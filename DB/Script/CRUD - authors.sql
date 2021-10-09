--======STORED PROCEDURES FOR AUTHORS TABLE=======
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