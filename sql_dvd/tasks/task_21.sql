-- Task 21 - Genres les plus loues
-- Test ON
--
-- Instructions
--
--     Compter le nombre de locations par genre.
--     Afficher le genre le plus loue en premier.
--     Trier par nombre de location, puis, par genre de film.
--
-- Resultat attendu
--
-- +-----------------+--------------+
-- | libelle_genre   | nb_locations |
-- +-----------------+--------------+
-- | Drame           |            7 |
-- | Science-fiction |            7 |
-- | Aventure        |            4 |
-- | Comédie         |            4 |
-- | Animation       |            2 |
-- | Action          |            1 |
-- | Horreur         |            1 |
-- | Policier        |            1 |
-- | Romance         |            1 |
-- | Thriller        |            1 |
-- | Western         |            1 |
-- +-----------------+--------------+
-- 11 rows in set (0.00 sec)

SELECT
    genres_film.libelle_genre,
    COUNT(*) AS nb_locations
FROM locations
INNER JOIN dvd ON dvd.id = locations.dvd_id
INNER JOIN genres_film ON genres_film.id = dvd.genre_id
GROUP BY genres_film.libelle_genre
ORDER BY nb_locations DESC, genres_film.libelle_genre;
