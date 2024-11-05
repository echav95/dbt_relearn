{% test count_greater_one( model, column_name ) %}

select count({{ column_name }})
from {{ model }}
GROUP BY {{ column_name }}
HAVING count({{ column_name }})>1

{% endtest %}