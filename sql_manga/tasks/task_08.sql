-- Task 8
--
-- Instructions
--
--     Afficher le nombre de clients et le total d’enfants par ville.
--     Trier par ville.
--     Les noms des colonnes doivent correspondre exactement à ceux indiqués dans la section **Résultat attendu** (pensez à utiliser les bons alias).
--
-- Résultat attendu
--
-- +-------------+-------------------+------------------+
-- | ville       | nombre_de_clients | nombre_d_enfants |
-- +-------------+-------------------+------------------+
-- | Bordeaux    |                 2 |                5 |
-- | Lille       |                 1 |                3 |
-- | Lyon        |                 2 |                2 |
-- | Marseille   |                 1 |                2 |
-- | Montpellier |                 1 |                2 |
-- | Nantes      |                 1 |                0 |
-- | Nice        |                 1 |                0 |
-- | Orléans     |                 1 |                1 |
-- | Paris       |                 1 |                1 |
-- | Toulouse    |                 1 |                0 |
-- +-------------+-------------------+------------------+
-- 10 rows in set (0.00 sec)

SELECT
    ville              AS `ville`,
    COUNT(code_client) AS `nombre_de_clients`,
    SUM(enfants)       AS `nombre_d_enfants`
FROM clients
GROUP BY ville
ORDER BY ville ASC;
