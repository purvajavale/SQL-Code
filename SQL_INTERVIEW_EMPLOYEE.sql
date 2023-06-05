DROP DATABASE IF EXISTS Sql_invoicing;
CREATE DATABASE LearnEmployee;
SHOW DATABASES;
CREATE SCHEMA LearnEmployee;
CREATE DATABASE IF NOT EXISTS LearnEmployee;
USE LearnEmployee;
DROP TABLE LearnEmployeeDetail;

CREATE TABLE LearnEmployeeDetail (
EmployeeId TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Salary decimal(2,0) NOT NULL,
JoiningDate DATETIME NOT NULL,
Department VARCHAR(50) NOT NULL,
Gender VARCHAR(50) NOT NULL,
PRIMARY KEY (EmployeeId)
);

CREATE TABLE ProjectDetail (
ProjectId TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
EmployeeDetailId TINYINT UNSIGNED NOT NULL,
ProjectName VARCHAR(50) NOT NULL,
PRIMARY KEY (ProjectId)
);

INSERT INTO ProjectDetail
VALUES (9,6,'GL Management');
SELECT * FROM ProjectDetail;


INSERT INTO LearnEmployeeDetail
VALUES (5,'Ashish','kadian','50',current_timestamp(),'PAYROLL','Male');
SELECT * FROM LearnEmployeeDetail;
UPDATE LearnEmployeeDetail SET Gender='Male' WHERE EmployeeId = 4;

/*1. Write a query to get all employee detail from "EmployeeDetail" table*/
SELECT * FROM LearnEmployeeDetail;

/*Write a query to get only "FirstName" column from "EmployeeDetail" table*/
SELECT FirstName FROM LearnEmployeeDetail;

/*Write a query to get FirstName in upper case as "First Name"*/
SELECT UPPER(FirstName) FROM LearnEmployeeDetail;

/*Write a query to get FirstName in lower case as "First Name"*/
SELECT LOWER(FirstName) FROM LearnEmployeeDetail;

/*Write a query for combine FirstName and LastName and display it as "Name" (also
include white space between first name & last name)*/
SELECT CONCAT(FirstName,' ',LastName) AS Name FROM LearnEmployeeDetail;

/*Select employee detail whose name is "Vikas"*/
SELECT * FROM LearnEmployeeDetail WHERE FirstName = "Vikas";

/*Get all employee detail from EmployeeDetail table whose "FirstName" start with
latter 'a'*/
SELECT * FROM LearnEmployeeDetail WHERE FirstName LIKE 'A%';

/*Get all employee details from EmployeeDetail table whose "FirstName" contains 'k'*/
SELECT * FROM LearnEmployeeDetail WHERE FirstName LIKE '%k%';

/* Get all employee details from EmployeeDetail table whose "FirstName" end with 'h'*/
SELECT * FROM LearnEmployeeDetail WHERE FirstName LIKE '%h';

/*Get all employee detail from EmployeeDetail table whose "FirstName" start with
any single character between 'a-p'*/
SELECT * FROM LearnEmployeeDetail WHERE FirstName LIKE '[A-P]%';

/*Get all employee detail from EmployeeDetail table whose "FirstName" not start
with any single character between 'a-p'*/
SELECT * FROM LearnEmployeeDetail WHERE FirstName LIKE '[^A-P]%';

/*. Get all employee detail from EmployeeDetail table whose "Gender" end with 'le'
and contain 4 letters. The Underscore(_) Wildcard Character represents any single
character*/
SELECT * FROM LearnEmployeeDetail WHERE Gender LIKE '__le';

/*Get all employee detail from EmployeeDetail table whose "FirstName" start with
'A' and contain 5 letters*/
SELECT * FROM LearnEmployeeDetail WHERE FirstName LIKE 'A____';

/*. Get all employee detail from EmployeeDetail table whose "FirstName"
containing '%'. ex:-"Vik%as"*/
SELECT * FROM LearnEmployeeDetail WHERE FirstName LIKE '%[%]%';

/*Get all unique "Department" from EmployeeDetail table.*/
SELECT DISTINCT(Department) FROM LearnEmployeeDetail;

/*Get the highest "Salary" from EmployeeDetail table.*/
SELECT MAX(Salary) FROM LearnEmployeeDetail;

/*Get the lowest "Salary" from EmployeeDetail table.*/
SELECT MIN(Salary) FROM LearnEmployeeDetail;

/* Show "JoiningDate" in "dd mmm yyyy" format, ex- "15 Feb 2013"*/
SELECT DATE_FORMAT(JoiningDate,"%W %M %e %Y") AS FORMAT_DATE FROM LearnEmployeeDetail;

/*Get only Year part of "JoiningDate".*/
SELECT YEAR(JoiningDate) FROM LearnEmployeeDetail;

/*. Get only Month part of "JoiningDate".*/
SELECT MONTH(JoiningDate) FROM LearnEmployeeDetail;

/*Get system date.*/
SELECT current_date();

/*Get UTC date.*/
SELECT utc_date();

/* Get the first name, current date, joiningdate and diff between current date and
joining date in months.*/
SELECT DATEDIFF(CURRENT_DATE(), JoiningDate) AS DIFF_DATE FROM LearnEmployeeDetail;

/*Get how many employee exist in "EmployeeDetail" table.*/
SELECT COUNT(*) FROM LearnEmployeeDetail;

/*Get all employee details from EmployeeDetail table whose joining year is 2013.*/
SELECT * FROM LearnEmployeeDetail WHERE YEAR(JoiningDate) = '2023';

/*Get all employee details from EmployeeDetail table whose joining month is Jan(1)*/
SELECT * FROM LearnEmployeeDetail WHERE MONTH(JoiningDate) = '04';

/*Get all employee details from EmployeeDetail table whose joining date between
"2013-01-01" and "2013-12-01".*/
SELECT * FROM LearnEmployeeDetail WHERE JoiningDate BETWEEN '2023-04-30' AND '2023-05-30';

/* Select only one/top 1 record from "EmployeeDetail" table.*/
/*SELECT TOP 1 * FROM LearnEmployeeDetail;*/

/*Select all employee detail with First name "Vikas","Ashish", and "Nikhil"*/
SELECT * FROM LearnEmployeeDetail WHERE FirstName IN ('Vikas','Ashish', 'Nikhil');

/* Select all employee detail with First name not in "Vikas","Ashish", and "Nikhil".*/
SELECT * FROM LearnEmployeeDetail WHERE FirstName NOT IN ('Vikas','Ashish', 'Nikhil');

/*Select first name from "EmployeeDetail" table after removing white spaces from right side*/
SELECT RTRIM(FirstName) FROM LearnEmployeeDetail;

/*Select first name from "EmployeeDetail" table after removing white spaces from left side*/
SELECT LTRIM(FirstName) FROM LearnEmployeeDetail;

/*Display first name and Gender as M/F.(if male then M, if Female then F)*/
SELECT FirstName,
CASE 
	WHEN Gender = 'Male' THEN 'M'
	WHEN Gender = 'Female' THEN 'F'
END AS Gender
FROM LearnEmployeeDetail;

/*Select first name from "EmployeeDetail" table prifixed with "Hello "*/
SELECT FirstName, CONCAT('Hello ', FirstName) AS NewName FROM LearnEmployeeDetail;

/*Get employee details from "EmployeeDetail" table whose Salary greater than 600000*/
SELECT * FROM LearnEmployeeDetail WHERE Salary > 60;

/*Get employee details from "EmployeeDetail" table whose Salary less than 700000*/
SELECT * FROM LearnEmployeeDetail WHERE Salary < 70;

/*Get employee details from "EmployeeDetail" table whose Salary between 500000 than 600000*/
SELECT * FROM LearnEmployeeDetail WHERE Salary BETWEEN 50 AND 60;

/* Select second highest salary from "EmployeeDetail" table.*/
/*SELECT  * FROM LearnEmployeeDetail ORDER BY Salary DESC LIMIT n - 1, 1;  ---> n-1 --> 2-1 --> 1*/
SELECT * FROM LearnEmployeeDetail ORDER BY Salary DESC LIMIT 1, 1; 

/* Select first highest salary from "EmployeeDetail" table.*/
SELECT * FROM LearnEmployeeDetail ORDER BY Salary DESC LIMIT 0, 1; 

/* Select third highest salary from "EmployeeDetail" table.*/
SELECT * FROM LearnEmployeeDetail ORDER BY Salary DESC LIMIT 2, 1; 

/*Write the query to get the department and department wise total(sum) salary
from "EmployeeDetail" table.*/
SELECT Department, SUM(Salary) AS TotalSalary FROM LearnEmployeeDetail GROUP BY Department;

/*Write the query to get the department and department wise total(sum) salary,
display it in ascending order according to salary*/
SELECT Department, SUM(Salary) AS TotalSalary FROM LearnEmployeeDetail GROUP BY Department ORDER BY SUM(Salary) ASC;

/*Write the query to get the department and department wise total(sum) salary,
display it in descending order according to salary.*/
SELECT Department, SUM(Salary) AS TotalSalary FROM LearnEmployeeDetail GROUP BY Department ORDER BY SUM(Salary) DESC;

/*Write the query to get the department, total no. of departments, total(sum) salary
with respect to department from "EmployeeDetail" table.*/
SELECT Department, COUNT(*) AS TotalCount, SUM(Salary) AS TotalSalary FROM LearnEmployeeDetail GROUP BY Department;

/*Get department wise maximum salary from "EmployeeDetail" table order by salary ascending*/
SELECT Department, MAX(Salary) AS TotalSalary FROM LearnEmployeeDetail GROUP BY Department ORDER BY MAX(Salary) ASC;

/*Get department wise minimum salary from "EmployeeDetail" table order by salary ascending*/
SELECT Department, MIN(Salary) AS TotalSalary FROM LearnEmployeeDetail GROUP BY Department ORDER BY MIN(Salary) ASC;

/*Get department wise average salary from "EmployeeDetail" table order by salary ascending*/
SELECT Department, AVG(Salary) AS TotalSalary FROM LearnEmployeeDetail GROUP BY Department ORDER BY AVG(Salary) ASC;

/*Write down the query to fetch Project name assign to more than one Employee*/
SELECT ProjectName, COUNT(*) AS ProjectCount FROM ProjectDetail GROUP BY ProjectName HAVING COUNT(*) > 1;

/*Get employee name, project name order by firstname from "EmployeeDetail" and
"ProjectDetail" for those employee which have assigned project already -- INNER JOIN == JOIN*/
SELECT FirstName, ProjectName FROM LearnEmployeeDetail A 
JOIN ProjectDetail B 
WHERE A.EmployeeId = B.EmployeeDetailId;

/*Get employee name, project name order by firstname from "EmployeeDetail" and
"ProjectDetail" for all employee even they have not assigned project*/
SELECT FirstName, ProjectName FROM LearnEmployeeDetail A 
LEFT JOIN ProjectDetail B 
ON A.EmployeeId = B.EmployeeDetailId 
ORDER BY FirstName;

/*Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" 
for all employee if project is not assigned then display "-No Project Assigned".*/
SELECT FirstName, IFNULL(ProjectName,'No Project Assigned') FROM LearnEmployeeDetail A 
LEFT JOIN ProjectDetail B 
ON A.EmployeeId = B.EmployeeDetailId 
ORDER BY FirstName; 

/*Get all project name even they have not matching any employeeid, in left table,
order by firstname from "EmployeeDetail" and "ProjectDetail"*/
SELECT FirstName, ProjectName FROM LearnEmployeeDetail A 
RIGHT JOIN ProjectDetail B 
ON A.EmployeeId = B.EmployeeDetailId 
ORDER BY FirstName; 

/*Get complete record (employeename, project name) from both tables
([EmployeeDetail],[ProjectDetail]), if no match found in any table then show NULL.*/
SELECT FirstName, ProjectName FROM LearnEmployeeDetail A 
RIGHT JOIN ProjectDetail B 
ON A.EmployeeId = B.EmployeeDetailId 
ORDER BY FirstName; 

/*Write a query to find out the employeename who has not assigned any project,
and display "-No Project Assigned"( tables :- [EmployeeDetail],[ProjectDetail]).*/
SELECT FirstName, IFNULL(ProjectName,'No Project Assigned') FROM LearnEmployeeDetail A 
LEFT JOIN ProjectDetail B 
ON A.EmployeeId = B.EmployeeDetailId 
WHERE ProjectName IS NULL;

/*Write a query to find out the project name which is not assigned to any employee(
tables :- [EmployeeDetail],[ProjectDetail]).*/
SELECT FirstName, ProjectName FROM LearnEmployeeDetail A 
RIGHT JOIN ProjectDetail B 
ON A.EmployeeId = B.EmployeeDetailId 
WHERE FirstName IS NULL;

/*Write down the query to fetch EmployeeName & Project who has assign more
than one project.*/
SELECT EmployeeId, FirstName, ProjectName FROM LearnEmployeeDetail A 
JOIN ProjectDetail B 
ON A.EmployeeId = B.EmployeeDetailId 
WHERE EmployeeId IN (SELECT EmployeeDetailId FROM ProjectDetail 
GROUP BY EmployeeDetailID HAVING COUNT(*) >1 );

/*Write down the query to fetch ProjectName on which more than one employee
are working along with EmployeeName.*/
SELECT EmployeeId, FirstName, ProjectName FROM LearnEmployeeDetail A 
JOIN ProjectDetail B 
ON A.EmployeeId = B.EmployeeDetailId 
WHERE ProjectName IN (SELECT ProjectName FROM ProjectDetail 
GROUP BY ProjectName HAVING COUNT(1) >1 );


SELECT 15; /*15*/
SELECT A; /*Unknown column A in field list*/
SELECT $; /*Unknown column $ in field list*/
SELECT COUNT(*); /*1*/
SELECT COUNT('7'); /*1*/
SELECT 'VIKAS' + 1; /*1*/
SELECT 'VIKAS' + '1'; /*1*/
SELECT (SELECT 'VIKAS'); /*VIKAS*/
SELECT (SELECT 'VIKAS') AS NAME;  /*VIKAS*/
-- SELECT * FROM 'ProjectDetail'; SQL syntax
SELECT * FROM ProjectDetail; /*all data*/
SELECT * FROM LearnEmployeeDetail , ProjectDetail; /*Output will be cross join of both tables*/
SELECT COUNT(*) + COUNT(*); /*2*/
SELECT 'CLP' FROM ProjectDetail; /*Display "VIKAS" as many rows in Country table*/
SELECT SUM(1+2*3); /*7*/
SELECT MAX(1+2*3); /*7*/
-- SELECT MAX(1,3,4) SQL syntax
SELECT MAX('VIKAS'); /*VIKAS*/
-- Select Count(SELECT CountryID FROM Country); SQL syntax
SELECT 1 + '1'; /*2*/
SELECT '1' + 1; /*2*/
SELECT NULL + 5; /*NULL*/
SELECT NULL + '1'; /*NULL*/
SELECT 1 WHERE NULL = NULL; /*NOTHING WILL RETURN BY This (0 rows will be returned by this) because the condition is false*/
SELECT SUM(1); /*1*/
SELECT SUM('1'); /*1*/
SELECT SUM(NULL); /*NULL*/
SELECT 6/0; /*NULL*/
SELECT 0/0; /*NULL*/
SELECT 0/9; /*'0.0000'*/

CREATE TABLE TBL_1 (
ID TINYINT UNSIGNED NOT NULL
);
SELECT * FROM TBL_1;
INSERT INTO TBL_1 VALUES (1);

CREATE TABLE TBL_2 (
ID TINYINT UNSIGNED NOT NULL
);
SELECT * FROM TBL_2;
INSERT INTO TBL_2 VALUES (1);

-- All outputs to 6 records
SELECT T1.ID, T2.ID FROM TBL_1 T1 JOIN TBL_2 T2 ON T1.ID = T2.ID;
SELECT T1.ID, T2.ID FROM TBL_1 T1 LEFT JOIN TBL_2 T2 ON T1.ID = T2.ID;
SELECT T1.ID, T2.ID FROM TBL_1 T1 RIGHT JOIN TBL_2 T2 ON T1.ID = T2.ID;
SELECT T1.ID, T2.ID FROM TBL_1 T1 CROSS JOIN TBL_2 T2;

-- Anti left, right and cross join
SELECT T1.ID, T2.ID FROM TBL_1 T1 LEFT JOIN TBL_2 T2 ON T1.ID = T2.ID WHERE T2.ID IS NULL;
SELECT T1.ID, T2.ID FROM TBL_1 T1 RIGHT JOIN TBL_2 T2 ON T1.ID = T2.ID WHERE T1.ID IS NULL;
SELECT T1.ID, T2.ID FROM TBL_1 T1 CROSS JOIN TBL_2 T2;

CREATE TABLE Table_1 (
ID TINYINT UNSIGNED NOT NULL,
Name VARCHAR(50) NOT NULL
);
SELECT * FROM Table_1;
INSERT INTO Table_1 VALUES (3,'Manoj Kumar');

CREATE TABLE Table_2 (
ID TINYINT UNSIGNED NOT NULL,
Name VARCHAR(50) NOT NULL
);
SELECT * FROM Table_2;
INSERT INTO Table_2 VALUES (3,'Sandeep Kumar');

SELECT A.ID, A.Name, B.ID, B.Name 
FROM Table_1 A  
JOIN Table_2 B
ON A.ID = B.ID;

/*Suppose that you have table Employee with a column EName which contain
Records Employee name(EName) as A,B,A,A,B,D,C,M,A, Write a query which will
change/Swap the EName A to B and B to A*/
UPDATE Employee
set EName = (CASE
WHEN EName='A' THEN 'B'
WHEN EName='B' THEN 'A'
ELSE EName
END);

/*Distinct and GroupBy*/
SELECT DISTINCT(GENDER) 
FROM EMPLOYEE;
-- Output --
-- GENDER
-- female
-- male

SELECT GENDER, AGE, COUNT(GENDER) AS COUNT
FROM EMPLOYEE
GROUP BY GENDER;
-- Output --
-- GENDER   AGE   COUNT
-- female    26    4
-- male      23    7

-- Using Trim, LTRIM, RTRIM
SELECT EmployeeID, TRIM(employeeID) AS IDTRIM
FROM EmployeeErrors;
SELECT EmployeeID, RTRIM(employeeID) AS IDRTRIM
FROM EmployeeErrors;
SELECT EmployeeID, LTRIM(employeeID) AS IDLTRIM
FROM EmployeeErrors;

-- Using Replace
SELECT LastName, REPLACE(LastName, '- Fired', '') AS LastNameFixed
FROM EmployeeErrors;

-- Using Substring
SELECT Substring(err.FirstName,1,3), Substring(dem.FirstName,1,3), Substring(err.LastName,1,3), Substring(dem.LastName,1,3)
FROM EmployeeErrors err
JOIN EmployeeDemographics dem
	ON Substring(err.FirstName,1,3) = Substring(dem.FirstName,1,3)
	AND Substring(err.LastName,1,3) = Substring(dem.LastName,1,3);

-- Using UPPER and lower
SELECT firstname, LOWER(firstname)
FROM EmployeeErrors;
SELECT Firstname, UPPER(FirstName)
FROM EmployeeErrors;

-- Subquery in Select
SELECT EmployeeID, Salary, (SELECT AVG(Salary) FROM EmployeeSalary) AS AllAvgSalary
FROM EmployeeSalary;

-- Subquery in From
SELECT a.EmployeeID, AllAvgSalary
FROM 
	(SELECT EmployeeID, Salary, AVG(Salary) over () AS AllAvgSalary
	 FROM EmployeeSalary) a
ORDER BY a.EmployeeID;


-- Subquery in Where
SELECT EmployeeID, JobTitle, Salary
FROM EmployeeSalary
WHERE EmployeeID IN (
	SELECT EmployeeID 
	FROM EmployeeDemographics
	WHERE Age > 30);