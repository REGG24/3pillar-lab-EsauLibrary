--======STORED PROCEDURES FOR SALES TABLE=======
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