-- Task 4 - Compter les echantillons
-- Test ON
--
-- Instructions
--
--     Compter le nombre total d'echantillons enregistres.
--     Nommer la colonne nombre_echantillons.
--
-- Resultat attendu
--
-- +----------------------+
-- | nombre_echantillons  |
-- +----------------------+
-- |                   12 |
-- +----------------------+
-- 1 row in set (0.01 sec)

SELECT COUNT(*) AS nombre_echantillons FROM echantillon;
