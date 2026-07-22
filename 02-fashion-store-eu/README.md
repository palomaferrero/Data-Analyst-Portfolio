# 📊 Proyecto 2 — Análisis de Ventas e Inventario · Fashion Store EU

## Problema
Fashion Store EU es una tienda de moda europea que necesitaba evaluar su rendimiento comercial y optimizar el control de su inventario. La empresa carecía de visibilidad sobre qué canales y países generaban más ingresos, qué categorías aportaban el mayor margen de ganancia y qué productos tenían riesgo de quiebre de stock.

## Solución
Análisis integral de ventas, clientes e inventario correspondiente al período abril – junio 2025. Se combinó la extracción y transformación de datos en **SQL** (13 consultas) con el modelado de datos relacional y diseño de un **dashboard en Excel**.

## Herramientas
* **SQL** — extracción, filtrado, uniones (JOINs), segmentación y análisis de datos
* **Excel** — modelado relacional (utilizando BUSCARX), tablas dinámicas, alertas de stock y dashboard interactivo

## Dataset
Base de datos compuesta por **7 tablas interconectadas** (sales, salesitems, products, stock, customers, stores, campaigns). Período analizado: abril 2025 – junio 2025.

## Proceso

### SQL — Extracción y análisis
* Estructuración y ejecución de 13 consultas divididas en 3 bloques de análisis:
  1. **Rendimiento comercial:** Ventas totales por canal, top 5 productos por ingresos, ticket promedio por país, efectividad de campañas de marketing y evolución mensual de ventas.
  2. **Segmentación de clientes:** Identificación de clientes VIP (facturación > $1.500), clasificación por nivel de ticket promedio (CASE WHEN), clientes e-commerce por región y detección de registros sin compras (LEFT JOIN).
  3. **Productos e inventario:** Top productos por unidades vendidas, categorías con mayores ingresos, cálculo de margen de ganancia por categoría y alertas unificadas (UNION) de bajo stock (<10 unidades) y productos sin ventas.

### Excel — Modelado & dashboard
* Conexión y relacionamiento de tablas mediante BUSCARX para armar el modelo de datos.
* Creación de indicadores clave (KPIs): Facturación total, Ticket promedio general, Facturación VIP y Categoría más rentable.
* Diseño de gráficos interactivos de evolución mensual, ventas por canal, volumen de ventas por país y margen por categoría.
* Implementación de segmentadores dinámicos por Canal, Mes y Categoría.
* Tabla de monitoreo de stock con formato condicional para visualizar de forma rápida los artículos con pocas unidades.

## Resultados (período abril – junio 2025)
* **Facturación total:** $324.237 USD
* **Ticket promedio general:** $360 USD
* **Facturación clientes VIP:** $25.969 USD
* **Categoría más rentable:** T-Shirts ($30.782,67 USD de margen)

## Principales insights
* El canal **E-commerce** representa el 53% de las ventas totales, superando levemente a la **App Mobile** (47%).
* **Alemania** encabeza el volumen de ventas (221 transacciones) y la facturación total ($74,59K), seguido por **Francia** e **Italia**.
* **Comportamiento mensual:** **Mayo** registró el pico más alto de ventas ($141.922,21 USD), seguido por **Abril** ($133.392,44 USD), mientras que en **Junio** se observa una caída significativa ($48.922,01 USD).
* **T-Shirts**, **Shoes** y **Dresses** son las tres categorías con mayor margen de ganancia, superando todas los $29.000 USD de margen.
* Se identificaron artículos con bajo stock disponible (entre 1 y 3 unidades) concentrados principalmente en la categoría *Pants*.

## Recomendaciones
* Establecer alertas de reposición cuando el stock sea menor o igual a 3 unidades para evitar perder ventas en ciertos productos.
* Analizar las causas de la baja en ventas durante junio y lanzar promociones específicas de mitad de año.
* Crear acciones comerciales o beneficios exclusivos para la base de clientes VIP, dado que representan un volumen importante de facturación.
* Diseñar campañas orientadas a subir el ticket promedio en países como España y Portugal, por ejemplo ofreciendo productos o servicios adicionales que complementen la compra original.

## Archivos
| Archivo | Descripción |
| :--- | :--- |
| `fashion_store_eu.sql` | 13 queries de análisis en SQL organizadas por módulo |
| `fashion_store_eu.xlsx` | Modelo de datos y dashboard en Excel |
| `dashboard_fashion_store_eu_2.png` | Vista previa del dashboard |

```
