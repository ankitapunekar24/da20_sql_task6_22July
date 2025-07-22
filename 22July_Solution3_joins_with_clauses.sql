select * from sales

select * from product 

select * from customer



-----------------------------------------------------------------
create view customer_order_category_view as
select c.cust_id , c.customer_name ,c.segment, p.category ,
s.order_id , sum(s.qty) as total_qty 
from customer as c
INNER JOIN sales AS s ON s.cust_id = c.cust_id
INNER JOIN product AS p ON s.product_id = p.product_id
where ship_date > '2018-01-01'
group by c.cust_id , c.customer_name ,c.segment, p.category ,
s.order_id 

select * from customer_order_category_view

------------------------------------------------------------------
create view segment_sales_summary as
select c.cust_id , c.customer_name ,c.segment, p.category ,
s.order_id , sum(s.qty) as total_qty 
from customer as c
INNER JOIN sales AS s ON s.cust_id = c.cust_id
INNER JOIN product AS p ON s.product_id = p.product_id
where ship_date > '2018-01-01'
group by c.cust_id , c.customer_name ,c.segment, p.category ,
s.order_id 
having segment = 'Corporate'

select * from segment_sales_summary

----------------------------------------------------------------
CREATE VIEW customer_sales_summary AS
select c.cust_id , c.customer_name ,c.segment, p.category ,
s.order_id , sum(s.qty) as total_qty 
from customer as c
INNER JOIN sales AS s ON s.cust_id = c.cust_id
INNER JOIN product AS p ON s.product_id = p.product_id
where ship_date > '2018-01-01'
group by c.cust_id , c.customer_name ,c.segment, p.category ,
s.order_id 
having segment = 'Corporate'
order by age asc

select * from customer_sales_summary