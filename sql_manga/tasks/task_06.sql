-- Task 6
--
-- Instructions
--
--     Compter le nombre de mangas par genre.
--     Afficher le genre ainsi que le nombre de mangas correspondants.
--     Trier les résultats du genre le plus représenté au moins représenté.
--     Les noms des colonnes doivent correspondre exactement à ceux indiqués dans la section **Résultat attendu** (pensez à utiliser les bons alias).
--
-- Résultat attendu
--
-- +----------+---------------------------+
-- | genre    | nombre_de_manga_par_genre |
-- +----------+---------------------------+
-- | Shōnen   |                         6 |
-- | Horreur  |                         4 |
-- | Comédie  |                         4 |
-- | Shōjo    |                         2 |
-- | Seinen   |                         2 |
-- | Aventure |                         2 |
-- | Fantasy  |                         2 |
-- | Policier |                         2 |
-- +----------+---------------------------+
-- 8 rows in set (0.00 sec)

SELECT
	genres_manga.signification AS `genre`,
    COUNT(mangas.num_manga) AS `nombre_de_manga_par_genre`
FROM
    `mangas`
INNER JOIN genres_manga ON mangas.code_genre=genres_manga.code_genre
GROUP BY
    genres_manga.signification
ORDER BY
	nombre_de_manga_par_genre DESC;
