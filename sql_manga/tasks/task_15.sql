-- Task 15
-- Test ON
--
-- Instructions
--
--     Compter le nombre de locations par genre et par type de location.
--     Afficher genre, type de location et nombre de locations.
--
-- Résultat attendu
--
-- +---------------+---------------------+-----------------+
-- | signification | libelle             | nombre_location |
-- +---------------+---------------------+-----------------+
-- | Aventure      | Découverte          |               1 |
-- | Aventure      | Location courte     |               1 |
-- | Aventure      | Retard régularisé   |               1 |
-- | Comédie       | Classique           |               1 |
-- | Comédie       | Découverte          |               1 |
-- | Comédie       | Étudiant            |               2 |
-- | Fantasy       | Location longue     |               1 |
-- | Fantasy       | Premium             |               1 |
-- | Horreur       | Nouveauté           |               2 |
-- | Horreur       | Premium             |               2 |
-- | Policier      | Collector           |               2 |
-- | Seinen        | Location longue     |               1 |
-- | Seinen        | Nouveauté           |               1 |
-- | Shōjo         | Location standard   |               1 |
-- | Shōjo         | Pack famille        |               1 |
-- | Shōnen        | Classique           |               1 |
-- | Shōnen        | Location courte     |               1 |
-- | Shōnen        | Location standard   |               2 |
-- | Shōnen        | Week-end            |               2 |
-- +---------------+---------------------+-----------------+
-- 19 rows in set (0.00 sec)

SELECT
  genres_manga.signification,
  types_location.libelle,
  COUNT(*) AS nombre_location
FROM genres_manga

INNER JOIN mangas ON mangas.code_genre = genres_manga.code_genre
INNER JOIN table_location ON table_location.num_manga = mangas.num_manga
INNER JOIN types_location ON table_location.code_type = types_location.code_type

GROUP BY genres_manga.signification, types_location.libelle
ORDER BY genres_manga.signification ASC, types_location.libelle ASC;
