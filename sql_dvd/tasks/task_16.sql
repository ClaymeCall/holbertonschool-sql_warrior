-- Task 16 - Trouver les films d'aventure loues par des clients nes dans
-- les annees 60
-- Test ON
--
-- Instructions
--
--     Afficher les titres d'aventure loues par des clients nes dans les
--     annees 60.
--     Utiliser le code genre AV pour les films de genre aventure.
--     Afficher les informations suivantes :
--         - titre du film
--         - nom et prenom du client
--         - date de naissance du client
--     Trier par titre du film.
--
-- Resultat attendu
--
-- +---------------+--------+---------+----------------+
-- | titre         | nom    | prenom  | date_naissance |
-- +---------------+--------+---------+----------------+
-- | Indiana Jones | Girard | Nicolas | 1962-08-09     |
-- | Jurassic Park | Martin | Paul    | 1965-04-12     |
-- | Jurassic Park | Girard | Nicolas | 1962-08-09     |
-- +---------------+--------+---------+----------------+
-- 3 rows in set (0.01 sec)

SELECT
    dvd.titre,
    clients.nom,
    clients.prenom,
    clients.date_naissance
FROM locations
INNER JOIN factures ON factures.id = locations.facture_id
INNER JOIN clients ON clients.id = factures.client_id
INNER JOIN dvd ON dvd.id = locations.dvd_id
INNER JOIN genres_film ON genres_film.id = dvd.genre_id
WHERE genres_film.code_genre = 'AV'
    AND clients.date_naissance BETWEEN '1960-01-01' AND '1969-12-31'
ORDER BY dvd.titre;
