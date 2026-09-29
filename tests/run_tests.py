#!/usr/bin/env python3
"""Run a project's tasks/task_NN.sql answers against MySQL and check output.

Usage:
    python3 tests/run_tests.py <project>            # run every task that has an answer
    python3 tests/run_tests.py <project> 5          # run only task 5
    python3 tests/run_tests.py <project> 1 3 7      # run tasks 1, 3 and 7

<project> is a sibling project folder name, e.g. "sql_manga". Its database
name is read from init-scripts/<project>_grants.sql at the repo root, so it
never needs to be hardcoded here.

Each task file is expected to contain:
    - A leading SQL-comment block ("-- ...") with the instructions and one
      or more expected-result ASCII tables (each under its own "Résultat
      attendu" heading).
    - A blank line.
    - The SQL answer to run: one or more ';'-terminated statements. SELECTs
      are matched, in order, against the expected tables parsed from the
      header. Any INSERT/UPDATE/DELETE statements run alongside them are
      idempotent by construction: the whole answer is executed inside a
      single transaction that is always rolled back afterwards, so write
      tasks never leave data behind for the next run.

A task is skipped (not failed) when it has no SQL answer yet, or when the
number of SELECTs in its answer doesn't match the number of expected tables
in its header (the runner can't tell which output belongs to which table).
"""

import re
import subprocess
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
INIT_SCRIPTS_DIR = REPO_ROOT / "init-scripts"
ENV_FILE = REPO_ROOT / ".env"
CONTAINER = "mysql_dev"
DB_USER = "student"

RED = "\033[31m"
GREEN = "\033[32m"
YELLOW = "\033[33m"
RESET = "\033[0m"


def load_env(path):
    env = {}
    for line in path.read_text().splitlines():
        line = line.strip()
        if not line or line.startswith("#") or "=" not in line:
            continue
        key, value = line.split("=", 1)
        env[key.strip()] = value.strip()
    return env


def load_db_name(project):
    grants_file = INIT_SCRIPTS_DIR / f"{project}_grants.sql"
    if not grants_file.exists():
        print(f"No such project: {project} (missing {grants_file})")
        sys.exit(2)
    match = re.search(r"GRANT ALL PRIVILEGES ON (\w+)\.", grants_file.read_text())
    if not match:
        print(f"Could not find a database name in {grants_file}")
        sys.exit(2)
    return match.group(1)


def split_header_and_body(text):
    """Split a task file into its leading comment block and trailing SQL."""
    lines = text.splitlines()
    split_at = len(lines)
    for i, line in enumerate(lines):
        if line.strip() == "":
            split_at = i
            break
    header = "\n".join(lines[:split_at])
    body = "\n".join(lines[split_at:]).strip()
    return header, body


def parse_expected_tables(header):
    """Extract every ASCII table in a comment block, in order.

    Tables are segmented on their "+---+" border lines / surrounding text,
    so a header with several "Résultat attendu" sections (before/after,
    multi-step verifications, ...) yields one entry per table.
    """
    tables = []
    current = []

    def flush():
        if len(current) >= 2:
            tables.append({"columns": current[0], "rows": current[1:]})
        current.clear()

    for raw in header.splitlines():
        line = raw[2:] if raw.startswith("--") else raw
        line = line.strip()
        if line.startswith("|"):
            cells = [c.strip() for c in line.strip("|").split("|")]
            current.append(cells)
        elif line.startswith("+"):
            continue  # border line, ignore
        else:
            flush()
    flush()

    return tables


SELECT_RE = re.compile(r"^\s*SELECT\b", re.IGNORECASE)


def split_statements(body):
    """Naive ';'-based statement split. No statement in this project's
    answers embeds a literal semicolon inside a string, so this is safe."""
    return [s.strip() for s in body.split(";") if s.strip()]


def run_transaction(body, env, db_name):
    sql = f"START TRANSACTION;\n{body}\nROLLBACK;\n"
    cmd = [
        "docker", "exec", "-i", CONTAINER,
        "mysql",
        "-h127.0.0.1",
        f"-u{DB_USER}",
        f"-p{env['MYSQL_PASSWORD']}",
        "--default-character-set=utf8mb4",
        "-B",
        db_name,
    ]
    proc = subprocess.run(cmd, input=sql, capture_output=True, text=True)
    return proc.returncode, proc.stdout, proc.stderr


def slice_result_sets(stdout, expected_tables):
    """Split mysql's back-to-back result sets using each expected table's
    known row count (mysql -B gives no separator between result sets)."""
    lines = [l for l in stdout.splitlines() if l != ""]
    actual_tables = []
    idx = 0
    for table in expected_tables:
        n = len(table["rows"])
        block = lines[idx: idx + 1 + n]
        idx += 1 + n
        columns = block[0].split("\t") if block else []
        rows = [l.split("\t") for l in block[1:]]
        actual_tables.append({"columns": columns, "rows": rows})
    return actual_tables


def compare(expected, actual, label):
    diffs = []
    if expected["columns"] != actual["columns"]:
        diffs.append(
            f"  [{label}] columns mismatch:\n"
            f"    expected: {expected['columns']}\n"
            f"    actual:   {actual['columns']}"
        )
    if expected["rows"] != actual["rows"]:
        max_len = max(len(expected["rows"]), len(actual["rows"]))
        for i in range(max_len):
            exp_row = expected["rows"][i] if i < len(expected["rows"]) else None
            act_row = actual["rows"][i] if i < len(actual["rows"]) else None
            if exp_row != act_row:
                diffs.append(
                    f"  [{label}] row {i} mismatch:\n"
                    f"    expected: {exp_row}\n"
                    f"    actual:   {act_row}"
                )
    return diffs


def run_task(path, env, db_name):
    num = int(re.search(r"\d+", path.stem).group())
    text = path.read_text(encoding="utf-8")
    header, body = split_header_and_body(text)

    if not body:
        print(f"{YELLOW}SKIP{RESET} task {num:02d}: no answer written yet")
        return "skip"

    expected_tables = parse_expected_tables(header)
    statements = split_statements(body)
    select_count = sum(1 for s in statements if SELECT_RE.match(s))

    if not expected_tables or select_count != len(expected_tables):
        print(
            f"{YELLOW}SKIP{RESET} task {num:02d}: {select_count} SELECT(s) "
            f"in the answer vs {len(expected_tables)} expected table(s) "
            f"in the header - can't match them up"
        )
        return "skip"

    returncode, stdout, stderr = run_transaction(body, env, db_name)
    if returncode != 0:
        print(f"{RED}FAIL{RESET} task {num:02d}: query error")
        print(f"  {stderr.strip()}")
        return "fail"

    actual_tables = slice_result_sets(stdout, expected_tables)
    diffs = []
    for i, (exp, act) in enumerate(zip(expected_tables, actual_tables), start=1):
        label = f"result {i}/{len(expected_tables)}"
        diffs.extend(compare(exp, act, label))

    if diffs:
        print(f"{RED}FAIL{RESET} task {num:02d}")
        for d in diffs:
            print(d)
        return "fail"

    print(f"{GREEN}PASS{RESET} task {num:02d}")
    return "pass"


def main():
    args = sys.argv[1:]
    if not args:
        print(f"Usage: {sys.argv[0]} <project> [task_numbers...]")
        sys.exit(2)

    project, task_args = args[0], args[1:]
    project_dir = REPO_ROOT / project
    tasks_dir = project_dir / "tasks"
    if not tasks_dir.is_dir():
        print(f"No such project: {project} (missing {tasks_dir})")
        sys.exit(2)

    db_name = load_db_name(project)
    env = load_env(ENV_FILE)

    if task_args:
        paths = [tasks_dir / f"task_{int(n):02d}.sql" for n in task_args]
        missing = [p for p in paths if not p.exists()]
        if missing:
            print(f"Unknown task file(s): {[str(p) for p in missing]}")
            sys.exit(2)
    else:
        paths = sorted(tasks_dir.glob("task_*.sql"))

    results = {"pass": 0, "fail": 0, "skip": 0}
    for path in paths:
        results[run_task(path, env, db_name)] += 1

    total = sum(results.values())
    print(
        f"\n{total} tasks: "
        f"{GREEN}{results['pass']} passed{RESET}, "
        f"{RED}{results['fail']} failed{RESET}, "
        f"{YELLOW}{results['skip']} skipped{RESET}"
    )
    sys.exit(1 if results["fail"] else 0)


if __name__ == "__main__":
    main()
