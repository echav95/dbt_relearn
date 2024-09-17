SELECT *
FROM {{ ref("pokemon") }}
WHERE NAME = 'Charmander'