CREATE DATABASE airline_project;
USE airline_project;

SELECT COUNT(*) 
FROM airline_data;

SELECT * 
FROM airline_data;

/*Revenue by Travel Class (Product Mix)*/
SELECT Class,
SUM(Revenue) AS Total_Revenue
FROM airline_data
GROUP BY Class; /*Business*/

/*Revenue by Travel Type, (Business vs Personal)*/
SELECT `Type of Travel`,
SUM(Revenue) AS Total_Revenue
FROM airline_data
GROUP BY `Type of Travel`; /*Business*/

/*Average Satisfaction by Class*/
SELECT Class,
AVG(Satisfaction_Flag) AS Avg_Satisfaction
FROM airline_data
GROUP BY Class;/*Business*/

/*Delay Impact on Satisfaction*/
SELECT Satisfaction_Flag,
AVG(`Departure Delay in Minutes`) AS Avg_Delay
FROM airline_data
GROUP BY Satisfaction_Flag;/*Delay Impact on Satisfaction-yes*/

/*Revenue Loss Due to Delay*/
SELECT
SUM(CASE
    WHEN `Departure Delay in Minutes` > 30
    THEN Revenue ELSE 0 END) AS Revenue_Loss
FROM airline_data;/*Revenue Loss = 49144500*/

/*High Value Customer Revenue*/
SELECT High_Value_Customer,
SUM(Revenue) AS Revenue
FROM airline_data
GROUP BY High_Value_Customer;/*Yes=145807100, No=232024100*/


/*Loyal vs Non Loyal Customer Count*/
SELECT High_Value_Customer,
COUNT(*) AS Customer_Count
FROM airline_data
GROUP BY High_Value_Customer;/*Yes=28790,No=75114*/_