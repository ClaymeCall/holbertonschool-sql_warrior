# SQL Laboratoire

An analysis-lab schema: clients, sites, analysis requests, employees and their roles/certifications, samples, analysis parameters and methods, equipment, and the analyses and results tying it all together. Database name: `ecolab_analyse`.

## Usage

This project shares a single MySQL/phpMyAdmin Docker stack and Python test runner defined at the repo root.

1. `./up` — brings up the shared stack (on a fresh volume, this seeds every project's database from the root `init-scripts/`).
2. Write your answers in `tasks/task_NN.sql`.
3. `./test` — runs this project's tasks against the shared MySQL container and checks the output (or `./test 5` for a single task).
4. phpMyAdmin is available at http://localhost:${PHPMYADMIN_PORT} for manual inspection.

Schema and data are only (re-)seeded on a **fresh** volume. To reset (this reseeds *every* project, not just this one), run from the repo root:

    docker compose down -v && docker compose up -d
