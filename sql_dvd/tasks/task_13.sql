-- Task 13 - Lister les clients ayant loue en juin 2006
-- Test ON
--
-- Instructions
--
--     Afficher les clients ayant au moins une facture en juin 2006.
--     Eviter les doublons avec DISTINCT.
--     Trier par nom de client.
--
-- Resultat attendu
--
-- +----------+---------+
-- | nom      | prenom  |
-- +----------+---------+
-- | Bernard  | Julien  |
-- | Durand   | Alice   |
-- | Fournier | Aurelie |
-- | Laurent  | Hugo    |
-- | Leroy    | Marc    |
-- | Martin   | Paul    |
-- | Mercier  | Laura   |
-- | Moreau   | Sophie  |
-- | Petit    | Amelie  |
-- | Robin    | Julie   |
-- | Simon    | Anais   |
-- +----------+---------+
-- 11 rows in set (0.00 sec)

SELECT DISTINCT clients.nom, clients.prenom
FROM clients
INNER JOIN factures ON factures.client_id = clients.id
WHERE factures.date_facture BETWEEN '2006-06-01' AND '2006-06-30'
ORDER BY clients.nom;
