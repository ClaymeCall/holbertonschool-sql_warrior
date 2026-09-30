-- Task 12
-- Test ON
--
-- Instructions
--
--     Afficher les mangas du genre Horreur avec leur mangaka.
--     Afficher le titre du manga, le prénom et le nom du mangaka et le genre du manga.
--
-- Résultat attendu
--
-- +-------------------------+----------+---------+---------------+
-- | titre                   | prenom   | nom     | signification |
-- +-------------------------+----------+---------+---------------+
-- | Demon Slayer - Tome 1   | Koyoharu | Gotōge  | Horreur       |
-- | Demon Slayer - Tome 2   | Koyoharu | Gotōge  | Horreur       |
-- | Jujutsu Kaisen - Tome 1 | Gege     | Akutami | Horreur       |
-- | Jujutsu Kaisen - Tome 2 | Gege     | Akutami | Horreur       |
-- +-------------------------+----------+---------+---------------+
-- 4 rows in set (0.01 sec)

SELECT
  mangas.titre,
  mangakas.prenom,
  mangakas.nom,
  genres_manga.signification
FROM
  mangas

INNER JOIN mangakas ON mangas.code_mangaka = mangakas.code_mangaka
INNER JOIN genres_manga ON mangas.code_genre = genres_manga.code_genre

WHERE
  genres_manga.signification = 'Horreur'

ORDER BY mangas.titre ASC;
