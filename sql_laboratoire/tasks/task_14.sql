-- Task 14 - Nombre d'echantillons par client
-- Test ON
--
-- Instructions
--
--     Afficher chaque client avec son nombre d'echantillons.
--     Inclure les clients meme s'ils n'ont aucun echantillon.
--     Trier par nombre d'echantillons decroissant puis par nom.
--
-- Resultat attendu
--
-- +--------------------------+------------------------+
-- | nom                      | nombre_echantillons    |
-- +--------------------------+------------------------+
-- | AeroTech Sud             |                      1 |
-- | AgriSol Loire            |                      1 |
-- | Bureau Etudes Vertis     |                      1 |
-- | Cimenterie Ouest         |                      1 |
-- | EauPure Bretagne         |                      1 |
-- | Hôpital Saint-Luc        |                      1 |
-- | IndusChem Atlantique     |                      1 |
-- | Métropole Lyon           |                      1 |
-- | Port Atlantique Services |                      1 |
-- | Université Littorale     |                      1 |
-- | Ville de Nantes          |                      1 |
-- | VitiBio Gironde          |                      1 |
-- +--------------------------+------------------------+
-- 12 rows in set (0.01 sec)

SELECT c.nom, COUNT(e.id_echantillon) AS nombre_echantillons
FROM client c
LEFT JOIN demande_analyse d ON d.id_client = c.id_client
LEFT JOIN prelevement pr ON pr.id_demande = d.id_demande
LEFT JOIN echantillon e ON e.id_prelevement = pr.id_prelevement
GROUP BY c.id_client, c.nom
ORDER BY nombre_echantillons DESC, c.nom;
