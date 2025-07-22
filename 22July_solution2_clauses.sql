select * from sales

select * from product

select * from customer

CREATE VIEW customer_orders_over_45 AS
select c.segment, c.cust_id, s.order_id from customer as c
inner join sales as s on s.cust_id = c.cust_id
where age > 45

select * from customer_orders_over_45

--------------------------------------------------------

CREATE VIEW customer_product_shipments as
select c.cust_id, c.customer_name ,p.category,p.product_id,s.ship_date from customer as c
INNER JOIN sales AS s ON s.cust_id = c.cust_id
INNER JOIN product AS p ON s.product_id = p.product_id
WHERE c.age > 40;

select * from customer_product_shipments

--------------------------------------------------------

CREATE VIEW customer_sales_summary_over_40 as
select c.cust_id, c.customer_name ,sum(s.sales) AS total_sales,
p.category,p.product_id,s.ship_date from customer as c
INNER JOIN sales AS s ON s.cust_id = c.cust_id
INNER JOIN product AS p ON s.product_id = p.product_id
WHERE c.age > 40
Group by c.cust_id, 
    c.customer_name, 
    p.category, 
    p.product_id, 
    s.ship_date;

select * from customer_sales_summary

--------------------------------------------------------

CREATE VIEW high_value_sales_over as
select c.cust_id, c.customer_name ,sum(s.sales) AS total_sales,
p.category,p.product_id,s.ship_date from customer as c
INNER JOIN sales AS s ON s.cust_id = c.cust_id
INNER JOIN product AS p ON s.product_id = p.product_id
WHERE c.age > 40
Group by c.cust_id, 
    c.customer_name, 
    p.category, 
    p.product_id, 
    s.ship_date
having sum(s.sales) >10000
order by total_sales asc

select * from high_value_sales_over