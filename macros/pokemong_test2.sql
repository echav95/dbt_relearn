{% test pokemon_wrong(model, column_name) %}

SELECT *
FROM {{model}}
WHERE {{column_name}} = 'Fred'

{% endtest %}