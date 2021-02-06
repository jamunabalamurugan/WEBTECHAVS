--Groupby
/*SELECT column1, columnn 
FROM table_name 
WHERE [ conditions ] 
GROUP BY column1, column2 
ORDER BY column1, column2 */


alter table tblEmployeeInfo add Managerid int 
go
--No of Employees under each Manager

select Managerid,Count(employeeid) as'No of Employee',
avg(salary) 'avg salary',
max(salary) 'maximum salary'
from tblEmployeeInfo
group by Managerid
order by 2 desc,1 
--order by [no of employee] desc,managerid 


--return the name of each department and the maximum salary in the department
select  depid,max(Salary) as 'Maximum Salary',
sum(salary) as 'Total Salary '
from tblEmployeeInfo 
group by depid

Join
select employeeid,tblemployeeinfo.name,tblemployeeinfo.depid,tbldepartment.name 
from tblEmployeeInfo join tblDepartment
on tblEmployeeInfo.depid=tblDepartment.depid

select employeeid,e.name,e.depid,d.name 
from tblEmployeeInfo e , tblDepartment d
where e.depid=d.depid

?--Display the Name of Department with Total No of Employees in each department
select  d.depid,d.name,count(employeeid) 'NoOfEmployee',
max(e.Salary) as 'Maximum Salary' ,sum(e.salary) 
from tblEmployeeInfo e join tblDepartment d
on d.Depid=e.Depid
group by d.depid,d.name


--No of male and female in dept 2
select Gender,Depid ,count(Gender) 'count of employees'
from tblEmployeeInfo
where Depid=1
group by Gender,Depid

select Gender, count(Gender),Depid from tblEmployeeInfo
 group by Gender,Depid
 --
 --Invalid to use aggregate functions in where clause
 select * from tblEmployeeInfo
 where Salary<Max(salary)

 select salary from tblEmployeeInfo
   having Salary<Max(salary)
 

 ----Having
/*SELECT column1, function_name(column2)
FROM table_name
WHERE condition
GROUP BY column1, column2
HAVING condition
ORDER BY column1, column2;*/

--display the manger who has more than =2 employees

select Managerid,COUNT(employeeid) from tblEmployeeInfo
group by Managerid
having COUNT(employeeid)>=2

--display the department id,min salary who has minimum salary >=30000

--display the department id,min salary   // select did,min(salary) group by did having min(salary)>=30000
--minimum salary >=30000  //  min(salary)>=30000
select  Depid,MIN(salary) as 'Min salary' from tblEmployeeInfo
--where salary>20000
group by Depid
having min(salary)>=20000
order by [Min salary] Desc

--Write a query to find the no of people in the same dept

select depid,count(salary) 'Total no of People'
from tblEmployeeInfo
group by depid

--Is an expression that evaluates to TRUE, FALSE, or UNKNOWN. 
--Predicates are used in the search condition of WHERE clauses and
--HAVING clauses, the join conditions of FROM clauses,
--and other constructs where a Boolean value is required.


--Joins

--Inner join ,display the all the attributes from employeeinfo and dept
/*SELECT columns
FROM table1 
INNER JOIN table2
ON table1.column = table2.column;*/
select * from tblEmployeeInfo
select * from tblDepartment

insert into tblDepartment values(6,'Research')

--Join without any condition....That gives a cartesian product
--Result will be Total columns and Multiply rows of both tables
--Older sql uses , instead of join keyword
select * from tblDepartment

--Cross join
select *
from
tblEmployeeInfo 
cross join
tblDepartment 

select * from 
tblEmployeeInfo 
join tblDepartment 
on tblEmployeeInfo.Depid=tblDepartment.Depid

select e.Name [Employee Name],d.name [Department Name] 
from tblEmployeeInfo e
inner join tblDepartment d
on e.Depid=d.Depid 

/*SELECT columns
FROM table1
LEFT [OUTER] JOIN table2
ON table1.column = table2.column;
*/
insert into tblEmployeeInfo(employeeid,Name,location,Salary,Hiredate,Managerid) 
values(1014,'Divya','Goa',30000,'2016-7-20',1002)

--Left Join
select tblEmployeeInfo.Name,tblEmployeeInfo.location,d.name,tblEmployeeInfo.Depid from 
tblEmployeeInfo 
left join tblDepartment d
on tblEmployeeInfo.Depid=d.Depid


--Right Join

select e.Name,e.location,d.name,d.Depid from 
tblEmployeeInfo e
Right outer join tblDepartment d
on e.Depid=d.Depid

--Full join
select e.Name,e.location,d.name,d.Depid from 
tblEmployeeInfo e
full outer join tblDepartment d
on e.Depid=d.Depid

--self join
--display only the employees name and who have a manager name for each employee

select * from tblEmployeeInfo

select e.Name as 'Employee Name',e.employeeid,m.Name as 'Manager Name',m.managerid
from tblEmployeeInfo e
join tblEmployeeInfo m
on e.managerid=m.employeeid

--Display all employees and their Mananger Name whether he has a manager or not
select e.Name as 'Employee Name',e.employeeid,m.Name as 'Manager Name',m.employeeid
from tblEmployeeInfo e
left join tblEmployeeInfo m
on e.managerid=m.employeeid

select e.Name as 'Employee Name',e.employeeid ,e.managerid
from tblEmployeeInfo e




--Display the department information with no of employees in each department order by no of employees
--display the name of employee who dont have manager
--display the  manger name , no of employees whose manager name is not null and having more than 2 employee
select Mgr.Name 'Manager',COUNT(emp.name)
from  tblEmployeeInfo emp
inner join tblEmployeeInfo mgr
on emp.managerid=mgr.employeeid
where mgr.name is not null
group by emp.managerid,mgr.Name
having COUNT(emp.Name)>2

select * from tblemployeeinfo where managerid is null



