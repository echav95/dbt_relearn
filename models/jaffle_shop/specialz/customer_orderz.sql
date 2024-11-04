-- Yuji
-- I love you baby
-- Add you

with 

orders as (
    select *
    FROM {{source("ANALYTICS","ORDERS")}}
),

customers as (
    select *
    FROM {{source("ANALYTICS","CUSTOMERS")}}
),

payment as (
    select *
    FROM {{source("ANALYTICS","PAYMENT")}}
),

paid_orders as (select Orders.ID as order_id,
    Orders.USER_ID	as customer_id,
    Orders.ORDER_DATE AS order_placed_at,
        Orders.STATUS AS order_status,
    p.total_amount_paid,
    p.payment_finalized_date,
    C.FIRST_NAME    as customer_first_name,
        C.LAST_NAME as customer_last_name
FROM orders as Orders
left join (select ORDERID as order_id, max(CREATED) as payment_finalized_date, sum(AMOUNT) / 100.0 as total_amount_paid
        from payment
        where STATUS <> 'fail'
        group by 1) p ON orders.ID = p.order_id
left join raw.jaffle_shop.customers C on orders.USER_ID = C.ID ),

customer_orders 
as (select C.ID as customer_id
    , min(ORDER_DATE) as first_order_date
    , max(ORDER_DATE) as most_recent_order_date
    , count(ORDERS.ID) AS number_of_orders
from customers C 
left join raw.jaffle_shop.orders as Orders
on orders.USER_ID = C.ID 
group by 1)

select
p.*,
ROW_NUMBER() OVER (ORDER BY p.order_id) as transaction_seq,
ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY p.order_id) as customer_sales_seq,
CASE WHEN c.first_order_date = p.order_placed_at
THEN 'new'
ELSE 'return' END as nvsr,
sum(total_amount_paid) over (partition by p.customer_id order by p.order_placed_at) as customer_lifetime_value,
c.first_order_date as fdos
FROM paid_orders p
left join customer_orders as c USING (customer_id)
ORDER BY order_id