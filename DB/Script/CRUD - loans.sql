--======STORED PROCEDURES FOR LOANS TABLE=======
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