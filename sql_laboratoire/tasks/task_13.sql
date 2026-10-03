-- Task 13 - Reperer les parametres non conformes
-- Test ON
--
-- Instructions
--
--     Afficher les parametres ayant au moins un resultat non conforme
--     (c'est-a-dire la valeur de conforme dans la table resultat_analyse
--     est egale a 0).
--     Afficher le nom du parametre, l'unite et le seuil reglementaire.
--     Ne pas afficher de doublons.
--
-- Resultat attendu
--
-- +----------------+--------+-----------------------+
-- | nom_parametre  | unite  | seuil_reglementaire    |
-- +----------------+--------+-----------------------+
-- | plomb          | µg/L   |                 10.00 |
-- | legionelles    | UFC/L  |               1000.00 |
-- | arsenic        | µg/L   |                 10.00 |
-- +----------------+--------+-----------------------+
-- 3 rows in set (0.00 sec)

SELECT DISTINCT p.nom_parametre, p.unite, p.seuil_reglementaire
FROM resultat_analyse r
INNER JOIN analyse a ON a.id_analyse = r.id_analyse
INNER JOIN methode_analyse m ON m.id_methode = a.id_methode
INNER JOIN parametre_analyse p ON p.id_parametre = m.id_parametre
WHERE r.conforme = 0;
