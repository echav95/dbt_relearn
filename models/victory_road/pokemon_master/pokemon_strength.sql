With a AS (SELECT
    ID,
    NAME,
    TOTAL,
    ATTACK,
    CASE
        WHEN ATTACK > 50 then 'Strong'
        WHEN ATTACK > 60 then 'Really Strong'
        ELSE 'Weak'
        END as Power
FROM {{ ref("pokemon_battle") }})

SELECT *
FROM a