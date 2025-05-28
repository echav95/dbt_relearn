def model (dbt, session):
    
    poke_str = dbt.ref("pokemon_strength")

    return poke_str