-- Task 11
-- Test ON
--
-- Instructions
--
--     Afficher le nombre de locations par utilisateur.
--     Le resultat retourne par la requete doit correspondre au resultat
--     attendu mentionne ci-dessous (attention au nom des colonnes).
--
-- Resultat attendu
--
-- +----------------+-------------------+
-- | nom_complet    | nombre_locations  |
-- +----------------+-------------------+
-- | Jean Dupont    | 1                 |
-- | Marie Martin   | 1                 |
-- | Lucas Bernard  | 1                 |
-- | Emma Robert    | 1                 |
-- | Sophie Leroy   | 1                 |
-- +----------------+-------------------+
-- 5 rows in set (0.00 sec)

SELECT utilisateurs.nom_complet, COUNT(locations.id) AS nombre_locations
FROM utilisateurs
LEFT JOIN locations ON locations.utilisateur_id = utilisateurs.id
GROUP BY utilisateurs.id, utilisateurs.nom_complet
ORDER BY utilisateurs.id;
