-- Task 17 - Utiliser une CTE
-- Test ON
--
-- Instructions
--
--     Etape 1
--     Creer une CTE nommee echantillons_par_client. Cette CTE doit
--     contenir 3 colonnes :
--         - id de chaque client sous le nom id_client
--         - nom de chaque client sous le nom nom_client
--         - nombre d'echantillons par client sous le nom
--           nombre_echantillons
--
-- La CTE doit ressembler a ca
--
-- +-----------+---------------------------+------------------------+
-- | id_client | nom_client                | nombre_echantillons    |
-- +-----------+---------------------------+------------------------+
-- |         1 | Ville de Nantes           |                      2 |
-- |         2 | IndusChem Atlantique      |                      1 |
-- |         3 | Bureau Etudes Vertis      |                      0 |
-- |         4 | EauPure Bretagne          |                      1 |
-- |         5 | AgriSol Loire             |                      1 |
-- |         6 | Port Atlantique Services  |                      1 |
-- |         7 | Hôpital Saint-Luc         |                      1 |
-- |         8 | Cimenterie Ouest          |                      1 |
-- |         9 | Métropole Lyon            |                      1 |
-- |        10 | AeroTech Sud              |                      1 |
-- |        11 | VitiBio Gironde           |                      1 |
-- |        12 | Université Littorale      |                      1 |
-- +-----------+---------------------------+------------------------+
-- 12 rows in set (0.01 sec)
--
--     Etape 2
--     Utiliser la CTE pour afficher uniquement les clients ayant au
--     moins 1 echantillon.
--     Afficher uniquement les colonnes nom_client et
--     nombre_echantillons.
--
-- Resultat attendu
--
-- +---------------------------+------------------------+
-- | nom_client                | nombre_echantillons    |
-- +---------------------------+------------------------+
-- | Ville de Nantes           |                      2 |
-- | IndusChem Atlantique      |                      1 |
-- | EauPure Bretagne          |                      1 |
-- | AgriSol Loire             |                      1 |
-- | Port Atlantique Services  |                      1 |
-- | Hôpital Saint-Luc         |                      1 |
-- | Cimenterie Ouest          |                      1 |
-- | Métropole Lyon            |                      1 |
-- | AeroTech Sud              |                      1 |
-- | VitiBio Gironde           |                      1 |
-- | Université Littorale      |                      1 |
-- +---------------------------+------------------------+
-- 11 rows in set (0.01 sec)

WITH echantillons_par_client AS (
  SELECT
    client.id_client AS id_client,
    client.nom AS nom_client,
    COUNT(echantillon.id_echantillon) AS nombre_echantillons
  FROM client
  LEFT JOIN site ON client.id_client = site.id_client
  LEFT JOIN prelevement ON site.id_site = prelevement.id_site
  LEFT JOIN echantillon ON prelevement.id_prelevement = echantillon.id_prelevement
  GROUP BY client.id_client, client.nom
)
SELECT id_client, nom_client, nombre_echantillons
FROM echantillons_par_client;

WITH echantillons_par_client AS (
  SELECT
    client.id_client AS id_client,
    client.nom AS nom_client,
    COUNT(echantillon.id_echantillon) AS nombre_echantillons
  FROM client
  LEFT JOIN site ON client.id_client = site.id_client
  LEFT JOIN prelevement ON site.id_site = prelevement.id_site
  LEFT JOIN echantillon ON prelevement.id_prelevement = echantillon.id_prelevement
  GROUP BY client.id_client, client.nom
)
SELECT nom_client, nombre_echantillons
FROM echantillons_par_client
WHERE nombre_echantillons >= 1
ORDER BY nombre_echantillons DESC;
