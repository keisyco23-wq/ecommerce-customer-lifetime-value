-- Target: Calculate Churn Risk and Customer Lifetime Value (CLV)
WITH Customer_Cohort AS (
    SELECT 
        customer_id,
        COUNT(order_id) AS total_orders,
        SUM(total_amount) AS total_revenue,
        AVG(total_amount) AS average_ticket,
        MAX(order_date) AS last_purchase_date
    FROM orders
    GROUP BY customer_id
),
Ranked_Customers AS (
    SELECT 
        customer_id,
        total_orders,
        total_revenue,
        average_ticket,
        DATEDIFF(day, last_purchase_date, GETDATE()) AS days_since_last_purchase,
        NTILE(4) OVER (ORDER BY total_revenue DESC) AS revenue_tier
    FROM Customer_Cohort
)
SELECT 
    customer_id,
    total_orders,
    total_revenue,
    average_ticket,
    days_since_last_purchase,
    revenue_tier,
    CASE 
        WHEN days_since_last_purchase > 180 AND revenue_tier = 1 THEN 'High-Value Churn Risk'
        WHEN days_since_last_purchase > 180 THEN 'Standard Churn'
        WHEN days_since_last_purchase <= 90 AND revenue_tier = 1 THEN 'Active VIP Customer'
        ELSE 'Active Regular'
    END AS customer_status
FROM Ranked_Customers
ORDER BY total_revenue DESC;
