-- Task 10 - Calculer la duree moyenne des films par genre
-- Test ON
--
-- Instructions
--
--     Calculer la duree moyenne des films par genre.
--     Arrondir a une decimale avec ROUND(..., 1).
--     Trier par la duree moyenne du plus grand au plus petit et par
--     libelle de genre.
--
-- Resultat attendu
--
-- +-----------------+---------------+
-- | libelle_genre   | duree_moyenne |
-- +-----------------+---------------+
-- | Romance         |         195.0 |
-- | Thriller        |         154.0 |
-- | Science-fiction |         149.0 |
-- | Drame           |         131.0 |
-- | Western         |         131.0 |
-- | Policier        |         127.0 |
-- | Aventure        |         121.0 |
-- | Horreur         |         117.0 |
-- | Action          |         111.0 |
-- | Animation       |         105.5 |
-- | Comédie         |         102.7 |
-- +-----------------+---------------+
-- 11 rows in set (0.00 sec)

SELECT
    genres_film.libelle_genre,
    ROUND(AVG(dvd.duree_minutes), 1) AS duree_moyenne
FROM dvd
INNER JOIN genres_film ON dvd.genre_id = genres_film.id
GROUP BY genres_film.id, genres_film.libelle_genre
ORDER BY duree_moyenne DESC, genres_film.libelle_genre;
