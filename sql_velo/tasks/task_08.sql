-- Task 8
-- Test ON
--
-- Instructions
--
--     Calculer le montant moyen des paiements.
--     Afficher uniquement les colonnes mentionnees dans Resultat attendu.
--     Le nom de la colonne doit correspondre a celui mentionne dans
--     Resultat attendu.
--
-- Resultat attendu
--
-- +-----------+
-- | moyenne   |
-- +-----------+
-- | 11.833333 |
-- +-----------+
-- 1 row in set (0.00 sec)

SELECT AVG(montant) AS moyenne FROM paiements;
