select * 
FROM {{ source('ANALYTICS', 'listings') }}
order by id