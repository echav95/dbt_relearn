With a AS (SELECT
    ID,
    NAME,
    TOTAL,
    ATTACK,
    CASE
        WHEN ATTACK > 60 then 'Really Strong'
        WHEN ATTACK > 50 then 'Strong'
        ELSE 'Weak'
        END as Power,
    Release_Date,
    datediff('day', Release_Date, {{dbt.current_timestamp()}}) as days_since_released
FROM {{ ref("pokemon_battle") }})

SELECT *
FROM a