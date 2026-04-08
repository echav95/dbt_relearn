select purchase_size, 
'apple' as fruit
from {{ref("fct_customer__orders")}}
