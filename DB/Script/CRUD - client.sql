--======STORED PROCEDURES FOR EMPLOYEES TABLE=======
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