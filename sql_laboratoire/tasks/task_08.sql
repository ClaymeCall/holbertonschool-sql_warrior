-- Task 8 - Afficher les echantillons avec leur type
-- Test ON
--
-- Instructions
--
--     Afficher le code de l'echantillon et son type.
--     Trier par code d'echantillon.
--
-- Resultat attendu
--
-- +------------------+-----------------------+
-- | code_echantillon | libelle_type          |
-- +------------------+-----------------------+
-- | ECO-2025-001     | eau potable           |
-- | ECO-2025-002     | eau industrielle      |
-- | ECO-2025-003     | air ambiant           |
-- | ECO-2025-004     | eau de surface        |
-- | ECO-2025-005     | sol                   |
-- | ECO-2025-006     | sediment              |
-- | ECO-2025-007     | eau chaude sanitaire  |
-- | ECO-2025-008     | poussiere             |
-- | ECO-2025-009     | eau de surface        |
-- | ECO-2025-010     | gaz industriel        |
-- | ECO-2025-011     | sol                   |
-- | ECO-2025-012     | eau souterraine       |
-- +------------------+-----------------------+
-- 12 rows in set (0.00 sec)

SELECT e.code_echantillon, t.libelle_type
FROM echantillon e
INNER JOIN type_echantillon t ON e.id_type_echantillon = t.id_type_echantillon
ORDER BY e.code_echantillon;
