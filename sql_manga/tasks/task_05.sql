-- Task 5
-- Test ON
--
-- Instructions
--
--     Calculer le nombre total de mangas, le prix moyen et le prix maximum.
--     Arrondir le prix moyen à 2 décimales.
--     Utilisez des alias afin d’obtenir les mêmes intitulés de colonnes que ceux affichés dans la section **Résultat attendu**.
--
-- Résultat attendu
--
-- +------------------------+------------+----------+
-- | nombre_total_de_mangas | prix_moyen | prix_max |
-- +------------------------+------------+----------+
-- |                     24 |       2.35 |     2.80 |
-- +------------------------+------------+----------+
-- 1 row in set (0.00 sec)

SELECT
    COUNT(num_manga) AS nombre_total_de_mangas,
    ROUND(AVG(prix_base), 2) AS prix_moyen,
    MAX(prix_base) AS prix_max
FROM mangas;
