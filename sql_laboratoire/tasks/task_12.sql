-- Task 12 - Compter les analyses par analyste
-- Test ON
--
-- Instructions
--
--     Afficher le nom complet de chaque employe ayant le role analyste.
--     Compter le nombre d'analyses associees.
--     Inclure les analystes meme s'ils n'ont aucune analyse.
--     Trier par nombre d'analyses decroissant.
--
-- Resultat attendu
--
-- +----------------+-------------------+
-- | analyste       | nombre_analyses   |
-- +----------------+-------------------+
-- | Samir Benali   |                4  |
-- | Thomas Nguyen  |                4  |
-- | Marco Rossi    |                4  |
-- +----------------+-------------------+
-- 3 rows in set (0.00 sec)

SELECT CONCAT(e.prenom, ' ', e.nom) AS analyste, COUNT(a.id_analyse) AS nombre_analyses
FROM employe e
INNER JOIN role_employe r ON r.id_role = e.id_role
LEFT JOIN analyse a ON a.id_analyste = e.id_employe
WHERE r.libelle_role = 'analyste'
GROUP BY e.id_employe, e.prenom, e.nom
ORDER BY nombre_analyses DESC;
