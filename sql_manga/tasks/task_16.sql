-- Task 16
--
-- Instructions
--
--     Calculer le chiffre d’affaires par ville.
--     Trier du chiffre d’affaires le plus important au moins important.
--
-- Résultat attendu
--
-- +-------------+------------------+
-- | ville       | chiffre_affaires |
-- +-------------+------------------+
-- | Bordeaux    |            20.08 |
-- | Lyon        |            15.12 |
-- | Paris       |            10.14 |
-- | Toulouse    |             9.00 |
-- | Orléans     |             4.68 |
-- | Nice        |             4.64 |
-- | Marseille   |             4.53 |
-- | Montpellier |             4.32 |
-- | Lille       |             4.01 |
-- | Nantes      |             3.86 |
-- +-------------+------------------+
-- 10 rows in set (0.00 sec)

SELECT
  clients.ville,
  ROUND(SUM(mangas.prix_base * types_location.coefficient), 2) AS chiffre_affaires
FROM clients

INNER JOIN factures ON clients.code_client = factures.code_client
INNER JOIN table_location ON factures.num_facture = table_location.num_facture
INNER JOIN mangas ON table_location.num_manga = mangas.num_manga
INNER JOIN types_location ON table_location.code_type = types_location.code_type

GROUP BY clients.ville
ORDER BY chiffre_affaires DESC;
