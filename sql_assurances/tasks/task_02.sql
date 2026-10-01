-- Task 2
-- Test ON
--
-- Instructions
--
--     Afficher les vehicules avec leur assureur.
--     Attention au nom des colonnes, ils doivent etre identiques au
--     resultat attendu ci-dessous.
--
-- Resultat attendu
--
-- +-------------------+---------------+
-- | modele            | assureur      |
-- +-------------------+---------------+
-- | Peugeot 208       | AXA Assurance |
-- | Renault Clio      | MAIF          |
-- | Toyota Rav4       | Groupama      |
-- | Ford Transit      | AXA Assurance |
-- | Mercedes Vito     | Allianz       |
-- | Dacia Duster      | MAIF          |
-- | Volkswagen Tiguan | Groupama      |
-- | Opel Vivaro       | Allianz       |
-- | Hyundai Tucson    | AXA Assurance |
-- | Peugeot 208       | Generali      |
-- | Renault Clio      | MMA           |
-- | Toyota Rav4       | Swiss Life    |
-- +-------------------+---------------+
-- 12 rows in set (0.00 sec)

SELECT
  vehicules.modele AS `modele`,
  assureurs.nom AS `assureur`
FROM vehicules

INNER JOIN contrats ON vehicules.id = contrats.vehicule
INNER JOIN assureurs ON contrats.assureur = assureurs.id;
