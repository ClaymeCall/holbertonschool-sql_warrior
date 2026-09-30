-- Task 3
-- Test ON
--
-- Instructions
--
--     Pour cet exercice, il n'y a pas d'autres commandes a executer a part
--     celles mentionnees dans les etapes (a suivre et a executer dans le bon
--     ordre). Comprendre et tester le ROLLBACK en SQL.
--
--     Etape 1
--     Verifier le id et le statut du velo ayant le id = 1 :
--         SELECT id, statut FROM velos WHERE id = 1;
--
-- Resultat attendu de l'etape 1
--
-- +----+------------+
-- | id | statut     |
-- +----+------------+
-- |  1 | disponible |
-- +----+------------+
-- 1 row in set (0.00 sec)
--
--     Etape 2
--     Executer une transaction afin de mettre a jour le statut du velo
--     ayant le id = 1 :
--         START TRANSACTION;
--         UPDATE velos SET statut = 'maintenance' WHERE id = 1;
--
--     Etape 3
--     Apres la transaction, reverifier le id et le statut du velo ayant
--     le id = 1 :
--         SELECT id, statut FROM velos WHERE id = 1;
--
-- Resultat attendu de l'etape 3
--
-- +----+-------------+
-- | id | statut      |
-- +----+-------------+
-- |  1 | maintenance |
-- +----+-------------+
-- 1 row in set (0.00 sec)
--
--     Etape 4
--     Execution du ROLLBACK pour annuler les modifications faites dans la
--     derniere transaction :
--         ROLLBACK;
--
--     Etape 5
--     Reverifier le id et le statut du velo ayant le id = 1 apres
--     l'execution du ROLLBACK :
--         SELECT id, statut FROM velos WHERE id = 1;
--
-- Resultat attendu de l'etape 5
--
-- +----+------------+
-- | id | statut     |
-- +----+------------+
-- |  1 | disponible |
-- +----+------------+
-- 1 row in set (0.00 sec)

SELECT id, statut FROM velos WHERE id = 1;

START TRANSACTION;
UPDATE velos SET statut = 'maintenance' WHERE id = 1;

SELECT id, statut FROM velos WHERE id = 1;

ROLLBACK;

SELECT id, statut FROM velos WHERE id = 1;
