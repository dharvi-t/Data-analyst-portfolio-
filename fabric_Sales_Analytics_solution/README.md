# End to End Microsoft Fabric Sales Analytics solution 
This is a complete, hands-on Sales Analytics project built inside Microsoft Fabric, my first step towards my fabric journey to move past theoretical learning and actually build something production-ready real-world enterprise data pipeline.

The project automates raw data ingestion, cleans and transforms it using PySpark, models it into a high-performance Star Schema, secures it with Row-Level Security (RLS), and deploys it via a Power BI Fabric App.

📂 **[Access Project Folder & Interactive Video Demo on Google Drive](https://drive.google.com/drive/folders/1Ct98w7HjS-Vmq32LhPIxLMyoJgmw5hJB?usp=drive_link)**

---

## 🏗️ Architecture & Data Flow (Medallion)

Instead of transforming everything in one step, I implemented a three-tier **Medallion Architecture**:

*   **Bronze (Raw Land):** A Fabric Data Pipeline (`PL_Ingest_Sales`) runs daily at 6:00 AM, pulling raw sales CSVs from an HTTP source into OneLake as a Delta table (`bronze_sales`).
*   **Silver (Cleaned):** A Fabric Notebook running PySpark cleans the data. It filters out cancelled/returned sales (where revenue was zero), renames columns to snake_case, converts string dates to `Date` types, and adds a calculated `revenue_usd` column. Output is saved to `silver_sales`.
*   **Gold (Curated/Warehouse):** The cleaned data is modeled inside Synapse Data Warehouse for reporting, ensuring aggregated business metrics are ready to query.

---

## 📐 Data Modeling (Star Schema)

To avoid query slowness caused by flat tables, I designed a **Star Schema** in the Synapse Data Warehouse:

*   **Fact Table:** `Fact_Sales` (tracks sales transactions, revenue, quantities, and order IDs).
*   **Dimension Tables:** 
    *   `Dim_Customer` (customer details)
    *   `Dim_Product` (product categories)
    *   `Dim_Region` (geographical territories)
    *   `Dim_Date` (custom calendar starting Jan 1, 2023, with weekend and quarter flags)

*Note: All joins are made using integer-based **Surrogate Keys** (e.g., `customer_key`, `product_key`) rather than changing natural keys, which optimizes join performance and keeps the model secure.*

---

## 📊 Dashboard, Direct Lake Mode, & Security
Once the model was ready, I built a Sales Analytics dashboard in Power BI with KPIs like Total_Revenue, order_Count, avg_order_quantity ,Revenue_USD.

*   **Direct Lake Mode:** The Power BI semantic model connects to OneLake using Direct Lake. This reads Parquet files directly without copying data (Import mode) or running slow SQL queries (DirectQuery), giving the best of both worlds.
*   **Row-Level Security (RLS):** Configured territory-based roles (e.g., "North" managers can only view North data) and verified using the "View As" feature.
*   **Sharing:** Deployed the final sales_Analytics_overview report as a structured **Microsoft Fabric App** for seamless executive sharing.

---

## 📈 Key Business Insights & Recommendations

Instead of just building the dashboard, I analyzed the final data to see what story the sales numbers are actually telling us. Here is what I found:

### 1. The Electronics Powerhouse (High Value, Lower Volume)
* **The Insight:** Electronics is our massive revenue engine, driving **66.2% of total revenue (₹9.0M)**, despite making up only **31.6% of total orders (401 orders)**. 
* **The Recommendation:** Since Electronics has an incredibly high Average Order Value, we should create premium bundles or accessories upselling strategies at checkout to capture even more value from these high-spending customers.

### 2. Office Supplies (High Volume, Low Value)
* **The Insight:** Office Supplies has a high order volume (**32.3% of orders / 410 orders**) but brings in a tiny **5.9% of our revenue (₹0.8M)**.
* **The Recommendation:** This category is transactional and high-frequency but low-profit. To optimize shipping and transaction costs, we should introduce a minimum order threshold for free delivery or use them as low-cost cross-selling "add-on" items when customers purchase Furniture or Electronics.

### 3. Top-Tier Customer Loyalty
* **The Insight:** Our top customers, like Vivek Chopra (₹532.82K) and Sneha Gupta (₹531.61K), are driving a massive portion of our sales with high purchase frequencies (40-48 orders).
* **The Recommendation:** These top 10 accounts are vital to our business. We should design a VIP loyalty program or offer exclusive early-access deals to these specific accounts to secure their long-term retention and protect against competitor poaching.

---
## 🛠️ Tech Stack
*   **Orchestration:** Microsoft Fabric Data Pipelines
*   **Data Lake & Warehousing:** Fabric Lakehouse (OneLake), Synapse Data Warehouse
*   **Processing/Languages:** Apache Spark (PySpark inside Notebooks), T-SQL (Views, Stored Procedures)
*   **Storage Format:** Delta Lake (Parquet + Transaction Logs)
*   **BI & Security:** Power BI (Direct Lake mode, DAX, Row-Level Security, Fabric Apps)

---
*Special thanks to Mansi Goel for the hands-on series! Her teaching style helped me focus on troubleshooting, writing my own code, and understanding real corporate workflows.*

