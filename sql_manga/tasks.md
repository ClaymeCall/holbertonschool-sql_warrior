# Tasks instructions and answers

## Task 1

### Énoncé

Instructions

    Afficher tous les mangas avec leur numéro, leur titre, leur prix de base et leur année.
    Trier les résultats par titre.

Résultat attendu

+-----------+---------------------------------+-----------+-------+
| num_manga | titre                           | prix_base | annee |
+-----------+---------------------------------+-----------+-------+
|        23 | Bakuman - Tome 1                |      2.20 |  2008 |
|        24 | Bakuman - Tome 2                |      2.20 |  2009 |
|        15 | Bleach - Tome 1                 |      2.30 |  2001 |
|        16 | Bleach - Tome 2                 |      2.30 |  2002 |
|        21 | Death Note - Tome 1             |      2.50 |  2003 |
|        22 | Death Note - Tome 2             |      2.50 |  2004 |
|        17 | Demon Slayer - Tome 1           |      2.60 |  2016 |
|        18 | Demon Slayer - Tome 2           |      2.60 |  2017 |
|         5 | Dragon Ball - Tome 1            |      2.00 |  1984 |
|         6 | Dragon Ball - Tome 2            |      2.00 |  1985 |
|        11 | Fullmetal Alchemist - Tome 1    |      2.40 |  2001 |
|        12 | Fullmetal Alchemist - Tome 2    |      2.40 |  2002 |
|        19 | Jujutsu Kaisen - Tome 1         |      2.70 |  2018 |
|        20 | Jujutsu Kaisen - Tome 2         |      2.70 |  2019 |
|         9 | L’Attaque des Titans - Tome 1   |      2.80 |  2009 |
|        10 | L’Attaque des Titans - Tome 2   |      2.80 |  2010 |
|         3 | Naruto - Tome 1                 |      2.20 |  1999 |
|         4 | Naruto - Tome 2                 |      2.20 |  2000 |
|         1 | One Piece - Tome 1              |      2.50 |  1997 |
|         2 | One Piece - Tome 2              |      2.50 |  1998 |
|        13 | Ranma 1/2 - Tome 1              |      1.90 |  1987 |
|        14 | Ranma 1/2 - Tome 2              |      1.90 |  1988 |
|         7 | Sailor Moon - Tome 1            |      2.10 |  1992 |
|         8 | Sailor Moon - Tome 2            |      2.10 |  1993 |
+-----------+---------------------------------+-----------+-------+
24 rows in set (0.01 sec)

### Réponse

```sql
SELECT num_manga, titre, prix_base, annee FROM `mangas`;
```

## Task 2

### Énoncé

Instructions

    Afficher les mangas sortis à partir de 2010.
    Afficher uniquement le titre, l’année et le prix de base.
    Trier les mangas par annee dans un ordre ascendant.

Résultat attendu

+---------------------------------+-------+-----------+
| titre                           | annee | prix_base |
+---------------------------------+-------+-----------+
| L’Attaque des Titans - Tome 2   |  2010 |      2.80 |
| Demon Slayer - Tome 1           |  2016 |      2.60 |
| Demon Slayer - Tome 2           |  2017 |      2.60 |
| Jujutsu Kaisen - Tome 1         |  2018 |      2.70 |
| Jujutsu Kaisen - Tome 2         |  2019 |      2.70 |
+---------------------------------+-------+-----------+
5 rows in set (0.00 sec)

### Réponse

```sql
SELECT titre, annee, prix_base FROM `mangas` WHERE (annee >= 2010) ORDER BY annee ASC;
```

## Task 3

### Énoncé

Instructions

    Afficher les clients habitant à Lyon ou à Bordeaux.
    Afficher le prénom, le nom et la ville.

Résultat attendu

+--------+---------+----------+
| prenom | nom     | ville    |
+--------+---------+----------+
| Lucas  | Bernard | Lyon     |
| Chloé  | Petit   | Lyon     |
| Nathan | Durand  | Bordeaux |
| Manon  | Laurent | Bordeaux |
+--------+---------+----------+
4 rows in set (0.00 sec)

### Réponse

```sql
SELECT prenom, nom, ville FROM `clients` WHERE ville = 'Lyon' OR ville = 'Bordeaux';
```

## Task 4

### Énoncé

Instructions

    Afficher les mangas dont le titre contient « Tome 1 ».
    Affiche uniquement le num_manga et le titre.
    Trier les résultats par num_manga.

Résultat attendu

+-----------+---------------------------------+
| num_manga | titre                           |
+-----------+---------------------------------+
|         1 | One Piece - Tome 1              |
|         3 | Naruto - Tome 1                 |
|         5 | Dragon Ball - Tome 1            |
|         7 | Sailor Moon - Tome 1            |
|         9 | L’Attaque des Titans - Tome 1   |
|        11 | Fullmetal Alchemist - Tome 1    |
|        13 | Ranma 1/2 - Tome 1              |
|        15 | Bleach - Tome 1                 |
|        17 | Demon Slayer - Tome 1           |
|        19 | Jujutsu Kaisen - Tome 1         |
|        21 | Death Note - Tome 1             |
|        23 | Bakuman - Tome 1                |
+-----------+---------------------------------+
12 rows in set (0.01 sec)

### Réponse

## Task 5

### Énoncé

Instructions

    Calculer le nombre total de mangas, le prix moyen et le prix maximum.
    Arrondir le prix moyen à 2 décimales.
    Utilisez des alias afin d’obtenir les mêmes intitulés de colonnes que ceux affichés dans la section **Résultat attendu**.

Résultat attendu

+------------------------+------------+----------+
| nombre_total_de_mangas | prix_moyen | prix_max |
+------------------------+------------+----------+
|                     24 |       2.35 |     2.80 |
+------------------------+------------+----------+
1 row in set (0.00 sec)

### Réponse

## Task 6

### Énoncé

Instructions

    Compter le nombre de mangas par genre.
    Afficher le genre ainsi que le nombre de mangas correspondants.
    Trier les résultats du genre le plus représenté au moins représenté.
    Les noms des colonnes doivent correspondre exactement à ceux indiqués dans la section **Résultat attendu** (pensez à utiliser les bons alias).

Résultat attendu

+----------+---------------------------+
| genre    | nombre_de_manga_par_genre |
+----------+---------------------------+
| Shōnen   |                         6 |
| Horreur  |                         4 |
| Comédie  |                         4 |
| Shōjo    |                         2 |
| Seinen   |                         2 |
| Aventure |                         2 |
| Fantasy  |                         2 |
| Policier |                         2 |
+----------+---------------------------+
8 rows in set (0.00 sec)

### Réponse

## Task 7

### Énoncé

Instructions

    Calculer le montant de chaque facture.
    Le montant d’une ligne se calcule ainsi : `prix_base × coefficient` du type de location.
    Afficher le numéro de facture et le montant total.
    Les noms des colonnes doivent correspondre exactement à ceux indiqués dans la section **Résultat attendu** (pensez à utiliser les bons alias).

Résultat attendu

+-------------+----------+
| num_facture | depenses |
+-------------+----------+
|           1 |   5.1400 |
|           2 |   4.7200 |
|           3 |   8.6400 |
|           4 |   4.0100 |
|           5 |   9.0000 |
|           6 |   6.5400 |
|           7 |   4.6400 |
|           8 |   4.5300 |
|           9 |   8.0400 |
|          10 |   3.8600 |
|          11 |   4.6800 |
|          12 |   4.3200 |
|          13 |   5.0000 |
|          14 |   1.7600 |
|          15 |   5.5000 |
+-------------+----------+
15 rows in set (0.01 sec)

### Réponse

## Task 8

### Énoncé

Instructions

    Afficher le nombre de clients et le total d’enfants par ville.
    Trier par ville.
    Les noms des colonnes doivent correspondre exactement à ceux indiqués dans la section **Résultat attendu** (pensez à utiliser les bons alias).

Résultat attendu

+-------------+-------------------+------------------+
| ville       | nombre_de_clients | nombre_d_enfants |
+-------------+-------------------+------------------+
| Bordeaux    |                 2 |                5 |
| Lille       |                 1 |                3 |
| Lyon        |                 2 |                2 |
| Marseille   |                 1 |                2 |
| Montpellier |                 1 |                2 |
| Nantes      |                 1 |                0 |
| Nice        |                 1 |                0 |
| Orléans     |                 1 |                1 |
| Paris       |                 1 |                1 |
| Toulouse    |                 1 |                0 |
+-------------+-------------------+------------------+
10 rows in set (0.00 sec)

### Réponse

## Task 9

### Énoncé

Instructions

    Afficher les mangas avec leur mangaka.
    Afficher le titre du manga, le prénom, le nom et le pays du mangaka.
    Trier par titre de manga.

Résultat attendu

+---------------------------------+-----------+-----------+-------+
| titre                           | prenom    | nom       | pays  |
+---------------------------------+-----------+-----------+-------+
| Bakuman - Tome 1                | Takeshi   | Obata     | Japon |
| Bakuman - Tome 2                | Takeshi   | Obata     | Japon |
| Bleach - Tome 1                 | Tite      | Kubo      | Japon |
| Bleach - Tome 2                 | Tite      | Kubo      | Japon |
| Death Note - Tome 1             | Tsugumi   | Ohba      | Japon |
| Death Note - Tome 2             | Tsugumi   | Ohba      | Japon |
| Demon Slayer - Tome 1           | Koyoharu  | Gotōge    | Japon |
| Demon Slayer - Tome 2           | Koyoharu  | Gotōge    | Japon |
| Dragon Ball - Tome 1            | Akira     | Toriyama  | Japon |
| Dragon Ball - Tome 2            | Akira     | Toriyama  | Japon |
| Fullmetal Alchemist - Tome 1    | Hiromu    | Arakawa   | Japon |
| Fullmetal Alchemist - Tome 2    | Hiromu    | Arakawa   | Japon |
| Jujutsu Kaisen - Tome 1         | Gege      | Akutami   | Japon |
| Jujutsu Kaisen - Tome 2         | Gege      | Akutami   | Japon |
| L’Attaque des Titans - Tome 1   | Hajime    | Isayama   | Japon |
| L’Attaque des Titans - Tome 2   | Hajime    | Isayama   | Japon |
| Naruto - Tome 1                 | Masashi   | Kishimoto | Japon |
| Naruto - Tome 2                 | Masashi   | Kishimoto | Japon |
| One Piece - Tome 1              | Eiichirō  | Oda       | Japon |
| One Piece - Tome 2              | Eiichirō  | Oda       | Japon |
| Ranma 1/2 - Tome 1              | Rumiko    | Takahashi | Japon |
| Ranma 1/2 - Tome 2              | Rumiko    | Takahashi | Japon |
| Sailor Moon - Tome 1            | Naoko     | Takeuchi  | Japon |
| Sailor Moon - Tome 2            | Naoko     | Takeuchi  | Japon |
+---------------------------------+-----------+-----------+-------+
24 rows in set (0.00 sec)

### Réponse

## Task 10

### Énoncé

Instructions

    Afficher le détail des locations.
    Afficher le numéro de facture, le client (nom et prenom), le manga (titre), le type de location (libelle) et la date de retour.

Résultat attendu

+-------------+--------+----------+---------------------------------+---------------------+-------------+
| num_facture | prenom | nom      | titre                           | libelle             | date_retour |
+-------------+--------+----------+---------------------------------+---------------------+-------------+
|           1 | Emma   | Martin   | One Piece - Tome 1              | Location courte     | 2026-01-07  |
|           1 | Emma   | Martin   | Naruto - Tome 1                 | Location standard   | 2026-01-11  |
|          13 | Emma   | Martin   | Death Note - Tome 2             | Collector           | 2026-02-15  |
|           2 | Lucas  | Bernard  | Dragon Ball - Tome 1            | Week-end            | 2026-01-10  |
|           2 | Lucas  | Bernard  | Sailor Moon - Tome 1            | Location standard   | 2026-01-13  |
|           3 | Chloé  | Petit    | L’Attaque des Titans - Tome 1   | Nouveauté           | 2026-01-14  |
|           3 | Chloé  | Petit    | Fullmetal Alchemist - Tome 1    | Location longue     | 2026-01-20  |
|          14 | Chloé  | Petit    | Bakuman - Tome 2                | Découverte          | 2026-02-13  |
|           4 | Hugo   | Robert   | Ranma 1/2 - Tome 1              | Classique           | 2026-01-19  |
|           4 | Hugo   | Robert   | Bleach - Tome 1                 | Location courte     | 2026-01-14  |
|           5 | Inès   | Richard  | Demon Slayer - Tome 1           | Nouveauté           | 2026-01-21  |
|           5 | Inès   | Richard  | Jujutsu Kaisen - Tome 1         | Premium             | 2026-01-25  |
|           6 | Nathan | Durand   | Death Note - Tome 1             | Collector           | 2026-01-24  |
|           6 | Nathan | Durand   | Bakuman - Tome 1                | Étudiant            | 2026-01-23  |
|          15 | Nathan | Durand   | One Piece - Tome 1              | Retard régularisé   | 2026-02-15  |
|           7 | Léa    | Moreau   | One Piece - Tome 2              | Découverte          | 2026-01-22  |
|           7 | Léa    | Moreau   | Naruto - Tome 2                 | Location standard   | 2026-01-26  |
|           8 | Noah   | Simon    | Dragon Ball - Tome 2            | Classique           | 2026-01-29  |
|           8 | Noah   | Simon    | Sailor Moon - Tome 2            | Pack famille        | 2026-01-30  |
|           9 | Manon  | Laurent  | L’Attaque des Titans - Tome 2   | Location longue     | 2026-02-04  |
|           9 | Manon  | Laurent  | Fullmetal Alchemist - Tome 2    | Premium             | 2026-02-03  |
|          10 | Jules  | Lefebvre | Ranma 1/2 - Tome 2              | Étudiant            | 2026-02-01  |
|          10 | Jules  | Lefebvre | Bleach - Tome 2                 | Week-end            | 2026-02-02  |
|          11 | Sarah  | Michel   | Demon Slayer - Tome 2           | Nouveauté           | 2026-02-07  |
|          12 | Adam   | Garcia   | Jujutsu Kaisen - Tome 2         | Premium             | 2026-02-12  |
+-------------+--------+----------+---------------------------------+---------------------+-------------+
25 rows in set (0.00 sec)

### Réponse

## Task 11

### Énoncé

Instructions

    Afficher les 5 clients ayant généré le plus de chiffre d’affaires.
    Afficher le code client, le prénom, le nom, le nombre de locations et le total dépensé par client.

Résultat attendu

+-------------+--------+---------+--------------------+----------------+
| code_client | prenom | nom     | nombre_de_location | total_depenses |
+-------------+--------+---------+--------------------+----------------+
|           6 | Nathan | Durand  |                  3 |          12.04 |
|           3 | Chloé  | Petit   |                  3 |          10.40 |
|           1 | Emma   | Martin  |                  3 |          10.14 |
|           5 | Inès   | Richard |                  2 |           9.00 |
|           9 | Manon  | Laurent |                  2 |           8.04 |
+-------------+--------+---------+--------------------+----------------+
5 rows in set (0.01 sec)

### Réponse

## Task 12

### Énoncé

Instructions

    Afficher les mangas du genre Horreur avec leur mangaka.
    Afficher le titre du manga, le prénom et le nom du mangaka et le genre du manga.

Résultat attendu

+-------------------------+----------+---------+---------------+
| titre                   | prenom   | nom     | signification |
+-------------------------+----------+---------+---------------+
| Demon Slayer - Tome 1   | Koyoharu | Gotōge  | Horreur       |
| Demon Slayer - Tome 2   | Koyoharu | Gotōge  | Horreur       |
| Jujutsu Kaisen - Tome 1 | Gege     | Akutami | Horreur       |
| Jujutsu Kaisen - Tome 2 | Gege     | Akutami | Horreur       |
+-------------------------+----------+---------+---------------+
4 rows in set (0.01 sec)

### Réponse

## Task 13

### Énoncé

Instructions

    Construire une analyse croisée du nombre de locations par ville et par genre.
    Afficher au minimum les colonnes Aventure, Fantasy, Horreur et Shōnen.

Résultat attendu

+-------------+----------+---------+----------+---------+
| ville       | Aventure | Fantasy | Horreur | Shōnen  |
+-------------+----------+---------+----------+---------+
| Bordeaux    |        1 |       1 |        0 |       0 |
| Lille       |        0 |       0 |        0 |       1 |
| Lyon        |        0 |       1 |        0 |       1 |
| Marseille   |        0 |       0 |        0 |       1 |
| Montpellier |        0 |       0 |        1 |       0 |
| Nantes      |        0 |       0 |        0 |       1 |
| Nice        |        1 |       0 |        0 |       1 |
| Orléans     |        0 |       0 |        1 |       0 |
| Paris       |        1 |       0 |        0 |       1 |
| Toulouse    |        0 |       0 |        2 |       0 |
+-------------+----------+---------+----------+---------+
10 rows in set (0.01 sec)

### Réponse

## Task 14

### Énoncé

Instructions

    Calculer le chiffre d’affaires par genre de manga.
    Trier du chiffre d’affaires le plus élevé au plus faible.

Résultat attendu

+---------------+------------------+
| signification | chiffre_affaires |
+---------------+------------------+
| Horreur       |            18.00 |
| Shōnen        |            14.11 |
| Aventure      |            10.00 |
| Policier      |            10.00 |
| Seinen        |             9.24 |
| Fantasy       |             7.44 |
| Comédie       |             6.34 |
| Shōjo         |             5.25 |
+---------------+------------------+
8 rows in set (0.00 sec)

### Réponse

## Task 15

### Énoncé

Instructions

    Compter le nombre de locations par genre et par type de location.
    Afficher genre, type de location et nombre de locations.

Résultat attendu

+---------------+---------------------+-----------------+
| signification | libelle             | nombre_location |
+---------------+---------------------+-----------------+
| Aventure      | Découverte          |               1 |
| Aventure      | Location courte     |               1 |
| Aventure      | Retard régularisé   |               1 |
| Comédie       | Classique           |               1 |
| Comédie       | Découverte          |               1 |
| Comédie       | Étudiant            |               2 |
| Fantasy       | Location longue     |               1 |
| Fantasy       | Premium             |               1 |
| Horreur       | Nouveauté           |               2 |
| Horreur       | Premium             |               2 |
| Policier      | Collector           |               2 |
| Seinen        | Location longue     |               1 |
| Seinen        | Nouveauté           |               1 |
| Shōjo         | Location standard   |               1 |
| Shōjo         | Pack famille        |               1 |
| Shōnen        | Classique           |               1 |
| Shōnen        | Location courte     |               1 |
| Shōnen        | Location standard   |               2 |
| Shōnen        | Week-end            |               2 |
+---------------+---------------------+-----------------+
19 rows in set (0.00 sec)

### Réponse

## Task 16

### Énoncé

Instructions

    Calculer le chiffre d’affaires par ville.
    Trier du chiffre d’affaires le plus important au moins important.

Résultat attendu

+-------------+------------------+
| ville       | chiffre_affaires |
+-------------+------------------+
| Bordeaux    |            20.08 |
| Lyon        |            15.12 |
| Paris       |            10.14 |
| Toulouse    |             9.00 |
| Orléans     |             4.68 |
| Nice        |             4.64 |
| Marseille   |             4.53 |
| Montpellier |             4.32 |
| Lille       |             4.01 |
| Nantes      |             3.86 |
+-------------+------------------+
10 rows in set (0.00 sec)

### Réponse

## Task 17

### Énoncé

Instructions

    Ajouter un nouveau genre nommé « Historique » avec le code 13.
    Vérifier que le genre a bien été ajouté avec cette commande: `SELECT * FROM genres_manga WHERE code_genre = 13;`

Résultat attendu (de la commande SELECT ci-dessus)

+------------+---------------+
| code_genre | signification |
+------------+---------------+
|         13 | Historique    |
+------------+---------------+
1 row in set (0.00 sec)

### Réponse

## Task 18

### Énoncé

Instructions

    Ajouter un nouveau mangaka : Makoto Yukimura, né en 1976 au Japon, avec le code 13.
    Vérifier l'ajout du mangaka avec cette commande:

    SELECT * FROM mangakas WHERE code_mangaka = 13;

Résultat attendu

+--------------+--------+----------+-----------------+-------+
| code_mangaka | prenom | nom      | annee_naissance | pays  |
+--------------+--------+----------+-----------------+-------+
|           13 | Makoto | Yukimura |            1976 | Japon |
+--------------+--------+----------+-----------------+-------+
1 row in set (0.00 sec)

    Ajouter ensuite le manga « Vinland Saga - Tome 1 » avec:
        le numéro 25
        Makoto Yukimura comme mangaka
        un prix de base de 2.90 €
        le genre Historique
        l’année 2005
        une durée de 92 minutes
        descriptif: Thorfinn grandit dans un contexte de guerres vikings.
    Vérifier l'ajout du manga avec cette commande:

    SELECT num_manga, titre, prix_base, code_mangaka, code_genre, annee, duree FROM mangas WHERE num_manga = 25;

Résultat attendu

+-----------+-----------------------+-----------+--------------+------------+-------+-------+
| num_manga | titre                 | prix_base | code_mangaka | code_genre | annee | duree |
+-----------+-----------------------+-----------+--------------+------------+-------+-------+
|        25 | Vinland Saga - Tome 1 |      2.90 |           13 |         13 |  2005 |    92 |
+-----------+-----------------------+-----------+--------------+------------+-------+-------+
1 row in set (0.00 sec)

### Réponse

## Task 19

### Énoncé

Instructions

    Augmenter de 0.20 € le prix de base des mangas du genre Horreur.
    Vérifier le prix des mangas du genre Horreur avant l'augmentation des prix avec la commande:

SELECT m.num_manga, m.titre, m.prix_base, g.signification
FROM mangas m
JOIN genres_manga g ON g.code_genre = m.code_genre
WHERE g.signification = 'Horreur';

Résultat attendu AVANT augmentation des prix

+-----------+-------------------------+-----------+---------------+
| num_manga | titre                   | prix_base | signification |
+-----------+-------------------------+-----------+---------------+
|        17 | Demon Slayer - Tome 1   |      2.60 | Horreur       |
|        18 | Demon Slayer - Tome 2   |      2.60 | Horreur       |
|        19 | Jujutsu Kaisen - Tome 1 |      2.70 | Horreur       |
|        20 | Jujutsu Kaisen - Tome 2 |      2.70 | Horreur       |
+-----------+-------------------------+-----------+---------------+
4 rows in set (0.00 sec)

Résultat attendu APRES augmentation des prix

    Vérifier les nouveaux prix aprés l'augmentation des prix avec la même commande SELECT ci-dessus.
+-----------+-------------------------+-----------+---------------+
| num_manga | titre                   | prix_base | signification |
+-----------+-------------------------+-----------+---------------+
|        17 | Demon Slayer - Tome 1   |      2.80 | Horreur       |
|        18 | Demon Slayer - Tome 2   |      2.80 | Horreur       |
|        19 | Jujutsu Kaisen - Tome 1 |      2.90 | Horreur       |
|        20 | Jujutsu Kaisen - Tome 2 |      2.90 | Horreur       |
+-----------+-------------------------+-----------+---------------+
4 rows in set (0.00 sec)

### Réponse

## Task 20

### Énoncé

Instructions

    Affiche le nombre de location ayant le type de location « Retard régularisé »

Résultat attendu

+-----------+-----------------+
| code_type | nb_utilisations |
+-----------+-----------------+
|        12 |               1 |
+-----------+-----------------+
1 row in set (0.00 sec)

### Réponse
