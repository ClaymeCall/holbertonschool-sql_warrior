-- Task 14
-- Test ON
--
-- Instructions
--
--     Afficher les utilisateurs sans aucune location.
--     Le resultat retourne par la requete doit correspondre au resultat
--     attendu mentionne ci-dessous (attention au nom des colonnes).
--
-- Resultat attendu
--
-- Empty set (0.00 sec)

SELECT utilisateurs.id, utilisateurs.nom_complet
FROM utilisateurs
LEFT JOIN locations ON locations.utilisateur_id = utilisateurs.id
WHERE locations.id IS NULL;
