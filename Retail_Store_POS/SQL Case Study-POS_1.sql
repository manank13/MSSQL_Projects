/* Create Database */
create Database POS 

/* Use Database */
use POS 

/* Create Table with Columns */
create table Customer(
Customer_Id int not null Primary key,
DOB varchar(50) not null,
Gender varchar(1) not null,
City_Code int null)

Create table Transactions(
Transaction_Id int not null identity (1000,1) Primary key,
Cust_Id int not null Foreign key References dbo.Customer(Customer_ID),
Tran_Date date not null,
Prod_Subcat_Code varchar(50) not null,
Product_Cat_Code varchar(50) not null,
Qty numeric(15,2) null,
Rate numeric(15,2) null,
Tax numeric(15,2) null,
Total_Amt numeric(15,2) null,
Store_type varchar(50) null,
Constraint Fk_Transactions Foreign key (Product_Cat_Code,Prod_Subcat_Code) References dbo.Prod_Cat_Info(Prod_Cat_Code,Prod_Sub_Cat))

Create table Prod_Cat_Info(
Prod_Cat_Code varchar(50) not null,
Prod_Cat varchar(50) not null,
Prod_Sub_Cat_Code varchar(50) not null,
Prod_Sub_Cat varchar(50) not null,
Constraint Pk_Prod_Cat_Info Primary key (Prod_Cat_Code,Prod_Sub_Cat))

/*truncate table Customer

insert into dbo.Customer values
(268408, '02-01-1970', 'M', 4),
(269696, '07-01-1970', 'F', 8);*/