USE ventas;

-- Cantidad de productos por categoría, ordenados de mayor a menor.
SELECT categoria, COUNT(categoria) AS total_productos
FROM dim_productos
GROUP BY categoria
ORDER BY total_productos DESC;

-- Ventas totales por región, ordenadas de mayor a menor.
SELECT region , SUM(monto_neto) AS ventas_totales
FROM dim_clientes AS c
   JOIN fact_pedidos AS p
   ON c.id_cliente = p.id_cliente
   JOIN fact_lineas_pedido AS f
   ON p.id_pedido = f.id_pedido
WHERE p.estado_pedido = "Completado"
GROUP BY region
ORDER BY ventas_totales DESC;

-- Ventas totales por región y categoría, ordenadas de mayor a menor.
SELECT c.region , p.categoria , SUM(monto_neto) AS ventas_totales
FROM fact_pedidos AS f
   JOIN dim_clientes AS c
   ON f.id_cliente = c.id_cliente
   JOIN fact_lineas_pedido AS l
   ON l.id_pedido = f.id_pedido
   JOIN dim_productos AS p
   ON p.id_producto = l.id_producto
WHERE f.estado_pedido = "Completado"
GROUP BY c.region , p.categoria
ORDER BY c.region , ventas_totales DESC;

-- Top 5 productos más vendidos.
SELECT d.nombre_producto , SUM(f.monto_neto) AS total_ingresos
FROM dim_productos AS d
   JOIN fact_lineas_pedido AS f
   ON d.id_producto = f.id_producto
WHERE f.estado_pedido = "Completado"
GROUP BY d.nombre_producto , d.id_producto
ORDER BY total_ingresos DESC
LIMIT 5;

-- Clientes que cancelaron pedidos, ordenados de mayor a menor.
SELECT nombre_cliente , COUNT(id_pedido) AS pedidos_cancelados
FROM fact_pedidos AS f
   JOIN dim_clientes AS c
   ON c.id_cliente = f.id_cliente
WHERE estado_pedido = "Cancelado" 
GROUP BY nombre_cliente
ORDER BY pedidos_cancelados DESC;

-- Ticket promedio por tipo de cliente.
SELECT segmento , 
ROUND (SUM(l.monto_neto) / COUNT(DISTINCT l.id_pedido)) AS ticket_promedio
FROM dim_clientes AS c
   JOIN fact_pedidos AS p
   ON c.id_cliente = p.id_cliente
   JOIN fact_lineas_pedido AS l
   ON l.id_pedido = p.id_pedido
WHERE p.estado_pedido = "Completado"
GROUP BY segmento
ORDER BY ticket_promedio DESC;

-- Vendedores con más ventas totales, ordenados de mayor a menor.
SELECT nombre_vendedor , SUM(monto_neto) AS ventas_totales
FROM dim_vendedores AS v
   JOIN fact_pedidos AS p
   ON v.id_vendedor = p.id_vendedor
   JOIN fact_lineas_pedido AS l
   ON l.id_pedido = p.id_pedido
WHERE p.estado_pedido = "Completado"
GROUP BY nombre_vendedor
ORDER BY ventas_totales DESC;

-- Evolución de ventas mensuales.
SELECT DATE_FORMAT(p.fecha_pedido, "%Y-%m") AS periodo,
SUM(l.monto_neto) AS ventas_totales
   FROM fact_pedidos AS p
   JOIN fact_lineas_pedido AS l
   ON p.id_pedido = l.id_pedido 
WHERE p.estado_pedido = "Completado"
GROUP BY periodo
ORDER BY periodo ASC;
