-- Task 11 - Resultats complets des analyses
-- Test ON
--
-- Instructions
--
--     Pour les demandes d'analyses afficher les informations suivantes :
--         - le nom du client
--         - le nom du site
--         - le code echantillon
--         - le nom du parametre
--         - la valeur mesuree
--         - la conformite
--     Trier par client puis par code echantillon.
--
-- Resultat attendu
--
-- +------------------------+------------------------------+------------------+----------------+-----------------+----------+
-- | nom_client             | nom_site                      | code_echantillon | nom_parametre  | valeur_mesuree  | conforme |
-- +------------------------+------------------------------+------------------+----------------+-----------------+----------+
-- | EauPure Bretagne       | Bassin Vilaine                | ECO-2025-004     | mercure        |            0.70 |        1 |
-- | EauPure Bretagne       | Bassin Vilaine                | ECO-2025-004     | mercure        |            0.40 |        1 |
-- | Hôpital Saint-Luc      | Bloc Technique Hospitalier    | ECO-2025-007     | legionelles    |         1250.00 |        0 |
-- | Hôpital Saint-Luc      | Bloc Technique Hospitalier    | ECO-2025-007     | legionelles    |          940.00 |        1 |
-- | IndusChem Atlantique   | Usine Zone Portuaire          | ECO-2025-002     | plomb          |           14.50 |        0 |
-- | IndusChem Atlantique   | Usine Zone Portuaire          | ECO-2025-002     | plomb          |            9.20 |        1 |
-- | Métropole Lyon         | Station Rhône Centre          | ECO-2025-009     | conductivite   |          810.00 |        1 |
-- | Métropole Lyon         | Station Rhône Centre          | ECO-2025-009     | conductivite   |          760.00 |        1 |
-- | Université Littorale   | Plateforme Marine             | ECO-2025-012     | arsenic        |           12.30 |        0 |
-- | Université Littorale   | Plateforme Marine             | ECO-2025-012     | arsenic        |            8.50 |        1 |
-- | Ville de Nantes        | Station Eau Nord              | ECO-2025-001     | pH             |            7.20 |        1 |
-- | Ville de Nantes        | Station Eau Nord              | ECO-2025-001     | pH             |            8.10 |        1 |
-- +------------------------+------------------------------+------------------+----------------+-----------------+----------+
-- 12 rows in set (0.01 sec)

SELECT c.nom AS nom_client, si.nom_site, e.code_echantillon, p.nom_parametre, r.valeur_mesuree, r.conforme
FROM client c
INNER JOIN site si ON si.id_client = c.id_client
INNER JOIN prelevement pr ON pr.id_site = si.id_site
INNER JOIN echantillon e ON e.id_prelevement = pr.id_prelevement
INNER JOIN analyse a ON a.id_echantillon = e.id_echantillon
INNER JOIN resultat_analyse r ON r.id_analyse = a.id_analyse
INNER JOIN methode_analyse m ON m.id_methode = a.id_methode
INNER JOIN parametre_analyse p ON p.id_parametre = m.id_parametre
ORDER BY c.nom, e.code_echantillon, r.id_resultat;
