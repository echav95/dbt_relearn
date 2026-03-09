with customer as (
    select *
    from {{ ref('stg_jaffle_shop_customers') }}
)

select *
from customer