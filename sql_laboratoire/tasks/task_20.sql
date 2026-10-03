-- Task 20 - Classer les analyses terminees par duree
-- Test ON
--
-- Instructions
--
--     Utiliser une fonction de fenetrage (window function).
--     Afficher uniquement les analyses terminees avec leur duree en
--     minutes. Afficher les colonnes suivantes :
--         - id_analyse
--         - code_echantillon
--         - duree_minutes (duree de preparation de chaque analyse en
--           minutes, utiliser TIMESTAMPDIFF)
--     Ajouter un rang avec RANK() et afficher la colonne rang_duree.
--     Classer de la plus longue a la plus courte.
--
-- Resultat attendu
--
-- +------------+------------------+------------------+-------------+
-- | id_analyse | code_echantillon | duree_minutes    | rang_duree  |
-- +------------+------------------+------------------+-------------+
-- |          7 | ECO-2025-007     |              255 |           1 |
-- |          2 | ECO-2025-002     |              105 |           2 |
-- |         12 | ECO-2025-012     |              100 |           3 |
-- |          4 | ECO-2025-004     |               85 |           4 |
-- |          1 | ECO-2025-001     |               40 |           5 |
-- |          9 | ECO-2025-009     |               30 |           6 |
-- +------------+------------------+------------------+-------------+
-- 6 rows in set (0.01 sec)

SELECT
  analyse.id_analyse,
  echantillon.code_echantillon,
  TIMESTAMPDIFF(MINUTE, analyse.date_debut, analyse.date_fin) AS duree_minutes,
  RANK() OVER (
    ORDER BY TIMESTAMPDIFF(MINUTE, analyse.date_debut, analyse.date_fin) DESC
  ) AS rang_duree
FROM analyse
INNER JOIN echantillon ON echantillon.id_echantillon = analyse.id_echantillon
WHERE analyse.statut = 'terminee'
ORDER BY duree_minutes DESC;
