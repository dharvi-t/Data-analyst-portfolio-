# 📊 Data Analytics Portfolio — Dharvi Tomar

<div align="center">

  <h3><b>Dharvi Tomar</b></h3>
  <p><b>Microsoft Certified Power BI Data Analyst Associate (PL-300) | Business Intelligence & Data Engineering Specialist</b></p>

  [![Email](https://img.shields.io/badge/Email-dharvidzt%40gmail.com-c14438?style=for-the-badge&logo=gmail&logoColor=white)](mailto:dharvidzt@gmail.com)
  [![Phone](https://img.shields.io/badge/Phone-+91--9136318557-0078D4?style=for-the-badge&logo=phone&logoColor=white)](tel:+919136318557)
  [![LinkedIn](https://img.shields.io/badge/LinkedIn-Dharvi_Tomar-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/dharvi-tomar)
  [![GitHub](https://img.shields.io/badge/GitHub-dharvi--t-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/dharvi-t)

</div>

---

## 👋 About Me

I am a **Microsoft Certified Power BI Data Analyst Associate (PL-300)** with hands-on experience in building enterprise-grade data solutions across **Microsoft Fabric, SQL, Power BI, PySpark, Python, and Excel**. 

I specialize in transforming raw, unstructured enterprise data into automated ETL pipelines, scalable Star Schema data models, secured OneLake governance solutions, and high-impact interactive dashboards.

---

## 🛠️ Technical Proficiencies

| Category | Skills & Technologies |
| :--- | :--- |
| **Microsoft Fabric & Cloud** | OneLake, Lakehouse Architecture, Synapse Data Warehouse, Delta Lake, Direct Lake Mode |
| **Data Integration & ETL** | Microsoft Fabric Data Pipelines, Dataflows Gen2, Power Query |
| **Languages & Programming** | SQL / T-SQL (CTEs, Joins, Window Functions, Subqueries), Python (Pandas, NumPy, Matplotlib, Seaborn), PySpark |
| **Data Modeling & Storage** | Star Schema Design, Surrogate Keys, Semantic Models, MySQL, SQLite, import, direct query and diectlake mode |
| **BI & Data Visualization** | Power BI, Advanced DAX, Interactive Dashboard Design, Decomposition Trees, KPI Reporting |
| **Governance & Security** | OneLake Security, Column-Level Security (CLS), Row-Level Security (RLS) dynamic and static, object level security (OBL), Data Lineage |
| **Developer Tools & Excel** |  GitHub, Google Colab, Advanced Excel (Pivot Tables, XLOOKUP, VLOOKUP) |
| **AI & Generative Tools** | Microsoft Copilot, Claude, Gemini Notebook LLM, for troubleshooting , documentation  and automate the repeatative work |

---

## 🚀 Projects Overview

| # | Project Name | Domain | Core Tech Stack | Key Deliverables & Highlights | Links |
| :-: | :--- | :--- | :--- | :--- | :-: |
| **01** | **[Microsoft Fabric Sales Analytics](./fabric_Sales_Analytics_solution/)** | Sales & Retail | Fabric, PySpark, Synapse DW, Direct Lake, RLS | Medallion Architecture (Bronze/Silver/Gold), Star Schema, Direct Lake BI App | [📁code](./fabric_Sales_Analytics_solution/) \| [🎥 Video](https://drive.google.com/file/d/1nLmtZD51lssNfkJInAa-9WPpo7UjpuTa/view?usp=drive_link) |
| **02** | **[Fabric HR Attrition Analytics](./fabric_hr_attrtion/)** | Human Resources | Dataflows Gen2, OneLake CLS, Dynamic RLS, DAX | 1,470 records, OneLake CLS security, 35.8% youth attrition insights | [📁 Code](./hr_attrition_analytics/) \| [📂 Drive](https://drive.google.com/drive/folders/1Ct98w7HjS-Vmq32LhPIxLMyoJgmw5hJB?usp=drive_link) |
| **03** | **[Ecommerce SQL Case Study](./Ecommerce_sql_case_study)** | E-Commerce | MySQL, Power BI, DAX, Star Schema | 7,000+ orders, CLV & AOV analysis, 98% repeat customer revenue insight | [📁 Code](./Ecommerce_sql_case_study) |
| **04** | **[Airline Delay & Operations](./Airline_project.ipynb)** | Aviation | SQL, Python, SQLite, Pandas, Seaborn | 50,000+ records, occupancy rates, ticket sales & revenue EDA | [⚡ Colab](https://colab.research.google.com/github/dharvi-t/Data-analyst-portfolio-/blob/main/Airline_project.ipynb) \| [📊 Data](https://drive.google.com/file/d/1P1I_qDZy2ZAxhM4F9mlpmcHTrikMDJq8/view?usp=drive_link) |
| **05** | **[HR Attrition Analysis (Python)](./HR_Analytics.ipynb)** | HR Analytics | Python, Pandas, Matplotlib, Seaborn | 1,480 employee records, exploratory data analysis & retention strategy | [⚡ Colab](https://colab.research.google.com/github/dharvi-t/Data-analyst-portfolio-/blob/main/HR_Analytics.ipynb) \| [📊 Data](https://drive.google.com/file/d/1QiW0qENKoFde81KFa5yn7MitEwwX8Jk4/view?usp=drive_link) |

---

## 📂 Detailed Project Breakdowns

### 📊 Project 1: Microsoft Fabric End-to-End Sales Analytics

**Overview:**  
Built an enterprise-grade sales analytics solution in Microsoft Fabric to move past theoretical learning and construct a production-ready pipeline.

* **Medallion Architecture:** Automated raw ingestion via Fabric Data Pipelines (`PL_Ingest_Sales`) into Bronze Delta tables, cleaned and standardized messy dates and multi-currency metrics using PySpark in Fabric Notebooks (Silver), and aggregated business metrics into Gold.
* **Star Schema Modeling:** Modeled 1 Fact table (`Fact_Sales`) and 4 Dimension tables (`Dim_Customer`, `Dim_Product`, `Dim_Region`, `Dim_Date`) inside Synapse Data Warehouse using integer Surrogate Keys for optimal query performance.
* **Direct Lake & Security:** Connected Power BI directly to OneLake Parquet files using **Direct Lake mode**, configured territory-based **Row-Level Security (RLS)**, and deployed via a Microsoft Fabric App.
* **Key Insights:** Uncovered that Electronics accounts for **66.2% of total revenue (₹9.0M)** across 401 orders, whereas Office Supplies represents high order volume (32.3%) but low revenue share (5.9%).

🔗 **[📁 View Project Folder](./fabric_Sales_Analytics_solution/)** \| **[📊 Watch Live Dashboard Demo Video](https://drive.google.com/file/d/1nLmtZD51lssNfkJInAa-9WPpo7UjpuTa/view?usp=drive_link)**

---

### 👥 Project 2: Microsoft Fabric HR Attrition Analytics (IBM Dataset)

**Overview:**  
Engineered a low-code HR analytics capstone project analyzing 1,470 employee records (IBM HR dataset) to isolate turnover risks and govern sensitive workforce data.

* **Data Ingestion & Transformation:** Used **Dataflows Gen2** (`DF_HR`) to ingest raw CSV data, perform data assessment, and add custom conditional logic for `Salary_Band` and `Age_Group`.
* **Lakehouse & Governance:** Stored Delta tables in Fabric Lakehouse (`Lh_HR`) and applied **Column-Level Security (CLS)** in OneLake Security on sensitive compensation fields (`MonthlyIncome`) alongside dynamic **Row-Level Security (RLS)** via DAX (`USERPRINCIPALNAME`).
* **Reporting & Insights:** Developed a 2-page interactive Power BI report (**Overview** & **Deep Dive**) featuring Decomposition Trees and KPI cards, deployed as a Fabric App (`Ws_HR_app`).
* **Key Insights:** Identified an overall 16.1% attrition rate, with severe turnover spikes among **18–25 age group employees (35.8%)**, **OverTime staff (31.0%)**, and the **under ₹3k salary band (28.6%)**.

🔗 **[📁 View Project Folder](./fabric_hr_attrtion/)** \| **[📂 Google Drive Project Assets & Video Demo](https://drive.google.com/drive/folders/1Ct98w7HjS-Vmq32LhPIxLMyoJgmw5hJB?usp=drive_link)**

---

### 🛒 Project 3: Ecommerce SQL Case Study + Power BI

**Overview:**  
Analyzed 7,000+ e-commerce orders using SQL and Power BI to evaluate revenue trends, product performance, and customer purchasing behavior.

* **SQL Analytics:** Queried structured relational tables using complex T-SQL joins, subqueries, CTEs, and window functions.
* **Data Modeling & DAX:** Designed a Star Schema model (1 fact + 4 dimensions) and calculated key DAX metrics including Total Revenue, Average Order Value (AOV), Repeat Customer Rate, and Customer Lifetime Value (CLV).
* **Key Insights:** Discovered that **98% of total revenue came from repeat customers** and the top 2.5% high-value accounts contributed 6% of revenue, demonstrating that customer retention is the primary business growth driver.

🔗 **[📁 View Project Folder](./Ecommerce_sql_case_study)**

---

### ✈️ Project 4: Airline Delay & Operations Analysis (SQL + Python)

**Overview:**  
Explored an airline relational database containing over 50,000 records using Python (Pandas, Matplotlib, Seaborn, SQLite3) in Google Colab.

* **Analysis Scope:** Evaluated aircraft seating capacity, ticket sales, revenue trends, fare conditions, and flight occupancy rates to identify operational bottlenecks and profitability opportunities.

🔗 **[⚡ Open in Google Colab](https://colab.research.google.com/github/dharvi-t/Data-analyst-portfolio-/blob/main/Airline_project.ipynb)** \| **[📊 Download Dataset](https://drive.google.com/file/d/1P1I_qDZy2ZAxhM4F9mlpmcHTrikMDJq8/view?usp=drive_link)**

---

### 👩‍💼 Project 5: HR Employee Retention Analysis (Python EDA)

**Overview:**  
Performed exploratory data analysis (EDA) on an HR dataset of 1,480 employee records using Python to identify key drivers of attrition.

* **Analysis Scope:** Conducted data cleaning, EDA, and statistical visualization with Pandas, Matplotlib, and Seaborn to uncover tenure, department, and salary influences on employee turnover.

🔗 **[⚡ Open in Google Colab](https://colab.research.google.com/github/dharvi-t/Data-analyst-portfolio-/blob/main/HR_Analytics.ipynb)** \| **[📊 Download Dataset](https://drive.google.com/file/d/1QiW0qENKoFde81KFa5yn7MitEwwX8Jk4/view?usp=drive_link)**

---

## 📜 Certifications & Education

* **Microsoft Certified: Power BI Data Analyst Associate (PL-300)** — July 2026
* **Deloitte Australia Data Analytics Job Simulation** — May 2025
* **Bachelor's Degree -> BCA graduate**   - (2025)
* **Post Graduation -> MSc in Data Science and analytics**    -(Currently pursuing)

---

## 📫 Connect & Contact

I am actively seeking entry-level roles in **Data Analysis**, **Junior Power BI Development**, **Business Intelligence** Feel free to reach out to discuss collaboration, opportunities, or technical workflows!

* 📧 **Email:** [dharvidzt@gmail.com](mailto:dharvidzt@gmail.com)
* 📞 **Phone:** [+91-9136318557](tel:+919136318557)
* 💼 **LinkedIn:** [linkedin.com/in/dharvi-tomar](https://www.linkedin.com/in/dharvi-tomar)
* 💻 **GitHub:** [github.com/dharvi-t](https://github.com/dharvi-t)
