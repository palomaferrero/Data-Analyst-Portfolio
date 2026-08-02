USE fashion_store_eu ;


-- 1) OVERALL SALES ANALYSIS & COMMERCIAL PERFORMANCE

-- Total sales revenue by channel.
SELECT channel , SUM(total_amount) AS total_sales
FROM sales
GROUP BY channel
ORDER BY total_sales DESC ;

-- Top 5 products by revenue.
SELECT p.product_name , p.category , SUM(s.item_total) AS total_product_amount
FROM salesitems AS s
    JOIN products AS p
    ON s.product_id = p.product_id
GROUP BY p.product_name , p.category
ORDER BY total_product_amount DESC
LIMIT 5 ;

-- Sales volume and average ticket by country.
SELECT country , COUNT(sale_id) AS sales_volume , ROUND(AVG(total_amount), 2) AS average_ticket
FROM sales
GROUP BY country
ORDER BY sales_volume DESC , average_ticket ;

-- Marketing campaign performance.
SELECT channel_campaigns , SUM(item_total) AS total_revenue , SUM(discount_applied) AS total_discounts_applied
FROM salesitems
GROUP BY channel_campaigns
ORDER BY total_revenue DESC , total_discounts_applied ;

-- Monthly sales trajectory.
SELECT MONTH(sale_date) AS month_sale , SUM(total_amount) AS total_sales
FROM sales 
GROUP BY month_sale 
ORDER BY month_sale ASC ;


-- 2) CUSTOMER SEGMENTATION & BEHAVIOR

-- E-commerce customer list in Germany.
SELECT DISTINCT c.customer_id , c.country , c.age_range , c.signup_date , s.channel
FROM customers AS c
   JOIN sales AS s
   ON c.customer_id = s.customer_id
WHERE c.country = "Germany" AND s.channel = "E-commerce"
ORDER BY c.customer_id ASC ;

-- VIP customer identification.
-- (Defined as customers with total spend exceeding $1,500)
SELECT customer_id , SUM(total_amount) AS total_spent , COUNT(sale_id) AS total_orders
FROM sales
GROUP BY customer_id
HAVING total_spent > 1500
ORDER BY total_spent DESC ;

-- Customer segmentation by average order value (AOV).
SELECT  customer_id, AVG(total_amount) AS average_ticket, 
    CASE
        WHEN AVG(total_amount) >= 400 THEN "High level"
        WHEN AVG(total_amount) >= 200 THEN "Mid level"
        ELSE "Low level"
    END AS customer_segment
FROM sales
GROUP BY customer_id
ORDER BY average_ticket DESC ;

-- Registered customers with zero purchases.
SELECT c.customer_id , c.signup_date , c.country
FROM customers AS c
    LEFT JOIN sales AS s
    ON c.customer_id = s.customer_id
WHERE s.sale_id IS NULL ;


-- 3) PRODUCT & INVENTORY ANALYSIS

-- Top 5 products by units sold.
SELECT p.product_name , p.category , SUM(s.quantity) AS total_units_sold
FROM products AS p
   JOIN salesitems AS s 
   ON s.product_id = p.product_id
GROUP BY p.product_name , p.category
ORDER BY total_units_sold DESC
LIMIT 5 ;

-- Top 3 product categories by performance.
-- (Categories exceeding $10,000 in total revenue)
SELECT p.category , SUM(s.item_total) AS total_revenue
FROM products AS p
    JOIN salesitems AS s
    ON p.product_id = s.product_id
GROUP BY p.category
HAVING total_revenue > 10000
ORDER BY total_revenue DESC
LIMIT 3 ;

-- Profit margin by product category.
SELECT p.category , SUM((s.unit_price-p.cost_price)*s.quantity) AS product_profit_margin
FROM products AS p
    JOIN salesitems AS s
    ON p.product_id = s.product_id
GROUP BY p.category
ORDER BY product_profit_margin DESC ;

-- Low stock alert (<10 units) and unsold product detection.
SELECT p.product_id , p.product_name , s.stock_quantity , "Low stock" AS alert_type
FROM stock AS s
    JOIN products AS p
    ON p.product_id = s.product_id
WHERE s.stock_quantity < 10
UNION
SELECT p.product_id , p.product_name , s.stock_quantity , "No sales" AS alert_type
FROM products AS p
    LEFT JOIN salesitems AS si
    ON p.product_id = si.product_id
    LEFT JOIN stock AS s
    ON p.product_id = s.product_id
WHERE si.item_id IS NULL ;
