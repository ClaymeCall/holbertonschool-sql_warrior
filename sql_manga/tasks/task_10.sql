-- Task 10
-- Test ON
--
-- Instructions
--
--     Afficher le détail des locations.
--     Afficher le numéro de facture, le client (nom et prenom), le manga (titre), le type de location (libelle) et la date de retour.
--
-- Résultat attendu
--
-- +-------------+--------+----------+---------------------------------+---------------------+-------------+
-- | num_facture | prenom | nom      | titre                           | libelle             | date_retour |
-- +-------------+--------+----------+---------------------------------+---------------------+-------------+
-- |           1 | Emma   | Martin   | One Piece - Tome 1              | Location courte     | 2026-01-07  |
-- |           1 | Emma   | Martin   | Naruto - Tome 1                 | Location standard   | 2026-01-11  |
-- |          13 | Emma   | Martin   | Death Note - Tome 2             | Collector           | 2026-02-15  |
-- |           2 | Lucas  | Bernard  | Dragon Ball - Tome 1            | Week-end            | 2026-01-10  |
-- |           2 | Lucas  | Bernard  | Sailor Moon - Tome 1            | Location standard   | 2026-01-13  |
-- |           3 | Chloé  | Petit    | L’Attaque des Titans - Tome 1   | Nouveauté           | 2026-01-14  |
-- |           3 | Chloé  | Petit    | Fullmetal Alchemist - Tome 1    | Location longue     | 2026-01-20  |
-- |          14 | Chloé  | Petit    | Bakuman - Tome 2                | Découverte          | 2026-02-13  |
-- |           4 | Hugo   | Robert   | Ranma 1/2 - Tome 1              | Classique           | 2026-01-19  |
-- |           4 | Hugo   | Robert   | Bleach - Tome 1                 | Location courte     | 2026-01-14  |
-- |           5 | Inès   | Richard  | Demon Slayer - Tome 1           | Nouveauté           | 2026-01-21  |
-- |           5 | Inès   | Richard  | Jujutsu Kaisen - Tome 1         | Premium             | 2026-01-25  |
-- |           6 | Nathan | Durand   | Death Note - Tome 1             | Collector           | 2026-01-24  |
-- |           6 | Nathan | Durand   | Bakuman - Tome 1                | Étudiant            | 2026-01-23  |
-- |          15 | Nathan | Durand   | One Piece - Tome 1              | Retard régularisé   | 2026-02-15  |
-- |           7 | Léa    | Moreau   | One Piece - Tome 2              | Découverte          | 2026-01-22  |
-- |           7 | Léa    | Moreau   | Naruto - Tome 2                 | Location standard   | 2026-01-26  |
-- |           8 | Noah   | Simon    | Dragon Ball - Tome 2            | Classique           | 2026-01-29  |
-- |           8 | Noah   | Simon    | Sailor Moon - Tome 2            | Pack famille        | 2026-01-30  |
-- |           9 | Manon  | Laurent  | L’Attaque des Titans - Tome 2   | Location longue     | 2026-02-04  |
-- |           9 | Manon  | Laurent  | Fullmetal Alchemist - Tome 2    | Premium             | 2026-02-03  |
-- |          10 | Jules  | Lefebvre | Ranma 1/2 - Tome 2              | Étudiant            | 2026-02-01  |
-- |          10 | Jules  | Lefebvre | Bleach - Tome 2                 | Week-end            | 2026-02-02  |
-- |          11 | Sarah  | Michel   | Demon Slayer - Tome 2           | Nouveauté           | 2026-02-07  |
-- |          12 | Adam   | Garcia   | Jujutsu Kaisen - Tome 2         | Premium             | 2026-02-12  |
-- +-------------+--------+----------+---------------------------------+---------------------+-------------+
-- 25 rows in set (0.00 sec)

SELECT
	factures.num_facture,
    clients.prenom,
    clients.nom,
    mangas.titre,
    types_location.libelle,
    table_location.date_retour
FROM
	factures
INNER JOIN clients ON factures.code_client = clients.code_client
INNER JOIN table_location ON factures.num_facture = table_location.num_facture
INNER JOIN mangas ON table_location.num_manga = mangas.num_manga
INNER JOIN types_location ON table_location.code_type = types_location.code_type;
