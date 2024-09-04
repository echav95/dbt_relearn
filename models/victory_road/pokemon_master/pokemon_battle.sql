WITH poke_data AS (
    SELECT *
    FROM {{ref("pokemon")}}
    WHERE NAME NOT LIKE '%Mega%'
)
SELECT *
FROM poke_data