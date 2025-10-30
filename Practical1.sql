--SELECT Statement

--Question 1. 
--Display all columns for all transactions. Expected output: All columns

SELECT *
FROM RETAIL.SALES.RETAIL_SALES;


--Question 2. 
--Display only the Transaction ID, Date, and Customer ID for all records. Expected output: Transaction ID, Date, Customer ID

SELECT TRANSACTION_ID
        DATE,
        CUSTOMER_ID
FROM RETAIL.SALES.RETAIL_SALES;

--SELECT DISTINCT Statement


--Qustion 3. 
--Display all the distinct product categories in the dataset. Expected output: Product Category

SELECT DISTINCT Product_Category
FROM RETAIL.SALES.RETAIL_SALES


--Question 4. 
--Display all the distinct gender values in the dataset. Expected output: Gender

SELECT DISTINCT Gender
FROM RETAIL.SALES.RETAIL_SALES


--WHERE Clause

--Question 5. 
--Display all transactions where the Age is greater than 40. Expected output: All columns

SELECT *
FROM RETAIL.SALES.RETAIL_SALES
WHERE Age > 40;


--Question 6. 
--Display all transactions where the Price per Unit is between 100 and 500. Expected output: All columns

SELECT *
FROM RETAIL.SALES.RETAIL_SALES
WHERE PRICE_PER_UNIT BETWEEN 100 AND 500;


--Question 7. 
--Display all transactions where the Product Category is either 'Beauty' or 'Electronics'.Expected output: All columns

SELECT *
FROM RETAIL.SALES.RETAIL_SALES
WHERE PRODUCT_CATEGORY IN ('Beauty', 'Electronics');


--Question 8. 
--Display all transactions where the Product Category is not 'Clothing'. Expected output: All columns

SELECT *
FROM RETAIL.SALES.RETAIL_SALES
WHERE PRODUCT_CATEGORY NOT IN ('CLOTHING');


--Question 9. 
--Display all transactions where the Quantity is greater than or equal to 3. Expected output: All columns

SELECT *
FROM RETAIL.SALES.RETAIL_SALES
WHERE QUANTITY >= 3;


--Aggregate Functions

--Question 10. 
--Count the total number of transactions. Expected output: Total_Transactions

SELECT COUNT ('TransactionID') AS Total_Transactions
FROM RETAIL.SALES.RETAIL_SALES;


--Question 11. 
--Find the average Age of customers. Expected output: Average_Ag

SELECT AVG(Age) AS Average_age
FROM RETAIL.SALES.RETAIL_SALES


--Question 12. 
--Find the total quantity of products sold. Expected output: Total_Quantity

SELECT SUM(Quantity) AS Total_quantity
FROM RETAIL.SALES.RETAIL_SALES


--Question 13. 
--Find the maximum Total Amount spent in a single transaction. Expected output: Max_Total_Amount

SELECT MAX(Total_amount) AS Max_Total_Amount
FROM RETAIL.SALES.RETAIL_SALES;


--Question 14. 
--Find the minimum Price per Unit in the dataset. Expected output: Min_Price_per_Unit

SELECT MIN(Price_Per_Unit) AS Min_Price_Per_Unit
FROM RETAIL.SALES.RETAIL_SALES;


--GROUP BY Statement

--Qustion 15. 
--Find the number of transactions per Product Category. Expected output: Product Category, Transaction_Count

SELECT Product_Category,
      COUNT(Quantity) AS Transactions_Count,
FROM RETAIL.SALES.RETAIL_SALES 
GROUP BY Product_Category;


--Question 16. 
--Find the total revenue (Total Amount) per gender. Expected output: Gender, Total_Revenue

SELECT Gender,
       SUM(Total_Amount * Quantity) as Total_Revenue,
FROM RETAIL.SALES.RETAIL_SALES 
GROUP BY Gender;


--Question 17. 
--Find the average Price per Unit per product category. Expected output: Product Category, Average_Price

SELECT Product_Category,
      AVG(Price_per_Unit) AS Average_Price
FROM RETAIL.SALES.RETAIL_SALES 
GROUP BY Product_Category;


--HAVING Clause

--Question 18. 
--Find the total revenue per product category where total revenue is greater than10,000. Expected output: Product Category, Total_Revenue

SELECT Product_Category,
    SUM(Price_per_Unit * Quantity) AS Total_Revenue
 FROM RETAIL.SALES.RETAIL_SALES  
 GROUP BY Product_Category
 HAVING SUM(Price_per_Unit * Quantity) > 10000;

--Question 19.
--Find the average quantity per product category where the average is more than 2. Expected output: Product Category, Average_Quantity

SELECT Product_Category,
    AVG(Quantity) AS Average_Quantity
 FROM RETAIL.SALES.RETAIL_SALES  
 GROUP BY Product_Category
 HAVING AVG(Quantity) > 2;


--CASE Statement

--Question 20. 
--Display a column called Spending_Level that shows 'High' if Total Amount > 1000, otherwise 'Low'. Expected output: Transaction ID, Total Amount, Spending_Level


SELECT 
       Transaction_ID,
       Total_Amount,
CASE
     WHEN Total_Amount > 1000 THEN 'High'
     ELSE 'Low'
END AS Spending_Level
FROM RETAIL.SALES.RETAIL_SALES;


--Question 21. 
--Display a new column called Age_Group that labels customers as:
--• 'Youth' if Age < 30
--• 'Adult' if Age is between 30 and 59
--• 'Senior' if Age >= 60
--Expected output: Customer ID, Age, Age_Group

SELECT 
    Customer_ID,
    Age,
    CASE
        WHEN Age < 30 THEN 'Youth'
        WHEN Age BETWEEN 30 AND 59 THEN 'Adult'
        WHEN Age >= 60 THEN 'Senior'
    END AS Age_Group
FROM RETAIL.SALES.RETAIL_SALES;








