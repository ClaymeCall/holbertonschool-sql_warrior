-- Task 14
--
-- Instructions
--
--     Calculer le chiffre d’affaires par genre de manga.
--     Trier du chiffre d’affaires le plus élevé au plus faible.
--
-- Résultat attendu
--
-- +---------------+------------------+
-- | signification | chiffre_affaires |
-- +---------------+------------------+
-- | Horreur       |            18.00 |
-- | Shōnen        |            14.11 |
-- | Aventure      |            10.00 |
-- | Policier      |            10.00 |
-- | Seinen        |             9.24 |
-- | Fantasy       |             7.44 |
-- | Comédie       |             6.34 |
-- | Shōjo         |             5.25 |
-- +---------------+------------------+
-- 8 rows in set (0.00 sec)

SELECT
  genres_manga.signification,
  ROUND(SUM(mangas.prix_base * types_location.coefficient), 2) AS `chiffre_affaires`
FROM mangas

LEFT JOIN genres_manga ON mangas.code_genre = genres_manga.code_genre
LEFT JOIN table_location ON mangas.num_manga = table_location.num_manga
LEFT JOIN types_location ON table_location.code_type = types_location.code_type

GROUP BY genres_manga.signification
ORDER BY `chiffre_affaires` DESC;
