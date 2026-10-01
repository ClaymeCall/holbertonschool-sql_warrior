-- Task 15
-- Test ON
--
-- Instructions
--
--     Afficher le nombre de trajets effectue pour chaque voiture utilisee.
--
-- Resultat attendu
--
-- +-----+-------------------+---------------------------+
-- | id  | modele            | nombre_total_de_trajets  |
-- +-----+-------------------+---------------------------+
-- | 105 | Mercedes Vito     |                        2 |
-- | 101 | Peugeot 208       |                        1 |
-- | 103 | Toyota Rav4       |                        1 |
-- | 104 | Ford Transit      |                        1 |
-- | 106 | Dacia Duster      |                        1 |
-- | 108 | Volkswagen Tiguan |                        1 |
-- | 110 | Fiat Panda        |                        1 |
-- +-----+-------------------+---------------------------+
-- 7 rows in set (0.00 sec)

SELECT
  vehicules.id AS `id`,
  vehicules.modele AS `modele`,
  COUNT(deplacements.debut_dep) AS `nombre_total_de_trajets`
FROM vehicules

LEFT JOIN deplacements ON vehicules.id = deplacements.vehicule

GROUP BY vehicules.id

ORDER BY `nombre_total_de_trajets` DESC;
