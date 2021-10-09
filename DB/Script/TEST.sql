USE libreria_esau;
GO

--TEST CLIENT CRUD
EXEC spInsertClient 'Roberto','3418787461','Guanatos' ;
EXEC spUpdateClientById @id_client = 5, @name='Fernando modificado', @phone='3211233366', @address='Yucatan';
EXEC spDeleteClientById @id_client = 32;
EXEC spSelectAllClients;

--TEST EMPLOYEE CRUD
EXEC spInsertEmployee 'Ignacio','3418787460','Guanatos',5000.00 ;
EXEC spUpdateEmployeeById @id_employee = 3, @name='LUIS MODIFICADO', @phone='3331239988', @address='Guanatos', @salary=6000.00;
EXEC spDeleteEmployeeById @id_employee = 23;
EXEC spSelectAllEmployees;

--TEST AUTHORS CRUD
EXEC spInsertAuthor 'Jorge Luis Borjes','Argentine';
EXEC spUpdateAuthorById @id_author = 3, @name='Stephen King modificado', @nationality='MEXICAN';
EXEC spDeleteAuthorById @id_author = 16;
EXEC spSelectAllAuthors;

--TEST BOOKS CRUD
EXEC spInsertBook 'The lord of the flies',
'The book focuses on a group of British boys stranded on an uninhabited island and their disastrous attempt to govern themselves',
200.00, 5, 2;
EXEC spUpdateBookById @id_book = 4, @name='Mr. Mercedes modificado', @description='Description modified', @price=800.00, @stock=1, @id_author=NULL;
EXEC spDeleteBookById @id_book = 16;
EXEC spSelectAllBooks;

--TEST LOANS CRUD
EXEC spInsertLoan 2, 1, 2, '2021-10-07';
EXEC spUpdateLoanById @id_loan=15, @id_book = 4, @id_employee = 2, @id_client=3, @date = '2000-10-07';
EXEC spDeleteLoanById @id_loan = 16;
EXEC spSelectAllLoans;

--TEST RETURNS CRUD
EXEC spInsertReturn 10,'2021-10-07';
EXEC spUpdateReturnById @id_return=15, @date = '2000-10-07';
EXEC spDeleteReturnById @id_return = 16;
EXEC spSelectAllReturns;

--TEST SALES CRUD
EXEC spInsertSale 2, 1, 2, '2021-10-07';
EXEC spUpdateSaleById @id_sale=15, @id_book = 4, @id_employee = 2, @id_client=3, @date = '2000-10-07';
EXEC spDeleteSaleById @id_sale = 16;
EXEC spSelectAllSales;




