-- Task 14 - Afficher les locations avec client et realisateur
-- Test ON
--
-- Instructions
--
--     Afficher les locations avec le titre du DVD, l'identite du client
--     et l'identite du realisateur.
--     Utiliser des concatenations pour former les identites.
--     Trier par titre de film (dvd).
--
-- Resultat attendu
--
-- +-------------------------------------+-----------------------+---------------------+
-- | titre                                | client                | realisateur         |
-- +-------------------------------------+-----------------------+---------------------+
-- | Alien                                | M. Leroy Marc         | Scott Ridley        |
-- | Avatar                               | Mme Garcia Claire     | Cameron James       |
-- | Delicatessen                         | M. Faure Kevin        | Jeunet Jean-Pierre  |
-- | Delicatessen                         | Mme Petit Amelie      | Jeunet Jean-Pierre  |
-- | Fight Club                           | Mlle Simon Anais      | Fincher David       |
-- | Impitoyable                          | Mme Mercier Laura     | Eastwood Clint      |
-- | Inception                            | Mme Robin Julie       | Nolan Christopher   |
-- | Inception                            | Mme Moreau Sophie     | Nolan Christopher   |
-- | Indiana Jones                        | M. Bernard Julien     | Spielberg Steven    |
-- | Indiana Jones                        | M. Girard Nicolas     | Spielberg Steven    |
-- | Interstellar                         | M. Laurent Hugo       | Nolan Christopher   |
-- | Jurassic Park                        | M. Martin Paul        | Spielberg Steven    |
-- | Jurassic Park                        | M. Girard Nicolas     | Spielberg Steven    |
-- | Kill Bill                            | M. Martin Paul        | Tarantino Quentin   |
-- | Le Fabuleux Destin d Amelie Poulain  | Mme Durand Alice      | Jeunet Jean-Pierre  |
-- | Le Grand Bleu                        | Mme Garcia Claire     | Besson Luc          |
-- | Le Voyage de Chihiro                 | Mme Durand Alice      | Miyazaki Hayao      |
-- | Les Ailes du Desir                   | Mme Fournier Aurelie  | Wenders Wim         |
-- | Les Ailes du Desir                   | M. Leroy Marc         | Wenders Wim         |
-- | Les Temps modernes                   | Mme Mercier Laura     | Chaplin Charlie     |
-- | Metropolis                           | Mme Fournier Aurelie  | Lang Fritz          |
-- | Metropolis                           | M. Bernard Julien     | Lang Fritz          |
-- | Mon Voisin Totoro                    | Mme Petit Amelie      | Miyazaki Hayao      |
-- | Paris Texas                          | M. Roux Thomas        | Wenders Wim         |
-- | Pulp Fiction                         | Mme Moreau Sophie     | Tarantino Quentin   |
-- | Sans toit ni loi                     | Mme Robin Julie       | Varda Agnes         |
-- | Seven                                | M. Laurent Hugo       | Fincher David       |
-- | Titanic                              | Mlle Simon Anais      | Cameron James       |
-- | Total Recall                         | M. Blanc Antoine      | Verhoeven Paul      |
-- | Tout sur ma mere                     | M. Roux Thomas        | Almodovar Pedro     |
-- +-------------------------------------+-----------------------+---------------------+
-- 30 rows in set (0.00 sec)

SELECT
    dvd.titre,
    CONCAT(clients.civilite, ' ', clients.nom, ' ', clients.prenom) AS client,
    CONCAT(realisateurs.nom, ' ', realisateurs.prenom) AS realisateur
FROM clients
INNER JOIN factures ON factures.client_id = clients.id
INNER JOIN locations ON locations.facture_id = factures.id
INNER JOIN dvd ON dvd.id = locations.dvd_id
INNER JOIN realisateurs ON realisateurs.id = dvd.realisateur_id
ORDER BY dvd.titre;
