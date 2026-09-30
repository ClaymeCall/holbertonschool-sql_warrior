-- Task 4
-- Test ON
--
-- Instructions
--
--     Afficher les utilisateurs dont le nom commence par "J".
--
-- Resultat attendu
--
-- NB: la valeur de la date de creation est egale a celle a laquelle tu as
-- cree les donnees dans ta BDD.
--
-- +----+-------------+----------------+------------+---------------+---------------------+
-- | id | nom_complet | email          | telephone  | mot_de_passe  | date_creation       |
-- +----+-------------+----------------+------------+---------------+---------------------+
-- |  1 | Jean Dupont | jean@email.com | 0600000001 | hash1         | 2026-09-30 07:35:01 |
-- +----+-------------+----------------+------------+---------------+---------------------+
-- 1 row in set (0.00 sec)

SELECT id, nom_complet, email, telephone, mot_de_passe, date_creation
FROM utilisateurs
WHERE nom_complet LIKE 'J%';
