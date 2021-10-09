--======STORED PROCEDURES FOR RETURNSS TABLE=======
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
