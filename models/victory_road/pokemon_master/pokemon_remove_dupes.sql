with poke as (SELECT *,
ROW_NUMBER() OVER (PARTITION BY ID ORDER BY ID) AS rn
FROM {{ref("pokemon_battle")}}
ORDER BY ID)
SELECT * 
FROM poke
WHERE rn = 1