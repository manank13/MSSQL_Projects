
/*
1. SQL language is case insensitive
2. All the text/string/Char values shopul dbe quotes. 
	In SQL only single quotes are allowed.

*/

-- Create a new database
CREATE DATABASE db_Jul19_Batch

-- delete a  database
-- drop database db_Jul19_Batch

-- make a database active
use db_Jul19_Batch

-- create a table
create table tbl_Table1(
COL1 int,
col2 char(10)
)

create table tbl_Table2(
COL1 int identity(10000001, 1) primary key,
col2 char(10) not null unique
)


--CREATE NEW TABLE IN DATABASE
CREATE TABLE CUSTOMER ( 
CustomerId int IDENTITY(1001,1) PRIMARY KEY, 
CustomerNumber int NOT NULL UNIQUE, 
LastName varchar(50) NOT NULL, 
FirstName varchar(50) NOT NULL, 
AreaCode int NULL, 
Address varchar(50) NULL, 
Phone varchar(50) DEFAULT '0000000000'
)

-- drop table tbl_Table2

--ADD NEW FIELD TO EXISTING TABLE
ALTER TABLE CUSTOMER ADD Gender char (1)

--CHANGE DATATYPE OF A FIELD
ALTER TABLE CUSTOMER ALTER COLUMN Gender varchar(6)

--DROP A FIELD FROM A TABLE
ALTER TABLE CUSTOMER DROP COLUMN Gender

-- DML: INSERT data insersion
-- INSERT INTO CUSTOMER VALUES ()
-- INSERT INTO CUSTOMER () VALUES ()

SELECT * FROM CUSTOMER

--METHOD 1 (Specify values for each field in the table in same order as it exists in table defination
INSERT INTO CUSTOMER VALUES 
(102, 'Smith', 'John', 12, 'California')

--METHOD 2 (Specify values for each field mentioned in INSERT in same order as it exists in INSERT statement
INSERT INTO CUSTOMER 
(CustomerNumber, LastName, FirstName, AreaCode, Address) VALUES 
(102, 'Smith', 'John', 14, 'California')

--You may skip to insert values for fields that can have null values
INSERT INTO CUSTOMER (CustomerNumber, LastName, FirstName) VALUES 
(103, 'Smith', 'John')

INSERT INTO CUSTOMER 
(CustomerNumber, LastName, FirstName, AreaCode, Address)
VALUES 
(104, 'Smith', 'John', 12, 'California'),
(105, 'Smith', 'John', 12, 'California')

-- update the data
UPDATE CUSTOMER
SET FIRSTNAME = 'Andrina', Lastname = 'J'
where
CustomerId = 1006

select * from CUSTOMER

delete from CUSTOMER
where
CustomerId = 1004

-- What is the difference in drop truncate and delete
drop table customer
truncate table customer
delete from customer

--------------------------------------------------------------------

SELECT [KEYWORDS]
COLUMN/S
FROM
TABLENAME/S
WHERE
CONDITION/S
GROUP BY
COLUMN/S
HAVING
CONDITION/S
ORDER BY
COLUMN/S










