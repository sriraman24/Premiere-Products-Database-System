USE Premiere_Products;

-- List the number, name, balance and credit limit of all customers in the database.

SELECT CustomerNum, CustomerName, Balance, CreditLimit
FROM Customer;

-- List all fields and all rows in the Orders table.

SELECT*
FROM Orders;

-- Find the name of customer 148.

Select CustomerName
FROM Customer
WHERE CustomerNum = 148;

/* List the description, on hand value and warehouse number for all parts that have more than
10 units on-hand and that are located in warehouse 3. */

SELECT Description, OnHand, Warehouse
FROM Part
WHERE OnHand > 10 
AND Warehouse = 3;

-- List the number, name and balance for each customer whose balance is between $1000 and $5000.

SELECT CustomerNum, CustomerName, Balance
FROM Customer
WHERE Balance BETWEEN 1000 AND 5000;

-- List the number, name and available credit for all customers.

SELECT CustomerNum, CustomerName, CreditLimit
FROM Customer;

-- How many customers does sales rep 65 represent?

SELECT COUNT(*)
FROM Customer
WHERE RepNum = 65;

-- What is the average balance of all customers of sales rep 35?

SELECT AVG(Balance)
FROM Customer
GROUP BY RepNum
HAVING COUNT(*) > 3;

-- What is the average balance for all customers of each sales rep?

SELECT RepNum, ROUND(AVG(Balance), 3)
FROM Customer
GROUP BY RepNum;

-- List the customer number, name, balance and rep-number for each customer. Sort the output alphabetically by customer name.

SELECT CustomerNum, CustomerName, Balance, RepNum
FROM Customer
ORDER BY CustomerName;

/* List the customer number, name, balance and rep-number for each customer. Sort the output by sales rep-number.
 Within the customers of each sales rep, sort the output by customer name. */
 
 SELECT CustomerNum, CustomerName, Balance, RepNum
 FROM Customer
 ORDER BY RepNum, CustomerName;
 
-- List each customer’s number and name along with the number, last name and first name of each customer’s sales rep.

SELECT C.CustomerNum, C.CustomerName, R.RepNum, R.LastName, R.FirstName
FROM Customer C
JOIN Rep R
ON C.RepNum = R.RepNum;

/* For each customer whose credit limit is $10000, list customer’s number and name along with
  the number , last name and first name of the corresponding sales rep. */
  
  SELECT C.CustomerNum, C.CustomerName, R.RepNum, R.LastName, R.FirstName
  FROM Customer C
  JOIN Rep R
  ON C.RepNum = R.RepNum
  WHERE CreditLimit = 10000;
  
/* For each order, list the order number, order date, customer number and name. In addition, for each order line 
within the order, list the part number, description, number of units ordered and quoted price. */

SELECT L.OrderNum, O.OrderDate, O.CustomerNum, C.CustomerName, L.PartNum, P.Description, L.NumOrdered, L.QuotedPrice
FROM Customer C
JOIN Orders O
ON C.CustomerNum = O.CustomerNum
JOIN Orderline L
ON O.OrderNum = L.OrderNum
JOIN Part P
ON L.PartNum = P.PartNum;

/* The zip code for customers located in the city of Fillmore is incorrect; it should be 33363.
Change the zip code for these customers to the correct value. */

UPDATE Customer
SET Zip = 33363
WHERE City = "Fillmore";

-- Delete all order lines in which the order number is 21610

DELETE FROM Orderline
WHERE OrderNum = 21610;

-- List the number, name and balance of all customers.

SELECT CustomerNum, CustomerName, Balance
FROM Customer;

-- List the complete Part table.

SELECT *
FROM Part;

-- List the name of every customer with a $10000 credit limit.

SELECT CustomerName
FROM Customer
WHERE CreditLimit = 10000;

-- Find the name of customer 148

Select CustomerName
FROM Customer
WHERE CustomerNum = 148;

-- Find the customer name for every customer located in the city of Grove.

SELECT CustomerName
FROM Customer
WHERE City = "Grove";

-- List the number, name, credit limit and balance for all customers with credit limits that exceed their balances.
 
 SELECT CustomerNum, CustomerName, CreditLimit, Balance
 FROM Customer
 WHERE CreditLimit > Balance;
 
 -- List the descriptions of all parts that are located in warehouse 3 and for which there are more than 20 units on hand.
 
 SELECT Description
 FROM Part
 WHERE Warehouse = 3
 AND OnHand > 20;
 
 -- List the description of all parts that are located in warehouse 3 or for which there are more than 20 units on hand or both.

 SELECT Description
 FROM Part
 WHERE Warehouse = 3
 OR OnHand > 20;
 
-- List the descriptions of all parts that are not in warehouse 3.

SELECT Description
FROM Part
WHERE NOT Warehouse = 3;

-- List the number, name and balance of all customers with balances greater than or equal to $1000 and less than or equal to $5000.

SELECT CustomerNum, CustomerName, Balance
FROM Customer
WHERE Balance >= 1000
AND Balance <= 5000;

-- List the number, name and complete address of every customer located on a street that contains the letters Oxford.
 
 SELECT CustomerNum, CustomerName, Street, City, State, Zip
 FROM Customer
 WHERE Street LIKE "%oxford%";

-- List the number, name, street and credit limit for every customer with a credit limit of $7500, $10000 or $15000.

SELECT CustomerNum, CustomerName, Street, CreditLimit
FROM Customer
WHERE CreditLimit IN (7500, 10000, 15000);

-- List the number, name and credit limit of all customers. Sort the customers by name.

SELECT CustomerNum, CustomerName, CreditLimit
FROM Customer
ORDER BY CustomerName;

/* List the number, name and credit limit of all customers. Sort the customers by name within descending credit limit. 
(In other words, sort the customers by credit limit in descending order. Within each group of customers that have a common credit limit, 
sort the customers by name) */

SELECT CustomerNum, CustomerName, CreditLimit
FROM Customer
ORDER BY CreditLimit DESC, CustomerName;

-- How many parts in item class HW?

SELECT COUNT(*)
FROM Part
WHERE Class = "HW";

-- Find the number of customers and the total of their balances.

SELECT CustomerNum, count(*), SUM(Balance)
FROM Customer
GROUP BY CustomerNum;

/* Find the total number of customers and the total of their balances. Change the column namesfor number of customers and 
total of their balances to CustomerCount and BalanceTotal respectively. */

SELECT count(*) AS CustomerCount, SUM(Balance) AS BalanceTotal
FROM Customer
GROUP BY CustomerNum;

-- List the order number for each order that contains an order line for a part located in warehouse 3.

SELECT O.OrderNum
FROM Orderline O
JOIN Part P
ON O.PartNum = P.PartNum
WHERE P.Warehouse = 3;

/* For each sales rep, list the rep number, the number of customers assigned to the rep and the average balance of the rep’s customers.
Group the records by rep number and order of the records by rep number. */

SELECT RepNum, COUNT(*), AVG(Balance)
FROM Customer
GROUP BY RepNum
ORDER BY RepNum;

/* For each sale rep with fewer than four customers, list the rep number, the number of customers assigned to the rep 
and the average balance of the rep’s customers. Rename the count of the number of customers and 
the average of the balances to NumCustomers and AverageBalance respectively. Order the groups by rep number. */

SELECT RepNum, COUNT(*) AS NumCustomers, AVG(Balance) AS AverageBalance
FROM Customer
GROUP BY RepNum
HAVING COUNT(*) < 4
ORDER BY RepNum;

/* List the number and name of each customer with number, last name, first name of sales rep who represents the customer. 
Order the records by customer number. */

SELECT C.CustomerNum, C.CustomerName, C.RepNum, R.FirstName, R.LastName
FROM Customer C
JOIN Rep R
ON C.RepNum = R.RepNum
ORDER BY C.CustomerNum;

/* List the number and name of each customer whose credit limit is $10000 together with number, last name and 
first name of the sales rep who represents the customer. Order the records by customer number. */

SELECT C.CustomerNum, C.CustomerName, C.RepNum, R.FirstName, R.LastName
FROM Customer C
JOIN Rep R
ON C.RepNum = R.RepNum
WHERE C.CreditLimit = 10000
ORDER BY C.CustomerNum;

/* For every order, list the order number, order date, customer number and customer name. In addition, for each order line within the order, 
list the part number, number of units ordered and quoted price. Order the records by order number.*/

SELECT L.OrderNum, O.OrderDate, C.CustomerNum, C.CustomerName, L.PartNum, L.NumOrdered, L.QuotedPrice
FROM Customer C 
JOIN Orders O
ON C.CustomerNum = O.CustomerNum 
JOIN Orderline L
ON O.OrderNum = L.OrderNum
ORDER BY OrderNum;

-- List the number and name of all customers that are represented by sale rep 35 or that currently have orders on file or both.

SELECT c.customerNum, c.customerName
FROM customer c
LEFT JOIN orders o 
ON c.customerNum = o.customerNum
WHERE c.RepNum = 35 
OR o.orderNum IS NOT NULL
GROUP BY c.customerNum, c.customerName;

-- Change the street address of customer 524 to 1445 Rivard.

UPDATE Customer
SET Street = "1445 Rivard"
WHERE CustomerNum = 524;

/* Add a new sales rep to Rep table. Her number is 16; name is Sharon Rands, address is 826 Raymond, Altonville, FL 32543.
She has not yet earned any commission, but her commission rate is 5% (0.05). */
 
 INSERT INTO Rep(RepNum, LastName, FirstName, Street, City, State, Zip, Commission, Rate)
 VALUES(16, "Rands", "Sharon", "826 Raymond", "Altonville", "FL", 32543, 0.00, 0.05);

-- Delete any row in the OrderLine table in which the part number is BV06.

DELETE FROM Orderline
WHERE PartNum = "BV06";

/* Create a new table named SmallCust consisting of all fields from Customer table and those rows in which the credit limit is
less than or equal to $7500. */

CREATE TABLE SmallCust AS
SELECT*
FROM Customer
WHERE CreditLimit <= 7500;







  
  






