-- Task 5 - Calculer une temperature moyenne
-- Test ON
--
-- Instructions
--
--     Calculer la temperature moyenne de reception des echantillons.
--     Arrondir le resultat a 2 decimales.
--     Nommer la colonne temperature_moyenne.
--
-- Resultat attendu
--
-- +----------------------+
-- | temperature_moyenne  |
-- +----------------------+
-- |                 7.95 |
-- +----------------------+
-- 1 row in set (0.00 sec)

SELECT ROUND(AVG(temperature_reception), 2) AS temperature_moyenne FROM echantillon;
