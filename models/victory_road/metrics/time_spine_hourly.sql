{{
    config(
        materialized = 'table',
    )
}}

with hours as (

    {{
        dbt.date_spine(
            'hour',
            "to_date('01/01/2000','mm/dd/yyyy')",
            "to_date('01/01/2025','mm/dd/yyyy')"
        )
    }}

),

final as (
    select cast(date_hour as timestamp) as date_hour
    from hours
)

select * from final
-- filter the time spine to a specific range
where date_hour < dateadd(day, 30, current_timestamp())
-- and date_day > dateadd(year, -4, current_timestamp()) 
