-- Task 5
-- Test ON
--
-- Instructions
--
--     Afficher le nombre de vehicules par type.
--     Attention aux noms des colonnes, ils doivent etre identiques au
--     resultat attendu ci-dessous.
--     Attention a l'ordre dans lequel les donnees sont affichees : ca doit
--     etre identique au resultat attendu ci-dessous.
--
-- Resultat attendu
--
-- +------------+-------+
-- | libelle    | total |
-- +------------+-------+
-- | Citadine   |     4 |
-- | SUV        |     4 |
-- | Utilitaire |     3 |
-- | Minibus    |     1 |
-- | Berline    |     0 |
-- | Compacte   |     0 |
-- | Coupe      |     0 |
-- | Electrique |     0 |
-- | Hybride    |     0 |
-- | Microcar   |     0 |
-- | Pick-up    |     0 |
-- | Van        |     0 |
-- +------------+-------+
-- 12 rows in set (0.00 sec)

SELECT
  types_vehicules.libelle AS `libelle`,
  COUNT(vehicules.id) AS `total`
FROM types_vehicules

LEFT JOIN vehicules ON types_vehicules.id = vehicules.type_voiture

GROUP BY types_vehicules.libelle

ORDER BY `total` DESC;
