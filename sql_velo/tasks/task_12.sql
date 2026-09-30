-- Task 12
-- Test ON
--
-- Instructions
--
--     Afficher les utilisateurs ayant depense plus de 10 euros.
--     Le resultat retourne par la requete doit correspondre au resultat
--     attendu mentionne ci-dessous (attention au nom des colonnes).
--
-- Resultat attendu
--
-- +--------------+----------------+
-- | nom_complet  | total_depense  |
-- +--------------+----------------+
-- | Jean Dupont  | 12.50          |
-- | Emma Robert  | 15.00          |
-- +--------------+----------------+
-- 2 rows in set (0.00 sec)

SELECT utilisateurs.nom_complet, SUM(paiements.montant) AS total_depense
FROM utilisateurs
INNER JOIN locations ON locations.utilisateur_id = utilisateurs.id
INNER JOIN paiements ON paiements.location_id = locations.id
GROUP BY utilisateurs.id, utilisateurs.nom_complet
HAVING SUM(paiements.montant) > 10
ORDER BY utilisateurs.id;
