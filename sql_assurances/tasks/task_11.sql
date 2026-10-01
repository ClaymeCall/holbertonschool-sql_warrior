-- Task 11
-- Test ON
--
-- Instructions
--
--     Creer une procedure appelee ajouter_employe permettant d'ajouter un
--     employe.
--         - La procedure doit prendre comme parametres :
--             - le nom du nouvel employe (type VARCHAR(50)),
--             - son prenom (type VARCHAR(50)),
--             - son numero de permis (type VARCHAR(12))
--         - Gerer la logique de l'ID du nouvel employe dans la procedure.
--         - Le nom du nouvel employe doit etre enregistre en majuscule.
--
--     Test :
--         CALL ajouter_employe('diallo', 'amina', '999888777666');
--
--         SELECT *
--         FROM employes
--         WHERE nom = 'DIALLO' AND prenom = 'amina';
--
-- Resultat attendu suite a l'execution des commandes ci-dessus
--
-- +-----+--------+--------+--------------+
-- | id  | nom    | prenom | num_permis   |
-- +-----+--------+--------+--------------+
-- | 213 | DIALLO | Amina  | 999888777666 |
-- +-----+--------+--------+--------------+
-- 1 row in set (0.00 sec)

DROP PROCEDURE IF EXISTS ajouter_employe;

DELIMITER //

CREATE PROCEDURE ajouter_employe(p_nom VARCHAR(50), p_prenom VARCHAR(50), p_num_permis VARCHAR(12))
MODIFIES SQL DATA

BEGIN
  DECLARE v_id INT;
  SET v_id = (SELECT IFNULL(MAX(id), 0) + 1 FROM employes);

  INSERT INTO employes (id, nom, prenom, num_permis)
  VALUES (
    v_id,
    UPPER(p_nom),
    CONCAT(UPPER(LEFT(p_prenom, 1)), LOWER(SUBSTRING(p_prenom, 2))),
    p_num_permis
  );

END

//

DELIMITER ;

START TRANSACTION;

CALL ajouter_employe('diallo', 'amina', '999888777666');

SELECT *
FROM employes
WHERE nom = 'DIALLO' AND prenom = 'amina';

ROLLBACK;
