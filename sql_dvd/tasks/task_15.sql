-- Task 15 - Trouver les clients ayant loue des films de realisateurs
-- allemands en juin 2006
-- Test ON
--
-- Instructions
--
--     Afficher les clients ayant loue un DVD realise par un realisateur
--     allemand en juin 2006 (date de facture (location) en juin 2006).
--     Afficher les colonnes suivantes :
--         - nom du client
--         - prenom du client
--         - titre du dvd (film)
--         - date de facture de location du film
--     Trier par nom et prenom de client et par titre de film,
--     respectivement dans cet ordre.
--
-- Resultat attendu
--
-- +----------+---------+---------------------+--------------+
-- | nom      | prenom  | titre               | date_facture |
-- +----------+---------+---------------------+--------------+
-- | Bernard  | Julien  | Metropolis          | 2006-06-08   |
-- | Fournier | Aurelie | Les Ailes du Desir  | 2006-06-29   |
-- | Fournier | Aurelie | Metropolis          | 2006-06-29   |
-- | Leroy    | Marc    | Les Ailes du Desir  | 2006-06-14   |
-- +----------+---------+---------------------+--------------+
-- 4 rows in set (0.00 sec)

SELECT
    clients.nom,
    clients.prenom,
    dvd.titre,
    factures.date_facture
FROM locations
INNER JOIN factures ON factures.id = locations.facture_id
INNER JOIN clients ON clients.id = factures.client_id
INNER JOIN dvd ON dvd.id = locations.dvd_id
INNER JOIN realisateurs ON realisateurs.id = dvd.realisateur_id
WHERE realisateurs.pays = 'ALLEMAGNE'
    AND factures.date_facture BETWEEN '2006-06-01' AND '2006-06-30'
ORDER BY clients.nom, clients.prenom, dvd.titre;
