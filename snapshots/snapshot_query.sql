select
    id,
    name,
    minimum_nights,
    price,
    created_at,
    updated_at,
    dbt_scd_id,
    dbt_updated_at,
    dbt_valid_from,
    dbt_valid_to
from analytics.dbt_echavez.raw_listing_snap
where id = 3176
order by dbt_valid_to