--======REPORTING USING CREATE SELECT/VIEWS STATEMENTS WITH JOIN, AGGREGATES, ETC=======
USE libreria_esau;
GO

-- =============================================
-- VIEW AVG_EMPLOYEE_SALARY_PER_ADDRESS
-- Description: It shows the average salary of employees per address
-- Usage: SELECT * FROM AVG_EMPLOYEE_SALARY_PER_ADDRESS
-- =============================================
CREATE OR ALTER VIEW AVG_EMPLOYEE_SALARY_PER_ADDRESS
AS
SELECT ADDRESS,AVG(SALARY) AS 'Average Salary' FROM employee GROUP BY ADDRESS;

GO

-- =============================================
-- VIEW AVG_BOOKS_PRICE
-- Description: It shows the average price of books
-- Usage: SELECT * FROM AVG_BOOKS_PRICE;
-- =============================================
CREATE OR ALTER VIEW AVG_BOOKS_PRICE
AS
SELECT AVG(PRICE) AVG_PRICE FROM books;

GO

-- =============================================
-- VIEW AVG_BOOKS_PRICE_PER_DATESALE
-- Description: It shows the average price of books
-- Usage: SELECT * FROM AVG_BOOKS_PRICE_PER_DATESALE;
-- =============================================
CREATE OR ALTER VIEW AVG_BOOKS_PRICE_PER_DATESALE
AS
SELECT DATE,AVG(PRICE) AS 'Average total' FROM sales S JOIN books B ON S.ID_BOOK=B.ID_BOOK GROUP BY DATE;

GO

-- =============================================
-- VIEW EMPLOYEES_PER_ADDRESS
-- Description: It shows the number of employees per address
-- Usage: SELECT * FROM EMPLOYEES_PER_ADDRESS;
-- =============================================
CREATE OR ALTER VIEW EMPLOYEES_PER_ADDRESS
AS
SELECT ADDRESS,COUNT(ADDRESS) AS 'INCIDENTS' FROM employee GROUP BY ADDRESS;

GO

-- =============================================
-- VIEW BOOKS_PER_PRICE
-- Description: It shows the number of books that cost an specific price
-- Usage: SELECT * FROM BOOKS_PER_PRICE;
-- =============================================
CREATE OR ALTER VIEW BOOKS_PER_PRICE
AS
SELECT PRICE,COUNT(PRICE) AS 'INCIDENTS' FROM books GROUP BY PRICE;

GO

-- =============================================
-- VIEW CLIENTS_PER_ADDRESS
-- Description: It shows the number of clients per address
-- Usage: SELECT * FROM CLIENTS_PER_ADDRESS;
-- =============================================
CREATE OR ALTER VIEW CLIENTS_PER_ADDRESS
AS
SELECT ADDRESS,COUNT(ADDRESS) AS 'INCIDENTS' FROM client GROUP BY ADDRESS;

GO

-- =============================================
-- VIEW TOTALPRICE_PER_BOOK
-- Description: It shows the total price for all the same books
-- Usage: SELECT * FROM TOTALPRICE_PER_BOOK;
-- =============================================
CREATE OR ALTER VIEW TOTALPRICE_PER_BOOK
AS
SELECT NAME,SUM(PRICE) AS 'TOTAL' FROM books GROUP BY NAME;

GO


-- =============================================
-- VIEW TOTALSALARY_PER_ADDRESS
-- Description: It shows the total sum of salary per address
-- Usage: SELECT * FROM TOTALSALARY_PER_ADDRESS;
-- =============================================
CREATE OR ALTER VIEW TOTALSALARY_PER_ADDRESS
AS
SELECT ADDRESS,SUM(SALARY) AS 'TOTAL' FROM EMPLOYEE GROUP BY ADDRESS;

GO

-- =============================================
-- VIEW MAXSALARY_PER_ADDRESS
-- Description: It shows the maximum salary per address
-- Usage: SELECT * FROM MAXSALARY_PER_ADDRESS;
-- =============================================
CREATE OR ALTER VIEW MAXSALARY_PER_ADDRESS
AS
SELECT ADDRESS,MAX(SALARY) AS 'MAX SALARY' FROM EMPLOYEE GROUP BY ADDRESS;

GO

-- =============================================
-- VIEW MAXSALE_PER_DATE
-- Description: It shows the maximum price of sale per date
-- Usage: SELECT * FROM MAXSALE_PER_DATE;
-- =============================================
CREATE OR ALTER VIEW MAXSALE_PER_DATE
AS
SELECT DATE, MAX(PRICE) AS 'MAX SALE TOTAL' FROM sales S JOIN books B ON S.ID_BOOK=B.ID_BOOK GROUP BY DATE;

GO

-- =============================================
-- VIEW MAXSALARY_OF_EMPLOYEES
-- Description: It shows the maximum salary of the employees
-- Usage: SELECT * FROM MAXSALARY_OF_EMPLOYEES;
-- =============================================
CREATE OR ALTER VIEW MAXSALARY_OF_EMPLOYEES
AS
SELECT MAX(SALARY) AS 'MAX SALARY' FROM employee;

GO

-- =============================================
-- VIEW MINSALARY_PER_ADDRESS
-- Description: It shows the minimum salary of employees per address
-- Usage: SELECT * FROM MINSALARY_PER_ADDRESS;
-- =============================================
CREATE OR ALTER VIEW MINSALARY_PER_ADDRESS
AS
SELECT ADDRESS,MIN(SALARY) AS 'MIN SALARY' FROM EMPLOYEE GROUP BY ADDRESS;

GO


-- =============================================
-- VIEW LOWER_PRICE_BOOKS
-- Description: It shows the minimum price of the books
-- Usage: SELECT * FROM LOWER_PRICE_BOOKS;
-- =============================================
CREATE OR ALTER VIEW LOWER_PRICE_BOOKS
AS
SELECT MIN(PRICE) AS  'MIN PRICE' FROM BOOKS;

GO

-- =============================================
-- VIEW MINSALES_PER_DATE
-- Description: It shows the minimum price of sales per date
-- Usage: SELECT * FROM MINSALES_PER_DATES;
-- =============================================
CREATE OR ALTER VIEW MINSALES_PER_DATE
AS
SELECT DATE, MIN(PRICE) AS 'MIN SALE TOTAL' FROM sales S JOIN books B ON S.ID_BOOK=B.ID_BOOK GROUP BY DATE;

GO


-- =============================================
-- VIEW MINSALARY_OF_EMPLOYEES
-- Description: It shows the minimum salary of the employees
-- Usage: SELECT * FROM MINSALARY_OF_EMPLOYEES;
-- =============================================
CREATE OR ALTER VIEW MINSALARY_OF_EMPLOYEES
AS
SELECT MIN(SALARY) AS 'MIN SALARY' FROM employee;

GO

-- =============================================
-- VIEW SALES_PER_EMPLOYEE
-- Description: It shows the number of sales that every employee has done
-- Usage: SELECT * FROM SALES_PER_EMPLOYEE;
-- =============================================
CREATE OR ALTER VIEW SALES_PER_EMPLOYEE
AS
SELECT 
NAME AS EmployeeName,COUNT(ID_SALE) AS NumberOfSales FROM 
employee E JOIN SALES S ON  E.ID_EMPLOYEE = S.ID_EMPLOYEE GROUP BY NAME;

GO

-- =============================================
-- VIEW LOANS_PER_EMPLOYEE
-- Description: It shows the number of loans that every employee has done
-- Usage: SELECT * FROM LOANS_PER_EMPLOYEE;
-- =============================================
CREATE OR ALTER VIEW LOANS_PER_EMPLOYEE
AS
SELECT 
NAME AS EmployeeName,COUNT(ID_LOAN) AS NumberOfLoans FROM 
employee E JOIN LOANS L ON E.ID_EMPLOYEE = L.ID_EMPLOYEE GROUP BY NAME;

GO

-- =============================================
-- VIEW ACTIVE_LOANS
-- Description: It shows the data of the clients that have received a loan and the name of the book registered so far
-- Usage: SELECT * FROM ACTIVE_LOANS;
-- =============================================
CREATE OR ALTER VIEW ACTIVE_LOANS
AS
SELECT 
C.NAME AS ClientName,C.PHONE,C.ADDRESS,B.NAME AS BookName FROM 
client C JOIN loans L ON C.ID_CLIENT = L.ID_CLIENT JOIN books B ON L.ID_BOOK = B.ID_AUTHOR;

GO

-- =============================================
-- VIEW RETURNS_PER_CLIENT
-- Description: It shows the number of returns that every client has done
-- Usage: SELECT * FROM RETURNS_PER_CLIENT;
-- =============================================
CREATE OR ALTER VIEW RETURNS_PER_CLIENT
AS
SELECT 
C.NAME AS ClientName,COUNT(R.ID_RETURN) AS NumberOfReturns FROM 
client C LEFT JOIN loans L ON C.ID_CLIENT = L.ID_CLIENT RIGHT JOIN returnss R ON L.ID_LOAN = R.ID_LOAN GROUP BY C.NAME;

GO

SELECT * FROM AVG_EMPLOYEE_SALARY_PER_ADDRESS;
SELECT * FROM AVG_BOOKS_PRICE;
SELECT * FROM AVG_BOOKS_PRICE_PER_DATESALE;
SELECT * FROM EMPLOYEES_PER_ADDRESS;
SELECT * FROM BOOKS_PER_PRICE;
SELECT * FROM CLIENTS_PER_ADDRESS;
SELECT * FROM TOTALPRICE_PER_BOOK;
SELECT * FROM TOTALSALARY_PER_ADDRESS;
SELECT * FROM MAXSALARY_PER_ADDRESS;
SELECT * FROM MAXSALE_PER_DATE;
SELECT * FROM MAXSALARY_OF_EMPLOYEES;
SELECT * FROM MINSALARY_PER_ADDRESS;
SELECT * FROM MINSALES_PER_DATE;
SELECT * FROM MINSALARY_OF_EMPLOYEES;
SELECT * FROM SALES_PER_EMPLOYEE;
SELECT * FROM LOANS_PER_EMPLOYEE;
SELECT * FROM ACTIVE_LOANS;
SELECT * FROM RETURNS_PER_CLIENT;