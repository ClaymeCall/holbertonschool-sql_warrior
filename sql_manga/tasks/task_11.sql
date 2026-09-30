-- Task 11
-- Test ON
--
-- Instructions
--
--     Afficher les 5 clients ayant généré le plus de chiffre d’affaires.
--     Afficher le code client, le prénom, le nom, le nombre de locations et le total dépensé par client.
--
-- Résultat attendu
--
-- +-------------+--------+---------+--------------------+----------------+
-- | code_client | prenom | nom     | nombre_de_location | total_depenses |
-- +-------------+--------+---------+--------------------+----------------+
-- |           6 | Nathan | Durand  |                  3 |          12.04 |
-- |           3 | Chloé  | Petit   |                  3 |          10.40 |
-- |           1 | Emma   | Martin  |                  3 |          10.14 |
-- |           5 | Inès   | Richard |                  2 |           9.00 |
-- |           9 | Manon  | Laurent |                  2 |           8.04 |
-- +-------------+--------+---------+--------------------+----------------+
-- 5 rows in set (0.01 sec)

SELECT
    clients.code_client,
    clients.prenom,
    clients.nom,
    COUNT(table_location.num_manga) AS nombre_de_location,
    ROUND(SUM(mangas.prix_base * types_location.coefficient), 2) AS total_depenses
FROM
    clients
INNER JOIN factures ON clients.code_client = factures.code_client
INNER JOIN table_location ON factures.num_facture = table_location.num_facture
INNER JOIN mangas ON table_location.num_manga = mangas.num_manga
INNER JOIN types_location ON table_location.code_type = types_location.code_type
GROUP BY
    clients.code_client, clients.prenom, clients.nom
ORDER BY
    total_depenses DESC
LIMIT 5;
