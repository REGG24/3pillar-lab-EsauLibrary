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