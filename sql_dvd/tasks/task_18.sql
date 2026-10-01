-- Task 18 - Analyse croisee : nombre de DVD par pays et par genre
-- Test ON
--
-- Instructions
--
--     Compter les DVD par pays du realisateur et par genre.
--     Trier par pays puis par genre.
--
-- Resultat attendu
--
-- +-------------+-----------------+--------+
-- | pays        | libelle_genre   | nb_dvd |
-- +-------------+-----------------+--------+
-- | ALLEMAGNE   | Drame           |      2 |
-- | ALLEMAGNE   | Science-fiction |      1 |
-- | CANADA      | Romance         |      1 |
-- | CANADA      | Science-fiction |      1 |
-- | ESPAGNE     | Drame           |      1 |
-- | ETATS-UNIS  | Action          |      1 |
-- | ETATS-UNIS  | Aventure        |      2 |
-- | ETATS-UNIS  | Drame           |      1 |
-- | ETATS-UNIS  | Policier        |      1 |
-- | ETATS-UNIS  | Thriller        |      1 |
-- | ETATS-UNIS  | Western         |      1 |
-- | FRANCE      | Comédie         |      2 |
-- | FRANCE      | Drame           |      2 |
-- | JAPON       | Animation       |      2 |
-- | PAYS-BAS    | Science-fiction |      1 |
-- | ROYAUME-UNI | Comédie         |      1 |
-- | ROYAUME-UNI | Horreur         |      1 |
-- | ROYAUME-UNI | Science-fiction |      2 |
-- +-------------+-----------------+--------+
-- 18 rows in set (0.00 sec)

SELECT
    realisateurs.pays,
    genres_film.libelle_genre,
    COUNT(*) AS nb_dvd
FROM dvd
INNER JOIN realisateurs ON realisateurs.id = dvd.realisateur_id
INNER JOIN genres_film ON genres_film.id = dvd.genre_id
GROUP BY realisateurs.pays, genres_film.libelle_genre
ORDER BY realisateurs.pays, genres_film.libelle_genre;
