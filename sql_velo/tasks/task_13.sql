-- Task 13
-- Test ON
--
-- Instructions
--
--     Afficher tous les velos tries du plus loue au moins loue.
--     Le resultat retourne par la requete doit correspondre au resultat
--     attendu mentionne ci-dessous (attention au nom des colonnes).
--
-- Resultat attendu
--
-- +------+------------------+
-- | code | total_locations  |
-- +------+------------------+
-- | V001 | 1                |
-- | V002 | 1                |
-- | V004 | 1                |
-- | V005 | 1                |
-- | V006 | 1                |
-- | V003 | 0                |
-- | V007 | 0                |
-- | V008 | 0                |
-- | V009 | 0                |
-- | V010 | 0                |
-- +------+------------------+
-- 10 rows in set (0.00 sec)

SELECT velos.code, COUNT(locations.id) AS total_locations
FROM velos
LEFT JOIN locations ON locations.velo_id = velos.id
GROUP BY velos.id, velos.code
ORDER BY total_locations DESC, velos.code;
