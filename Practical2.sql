--SELECT Statement to check tables

SELECT *
FROM ORDERS_PRODUCTS_CUSTOMERS.DATABASE.ORDERS
LIMIT 10;

SELECT *
FROM ORDERS_PRODUCTS_CUSTOMERS.DATABASE.PRODUCTS
LIMIT 10;

SELECT *
FROM ORDERS_PRODUCTS_CUSTOMERS.DATABASE.CUSTOMERS
LIMIT 10;


--Question 1.
--List all orders along with the customer name and product name. Expected Output Columns:
--OrderID, OrderDate, CustomerName, ProductName, Quantity

SELECT ORDERS.ORDERID,
       ORDERS.ORDERDATE,
       CUSTOMERS.CUSTOMERNAME,
       PRODUCTS.PRODUCTNAME,
       QUANTITY
FROM   ORDERS
INNER JOIN CUSTOMERS ON ORDERS.CUSTOMERID = CUSTOMERS.CUSTOMERID
INNER JOIN PRODUCTS ON ORDERS.PRODUCTID = PRODUCTS.PRODUCTID;

--Question 2.
--Which customers have placed at least one order? Expected Output Columns:
--CustomerID, CustomerName, Country, OrderID, OrderDate

SELECT CUSTOMERS.CUSTOMERID,
       CUSTOMERS.CUSTOMERNAME,
       CUSTOMERS.COUNTRY,
       ORDERS.ORDERID,
       ORDERS.ORDERDATE
FROM CUSTOMERS
INNER JOIN ORDERS ON CUSTOMERS.CUSTOMERID = ORDERS.CUSTOMERID;


--Question 3.
--List all customers and any orders they might have placed. Include customers who havenot placed any orders. Expected Output Columns:
--CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity

SELECT CUSTOMERS.CUSTOMERID,
       CUSTOMERS.CUSTOMERNAME,
       CUSTOMERS.COUNTRY,
       ORDERS.ORDERID,
       ORDERS.ORDERDATE,
       ORDERS.PRODUCTID,
       ORDERS.QUANTITY
FROM CUSTOMERS
LEFT JOIN ORDERS ON CUSTOMERS.CUSTOMERID = ORDERS.CUSTOMERID;



--Question 4.
--List all products and how many times each was ordered (if any). Expected Output Columns:
--ProductID, ProductName, TotalOrders (TotalOrders is the count of how many times the product appears in orders)

SELECT PRODUCTS.PRODUCTID,
       PRODUCTS.PRODUCTNAME,
       COUNT(ORDERS.ORDERID) AS TOTALORDERS
FROM PRODUCTS
LEFT JOIN ORDERS ON PRODUCTS.PRODUCTID = ORDERS.PRODUCTID
GROUP BY PRODUCTS.PRODUCTID, PRODUCTS.PRODUCTNAME;


--Question 5.
--Find all orders along with product details, including any products that might not have been ordered. Expected Output Columns:
--OrderID, OrderDate, ProductID, ProductName, Price, Quantity

SELECT ORDERS.ORDERID,
       ORDERS.ORDERDATE,
       PRODUCTS.PRODUCTID,
       PRODUCTS.PRODUCTNAME,
       PRODUCTS.PRICE,
       ORDERS.QUANTITY
FROM ORDERS
RIGHT JOIN PRODUCTS ON ORDERS.PRODUCTID = PRODUCTS.PRODUCTID;


--Question 6.
--Which customers have made orders, and include customers even if they have never placed an order.Expected Output Columns:
--CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity

SELECT CUSTOMERS.CUSTOMERID,
       CUSTOMERS.CUSTOMERNAME,
       CUSTOMERS.COUNTRY,
       ORDERS.ORDERID,
       ORDERS.ORDERDATE,
       ORDERS.PRODUCTID,
       ORDERS.QUANTITY
FROM ORDERS
RIGHT JOIN CUSTOMERS ON ORDERS.CUSTOMERID = CUSTOMERS.CUSTOMERID;


--Question 7.
--List all customers and orders, showing NULLs where customers have not ordered orwhere orders have no customer info.Expected Output Columns:
--CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity

SELECT CUSTOMERS.CUSTOMERID,
       CUSTOMERS.CUSTOMERNAME,
       CUSTOMERS.COUNTRY,
       ORDERS.ORDERID,
       ORDERS.ORDERDATE,
       ORDERS.PRODUCTID,
       ORDERS.QUANTITY
FROM CUSTOMERS
FULL OUTER JOIN ORDERS ON CUSTOMERS.CUSTOMERID = ORDERS.CUSTOMERID;


--Question 8.
--List all products and orders, showing NULLs where products were never ordered or orders are missing product info.Expected Output Columns:
--ProductID, ProductName, Price, OrderID, OrderDate, CustomerID, Quantity

SELECT PRODUCTS.PRODUCTID,
       PRODUCTS.PRODUCTNAME,
       PRODUCTS.PRICE,
       ORDERS.ORDERID,
       ORDERS.ORDERDATE,
       ORDERS.CUSTOMERID,
       ORDERS.QUANTITY
FROM PRODUCTS
FULL OUTER JOIN ORDERS ON PRODUCTS.PRODUCTID = ORDERS.PRODUCTID;
