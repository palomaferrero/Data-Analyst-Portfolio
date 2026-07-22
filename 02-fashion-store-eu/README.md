# 📊 Proyecto 2 — Análisis de Ventas e Inventario · Fashion Store EU

## Contexto & Objetivo
Fashion Store EU requería un diagnóstico integral de su desempeño comercial y de gestión de inventario. El objetivo del proyecto fue analizar el volumen de facturación por canal y región, así como identificar de forma temprana los productos con riesgo inminente de quiebre de stock para optimizar la toma de decisiones.

---

## Herramientas & Metodología
* **SQL:** Extracción, filtrado de transacciones válidas y estructuración inicial de la base de datos relacional.
* **Excel:** Modelado de datos mediante BUSCARX, automatización de indicadores clave y diseño de un dashboard ejecutivo interactivo con alertas de stock.

---

## Dataset
Base de datos relacional de 4 tablas interconectadas (sales, products, stock, customers). 
* **Período analizado:** Abril – Junio 2025.

---

## Resultados Principales
* **Facturación total:** $324.237 USD
* **Ticket promedio general:** $360 USD
* **Facturación segmento VIP:** $25.969 USD
* **Categoría líder:** *T-Shirts* (mayor volumen de ventas y rentabilidad)

---

## Principales Insights
* **Distribución por canal:** El canal **E-commerce** lidera la generación de ingresos con un 53%, frente a un 47% de la **App Mobile**.
* **Rendimiento geográfico:** **Alemania** ($74,59K) y **Francia** ($72,30K) encabezan la facturación dentro de la región, mientras que mercados como **Portugal** y **España** registran la menor participación relativa.
* **Evolución temporal:** Se observa una contracción marcada de la facturación en el mes de **Junio** ($48.922 USD) en comparación con el pico alcanzado en **Mayo** ($141.922 USD), lo que señala un patrón de desaceleración hacia el cierre del trimestre.
* **Rentabilidad por categoría:** Aunque la categoría *T-Shirts* lidera en margen absoluto ($30.782 USD), categorías como *Shoes* y *Dresses* muestran una contribución cercana, demostrando un catálogo diversificado pero con alta dependencia de básicos.
* **Riesgo de inventario:** Se detectaron artículos críticos con solo 1 unidad disponible en depósito, concentrados principalmente en las líneas *Dresses* y *Pants*.

---

## Recomendaciones de Negocio
1. **Definir punto de reorden:** Configurar alertas de reposición automática al alcanzar ≤ 3 unidades para evitar pérdidas de facturación por quiebre de stock.
2. **Estrategia de fidelización VIP:** Diseñar campañas exclusivas de retención para el segmento VIP, dada su alta contribución al margen total.
3. **Incentivo en canal App Mobile:** Implementar promociones específicas dentro de la aplicación móvil para equilibrar la conversión respecto al canal web.
4. **Plan de reactivación comercial para Junio:** Investigar las causas de la caída brusca de ventas en junio y lanzar acciones de liquidación o promociones de medio año para sostener el flujo de ingresos.
5. **Estrategia diferenciada por mercado:** Diseñar campañas de marketing enfocadas en incrementar el ticket promedio en países de menor volumen (Portugal y España) mediante promociones de cross-selling (armado de conjuntos/bundles).

---

## Archivos del Proyecto
| Archivo | Descripción |
| :--- | :--- |
| `fashion_store_eu.sql` | Consultas SQL de extracción y procesamiento de datos |
| `fashion_store_eu.xlsx` | Modelo relacional y Dashboard interactivo en Excel |
| `dashboard_fashion_store_eu.png` | Vista previa del panel de control ejecutivo |
