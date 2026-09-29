-- Task 13
--
-- Instructions
--
--     Construire une analyse croisée du nombre de locations par ville et par genre.
--     Afficher au minimum les colonnes Aventure, Fantasy, Horreur et Shōnen.
--
-- Résultat attendu
--
-- +-------------+----------+---------+----------+---------+
-- | ville       | Aventure | Fantasy | Horreur | Shōnen  |
-- +-------------+----------+---------+----------+---------+
-- | Bordeaux    |        1 |       1 |        0 |       0 |
-- | Lille       |        0 |       0 |        0 |       1 |
-- | Lyon        |        0 |       1 |        0 |       1 |
-- | Marseille   |        0 |       0 |        0 |       1 |
-- | Montpellier |        0 |       0 |        1 |       0 |
-- | Nantes      |        0 |       0 |        0 |       1 |
-- | Nice        |        1 |       0 |        0 |       1 |
-- | Orléans     |        0 |       0 |        1 |       0 |
-- | Paris       |        1 |       0 |        0 |       1 |
-- | Toulouse    |        0 |       0 |        2 |       0 |
-- +-------------+----------+---------+----------+---------+
-- 10 rows in set (0.01 sec)

SELECT
  clients.ville AS `ville`,
  SUM(CASE WHEN genres_manga.signification = 'Aventure' THEN 1 ELSE 0 END) AS `Aventure`,
  SUM(CASE WHEN genres_manga.signification = 'Fantasy' THEN 1 ELSE 0 END) AS `Fantasy`,
  SUM(CASE WHEN genres_manga.signification = 'Horreur' THEN 1 ELSE 0 END) AS `Horreur`,
  SUM(CASE WHEN genres_manga.signification = 'Shōnen' THEN 1 ELSE 0 END) AS `Shōnen`
FROM clients

LEFT JOIN factures ON clients.code_client = factures.code_client
LEFT JOIN table_location ON factures.num_facture = table_location.num_facture
LEFT JOIN mangas ON table_location.num_manga = mangas.num_manga
LEFT JOIN genres_manga ON mangas.code_genre = genres_manga.code_genre

GROUP BY clients.ville

ORDER BY clients.ville ASC;
