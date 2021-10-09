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

