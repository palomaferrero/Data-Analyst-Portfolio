USE fashion_store_eu ;


-- 1) ANÁLISIS GENERAL DE VENTAS Y RENDIMIENTO COMERCIAL

-- Ventas totales por canal.
SELECT channel , SUM(total_amount) AS total_sales
FROM sales
GROUP BY channel
ORDER BY total_sales DESC ;

-- Top 5 productos con mayores ingresos.
SELECT p.product_name , p.category , SUM(s.item_total) AS total_product_amount
FROM salesitems AS s
    JOIN products AS p
    ON s.product_id = p.product_id
GROUP BY p.product_name , p.category
ORDER BY total_product_amount DESC
LIMIT 5 ;

-- Cantidad de ventas y ticket promedio por país.
SELECT country , COUNT(sale_id) AS sales_volume , ROUND(AVG(total_amount), 2) AS average_ticket
FROM sales
GROUP BY country
ORDER BY sales_volume DESC , average_ticket ;

-- Rendimiento de campañas de marketing.
SELECT channel_campaigns , SUM(item_total) AS total_revenue , SUM(discount_applied) AS total_discounts_applied
FROM salesitems
GROUP BY channel_campaigns
ORDER BY total_revenue DESC , total_discounts_applied ;

-- Evolución mensual de ventas.
SELECT MONTH(sale_date) AS month_sale , SUM(total_amount) AS total_sales
FROM sales 
GROUP BY month_sale 
ORDER BY month_sale ASC ;


-- 2) SEGMENTACIÓN Y COMPORTAMIENTO DE CLIENTES

-- Listado de clientes E-commerce en Alemania.
SELECT DISTINCT c.customer_id , c.country , c.age_range , c.signup_date , s.channel
FROM customers AS c
   JOIN sales AS s
   ON c.customer_id = s.customer_id
WHERE c.country = "Germany" AND s.channel = "E-commerce"
ORDER BY c.customer_id ASC ;

-- Identificación de clientes VIP.
-- (siendo un cliente VIP aquel que haya acumulado más de $1.500 en total facturado)
SELECT customer_id , SUM(total_amount) AS total_spent , COUNT(sale_id) AS total_orders
FROM sales
GROUP BY customer_id
HAVING total_spent > 1500
ORDER BY total_spent DESC ;

-- Clasificación de clientes por ticket promedio.
SELECT  customer_id, AVG(total_amount) AS average_ticket, 
    CASE
        WHEN AVG(total_amount) >= 400 THEN "High level"
        WHEN AVG(total_amount) >= 200 THEN "Mid level"
        ELSE "Low level"
    END AS customer_segment
FROM sales
GROUP BY customer_id
ORDER BY average_ticket DESC ;

-- Clientes registrados sin compras.
SELECT c.customer_id , c.signup_date , c.country
FROM customers AS c
    LEFT JOIN sales AS s
    ON c.customer_id = s.customer_id
WHERE s.sale_id IS NULL ;


-- 3) ANÁLISIS DE PRODUCTOS E INVENTARIO

-- Top 5 productos más vendidos.
SELECT p.product_name , p.category , SUM(s.quantity) AS total_units_sold
FROM products AS p
   JOIN salesitems AS s 
   ON s.product_id = p.product_id
GROUP BY p.product_name , p.category
ORDER BY total_units_sold DESC
LIMIT 5 ;

-- Top 3 categorías con mayor rendimiento.
-- (siendo aquellas que hayan superado los $10.000 en ventas totales)
SELECT p.category , SUM(s.item_total) AS total_revenue
FROM products AS p
    JOIN salesitems AS s
    ON p.product_id = s.product_id
GROUP BY p.category
HAVING total_revenue > 10000
ORDER BY total_revenue DESC
LIMIT 3 ;

-- Margen de ganancia por categoría.
SELECT p.category , SUM((s.unit_price-p.cost_price)*s.quantity) AS product_profit_margin
FROM products AS p
    JOIN salesitems AS s
    ON p.product_id = s.product_id
GROUP BY p.category
ORDER BY product_profit_margin DESC ;

-- Productos con bajo stock (menos de 10u.) y productos sin ventas.
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