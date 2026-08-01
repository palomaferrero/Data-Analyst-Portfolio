# 📊 Project 2 — Sales & Inventory Analytics · Fashion Store EU

## Business Problem
Fashion Store EU, a European retail brand, needed to evaluate its commercial performance and optimize inventory management. Management lacked clear insights into which sales channels and countries drove revenue, which product categories offered the highest profit margins, and which items faced stockout risks.

## Solution
An end-to-end sales, customer, and inventory analysis for the Q2 period (April – June 2025). The project combines SQL data extraction and transformation (13 structured queries) with relational data modeling and an interactive dashboard built in Excel.

## Tech Stack
- **SQL** — Data extraction, filtering, complex JOINs, segmentation, and aggregation queries
- **Excel** — Relational data modeling (XLOOKUP), PivotTables, conditional stock alerts, and interactive dashboard design

## Dataset Overview
Relational database consisting of 7 interconnected tables (`sales`, `salesitems`, `products`, `stock`, `customers`, `channels`, `campaigns`) covering the period April 2025 – June 2025.

## Methodology & Process

### SQL — Extraction & Data Analysis
Engineered and executed 13 analytical queries organized across 3 core business modules:
- **Commercial Performance:** Total revenue by channel, top 5 products by revenue, average order value (AOV) by country, marketing campaign effectiveness, and monthly sales evolution.
- **Customer Segmentation:** Identification of VIP customers (spend > $1,500), AOV tiering using `CASE WHEN` logic, regional e-commerce distribution, and churn/inactive customer detection (`LEFT JOIN`).
- **Product & Inventory Health:** Top products by units sold, top-performing revenue categories, category-level profit margin analysis, and unified `UNION` alerts for low stock (<10 units) and inactive SKUs.

### Excel — Modeling & Dashboard Design
- Built a relational data model connecting source tables using `XLOOKUP`.
- Defined key performance indicators (KPIs): *Total Revenue*, *Overall Average Order Value (AOV)*, *VIP Customer Revenue*, and *Most Profitable Category*.
- Designed interactive charts visualizing monthly sales trends, revenue share by channel, regional sales volume, and profit margin by category.
- Implemented dynamic slicers enabling seamless filtering by *Channel*, *Month*, and *Category*.
- Developed an inventory monitoring table with conditional formatting to instantly highlight critical stock levels.

## Executive Summary & KPIs (April – June 2025)
- **Total Revenue:** $324,237 USD
- **Overall Average Order Value (AOV):** $360 USD
- **VIP Customer Revenue:** $25,969 USD
- **Most Profitable Category:** T-Shirts ($30,782.67 USD total profit margin)

## Key Findings
* **Channel Distribution:** E-commerce accounts for 53% of total sales, closely followed by the Mobile App at 47%.
* **Geographic Performance:** Germany leads overall transaction volume (221 transactions) and total revenue ($74.59K), followed by France and Italy.
* **Monthly Trajectory:** Sales peaked in May ($141,922.21 USD), following a strong April ($133,392.44 USD), before experiencing a notable drop in June ($48,922.01 USD).
* **Category Profitability:** T-Shirts, Shoes, and Dresses generated the highest profit margins, each exceeding $29,000 USD in net margin.
* **Inventory Risk:** Critical low-stock levels (1 to 3 units remaining) were identified, heavily concentrated within the **Pants** category.

## Actionable Recommendations
- **Automated Stock Alerts:** Establish automated reorder triggers when inventory falls below or equal to 3 units to prevent stockouts on high-demand items.
- **Mid-Year Promotions:** Investigate the root causes behind June's sales slump and launch targeted mid-year promotional campaigns to stabilize demand.
- **VIP Retention Program:** Roll out exclusive loyalty perks and targeted offers for the VIP customer segment, as they represent a substantial portion of overall revenue.
- **AOV Expansion Campaigns:** Design targeted cross-selling strategies in markets like Spain and Portugal to increase Average Order Value (AOV) through complementary product recommendations.

## Project Repository Files
| File Name | Description |
|-----------|-------------|
| `fashion_store_eu.sql` | 13 analytical SQL queries organized by module |
| `fashion_store_eu.xlsx` | Data model and interactive Excel dashboard |
| `dashboard_fashion_store_eu_2.png` | Executive dashboard preview |
