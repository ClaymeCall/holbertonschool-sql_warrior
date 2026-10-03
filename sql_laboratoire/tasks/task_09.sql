-- Task 9 - Afficher les analyses avec leur methode
-- Test ON
--
-- Instructions
--
--     Afficher l'identifiant de l'analyse, le code de l'echantillon, la
--     methode utilisee et le statut de l'analyse.
--     Trier par identifiant d'analyse.
--
-- Resultat attendu
--
-- +------------+------------------+-------------------------------+-----------+
-- | id_analyse | code_echantillon | nom_methode                    | statut    |
-- +------------+------------------+-------------------------------+-----------+
-- |          1 | ECO-2025-001     | Potentiométrie                 | terminee  |
-- |          2 | ECO-2025-002     | Spectrométrie ICP-MS           | terminee  |
-- |          3 | ECO-2025-003     | Gravimétrie PM10                | en_cours  |
-- |          4 | ECO-2025-004     | Absorption atomique mercure     | terminee  |
-- |          5 | ECO-2025-005     | Chromatographie ionique         | planifiee |
-- |          6 | ECO-2025-006     | Extraction GC-FID                | en_cours  |
-- |          7 | ECO-2025-007     | Culture légionelles              | terminee  |
-- |          8 | ECO-2025-008     | Gravimétrie PM10                | en_cours  |
-- |          9 | ECO-2025-009     | Conductimétrie                   | terminee  |
-- |         10 | ECO-2025-010     | GC-MS benzène                    | planifiee |
-- |         11 | ECO-2025-011     | Chromatographie ionique          | en_cours  |
-- |         12 | ECO-2025-012     | ICP-MS arsenic                   | terminee  |
-- +------------+------------------+-------------------------------+-----------+
-- 12 rows in set (0.01 sec)

SELECT a.id_analyse, e.code_echantillon, m.nom_methode, a.statut
FROM analyse a
INNER JOIN echantillon e ON a.id_echantillon = e.id_echantillon
INNER JOIN methode_analyse m ON a.id_methode = m.id_methode
ORDER BY a.id_analyse;
