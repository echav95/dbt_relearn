WITH poke_data AS (
    SELECT *
    FROM {{ ref("pokemon_unclean") }}
    WHERE
        name NOT LIKE '%Mega%'
        AND name NOT LIKE '%Primal%'
)

SELECT
    id,
    name,
    type1,
    type2,
    total,
    hp,
    attack,
    defense,
    spatk,
    spdef,
    speed,
    legendary,
    generation,
    CASE
        WHEN generation = 1 THEN CAST('1996-02-27' AS DATE)
        WHEN generation = 2 THEN CAST('1999-11-21' AS DATE)
        WHEN generation = 3 THEN CAST('2003-07-18' AS DATE)
        WHEN generation = 4 THEN CAST('2006-09-28' AS DATE)
    END AS release_date
FROM poke_data
