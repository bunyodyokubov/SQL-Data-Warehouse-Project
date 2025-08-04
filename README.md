Data Warehouse & Analytics Project


This repository contains a SQL-based Data Warehouse and Analytics solution structured into three layers: Bronze, Silver, and Gold. The project follows a modular, scalable architecture for handling raw data ingestion, transformation, and analytics-ready outputs.

Project Structure

├── bronze       # Raw data ingestion layer

├── silver       # Cleaned and structured data layer

├── gold         # Aggregated, business-level analytics layer


Layer Descriptions

Bronze Layer
Purpose: Acts as a landing zone for raw data.
Data Format: Uncleaned, possibly semi-structured or denormalized.
Sources: CSVs
Use: No transformation — just ingestion for traceability and audit.

Silver Layer
Purpose: Applies cleansing, deduplication, type casting, and basic transformations.
Data Format: Structured and query-ready tables (normalized or star-schema-friendly).
Use: Enables consistent downstream transformation logic.

Gold Layer
Purpose: Contains aggregated, enriched datasets optimized for analytics and reporting.
Data Format: Dimensional models (star/snowflake schemas), fact and dimension tables.
Use: Consumed by BI tools, dashboards, and reports.

Technologies Used
SQL (SQL Server)


Getting Started
Clone the repository:
Load initial data into the Bronze layer.
Run SQL scripts in the following order:

Bronze → Silver → Gold

Connect your analytics tool to the Gold layer for reporting.

License
This project is licensed under the MIT License – see the LICENSE file for details.

Contributing
Contributions are welcome! Please open an issue or submit a pull request.
