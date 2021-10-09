--======STORED PROCEDURES FOR ALL TABLES=======
USE libreria_esau;
GO

-- =============================================
-- VIEW SHOW_ERRORS
-- Description: It shows the errors when executing transactions
-- Usage: SELECT * FROM SHOW_ERRORS
-- =============================================
CREATE OR ALTER VIEW SHOW_ERRORS
AS 
SELECT SUSER_SNAME() suser_name,
   ERROR_NUMBER() error_number,
   ERROR_STATE() error_state,
   ERROR_SEVERITY() error_severity,
   ERROR_LINE() error_line,
   ERROR_PROCEDURE() error_procedure,
   ERROR_MESSAGE() error_message,
   GETDATE() date;


GO


--======STORED PROCEDURES FOR CLIENTS TABLE=======

-- =============================================
-- Procedure spInsertClient
-- Description: Insert a new client
-- Usage: EXEC spInsertClient 'Roberto','3418787461','Guanatos' ;
-- =============================================
CREATE OR ALTER PROCEDURE spInsertClient(
	@name varchar(50),
	@phone varchar(13),
	@address varchar(200)
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO [dbo].[client] VALUES(@name,@phone,@address);
			COMMIT;
	END TRY
	BEGIN CATCH
		ROLLBACK;
		PRINT 'rollback insert was triggered'
		SELECT * FROM SHOW_ERRORS;
	END CATCH
END


GO

-- =============================================
-- Procedure spSelectAllClients
-- Description: Select all clients
-- Usage: SELECT * FROM spSelectAllClients;
-- =============================================
CREATE OR ALTER PROCEDURE spSelectAllClients
AS
BEGIN
	SELECT ID_CLIENT,NAME,PHONE,ADDRESS FROM client;
END


GO

-- =============================================
-- Procedure spUpdateClientById
-- Description: Update a client by id
-- Usage: EXEC spUpdateClientById @id_client = 5, @name='Fernando modificado', @phone='3211233366', @address='Yucatan';
-- =============================================
CREATE OR ALTER PROCEDURE spUpdateClientById(
	@id_client INT,
	@name VARCHAR(50),
	@phone VARCHAR(13),
	@address VARCHAR(200)
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE client SET NAME=@name, PHONE=@phone, ADDRESS=@address WHERE ID_CLIENT=@id_client;
			COMMIT;
	END TRY
	BEGIN CATCH
		ROLLBACK;
		PRINT 'rollback update was triggered'
		SELECT * FROM SHOW_ERRORS;
	END CATCH
END


GO

-- =============================================
-- Procedure spDeleteClientById
-- Description: Delete a client by id
-- Usage: EXEC spDeleteClientById @id_client = 32;
-- =============================================
CREATE OR ALTER PROCEDURE spDeleteClientById(
	@id_client INT
)
AS 
BEGIN 
	BEGIN TRY
		BEGIN TRANSACTION
			DELETE FROM client WHERE ID_CLIENT=@id_client;
			COMMIT;
	END TRY
	BEGIN CATCH
		ROLLBACK;
		PRINT 'rollback delete was triggered'
		SELECT * FROM SHOW_ERRORS;
	END CATCH
END


GO


--======STORED PROCEDURES FOR EMPLOYEES TABLE=======

-- =============================================
-- Procedure spInsertEmployee
-- Description: Insert a new employee
-- Usage: EXEC spInsertEmployee 'Ignacio','3418787460','Guanatos',5000.00 ;
-- =============================================
CREATE OR ALTER PROCEDURE spInsertEmployee(
	@name varchar(50),
	@phone varchar(13),
	@address varchar(200),
	@salary float
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO [dbo].[employee] VALUES(@name,@phone,@address,@salary);
			COMMIT;
	END TRY
	BEGIN CATCH
		ROLLBACK;
		PRINT 'rollback insert was triggered'
		SELECT * FROM SHOW_ERRORS;
	END CATCH
END


GO

-- =============================================
-- Procedure spSelectAllEmployees
-- Description: Select all employees
-- Usage: SELECT * FROM spSelectAllEmployees;
-- =============================================
CREATE OR ALTER PROCEDURE spSelectAllEmployees
AS
BEGIN
	SELECT ID_EMPLOYEE,NAME,PHONE,ADDRESS,SALARY FROM employee;
END


GO

-- =============================================
-- Procedure spUpdateEmployeeById
-- Description: Update an employee by id
-- Usage: EXEC spUpdateEmployeeById @id_employee = 3, @name='LUIS MODIFICADO', @phone='3331239988', @address='Guanatos', @salary=6000.00;
-- =============================================
CREATE OR ALTER PROCEDURE spUpdateEmployeeById(
	@id_employee INT,
	@name VARCHAR(50),
	@phone VARCHAR(13),
	@address VARCHAR(200),
	@salary FLOAT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE employee SET NAME=@name, PHONE=@phone, ADDRESS=@address, SALARY=@salary WHERE ID_EMPLOYEE=@id_employee;
			COMMIT;
	END TRY
	BEGIN CATCH
		ROLLBACK;
		PRINT 'rollback update was triggered'
		SELECT * FROM SHOW_ERRORS;
	END CATCH
END


GO

-- =============================================
-- Procedure spDeleteEmployeeById
-- Description: Delete an enployee by id
-- Usage: EXEC spDeleteEmployeeById @id_employee = 23;
-- =============================================
CREATE OR ALTER PROCEDURE spDeleteEmployeeById(
	@id_employee INT
)
AS 
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			DELETE FROM employee WHERE ID_EMPLOYEE=@id_employee;
			COMMIT;
	END TRY
	BEGIN CATCH
		ROLLBACK;
		PRINT 'rollback delete was triggered'
		SELECT * FROM SHOW_ERRORS;
	END CATCH
END


GO


--======STORED PROCEDURES FOR AUTHORS TABLE=======

-- =============================================
-- Procedure spInsertAuthor
-- Description: Insert a new author
-- Usage: XEC spInsertAuthor 'Jorge Luis Borjes','Argentine';
-- =============================================
CREATE OR ALTER PROCEDURE spInsertAuthor(
	@name varchar(50),
	@nationality varchar(50)
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO [dbo].[authors] VALUES(@name,@nationality);
			COMMIT;
	END TRY
	BEGIN CATCH
		ROLLBACK;
		PRINT 'rollback insert was triggered'
		SELECT * FROM SHOW_ERRORS;
	END CATCH
END


GO

-- =============================================
-- Procedure spSelectAllAuthors
-- Description: Select all authors
-- Usage: SELECT * FROM spSelectAllAuthors;
-- =============================================
CREATE OR ALTER PROCEDURE spSelectAllAuthors
AS
BEGIN
	SELECT ID_AUTHOR,NAME,NATIONALITY FROM authors;
END


GO
-- =============================================
-- Procedure spUpdateAuthorById
-- Description: Update an author by id
-- Usage: EXEC spUpdateAuthorById @id_author = 3, @name='Stephen King modificado', @nationality='MEXICAN';
-- =============================================

CREATE OR ALTER PROCEDURE spUpdateAuthorById(
	@id_author INT,
	@name VARCHAR(50),
	@nationality VARCHAR(50)
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE authors SET NAME=@name, NATIONALITY=@nationality WHERE ID_AUTHOR=@id_author;
			COMMIT;
	END TRY
	BEGIN CATCH
		ROLLBACK;
		PRINT 'rollback update was triggered'
		SELECT * FROM SHOW_ERRORS;
	END CATCH
END


GO

-- =============================================
-- Procedure spDeleteAuthorById
-- Description: Delete an author by id
-- Usage: EXEC spDeleteAuthorById @id_author = 16;
-- =============================================
CREATE OR ALTER PROCEDURE spDeleteAuthorById(
	@id_author INT
)
AS 
BEGIN 
	BEGIN TRY
		BEGIN TRANSACTION
			DELETE FROM authors WHERE ID_AUTHOR=@id_author;
			COMMIT;
	END TRY
	BEGIN CATCH
		ROLLBACK;
		PRINT 'rollback delete was triggered'
		SELECT * FROM SHOW_ERRORS;
	END CATCH
END


GO

--======STORED PROCEDURES FOR BOOKS TABLE=======

-- =============================================
-- Procedure spInsertBook
-- Description: Insert a new book
-- Usage: EXEC spInsertBook 'The lord of the flies','The book focuses on a group of British boys stranded on an uninhabited island and their disastrous attempt to govern themselves',200.00, 5, 2;
-- =============================================
CREATE OR ALTER PROCEDURE spInsertBook(
	@name varchar(50),
	@description varchar(500),
	@price float,
	@stock int,
	@id_author int
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO [dbo].[books] VALUES(@name,@description,@price,@stock,@id_author);
			COMMIT;
	END TRY
	BEGIN CATCH
		PRINT 'rollback insert was triggered'
		ROLLBACK;
	END CATCH
END


GO

-- =============================================
-- Procedure spSelectAllBooks
-- Description: Select all books
-- Usage: SELECT * FROM spSelectAllBooks;
-- =============================================
CREATE OR ALTER PROCEDURE spSelectAllBooks
AS
BEGIN
	SELECT ID_BOOK,NAME,DESCRIPTION,PRICE,STOCK,ID_AUTHOR FROM books;
END


GO

-- =============================================
-- Procedure spUpdateBookById
-- Description: Update a book by id
-- Usage: EXEC spUpdateBookById @id_book = 4, @name='Mr. Mercedes modificado', @description='Description modified', @price=800.00, @stock=1, @id_author=NULL;
-- =============================================
CREATE OR ALTER PROCEDURE spUpdateBookById(
	@id_book INT,
	@name VARCHAR(50),
	@description VARCHAR(500),
	@price float,
	@stock int,
	@id_author int
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE books SET NAME=@name, DESCRIPTION=@description, PRICE=@price, STOCK=@stock, ID_AUTHOR=@id_author WHERE ID_BOOK=@id_book;
			COMMIT;	
	END TRY
	BEGIN CATCH
		ROLLBACK;
	END CATCH
END


GO

-- =============================================
-- Procedure spDeleteBookById
-- Description: Delete a book by id
-- Usage: EXEC spDeleteBookById @id_book = 16;
-- =============================================
CREATE OR ALTER PROCEDURE spDeleteBookById(
	@id_book INT
)
AS 
BEGIN 
	BEGIN TRY
		BEGIN TRANSACTION
			DELETE FROM books WHERE ID_BOOK=@id_book;
			COMMIT;
	END TRY
	BEGIN CATCH
		ROLLBACK;
	END CATCH
END


GO


--======STORED PROCEDURES FOR LOANS TABLE=======

-- =============================================
-- Procedure spInsertLoan
-- Description: Insert a new loan
-- Usage: EXEC spInsertLoan 2, 1, 2, '2021-10-07';
-- =============================================
CREATE OR ALTER PROCEDURE spInsertLoan(
	@id_book INT,
	@id_employee INT,
	@id_client INT,
	@date DATE
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO [dbo].[loans] VALUES(@id_book,@id_employee,@id_client,@date);
			COMMIT;
	END TRY
	BEGIN CATCH
		ROLLBACK;
		PRINT 'rollback insert was triggered'
		SELECT * FROM SHOW_ERRORS;
	END CATCH
END


GO

-- =============================================
-- Procedure spSelectAllLoans
-- Description: Select all loans
-- Usage: SELECT * FROM spSelectAllLoans;
-- =============================================
CREATE OR ALTER PROCEDURE spSelectAllLoans
AS
BEGIN
	SELECT ID_LOAN,ID_BOOK,ID_EMPLOYEE, ID_CLIENT, DATE FROM loans;
END


GO

-- =============================================
-- Procedure spUpdateLoanById
-- Description: Update a loan by id
-- Usage: EXEC spUpdateLoanById @id_loan=15, @id_book = 4, @id_employee = 2, @id_client=3, @date = '2000-10-07';
-- =============================================
CREATE OR ALTER PROCEDURE spUpdateLoanById(
	@id_loan INT,
	@id_book INT,
	@id_employee INT,
	@id_client INT,
	@date DATE
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE loans SET ID_BOOK=@id_book, ID_EMPLOYEE=@id_employee, ID_CLIENT=@id_client, DATE=@date  WHERE ID_LOAN=@id_loan;
			COMMIT;	
	END TRY
	BEGIN CATCH
		ROLLBACK;
		PRINT 'rollback update was triggered'
		SELECT * FROM SHOW_ERRORS;
	END CATCH
END


GO

-- =============================================
-- Procedure spDeleteLoanById
-- Description: Delete a loan by id
-- Usage: EXEC spDeleteLoanById @id_loan = 16;
-- =============================================
CREATE OR ALTER PROCEDURE spDeleteLoanById(
	@id_loan INT
)
AS 
BEGIN 
	BEGIN TRY
		BEGIN TRANSACTION
			DELETE FROM loans WHERE ID_LOAN=@id_loan;
			COMMIT;
	END TRY
	BEGIN CATCH
		ROLLBACK;
		PRINT 'rollback delete was triggered'
		SELECT * FROM SHOW_ERRORS;
	END CATCH
END


GO


--======STORED PROCEDURES FOR RETURNSS TABLE=======
-- =============================================
-- Procedure spInsertReturn
-- Description: Insert a new return
-- Usage: EXEC spInsertReturn 10,'2021-10-07';
-- =============================================
CREATE OR ALTER PROCEDURE spInsertReturn(
	@id_loan INT,
	@date DATE
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO [dbo].[returnss] VALUES(@id_loan,@date);
			COMMIT;
	END TRY
	BEGIN CATCH
		ROLLBACK;
		PRINT 'rollback insert was triggered'
		SELECT * FROM SHOW_ERRORS;
	END CATCH
END


GO

-- =============================================
-- Procedure sspSelectAllReturns
-- Description: Select all returns
-- Usage: SELECT * FROM spSelectAllReturns;
-- =============================================
CREATE OR ALTER PROCEDURE spSelectAllReturns
AS
BEGIN
	SELECT ID_RETURN,DATE DATE FROM returnss;
END


GO

-- =============================================
-- Procedure spUpdateReturnById
-- Description: Update a return by id
-- Usage: EXEC spUpdateReturnById @id_return=15, @date = '2000-10-07';
-- =============================================
CREATE OR ALTER PROCEDURE spUpdateReturnById(
	@id_return INT,
	@date DATE
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE returnss SET DATE=@date WHERE ID_RETURN=@id_return;
			COMMIT;	
	END TRY
	BEGIN CATCH
		ROLLBACK;
		PRINT 'rollback update was triggered'
		SELECT * FROM SHOW_ERRORS;
	END CATCH
END


GO

-- =============================================
-- Procedure spDeleteReturnById
-- Description: Delete a return by id
-- Usage: EXEC spDeleteReturnById @id_return = 16;
-- =============================================
CREATE OR ALTER PROCEDURE spDeleteReturnById(
	@id_return INT
)
AS 
BEGIN 
	BEGIN TRY
		BEGIN TRANSACTION
			DELETE FROM returnss WHERE ID_RETURN=@id_return;
			COMMIT;
	END TRY
	BEGIN CATCH
		ROLLBACK;
		PRINT 'rollback delete was triggered'
		SELECT * FROM SHOW_ERRORS;
	END CATCH
END


GO


--======STORED PROCEDURES FOR SALES TABLE=======

-- =============================================
-- Procedure spInsertSale
-- Description: Insert a new sale
-- Usage: EXEC spInsertSale 2, 1, 2, '2021-10-07';
-- =============================================
CREATE OR ALTER PROCEDURE spInsertSale(
	@id_book INT,
	@id_employee INT,
	@id_client INT,
	@date DATE
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO [dbo].[sales] VALUES(@id_book,@id_employee,@id_client,@date);
			COMMIT;
	END TRY
	BEGIN CATCH
		ROLLBACK;
		PRINT 'rollback insert was triggered'
		SELECT * FROM SHOW_ERRORS;
	END CATCH
END


GO

-- =============================================
-- Procedure pSelectAllSales
-- Description: Select all sales
-- Usage: SELECT * FROM pSelectAllSales;
-- =============================================
CREATE OR ALTER PROCEDURE spSelectAllSales
AS
BEGIN
	SELECT ID_SALE,ID_BOOK,ID_EMPLOYEE, ID_CLIENT, DATE FROM sales;
END


GO

-- =============================================
-- Procedure spUpdateSaleById
-- Description: Update a sale by id
-- Usage: EXEC spUpdateSaleById @id_sale=15, @id_book = 4, @id_employee = 2, @id_client=3, @date = '2000-10-07';
-- =============================================
CREATE OR ALTER PROCEDURE spUpdateSaleById(
	@id_sale INT,
	@id_book INT,
	@id_employee INT,
	@id_client INT,
	@date DATE
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE sales SET ID_BOOK=@id_book, ID_EMPLOYEE=@id_employee, ID_CLIENT=@id_client, DATE=@date  WHERE ID_SALE=@id_sale;
			COMMIT;	
	END TRY
	BEGIN CATCH
		ROLLBACK;
		PRINT 'rollback update was triggered'
		SELECT * FROM SHOW_ERRORS;
	END CATCH
END


GO

-- =============================================
-- Procedure spDeleteSaleById
-- Description: Delete a sale by id
-- Usage: EXEC spDeleteSaleById @id_sale = 16;
-- =============================================
CREATE OR ALTER PROCEDURE spDeleteSaleById(
	@id_sale INT
)
AS 
BEGIN 
	BEGIN TRY
		BEGIN TRANSACTION
			DELETE FROM sales WHERE ID_SALE=@id_sale;
			COMMIT;
	END TRY
	BEGIN CATCH
		ROLLBACK;
		PRINT 'rollback delete was triggered'
		SELECT * FROM SHOW_ERRORS;
	END CATCH
END




