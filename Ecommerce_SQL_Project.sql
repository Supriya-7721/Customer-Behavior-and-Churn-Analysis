SELECT City, REVENUE, ROUND(SUM(REVENUE) OVER (ORDER BY Revenue DESC),2) AS Running_Total FROM (SELECT City, ROUND(SUM(`Total Spend`),2) AS Revenue FROM cleaned_ecommerce_final GROUP BY City) t; 
SELECT * FROM cleaned_ecommerce_final WHERE `Total Spend` > (SELECT AVG(`Total Spend`) FROM cleaned_ecommerce_final);
SELECT City, Revenue FROM (SELECT City, SUM(`Total Spend`) AS Revenue FROM cleaned_ecommerce_final GROUP BY City) t ORDER BY Revenue DESC LIMIT 5;
WITH cte AS ( SELECT `Customer ID`, SUM(`Total Spend`) AS Revenue, NTILE(5) OVER (ORDER BY SUM(`Total Spend`) DESC) AS bucket FROM cleaned_ecommerce_final GROUP BY `Customer ID`) SELECT bucket, ROUND(SUM(revenue),2) AS total_revenue FROM cte GROUP BY bucket ORDER BY bucket;
SELECT City, `Membership Type`, ROUND(SUM(`Total Spend`),2) AS revenue, ROUND(100 * SUM(`Total Spend`) / (SUM(SUM(`Total Spend`)) OVER()),2) AS revenue_pct FROM cleaned_ecommerce_final GROUP BY City, `Membership Type`;
SELECT a.`Customer ID`, a.City, a.`Total Spend` FROM cleaned_ecommerce_final a JOIN ( SELECT City, AVG(`Total Spend`) AS avg_spend FROM cleaned_ecommerce_final GROUP BY City ) b ON a.City=b.City WHERE a.`Total Spend`> b.`avg_spend`;
