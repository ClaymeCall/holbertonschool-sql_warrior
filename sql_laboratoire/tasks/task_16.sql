-- Task 16 - Analyses plus longues que la moyenne
-- Test ON
--
-- Instructions
--
--     Afficher les analyses terminees dont la duree est superieure a la
--     duree moyenne de toutes les analyses terminees.
--     Afficher l'identifiant, le code echantillon et la duree en minutes.
--     Trier de la plus longue a la plus courte.
--
-- Resultat attendu
--
-- +------------+-----------------+-----------------+
-- | id_analyse | id_echantillon  | duree_minutes   |
-- +------------+-----------------+-----------------+
-- |          7 |               7 |             255 |
-- |          2 |               2 |             105 |
-- +------------+-----------------+-----------------+
-- 2 rows in set (0.00 sec)

SELECT
  analyse.id_analyse,
  analyse.id_echantillon,
  TIMESTAMPDIFF(MINUTE, analyse.date_debut, analyse.date_fin) AS duree_minutes
FROM analyse
WHERE analyse.statut = 'terminee'
  AND TIMESTAMPDIFF(MINUTE, analyse.date_debut, analyse.date_fin) > (
    SELECT AVG(TIMESTAMPDIFF(MINUTE, date_debut, date_fin))
    FROM analyse
    WHERE statut = 'terminee'
  )
ORDER BY duree_minutes DESC;
