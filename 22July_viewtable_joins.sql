select * from sales
select * from customer

-----1st View------
create view customer_orders as
select s.cust_id, s.qty as "qty_per_product",
s.order_date , c.segment , c.customer_name 
from sales as s
inner join customer as c
on s.cust_id = c.cust_id

select * from customer_orders

----2nd view----------
create view full_order_summary as
select s.order_id , s.ship_date, s.discount,
c.customer_name, c.city, s.ship_mode 
from sales as s left join customer as c 
on s.cust_id = c.cust_id

select * from full_order_summary

----3rd view----------

create view order_item_details as
select s.cust_id, c.customer_name , s.discount , s.profit ,c.segment , c.country 
from sales as s
inner join customer as c
on s.cust_id = c.cust_id

select * from order_item_details



