-- Task 20
--
-- Instructions
--
--     Affiche le nombre de location ayant le type de location « Retard régularisé »
--
-- Résultat attendu
--
-- +-----------+-----------------+
-- | code_type | nb_utilisations |
-- +-----------+-----------------+
-- |        12 |               1 |
-- +-----------+-----------------+
-- 1 row in set (0.00 sec)

SELECT
  tl.code_type,
  COUNT(*) AS nb_utilisations
FROM table_location tl

JOIN types_location t ON t.code_type = tl.code_type

WHERE t.libelle = 'Retard régularisé'

GROUP BY tl.code_type;
