# 📊 Proyecto 1 — Análisis de Ventas · TechSell S.A.

## Problema
Una empresa de tecnología B2B necesita entender el comportamiento de sus ventas 
para tomar mejores decisiones comerciales. No tiene visibilidad clara de qué 
regiones, productos y vendedores generan más revenue.

## Solución
Análisis exploratorio de 2 años de datos de ventas (2023-2024) con métricas 
clave por región, producto y vendedor, visualizadas en un dashboard interactivo.

## Herramientas
- **SQL** — exploración y análisis de datos
- **Power BI** — dashboard interactivo

## Dataset
Base de datos relacional con 5 tablas · 300 pedidos · 776 líneas de detalle · 
Período: enero 2023 – diciembre 2024

## Proceso

**SQL — Exploración y análisis**
- Carga de datos en SQL con 5 tablas relacionadas.
- Escritura de 8 queries de análisis: productos por categoría, ventas totales por región, 
  ventas totales por región y categoría, top 5 productos, clientes que cancelaron pedidos,
  ticket promedio, vendedores con más ventas, evolución de ventas mensuales.
- Filtrado de pedidos por estado para trabajar solo con ventas completadas.

**Power BI — Visualización**
- Conexión al archivo Excel como fuente de datos.
- Modelado de relaciones entre las 5 tablas (modelo estrella).
- Creación de 5 medidas DAX: Ventas Totales, Ventas completadas,
  Total de pedidos, Ticket Promedio y Tasa de cancelación.
- Dashboard de una página con KPIs, evolución mensual, 
  ventas por región y Top 5 productos por ingresos.
- Slicer interactivo para filtrar por año (2023 / 2024).

## Resultados (pedidos completados · 2023-2024)
 - Ingresos totales $1,60M
 - 300 pedidos totales
 - Ticket promedio $5,32K
 - Tasa de cancelación 6%

## Principales insights
 * **Sur** es la región con mayores ingresos ($518K), seguida por Norte ($366K).
 * **Laptop Pro 15** es el producto top con $530K en ventas totales.
 * **Carlos López** lidera el ranking de vendedores con $290K.
 * **Retail** tiene el ticket promedio más alto por segmento ($9.681).
 * **FastGrow Startup** es el cliente con más pedidos cancelados (4).
 * El dashboard permite comparar la evolución mensual de las ventas entre 2023 y 2024.

## Recomendaciones
- Analizar por qué la región sur es la zona líder para replicar su estrategia en las demás regiones.
- Priorizar campañas comerciales en el segmento retail por tener el ticket promedio más alto.
- Monitorear de cerca al cliente FastGrow Startup por registrar la mayor cantidad de cancelaciones.

## Archivos
| Archivo | Descripción |
|---------|-------------|
| `analisis_ventas.sql` | 8 queries de análisis en SQL |
| `analisis_ventas.pbix` | Dashboard interactivo en Power BI |
| `dashboard_preview.png` | Print de pantalla del dashboard |
