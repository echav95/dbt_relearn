WITH poke_data AS (
    SELECT *
    FROM {{ ref("pokemon") }}
    WHERE name NOT LIKE '%Mega%'
)

SELECT *
FROM poke_data
