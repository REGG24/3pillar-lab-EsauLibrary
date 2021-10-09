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
