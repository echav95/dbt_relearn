select purchase_size, count(purchase_size) as purchase_size_count
from {{ref("fct_customer__orders")}}
group by purchase_size