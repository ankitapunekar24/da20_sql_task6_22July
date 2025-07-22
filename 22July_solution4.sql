------------------------------------------------------------------
1. MULTI JOIN

CREATE VIEW customer_order_product_view AS
SELECT 
    c.cust_id,
    c.customer_name,
    c.segment,
    s.order_id,
    s.qty,
    s.sales,
    p.product_id,
    p.category,
    s.ship_date
FROM customer AS c
INNER JOIN sales AS s ON c.cust_id = s.cust_id
INNER JOIN product AS p ON s.product_id = p.product_id

SELECT * FROM customer_order_product_view

--------------------------------------------------------------------------

2. CTE

CREATE VIEW customer_total_sales_cte_view AS
WITH customer_totals AS (
    SELECT 
        c.cust_id,
        c.customer_name,
        SUM(s.sales) AS total_sales
    FROM customer AS c
    INNER JOIN sales AS s ON c.cust_id = s.cust_id
    GROUP BY c.cust_id, c.customer_name
)
SELECT * 
FROM customer_totals
WHERE total_sales > 10000

SELECT * FROM customer_total_sales_cte_view

--------------------------------------------------------------------------
3. SUBQUERY

CREATE VIEW product_sales_ranking_view AS
SELECT 
    p.product_id,
    p.category,
    p.sub_category,
    (
        SELECT SUM(s.sales)
        FROM sales AS s
        WHERE s.product_id = p.product_id
    ) AS total_product_sales
FROM product AS p

SELECT * FROM product_sales_ranking_view