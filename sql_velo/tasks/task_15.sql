-- Task 15
-- Test ON
--
-- Instructions
--
--     Afficher le nombre de locations par mois.
--
-- Resultat attendu
--
-- +------+-------------------+
-- | mois | nombre_locations  |
-- +------+-------------------+
-- |    5 | 5                 |
-- +------+-------------------+
-- 1 row in set (0.00 sec)

SELECT MONTH(date_debut) AS mois, COUNT(*) AS nombre_locations
FROM locations
GROUP BY MONTH(date_debut);
