-- Task 12
-- Test OFF
--
-- Instructions
--
--     Empecher de depasser la capacite maximale d'un vehicule en creant un
--     trigger appele trg_verifier_places.
--
--     Tester les commandes INSERT une par une et voir a chaque fois le
--     message retourne par MySQL et les changements au niveau de la table
--     deplacements :
--         INSERT INTO deplacements VALUES
--         (210, 104, '2027-07-01 08:00:00', '2027-07-01 18:00:00', 'Bordeaux');
--
--         INSERT INTO deplacements VALUES
--         (211, 104, '2027-07-01 08:00:00', '2027-07-01 18:00:00', 'Bordeaux');
--
--         INSERT INTO deplacements VALUES
--         (212, 104, '2027-07-01 08:00:00', '2027-07-01 18:00:00', 'Bordeaux');
--
-- Resultat attendu suite a la 3eme execution de la commande INSERT INTO ...
--
--     ERROR 1644 (45000): Capacite du vehicule depassee
--
--     Supprimer les donnees ajoutees a la table deplacements ci-dessus
--     avec cette commande :
--         DELETE FROM deplacements
--         WHERE vehicule = 104
--           AND debut_dep = '2027-07-01 08:00:00'
--           AND fin_dep = '2027-07-01 18:00:00'
--           AND lieu = 'Bordeaux';

DROP TRIGGER IF EXISTS trg_verifier_places;

DELIMITER //

CREATE TRIGGER trg_verifier_places
BEFORE INSERT ON deplacements
FOR EACH ROW
BEGIN
  DECLARE v_seat_count INT;
  DECLARE v_current_count INT;

  SELECT types_vehicules.nbplaces
  INTO v_seat_count
  FROM vehicules
  INNER JOIN types_vehicules ON vehicules.type_voiture = types_vehicules.id
  WHERE vehicules.id = NEW.vehicule;

  SELECT COUNT(*)
  INTO v_current_count
  FROM deplacements
  WHERE vehicule = NEW.vehicule
    AND debut_dep = NEW.debut_dep
    AND fin_dep = NEW.fin_dep;

  IF v_current_count >= v_seat_count THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Capacite du vehicule depassee';
  END IF;
END

//

DELIMITER ;
