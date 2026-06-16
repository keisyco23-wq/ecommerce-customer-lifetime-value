# Customer Lifetime Value & Retention Analysis — E-Commerce SQL Project

## 📌 Business Problem & Objective
An international e-commerce platform experienced a drop in customer retention rates, impacting marketing efficiency and overall revenue. The marketing team needed to identify high-value customer segments facing churn risk to deploy targeted re-engagement campaigns.

The objective of this project was to design complex SQL analytical queries to segment customers based on purchase recency, frequency, and monetary value (RFM), identifying financial leakage from migrating VIP clients.

---

## 🛠️ SQL Techniques Used
* **Common Table Expressions (CTEs):** Used to isolate customer behavior metrics before final aggregation.
* **Window Functions (`OVER`, `NTILE`):** Applied to dynamically split the customer base into performance quartiles.
* **Advanced Date Functions:** Calculated transactional recency intervals to trigger predictive churn labels.

---

## 📊 Business Key Results & Actionable Insights
* **VIP Churn Alert:** Identified that **4.2% of total customers** belonged to the highest revenue quartile but had not made a purchase in over 180 days, representing a hidden revenue recovery opportunity.
* **Data-Driven Strategy:** Recommended the automated integration of these SQL groups with the CRM platform to trigger automated email discounts for the "High-Value Churn Risk" tier.
