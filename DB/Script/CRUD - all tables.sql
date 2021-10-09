USE libreria_esau;
GO


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


-------------------------------------------------------client procedures
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


CREATE OR ALTER PROCEDURE spSelectAllClients
AS
BEGIN
	SELECT ID_CLIENT,NAME,PHONE,ADDRESS FROM client;
END


GO


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


--------------------------------------------------employee procedures
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


CREATE OR ALTER PROCEDURE spSelectAllEmployees
AS
BEGIN
	SELECT ID_EMPLOYEE,NAME,PHONE,ADDRESS,SALARY FROM employee;
END


GO


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


-----------------------------------------------authors procedures
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


CREATE OR ALTER PROCEDURE spSelectAllAuthors
AS
BEGIN
	SELECT ID_AUTHOR,NAME,NATIONALITY FROM authors;
END


GO


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

-----------------------------------------------books procedures
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


CREATE OR ALTER PROCEDURE spSelectAllBooks
AS
BEGIN
	SELECT ID_BOOK,NAME,DESCRIPTION,PRICE,STOCK,ID_AUTHOR FROM books;
END


GO


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


-----------------------------------------------loans procedures
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


CREATE OR ALTER PROCEDURE spSelectAllLoans
AS
BEGIN
	SELECT ID_LOAN,ID_BOOK,ID_EMPLOYEE, ID_CLIENT, DATE FROM loans;
END


GO


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


-----------------------------------------------returnss procedures
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


CREATE OR ALTER PROCEDURE spSelectAllReturns
AS
BEGIN
	SELECT ID_RETURN,DATE DATE FROM returnss;
END


GO


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


-----------------------------------------------sales procedures
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


CREATE OR ALTER PROCEDURE spSelectAllSales
AS
BEGIN
	SELECT ID_SALE,ID_BOOK,ID_EMPLOYEE, ID_CLIENT, DATE FROM sales;
END


GO


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




