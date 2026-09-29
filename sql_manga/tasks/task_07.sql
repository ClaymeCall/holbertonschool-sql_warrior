-- Task 7
--
-- Instructions
--
--     Calculer le montant de chaque facture.
--     Le montant d’une ligne se calcule ainsi : `prix_base × coefficient` du type de location.
--     Afficher le numéro de facture et le montant total.
--     Les noms des colonnes doivent correspondre exactement à ceux indiqués dans la section **Résultat attendu** (pensez à utiliser les bons alias).
--
-- Résultat attendu
--
-- +-------------+----------+
-- | num_facture | depenses |
-- +-------------+----------+
-- |           1 |   5.1400 |
-- |           2 |   4.7200 |
-- |           3 |   8.6400 |
-- |           4 |   4.0100 |
-- |           5 |   9.0000 |
-- |           6 |   6.5400 |
-- |           7 |   4.6400 |
-- |           8 |   4.5300 |
-- |           9 |   8.0400 |
-- |          10 |   3.8600 |
-- |          11 |   4.6800 |
-- |          12 |   4.3200 |
-- |          13 |   5.0000 |
-- |          14 |   1.7600 |
-- |          15 |   5.5000 |
-- +-------------+----------+
-- 15 rows in set (0.01 sec)

SELECT
    factures.num_facture AS `num_facture`,
    SUM(
        mangas.prix_base * types_location.coefficient
    ) AS `depenses`
FROM
    factures
INNER JOIN table_location ON factures.num_facture = table_location.num_facture
INNER JOIN mangas ON table_location.num_manga = mangas.num_manga
INNER JOIN types_location ON table_location.code_type = types_location.code_type
GROUP BY
    factures.num_facture
ORDER BY
    factures.num_facture ASC;
