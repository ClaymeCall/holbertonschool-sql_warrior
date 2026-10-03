-- Task 19 - Creer une vue de resultats complets
-- Test ON
--
-- Instructions
--
--     Creer une vue appelee vue_resultats_complets.
--     La vue doit afficher le client, le site, l'echantillon, le
--     parametre, l'unite, le seuil, la valeur mesuree et la conformite.
--     Tester la vue en affichant toutes ses colonnes et ses lignes avec :
--         SELECT * FROM vue_resultats_complets;
--
-- Resultat attendu
--
-- +------------------------+------------------------------+------------------+----------------+-----------+-----------------------+-----------------+----------+
-- | client                 | nom_site                      | code_echantillon | nom_parametre  | unite     | seuil_reglementaire   | valeur_mesuree  | conforme |
-- +------------------------+------------------------------+------------------+----------------+-----------+-----------------------+-----------------+----------+
-- | Ville de Nantes        | Station Eau Nord              | ECO-2025-001     | pH             | unité pH  |                  8.50 |            7.20 |        1 |
-- | IndusChem Atlantique   | Usine Zone Portuaire          | ECO-2025-002     | plomb          | µg/L      |                 10.00 |           14.50 |        0 |
-- | EauPure Bretagne       | Bassin Vilaine                | ECO-2025-004     | mercure        | µg/L      |                  1.00 |            0.70 |        1 |
-- | Hôpital Saint-Luc      | Bloc Technique Hospitalier    | ECO-2025-007     | legionelles    | UFC/L     |               1000.00 |         1250.00 |        0 |
-- | Métropole Lyon         | Station Rhône Centre          | ECO-2025-009     | conductivite   | µS/cm     |               2500.00 |          810.00 |        1 |
-- | Université Littorale   | Plateforme Marine             | ECO-2025-012     | arsenic        | µg/L      |                 10.00 |           12.30 |        0 |
-- | Ville de Nantes        | Station Eau Nord              | ECO-2025-001     | pH             | unité pH  |                  8.50 |            8.10 |        1 |
-- | IndusChem Atlantique   | Usine Zone Portuaire          | ECO-2025-002     | plomb          | µg/L      |                 10.00 |            9.20 |        1 |
-- | EauPure Bretagne       | Bassin Vilaine                | ECO-2025-004     | mercure        | µg/L      |                  1.00 |            0.40 |        1 |
-- | Hôpital Saint-Luc      | Bloc Technique Hospitalier    | ECO-2025-007     | legionelles    | UFC/L     |               1000.00 |          940.00 |        1 |
-- | Métropole Lyon         | Station Rhône Centre          | ECO-2025-009     | conductivite   | µS/cm     |               2500.00 |          760.00 |        1 |
-- | Université Littorale   | Plateforme Marine             | ECO-2025-012     | arsenic        | µg/L      |                 10.00 |            8.50 |        1 |
-- +------------------------+------------------------------+------------------+----------------+-----------+-----------------------+-----------------+----------+
-- 12 rows in set (0.00 sec)

CREATE OR REPLACE VIEW vue_resultats_complets AS
SELECT
  client.nom AS `client`,
  site.nom_site,
  echantillon.code_echantillon,
  parametre_analyse.nom_parametre,
  parametre_analyse.unite,
  parametre_analyse.seuil_reglementaire,
  resultat_analyse.valeur_mesuree,
  resultat_analyse.conforme
FROM client
INNER JOIN site ON site.id_client = client.id_client
INNER JOIN prelevement ON prelevement.id_site = site.id_site
INNER JOIN echantillon ON echantillon.id_prelevement = prelevement.id_prelevement
INNER JOIN analyse ON analyse.id_echantillon = echantillon.id_echantillon
INNER JOIN resultat_analyse ON resultat_analyse.id_analyse = analyse.id_analyse
INNER JOIN methode_analyse ON methode_analyse.id_methode = analyse.id_methode
INNER JOIN parametre_analyse ON parametre_analyse.id_parametre = methode_analyse.id_parametre
ORDER BY resultat_analyse.id_resultat ASC;

SELECT * FROM vue_resultats_complets;
