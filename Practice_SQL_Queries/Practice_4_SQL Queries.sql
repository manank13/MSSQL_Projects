SELECT * FROM TBL_ORDER
USE db_Jul19_Batch
--Q1: List all orders in ascending or descending order of SALES.
SELECT * FROM TBL_ORDER
ORDER BY
SALES DESC

--Q2: List all customers in ascending order of CATEGORY and descending order by SALES.
SELECT
REF_NO, CUST_NAME, CATEGORY, PRODUCT, SALES, PROFIT
FROM 
TBL_ORDER
ORDER BY
4, 6 DESC
-- CATEGORY, 6 DESC
-- CATEGORY ASC, SALES DESC  
-- SALES DESC, CATEGORY ASC : INCORRECT

--Q3: Display only unique records from the order table.
SELECT DISTINCT
* 
FROM 
TBL_ORDER

--Q4: Display unique combination of CATEGORY and PRODUCT arranged in proper order.
SELECT DISTINCT
CATEGORY, PRODUCT
FROM 
TBL_ORDER

/*
OPERATORS
----------------------------------------------
ARITHMATIC: + - * / % **
CONDITIONAL/RELATIONSHIP: 
	SINGLE VALUED: = > >= < <= != <> (OUTPUT IS ALWAY THE BOOL)
	MULTI VALUED: IN BETWEEN AND
	WILD CARD: LIKE % _ []
	NULL/MISSING: IS NULL IS NOT NULL
LOGICAL/BOOLEAN: AND OR NOT
*/

--Q5: Which orders are giving loss to the company?
SELECT 
*
FROM 
TBL_ORDER
WHERE
PROFIT < 0

--Q6: Which are the orders that belong to Technology category?
SELECT 
*
FROM 
TBL_ORDER
WHERE
CATEGORY = 'Technology'

--Q7: Are there any orders from Technology category where orders were sold at loss?
SELECT 
*
FROM 
TBL_ORDER
where
CATEGORY = 'Technology' AND PROFIT < 0

--Q8: Which are the orders where PRODUCTS (Tables, Phones and Appliances) are sold?
SELECT
*
FROM
TBL_ORDER
WHERE
PRODUCT IN ('Tables', 'Phones', 'Appliances')
-- PRODUCT = 'Tables' OR PRODUCT =  'Phones' OR PRODUCT =  'Appliances'

--Q9: List all orders excluding Tables product.
SELECT
*
FROM
TBL_ORDER
WHERE
PRODUCT != 'Tables'

SELECT
*
FROM
TBL_ORDER
WHERE
PRODUCT NOT IN ('Tables', 'Phones')
-- PRODUCT != 'Tables' and product != 'Phones'

--Q10: From which of the orders company has gained profit by selling Tables, Phones and Appliances?
SELECT
*
FROM
TBL_ORDER
WHERE
(PRODUCT = 'Tables' OR PRODUCT =  'Phones' OR PRODUCT =  'Appliances') AND PROFIT > 0 
-- PRODUCT IN ('Tables', 'Phones', 'Appliances') AND PROFIT > 0

--Q11: List all order details where sales are between 3000 and 5000.
SELECT
*
FROM
TBL_ORDER
WHERE
SALES BETWEEN 3000 AND 5000
-- SALES >= 3000 AND SALES <= 5000

--Q12: List orders which are placed by customers where customer name starts with J or T AND 
-- ends with d
SELECT
*
FROM
TBL_ORDER
WHERE
CUST_NAME LIKE '[JT]%d'
-- CUST_NAME LIKE '[JT]%' AND CUST_NAME LIKE '%d'
-- (CUST_NAME LIKE 'J%' OR CUST_NAME LIKE 'T%') AND CUST_NAME LIKE '%d'
-- CUST_NAME LIKE 'JT%' - INCORRECT

--Q13: Orders where characters at 2nd and 3rd of cust_name positions are is 'ar'
select
*
from
tbl_order
where
CUST_NAME like '_ar%'

-- find names where we have z in the name
select * from tbl_order where cust_name like '%z%'

--Q14: Which are the Top 5 orders in terms of sales amount?
select TOP 5
* 
from 
tbl_order
ORDER BY 
SALES DESC

/*
ORACLE: ROWNUM
MYSQL: LIMIT
MS SQL SERVER: TOP
*/

--Q15: Which are the bottom 25% orders in terms of profits?
SELECT TOP 25 PERCENT * FROM TBL_ORDER ORDER BY PROFIT ASC

--Q16: Display order details with appropiate header labels 
-- e.g. Customer Name, Product category and Sales amount etc..
SELECT 
CUST_NAME CUSTOMER_NAME, PRODUCT AS 'PRODUCTS', SALES AS [TOTAL SALES]
FROM 
TBL_ORDER

SELECT 
CUST_NAME AS PRODUCT
FROM 
TBL_ORDER AS T1

-- DEALING WITH NULL VALUES
SELECT * FROM TBL_ORDER

--UPDATE TBL_ORDER SET PROFIT = NULL WHERE PROFIT < -1000

-- ONLY THE RECORDS WHERE THERE IS NULL IN PROFIT
SELECT * FROM TBL_ORDER WHERE PROFIT IS NOT NULL


--Q17: Functions in SQL
SELECT
PROFIT, 
ABS(PROFIT) AS FN_ABS,
CEILING(PROFIT) AS FN_CEILING,
FLOOR(PROFIT) AS FN_FLOOR,
ROUND(PROFIT, 2) AS FN_ROUND,
ISNUMERIC(PROFIT) AS FN_ISNUMERIC
FROM
TBL_ORDER

SELECT
SUM(SALES) AS FN_SUM,
MIN(SALES) AS FN_MIN,
MAX(SALES) AS FN_MAX,
AVG(SALES) AS FN_AVG,
STDEV(SALES) AS FN_STD,
COUNT(SALES) AS FN_CNT
FROM
TBL_ORDER

SELECT
REF_NO,
ASCII('a') AS FN_ASCII,
CHAR(65) AS FN_CHAR,
CHARINDEX('-', REF_NO) AS FN_CHAR_INDEX,
REPLACE(REF_NO, 'CA', 'XX') FN_REPLACE,
STUFF(REF_NO, 1, 2, 'XX') FN_STUFF
FROM
TBL_ORDER

SELECT REPLICATE('A', 5), CONCAT(REF_NO, SPACE(50), CUST_NAME)
FROM
TBL_ORDER

SELECT
GETDATE(),
GETUTCDATE()

SELECT
ORD_DTE,
YEAR(ORD_DTE) AS FN_YEAR,
DATEPART(YEAR, ORD_DTE) AS FN_DATEPART_1,
DATEPART(MONTH, ORD_DTE) AS FN_DATEPART_2,
DATEPART(DAY, ORD_DTE) AS FN_DATEPART_3,
DATEPART(WEEKDAY, ORD_DTE) AS FN_DATEPART_4,

DATENAME(YEAR, ORD_DTE) AS FN_DATENAME_1,
DATENAME(MONTH, ORD_DTE) AS FN_DATENAME_2,
DATENAME(DAY, ORD_DTE) AS FN_DATENAME_3,
DATENAME(WEEKDAY, ORD_DTE) AS FN_DATENAME_4
FROM
TBL_ORDER

SELECT
GETDATE() AS TODAY_DATE,
ORD_DTE,
DATEDIFF(YEAR, ORD_DTE, GETDATE()) AS DIFF_YEARS,
DATEDIFF(MONTH, ORD_DTE, GETDATE()) AS DIFF_MONTH,

DATEADD(MONTH, -5, ORD_DTE) AS DATEADD_1
FROM
TBL_ORDER

--Q18: How many orders are placed for each category? Get the total sales amount as well.
SELECT 
COUNT(*) AS CNT,
COUNT(REF_NO) AS CNT_1,
COUNT(PROFIT) AS CNT_2
FROM TBL_ORDER

SELECT 
CATEGORY, COUNT(*) AS CNT
FROM 
TBL_ORDER
GROUP BY
CATEGORY

--Q19: What is the YEARLY sales amount?
SELECT 
YEAR(ORD_DTE) AS YEAR_DATE, SUM(SALES) AS TOT_SALES
FROM 
TBL_ORDER
GROUP BY
YEAR(ORD_DTE)

--Q19: What is the monthly sales amount?
SELECT 
DATENAME(YEAR, ORD_DTE) + ' - ' + DATENAME(MONTH, ORD_DTE) AS MONTH_DATE, SUM(SALES) AS TOT_SALES
FROM 
TBL_ORDER
GROUP BY
DATENAME(YEAR, ORD_DTE) + ' - ' + DATENAME(MONTH, ORD_DTE)

SELECT 
EOMONTH(ORD_DTE) AS MONTH_DATE, SUM(SALES) AS TOT_SALES
FROM 
TBL_ORDER
GROUP BY
EOMONTH(ORD_DTE)

--Q20: Are there any customers with duplicate reference number?
SELECT
REF_NO, COUNT(*) AS CNT
FROM
TBL_ORDER
GROUP BY
REF_NO
HAVING 
COUNT(*) > 1


/************************** Bonus Question ***************************************************

Get the data that fulfil following business requirement:

1. What is count of ORDERS buying perticular product in Technology and Furniture category 
   in year 2011 and 2012. 
2. Get the maximum, minimum and average sales amount for each product along with customer 
   count.
3. Display data for only those products which are bought by more than one customer.
4. Output should be arranged in descending order of customer count and average sales amount.
*********************************************************************************************/
SELECT
PRODUCT, COUNT(REF_NO) AS CNT, MIN(SALES) AS MIN_SALES, MAX(SALES) AS MAX_SALES, 
AVG(SALES) AS AVG_SALES
FROM
TBL_ORDER
WHERE
CATEGORY IN ('Technology', 'Furniture') AND YEAR(ORD_DTE) IN (2011, 2012)
GROUP BY
PRODUCT
HAVING
COUNT(REF_NO) > 1
ORDER BY
CNT DESC

CONVERT
CAST
ROW_NUMBER

IF
CASE WHEN

