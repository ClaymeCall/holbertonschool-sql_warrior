-- Task 15 - Duree moyenne des analyses terminees par methode
-- Test ON
--
-- Instructions
--
--     Calculer la duree moyenne, en minutes, des analyses terminees.
--     Grouper par methode.
--     Arrondir la duree a 2 decimales.
--     Trier par duree_moyenne_minutes dans un ordre descendant.
--     Pour calculer la duree moyenne penser a utiliser ces fonctions :
--         - ROUND() pour arrondir
--         - AVG() pour calculer la moyenne
--         - TIMESTAMPDIFF() pour calculer la duree
--
-- Resultat attendu
--
-- +-------------------------------+--------------------------+
-- | nom_methode                   | duree_moyenne_minutes    |
-- +-------------------------------+--------------------------+
-- | Culture légionelles           |                   255.00 |
-- | Spectrométrie ICP-MS          |                   105.00 |
-- | ICP-MS arsenic                |                   100.00 |
-- | Absorption atomique mercure   |                    85.00 |
-- | Potentiométrie                |                    40.00 |
-- | Conductimétrie                |                    30.00 |
-- +-------------------------------+--------------------------+
-- 6 rows in set (0.00 sec)

SELECT m.nom_methode, ROUND(AVG(TIMESTAMPDIFF(MINUTE, a.date_debut, a.date_fin)), 2) AS duree_moyenne_minutes
FROM analyse a
INNER JOIN methode_analyse m ON m.id_methode = a.id_methode
WHERE a.statut = 'terminee'
GROUP BY m.id_methode, m.nom_methode
ORDER BY duree_moyenne_minutes DESC;
