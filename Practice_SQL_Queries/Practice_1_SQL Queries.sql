/****************************************************************************
DDL STATEMENTS IN SQL - FOR DATABASE
****************************************************************************/
DROP DATABASE  dbCustomer
GO

CREATE DATABASE dbCustomer
GO

USE dbCustomer
GO

/****************************************************************************
DDL STATEMENTS IN SQL - FOR TABLES
****************************************************************************/
--DROP A TABLE FROM DATABASE
DROP TABLE CUSTOMER
GO

--CREATE NEW TABLE IN DATABASE
CREATE TABLE CUSTOMER ( 
CustomerId int IDENTITY(1001,1) PRIMARY KEY, 
CustomerNumber int NOT NULL UNIQUE, 
LastName varchar(50) NOT NULL, 
FirstName varchar(50) NOT NULL, 
AreaCode int NULL, 
Address varchar(50) NULL, 
Phone varchar(50) NULL DEFAULT '0000000000'
)
GO

--ADD NEW FIELD TO EXISTING TABLE
ALTER TABLE CUSTOMER ADD Gender char (1)

--CHANGE DATATYPE OF A FIELD
ALTER TABLE CUSTOMER ALTER COLUMN Gender varchar(6)

--DROP A FIELD FROM A TABLE
ALTER TABLE CUSTOMER DROP COLUMN Gender


/****************************************************************************
DML STATEMENTS IN SQL
****************************************************************************/

/********************* INSERT NEW RECORDS IN THE TABLE *********************/
--METHOD 1 (Specify values for each field in the table in same order as it exists in table defination
INSERT INTO CUSTOMER VALUES 
('100', 'Smith', 'John', 12, 'California', '1111111111')

--METHOD 2 (Specify values for each field mentioned in INSERT in same order as it exists in INSERT statement
INSERT INTO CUSTOMER (CustomerNumber, LastName, FirstName, AreaCode, Address, Phone) VALUES 
('101', 'Smith', 'John', 14, 'California', '1111111111')

--You may skip to insert values for fields that can have null values
INSERT INTO CUSTOMER (CustomerNumber, LastName, FirstName) VALUES 
('102', 'Smith', 'John')


/********************* UPDATE RECORDS IN THE TABLE *********************/
UPDATE CUSTOMER 
SET 
Phone = '9876543210' 
WHERE 
CustomerId = 1001
GO

UPDATE CUSTOMER 
SET 
Phone = '9870003210', FirstName = 'Andrina', LastName = 'Anzel'
WHERE 
CustomerId = 1002
GO

/********************* DELETE RECORDS FROM THE TABLE *********************/
DELETE FROM CUSTOMER 
WHERE 
CustomerId = 1003
GO

/********************* SELECT RECORDS FROM THE TABLE *********************/
SELECT * FROM CUSTOMER;
SELECT FirstName, LastName, Phone FROM CUSTOMER;