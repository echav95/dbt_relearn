With battle As (Select
    id,
    name,
    total,
    attack,
    release_date,
    Case
        When attack > 60 Then 'Really Strong'
        When attack > 50 Then 'Strong'
        Else 'Weak'
    End As power,
    datediff('day', release_date, {{ dbt.current_timestamp() }})
        As days_since_released
From {{ ref("pokemon_battle", v=1) }}
)

Select *
From battle