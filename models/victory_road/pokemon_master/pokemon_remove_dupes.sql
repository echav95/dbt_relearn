with poke as (
    select
        *,
        ROW_NUMBER() over (partition by id order by id) as rn
    from {{ ref("pokemon_battle", v=2) }}
    order by id
)

select *
from poke
where rn = 1