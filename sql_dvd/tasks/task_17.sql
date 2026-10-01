-- Task 17 - Identifier le meilleur client en nombre de DVD loues
-- Test ON
--
-- Instructions
--
--     Compter le nombre total de DVD loues par client.
--     Afficher les informations suivantes :
--         - code, nom et prenom du client
--         - nombre de dvd loues par client
--     Trier :
--         - pour faire apparaitre le client qui a realise le plus de
--           locations en premier,
--         - par la suite trier par nom et prenom du client.
--
-- Resultat attendu
--
-- +-------------+----------+---------+--------------+
-- | code_client | nom      | prenom  | nb_dvd_loues |
-- +-------------+----------+---------+--------------+
-- | C003        | Bernard  | Julien  |            2 |
-- | C002        | Durand   | Alice   |            2 |
-- | C011        | Fournier | Aurelie |            2 |
-- | C009        | Garcia   | Claire  |            2 |
-- | C012        | Girard   | Nicolas |            2 |
-- | C008        | Laurent  | Hugo    |            2 |
-- | C005        | Leroy    | Marc    |            2 |
-- | C001        | Martin   | Paul    |            2 |
-- | C013        | Mercier  | Laura   |            2 |
-- | C006        | Moreau   | Sophie  |            2 |
-- | C004        | Petit    | Amelie  |            2 |
-- | C015        | Robin    | Julie   |            2 |
-- | C010        | Roux     | Thomas  |            2 |
-- | C007        | Simon    | Anais   |            2 |
-- | C014        | Blanc    | Antoine |            1 |
-- | C016        | Faure    | Kevin   |            1 |
-- +-------------+----------+---------+--------------+
-- 16 rows in set (0.00 sec)

SELECT
    clients.code_client,
    clients.nom,
    clients.prenom,
    COUNT(*) AS nb_dvd_loues
FROM locations
INNER JOIN factures ON factures.id = locations.facture_id
INNER JOIN clients ON clients.id = factures.client_id
GROUP BY clients.id, clients.code_client, clients.nom, clients.prenom
ORDER BY nb_dvd_loues DESC, clients.nom, clients.prenom;
