
--Joining tables which are not related
select customerid,employeeid,c.city,e.city,c.region,e.region,c.country 
from customers c join employees e
on e.country=c.country
where e.employeeid between 1 and 5

--Find the details Employee of the Highest experience
select Lastname from employees
where hiredate=(
select max(hiredate) from employees)

--Find the customers and their total  orders

select top 1 count(customerid) 'Total Orders',customerid
from orders
group by customerid
order by 'Total Orders' desc

--Find the customers details  who has maximum orders
select * from customers 
where customerid in(
select top 5 customerid from orders 
group by customerid 
order by count(orderid) desc)

select CustomerId from Orders
group by CustomerID
having (count(orderid) =
(select max(countId) from 
(select count(o2.customerid) as [countId] 
from Orders o2 group by o2.CustomerID) t))


select CustomerId from Orders
group by CustomerID
having (count(orderid) =
(select max(countId) from 
(select count(customerid) as [countId] 
from Orders group by CustomerID) mycust))

select * from employees
select * from customers
insert customers
select substring(firstname,1,3)+substring(lastname,1,2),
lastname,firstname,title,address,city,region,postalcode,country,
homephone,null from employees

select * from products

update products
set unitprice=unitprice+2
where supplierid in(select supplierid from suppliers
where country='USA')

alter table products add totalsales int default 0

alter table products add constraint dfTotalsales 
default 0 for totalsales

select * from products

update products
set totalsales=0
where totalsales is null

--Correlated Subqueries
--This example updates total sales for all orders of each product
update products
set totalsales=(
select sum(quantity) from [order details] od
where products.productid=od.ProductID)

--Exists example
select * from products
where exists(select * from suppliers
where country='IND')

--Delete example using Joins
delete from [order details]
from orders o join [order details] od
on o.orderid=od.OrderID
where o.orderdate='4/15/1998'

--Delete with Subquery Example
delete from [order details]
where orderid in(
select orderid from orders
where orderdate='4/14/1998')

delete from [order details]
where orderid in(11020,11021,11022,11023)