-- Task 9
-- Test ON
--
-- Instructions
--
--     Afficher les mangas avec leur mangaka.
--     Afficher le titre du manga, le prénom, le nom et le pays du mangaka.
--     Trier par titre de manga.
--
-- Résultat attendu
--
-- +---------------------------------+-----------+-----------+-------+
-- | titre                           | prenom    | nom       | pays  |
-- +---------------------------------+-----------+-----------+-------+
-- | Bakuman - Tome 1                | Takeshi   | Obata     | Japon |
-- | Bakuman - Tome 2                | Takeshi   | Obata     | Japon |
-- | Bleach - Tome 1                 | Tite      | Kubo      | Japon |
-- | Bleach - Tome 2                 | Tite      | Kubo      | Japon |
-- | Death Note - Tome 1             | Tsugumi   | Ohba      | Japon |
-- | Death Note - Tome 2             | Tsugumi   | Ohba      | Japon |
-- | Demon Slayer - Tome 1           | Koyoharu  | Gotōge    | Japon |
-- | Demon Slayer - Tome 2           | Koyoharu  | Gotōge    | Japon |
-- | Dragon Ball - Tome 1            | Akira     | Toriyama  | Japon |
-- | Dragon Ball - Tome 2            | Akira     | Toriyama  | Japon |
-- | Fullmetal Alchemist - Tome 1    | Hiromu    | Arakawa   | Japon |
-- | Fullmetal Alchemist - Tome 2    | Hiromu    | Arakawa   | Japon |
-- | Jujutsu Kaisen - Tome 1         | Gege      | Akutami   | Japon |
-- | Jujutsu Kaisen - Tome 2         | Gege      | Akutami   | Japon |
-- | L’Attaque des Titans - Tome 1   | Hajime    | Isayama   | Japon |
-- | L’Attaque des Titans - Tome 2   | Hajime    | Isayama   | Japon |
-- | Naruto - Tome 1                 | Masashi   | Kishimoto | Japon |
-- | Naruto - Tome 2                 | Masashi   | Kishimoto | Japon |
-- | One Piece - Tome 1              | Eiichirō  | Oda       | Japon |
-- | One Piece - Tome 2              | Eiichirō  | Oda       | Japon |
-- | Ranma 1/2 - Tome 1              | Rumiko    | Takahashi | Japon |
-- | Ranma 1/2 - Tome 2              | Rumiko    | Takahashi | Japon |
-- | Sailor Moon - Tome 1            | Naoko     | Takeuchi  | Japon |
-- | Sailor Moon - Tome 2            | Naoko     | Takeuchi  | Japon |
-- +---------------------------------+-----------+-----------+-------+
-- 24 rows in set (0.00 sec)

SELECT
	mangas.titre,
    mangakas.prenom,
    mangakas.nom,
    mangakas.pays
FROM
	mangas
INNER JOIN mangakas ON mangas.code_mangaka = mangakas.code_mangaka
ORDER BY mangas.titre ASC;
