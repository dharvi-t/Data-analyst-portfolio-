###### **# Business Context**



**## Problem Statement**



 You are an analyst at an e-commerce company that sells across multiple cities.

 The company wants to improve revenue growth and customer retention , so The analytics

 team has been asked to investigate these questions and provide data-driven recommendations



* Business Concerns:



1. Revenue growth has slowed
2. Repeat purchases are low
3. Marketing spends are increasing but ROI (return on investment) is unclear



**## Business Questions**



**Q1**.Are we overly dependent on a small % of customers for revenue?

   (Revenue Dependency Risk)

**Q2**.How does retention change over time for different signup cohorts?

   (Customer Retention Behavior)

**Q3**.Which high-value customers are at risk of churning?

   (Churn Risk Identification)

**Q4**.Which products drive volume vs revenue (and why)?

   (Product Strategy Insight)



**## Data Grain (one row means what)**

 

 " ONE ROW = ONE PRODUCT PURCHASE IN ONE ORDER "



**## Data Model (Fact \& Dimensions)**

* **Fact Table:**
* 

** ** - fact\_orders: each row represents a product purchased in an order

* **Dimension Tables:**

  **-** dim\_customers

    - dim\_products

    - dim\_date

    - dim\_payments

  

  **## SQL Concepts Mapped to Business Needs**

  

  **|---------------------------|----------------------|**

  **| Business Need             | SQL Technique        |**

  **|---------------------------|----------------------|**

  **|.** Revenue contribution     **|** SUM() OVER()         **|**

  **|.** Customer ranking         **|** RANK(), DENSE\_RANK() **|**

  **|.** Retention gap analysis   **|** LAG()                **|**

  **|.** Churn identification     **|** CASE WHEN            **|**

  **|.** Query structure          **|** CTEs                 **|**

  **|.** Performance optimization **|** Indexing             **|**

  **|---------------------------|----------------------|**

  

  

  **## Metrics -** (real business metrics)

  

1. Total Revenue
2. Average Order Value (AOV)
3. Repeat Purchase Rate
4. Customer Lifetime Value (CLV)
5. Revenue Contribution %

   

   **## Assumptions**

   

1. A customer is considered churned if inactive for 90 days
2. Revenue = quantity × product price
3. Returns/refunds are ignored (simplification)
4. Payment failures are excluded from revenue
