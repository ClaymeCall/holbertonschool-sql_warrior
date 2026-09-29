-- Task 17
--
-- Instructions
--
--     Ajouter un nouveau genre nommé « Historique » avec le code 13.
--     Vérifier que le genre a bien été ajouté avec cette commande: `SELECT * FROM genres_manga WHERE code_genre = 13;`
--
-- Résultat attendu (de la commande SELECT ci-dessus)
--
-- +------------+---------------+
-- | code_genre | signification |
-- +------------+---------------+
-- |         13 | Historique    |
-- +------------+---------------+
-- 1 row in set (0.00 sec)

INSERT INTO genres_manga (code_genre, signification) VALUES (13, 'Historique');

SELECT * FROM genres_manga WHERE code_genre = 13;
