-- Task 4
-- Test ON
--
-- Instructions
--
--     Afficher le nombre total de vehicules.
--     Attention au nom de la colonne, il doit etre identique au resultat
--     attendu ci-dessous.
--
-- Resultat attendu
--
-- +-----------------+
-- | total_vehicules |
-- +-----------------+
-- |              12 |
-- +-----------------+
-- 1 row in set (0.01 sec)

SELECT COUNT(*) AS total_vehicules FROM vehicules;
