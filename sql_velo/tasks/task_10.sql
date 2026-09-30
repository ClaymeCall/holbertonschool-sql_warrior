-- Task 10
-- Test ON
--
-- Instructions
--
--     Afficher les velos en maintenance.
--     Le resultat retourne par la requete doit correspondre au resultat
--     attendu mentionne ci-dessous (attention au nom des colonnes).
--
-- Resultat attendu
--
-- +----+------+------------+-------------+----------------------+
-- | id | code | type_velo  | statut      | station_actuelle_id  |
-- +----+------+------------+-------------+----------------------+
-- |  3 | V003 | classique  | maintenance | 3                    |
-- | 10 | V010 | electrique | maintenance | 4                    |
-- +----+------+------------+-------------+----------------------+
-- 2 rows in set (0.00 sec)

SELECT id, code, type_velo, statut, station_actuelle_id
FROM velos
WHERE statut = 'maintenance'
ORDER BY id;
