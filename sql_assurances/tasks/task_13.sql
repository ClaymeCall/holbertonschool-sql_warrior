-- Task 13
-- Test ON
--
-- Instructions
--
--     Afficher les employes n'ayant jamais effectue de deplacement.
--
-- Resultat attendu
--
-- +-----+---------+--------+
-- | id  | nom     | prenom |
-- +-----+---------+--------+
-- | 203 | BERNARD | Emma   |
-- | 213 | DIALLO  | Amina  |
-- +-----+---------+--------+
-- 2 rows in set (0.00 sec)

SELECT
  employes.id,
  employes.nom,
  employes.prenom
FROM employes

LEFT JOIN deplacements ON employes.id = deplacements.employe

WHERE deplacements.employe IS NULL;
