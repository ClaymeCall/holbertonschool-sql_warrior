-- Task 20 - Analyse croisee : duree moyenne par pays et genre
-- Test ON
--
-- Instructions
--
--     Calculer la duree moyenne des DVD par pays du realisateur et par
--     genre.
--     Arrondir la moyenne a une decimale.
--     Trier par pays, puis, par genre de film.
--
-- Resultat attendu
--
-- +-------------+-----------------+---------------+
-- | pays        | libelle_genre   | duree_moyenne |
-- +-------------+-----------------+---------------+
-- | ALLEMAGNE   | Drame           |         136.5 |
-- | ALLEMAGNE   | Science-fiction |         153.0 |
-- | CANADA      | Romance         |         195.0 |
-- | CANADA      | Science-fiction |         162.0 |
-- | ESPAGNE     | Drame           |         101.0 |
-- | ETATS-UNIS  | Action          |         111.0 |
-- | ETATS-UNIS  | Aventure        |         121.0 |
-- | ETATS-UNIS  | Drame           |         139.0 |
-- | ETATS-UNIS  | Policier        |         127.0 |
-- | ETATS-UNIS  | Thriller        |         154.0 |
-- | ETATS-UNIS  | Western         |         131.0 |
-- | FRANCE      | Comédie         |         110.5 |
-- | FRANCE      | Drame           |         136.5 |
-- | JAPON       | Animation       |         105.5 |
-- | PAYS-BAS    | Science-fiction |         113.0 |
-- | ROYAUME-UNI | Comédie         |          87.0 |
-- | ROYAUME-UNI | Horreur         |         117.0 |
-- | ROYAUME-UNI | Science-fiction |         158.5 |
-- +-------------+-----------------+---------------+
-- 18 rows in set (0.00 sec)

SELECT
    realisateurs.pays,
    genres_film.libelle_genre,
    ROUND(AVG(dvd.duree_minutes), 1) AS duree_moyenne
FROM dvd
INNER JOIN realisateurs ON realisateurs.id = dvd.realisateur_id
INNER JOIN genres_film ON genres_film.id = dvd.genre_id
GROUP BY realisateurs.pays, genres_film.libelle_genre
ORDER BY realisateurs.pays, genres_film.libelle_genre;
