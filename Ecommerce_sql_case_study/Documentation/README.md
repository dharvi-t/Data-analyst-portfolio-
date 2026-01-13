###### **📊 Customer Retention \& Revenue Risk Analysis**

    (Advanced SQL Case Study – MySQL)



🔍 **Project Overview**



* This project is an **end-to-end SQL analytics case study** built using MySQL, focusing on understanding **revenue performance, customer behavior, retention patterns, and long-term customer value** for an e-commerce platform.



* The objective is not just writing SQL queries, **but thinking like a business analyst** — translating data into insights that help management make informed decisions.



**🎯 Business Problem**



* The company is facing:



1. Slowing revenue growth
2. Heavy dependence on repeat customers

3\. Unclear understanding of which customers and products truly drive revenue

* Management wants to understand:



1. How revenue is distributed across customers
2. Whether revenue is dependent on repeat buyers
3. Which products drive volume vs revenue
4. How customer lifetime value differs across segments



**🏗️ Data Model Overview**



-- The project uses a ***star schema*** optimized for analytical queries.



* **Fact Table**



 **fact\_orders:** Transaction-level data where each row represents a product purchased in an order.



1. order\_id
2. customer\_id
3. product\_id
4. order\_date
5. payment\_id
6. quantity
7. revenue

 

* **Dimension Tables**



1.  dim\_customers –(who) customer details and signup information
2.  dim\_products – (what) product and category information
3.  dim\_date – (when) date attributes for time-based analysis
4.  dim\_payments – (how) payment method and status



(This structure enables efficient joins, aggregation, and window-based analysis.)



**🛠️ Tools \& Technologies**



* Database: MySQL
* Query Language: SQL



* Concepts Used:



1. Window Functions
2. Common Table Expressions (CTEs)
3. Revenue \& percentage contribution analysis
4. Ranking and segmentation logic
5. Business-driven query design



* Reporting: SQL-driven insights + summary report





###### **📊 Project Insights Summary**



The analysis of  an e-commerce transactional dataset using advanced SQL techniques (CTEs, window functions, aggregations) to answer real-world business questions related to customer behavior, product performance, and revenue drivers.



🔹 **Q1.** **Revenue Concentration Analysis**



**Question:**

Is the business dependent on a small percentage of customers for revenue?



**Insight:**

Revenue is well distributed across customers. The top customers individually contribute a very small percentage of total revenue, indicating low revenue concentration risk. This suggests a stable customer base where the business is not overly dependent on a few high-spending customers.



**Business Value:**

* Lower risk of revenue loss due to churn of a few customers
* Emphasis should be on broad customer engagement rather than only VIP retention



**🔹 Q2. Top Customers by City**



**Question:**

Who are the top revenue-generating customers in each city?



**Insight:**

Each city has a different top customer, showing that revenue leadership is region-specific rather than dominated by a single national customer.



**Business Value:**

* Enables localized marketing strategies
* Supports city-level loyalty programs and targeted promotions



🔹 **Q3. Product Revenue vs Sales Volume**



**Question:**

Which products drive high revenue versus high sales volume?



**Insight:**

* High-volume products are not always the highest-revenue products.
* Some products sell frequently but generate moderate revenue, while a smaller set of products contributes disproportionately higher revenue with lower volume.



**Business Value:**

* Identifies premium products that drive profitability
* Helps differentiate pricing strategies for volume vs revenue leaders



🔹 **Q4. Customer Purchase Behavior (One-time vs Repeat Buyers)**



**Question:**

How does revenue differ between repeat buyers and one-time buyers?



**Insight:**

Repeat buyers represent ~98% of customers and generate almost all revenue, while one-time buyers contribute a negligible share of revenue.



**Business Value:**

* Strong evidence that customer retention is critical
* Reinforces the importance of loyalty programs and repeat-purchase incentives



🔹 **Q5. Customer Lifetime Value (CLV) Segmentation**



**Question:**

How is revenue distributed across customer value segments?



**Insight:**

* Medium-value customers form the majority and contribute the largest share of revenue
* High-value customers are very few but still significant
* Low-value customers contribute minimal revenue despite their volume



**Business Value:**

* Growth opportunity lies in upgrading medium-value customers to high-value
* Personalized offers can increase lifetime value without over-reliance on a small elite group



**🎯 Overall Business Takeaways**



* Revenue stability is driven by a broad and engaged customer base
* Retention matters more than acquisition
* Product strategy should differentiate between volume drivers and revenue drivers
* Customer value segmentation enables targeted growth strategies



**🧠 Skills Demonstrated**



* Advanced SQL (CTEs, Window Functions, Ranking, Percent Contributions)
* Dimensional data modeling
* Business-oriented analytical thinking

Translating raw data into actionable insights





**📈 Key Metrics Analyzed**



1. Revenue Contribution Percentage
2. Purchase Frequency
3. Repeat vs One-time Buyer Distribution
4. Product Volume vs Revenue Share
5. Customer Lifetime Value Segmentation (CLV)



**💡 Key Insights \& Outcomes**



1\. Revenue stability comes from a broad customer base rather than a small elite group.

2\. Repeat purchase behavior is the strongest driver of revenue.

3\. Revenue leaders and volume leaders are not the same products.

4\. Medium-CLV customers represent the biggest scalable growth opportunity.

5\. High-CLV customers require focused retention but do not dominate revenue.



**📌 Business Recommendations**



1. Focus retention efforts on medium and high CLV customers.
2. Design loyalty programs to convert medium CLV customers into high CLV.
3. Promote high-revenue products, not just high-volume products.
4. Implement city-level targeting based on top customers.
5. Reduce reliance on acquisition by strengthening repeat purchase behavior.
