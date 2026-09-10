# HR Attrition Analytics in Microsoft Fabric (IBM Dataset)

An end-to-end HR analytics solution built inside Microsoft Fabric as part of my practical learning journey and preparation for the DP-600 exam.

This project analyzes 1,470 employee records (IBM HR dataset) to uncover key drivers of employee turnover. It automates data ingestion using Dataflows Gen2, stores data in a Fabric Lakehouse, secures sensitive compensation fields using Column-Level Security (CLS) in OneLake, and deploys an interactive 2-page Power BI dashboard via a Microsoft Fabric App.

📂 **[Access Project Interactive Video Demo on Google Drive](https://drive.google.com/file/d/1BK5MqvKiUcdXAX86SNbksH1ULWVdPDJw/view?usp=drive_link)**

---

## 🏗️ Architecture & Data Pipeline

The project follows a clean, low-code data architecture built specifically for business and HR operations:

1. **Data Ingestion & Transformation (Dataflows Gen2):**
   * Imported raw employee CSV data via HTTP into **Dataflows Gen2** (`DF_HR`).
   * Cleaned and standardized data types across 35+ attributes.
   * Created conditional calculated columns:
     * **`Salary_Band`** (`under 3k`, `under 5k`, `under 10k`, `under 15k`, `under 20k`)
     * **`Age_Group`** (`18-25`, `26-45`, `46-60`)

2. **Storage (Fabric Lakehouse):**
   * Loaded the transformed dataset directly into the **Fabric Lakehouse** (`Lh_HR`) as a Delta table (`HR_employees`).

3. **Semantic Model & Reporting:**
   * Published a flat semantic model (`HR_semantic_flat`) optimized for DAX metrics.
   * Built a 2-page Power BI report (`HR_attrition`) featuring an **Overview** page and a **Deep Dive** page with interactive slicers and Decomposition Trees.

4. **Deployment & Sharing:**
   * Packaged and deployed the dashboard as a dedicated **Microsoft Fabric App** (`Ws_HR_app`) for executive distribution.

---

## 📊 Key Business Insights & HR Findings

Analyzing the 1,470 employee records revealed an overall company attrition rate of **16.1% (237 employees left)**:

* 🚨 **Age & Early Tenure Risk:** Employees aged **18–25** experience a massive **35.8% attrition rate** (44 out of 123 employees left), signaling onboarding and early-career retention challenges.
* ⏰ **OverTime Burnout:** Staff working **OverTime** suffer a **31% attrition rate**, compared to just **10%** for non-overtime employees.
* 💰 **Income Disparity:** Employees in the **`under 3k` salary band** experience the highest turnover at **28.6%** (113 left out of 395 employees).
* 👔 **High-Risk Roles:** Sales Representatives (**39.8%**), Laboratory Technicians (**23.9%**), and Human Resources staff (**23.1%**) are losing the highest proportion of staff.

---

## 🔐 Governance & Security

To protect employee privacy in accordance with enterprise data standards:

* **Column-Level Security (CLS):** Configured CLS in **OneLake Security** on the `MonthlyIncome` column so unauthorized users cannot view specific individual salary figures.
* **Row-Level Security (RLS):** Implemented department-level RLS using DAX (`USERPRINCIPALNAME`) to ensure department heads view data only for their assigned teams.

---

## 🛠️ Tech Stack

* **Data Integration:** Dataflows Gen2 (Power Query)
* **Storage & Lakehouse:** Microsoft Fabric OneLake, Lakehouse (`Lh_HR`)
* **Analytics & BI:** Power BI, DAX Measures, Decomposition Trees, Data linage, RLS / CLS
* **Deployment:** Microsoft Fabric App (`Ws_HR_app`)

---

