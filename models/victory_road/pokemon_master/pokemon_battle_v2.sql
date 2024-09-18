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
    generation
FROM poke_data