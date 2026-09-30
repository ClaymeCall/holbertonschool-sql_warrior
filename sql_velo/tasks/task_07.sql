-- Task 7
-- Test ON
--
-- Instructions
--
--     Afficher le detail de la location n 1.
--     Afficher uniquement les colonnes mentionnees dans Resultat attendu
--     (il faut penser a faire les jointures SQL).
--     Penser a consulter le ERD (diagramme de la BDD mentionne au debut du
--     projet) afin de revoir les relations entre les tables et savoir quels
--     JOIN peut-on faire.
--
-- Resultat attendu
--
-- +----+-------------+------+---------------------+---------------------+---------+
-- | id | nom_complet | code | date_debut          | date_fin            | montant |
-- +----+-------------+------+---------------------+---------------------+---------+
-- |  1 | Jean Dupont | V002 | 2025-05-01 08:00:00 | 2025-05-01 10:00:00 | 12.50   |
-- +----+-------------+------+---------------------+---------------------+---------+
-- 1 row in set (0.00 sec)

SELECT
    locations.id,
    utilisateurs.nom_complet,
    velos.code,
    locations.date_debut,
    locations.date_fin,
    paiements.montant
FROM locations

INNER JOIN utilisateurs ON utilisateurs.id = locations.utilisateur_id
INNER JOIN velos ON velos.id = locations.velo_id
INNER JOIN paiements ON paiements.location_id = locations.id

WHERE locations.id = 1;
