--Installation Steps
--https://learnsql.com/blog/how-to-install-sql-server-2017-windows/

--Click Next. You’ll now see the Database Engine Configuration settings. 
--If you’d like to have the option 
--to connect to databases through both Windows and SQL Server authentication,
--check Mixed Mode. Mixed Mode allows you connect to SQL Server 
--using both your Windows account password and 
--also a custom password you can set for SQL Server admin privileges.
--for sa password pls give newuser123

--SQL - DDL,DML,DCL


--Data Definition Language:
--CREATE DATABASE database_name;
--DROP DATABASE [ IF EXISTS ] database_name [,database_name2,...];
use master
go
drop database dbhr13
go
use dbctshr
go



--Data Definition Language:
--ALTER TABLE table_name ADD column_name data_type column_constraint;
--ALTER TABLE table_name ALTER COLUMN column_name new_data_type(size);
--ALTER TABLE table_name DROP COLUMN column_name;
--ALTER TABLE persons ADD full_name AS (first_name + ' ' + last_name);
--EXEC sp_rename 'old_table_name', 'new_table_name'
--DROP TABLE [IF EXISTS] [database_name.][schema_name.]table_name;
--TRUNCATE TABLE [database_name.][schema_name.]table_name;
--SELECT select_list INTO destination FROM source [WHERE condition]


--Constraints:
--CREATE TABLE table_name ( pk_column data_type PRIMARY KEY, ... );
--CREATE TABLE table_name ( pk_column_1 data_type, pk_column_2 data type,
--... PRIMARY KEY (pk_column_1, pk_column_2) );
--CONSTRAINT fk_constraint_name FOREIGN KEY (column_1, column2,...)
--REFERENCES parent_table_name(column1,column2,..)
--FOREIGN KEY (foreign_key_columns) REFERENCES
--parent_table(parent_key_columns) ON UPDATE action ON DELETE action;
--CHECK(condition)
--ALTER TABLE table_name ADD CONSTRAINT constraint_name CHECK(condtion);
--DROP CONSTRAINT constraint_name;
--ALTER TABLE table_name NOCHECK CONSTRAINT constraint_name;




--Constraints:
--CONSTRAINT constraint_name UNIQUE(column_name)
--UNIQUE (column1,column2)
--ALTER TABLE table_name ADD CONSTRAINT constraint_name UNIQUE(column1,
--column2,...);
--ALTER TABLE table_name ALTER COLUMN column_name data_type NOT NULL;
--ALTER TABLE table_name ALTER COLUMN column_name data_type NULL;
--ALTER TABLE table_name ALTER COLUMN column_name data_type default value;



--Data Manipulation Language:
--INSERT INTO table_name (column_list) VALUES (value_list);
--INSERT INTO table_name( column_list) OUTPUT inserted.column_name
--VALUES value_list);
--INSERT INTO table_name( column_list)
--OUTPUT
--inserted.column_name1,
--inserted.column_name2
--VALUES value_list);

--Data Manipulation Language:
--INSERT INTO table_name (column_list) VALUES (value_list_1), (value_list_2),
--... (value_list_n);
--INSERT [ TOP ( expression ) [ PERCENT ] ] INTO target_table (column_list)
--query
--INSERT INTO table_name (column_list) SELECT column_list FROM table1 WHERE
--condition
--INSERT TOP (n) INTO table_name (column_list) SELECT column_list FROM
--table_name ORDER BY column_name
--UPDATE table_name SET c1 = v1, c2 = v2, ... cn = vn [WHERE condition]
--DELETE [ TOP ( expression ) [ PERCENT ] ] FROM table_name [WHERE
--search_condition];
--MERGE target_table USING source_table ON merge_condition WHEN MATCHED THEN
--update_statement WHEN NOT MATCHED THEN insert_statement WHEN NOT MATCHED BY
--SOURCE THEN DELETE;

--Which of the following is/are the DDL statements?
--All of the Mentioned
--Drop
--Create
--Alter

create database dbCTSHR
go


use dbCTSHR

--DDL Create,Alter,Truncate,Drop
--Creating Employee table
drop table tblemployee
--Syntax for create table <tablename>()


Create table tblEmployee(
EmployeeId int not null ,
Name nvarchar(20) not null,
Location nvarchar(30),
)
go

--Alter,Adding Gender column to existing table
alter table tblEmployee 
add Gender varchar(10)
go
--Alter the existing column
alter table tblEmployee 
alter column Location nvarchar(50)
go
drop table visits
drop table stores
go
--Parent Table
create table stores
(storeid int primary key,
storename nvarchar(30),
city nvarchar(30),
storetype char(5)
constraint ck_storetype check( storetype in ('ACTIV','INACT'))
)
go

--Reference Table
CREATE TABLE visits (
visitid INT PRIMARY KEY IDENTITY (1,1),
firstname VARCHAR (50) NOT NULL,
lastname VARCHAR (50) NOT NULL,
visitdate DATETIME,
phone VARCHAR(20),
storeid INT NOT NULL,
FOREIGN KEY (storeid) REFERENCES stores (storeid),
CONSTRAINT "CK_visitdate" CHECK (visitdate < getdate())
);
go


--Drop a column
alter table tblEmployee
drop column Gender
go

alter table tblEmployee
add constraint pk_employeeid primary key(employeeid)
go
--truncate,Removes all records,Structure Remains
truncate table tblEmployee
go
--Drop,Removes all records and Structure also
--This command will remove the table from databse
--It requires authority in real time
--So pls avoid using this drop
drop table tblEmployee
go


--sp_help id built store procedure to see the design of any table
sp_help tblEmployee
go
--To see the records or contents of a table
select * from tblEmployee
go

select employeeid,Name from tblEmployee
where location='Chennai'
go
select visitid as 'Visitors Id',firstname 'First Name',visitdate 'Visted Stores on'
from visits

--DML Select ,Insert,Update,Delete
--Insert records
insert tblEmployee(employeeId,Name,Location) 
values(1001,'Kavin','Chennai')
insert into tblEmployee
values(1002,'Kanav','Bangalore')
go
--Inserting Multiple Employee Record
insert tblEmployee(employeeId,Name,Location)
values
(1003,'Harshitha','Mumbai'),
(1004,'Sumedha','Pune'),
(1005,'Saahithya','Bangalore')

insert into tblEmployee(Name,employeeId)
values('Sadhana',1006)

insert tblEmployee(employeeid)
values(1007)

select employeeiD,name,Location
from tblEmployee
--Top

select top 2 * from tblEmployee

select top 45 percent * from tblEmployee

select * from tblEmployee

go
--Rename the table
sp_rename 'tblEmployee','tblEmployeeInfo'
go

select * from tblEmployeeInfo
go
alter table tblEmployeeInfo 
add Salary money,Hiredate Date
go
alter table tblEmployeeInfo
drop column Hiredate
go
alter table tblEmployeeInfo
add HireDate date not null

delete tblEmployeeInfo
where employeeid=1007
go
create table tblDepartment
(DepId int primary key,
Name nvarchar(30) not null)
go
insert tblDepartment
values(1,'Admin')
insert tblDepartment
values(2,'Finance')
insert tblDepartment(Depid,Name)
values(100,'IT')
go
select * from tblDepartment
go
--Do not use drop to make changes...use alter
drop table tblEmployeeInfo
go

Create table tblEmployeeInfo(EmployeeId int primary key not null ,
Name nvarchar(20) not null,
Location nvarchar(30),
DepId int foreign key 
references tblDepartment(DepId)
)
go
alter table tblEmployeeInfo
add DepId int 
alter table tblEmployeeInfo
drop column depid

alter table tblEmployeeInfo 
add departmentid int foreign key
references tblDepartment(Depid)
go
insert tblEmployeeInfo
values(1001,'Kavin','Bangalore',2)
go

update tblDepartment
set name='Systems'

where depid=100

update tblDepartment
set name='HR'
where depid=1

update tblDepartment
set name='Finance'
where depid=2

select * from tblDepartment



