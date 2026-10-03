-- Task 6 - Identifier les equipements recents
-- Test ON
--
-- Instructions
--
--     Afficher les 3 equipements les plus recemment mis en service.
--     Afficher leur nom, leur type, leur date de mise en service et leur
--     statut.
--
-- Resultat attendu
--
-- +--------------------------+--------------------------+--------------------+-------------+
-- | nom_equipement           | type_equipement          | date_mise_service  | statut      |
-- +--------------------------+--------------------------+--------------------+-------------+
-- | Conductimètre CondX      | mesure electrochimique   | 2024-01-15         | actif       |
-- | GC-MS VolatilePro        | chromatographie gaz      | 2023-08-29         | maintenance |
-- | Préleveur PM10 AirSafe   | mesure air               | 2023-03-22         | actif       |
-- +--------------------------+--------------------------+--------------------+-------------+
-- 3 rows in set (0.00 sec)

SELECT nom_equipement, type_equipement, date_mise_service, statut
FROM equipement
ORDER BY date_mise_service DESC
LIMIT 3;
