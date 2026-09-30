-- Task 2
-- Test OFF
--
-- Instructions
--
--     Tester une violation de cle primaire.
--
--     Commande SQL a executer :
--         INSERT INTO utilisateurs(id, nom_complet, email, mot_de_passe)
--         VALUES (1, 'Test', 'test@test.com', '123');
--
--     Resultat attendu :
--         ERROR 1062 (23000): Duplicate entry '1' for key 'utilisateurs.PRIMARY'
--
--     Rechercher sur Internet la signification de l'erreur SQL ERROR 1062.
--     Prendre le temps d'analyser et de comprendre pourquoi une erreur de type
--     ERROR 1062 survient suite a l'execution de la commande INSERT ci-dessus.

INSERT INTO utilisateurs(id, nom_complet, email, mot_de_passe)
VALUES (1, 'Test', 'test@test.com', '123');
