-- Task 8 - Compter les DVD par genre
-- Test ON
--
-- Instructions
--
--     Compter le nombre de DVD pour chaque genre.
--     Inclure les genres meme s'ils n'ont aucun DVD grace a LEFT JOIN.
--     Trier par le nombre de dvd par genre en DESC et par libelle de genre.
--
-- Resultat attendu
--
-- +-----------------+--------+
-- | libelle_genre   | nb_dvd |
-- +-----------------+--------+
-- | Drame           |      6 |
-- | Science-fiction |      5 |
-- | Comédie         |      3 |
-- | Animation       |      2 |
-- | Aventure        |      2 |
-- | Action          |      1 |
-- | Horreur         |      1 |
-- | Policier        |      1 |
-- | Romance         |      1 |
-- | Thriller        |      1 |
-- | Western         |      1 |
-- | Biographie      |      0 |
-- | Documentaire    |      0 |
-- | Fantastique     |      0 |
-- | Guerre          |      0 |
-- | Musical         |      0 |
-- +-----------------+--------+
-- 16 rows in set (0.00 sec)

SELECT
    genres_film.libelle_genre,
    COUNT(dvd.id) AS nb_dvd
FROM genres_film
LEFT JOIN dvd ON dvd.genre_id = genres_film.id
GROUP BY genres_film.id, genres_film.libelle_genre
ORDER BY nb_dvd DESC, genres_film.libelle_genre;
