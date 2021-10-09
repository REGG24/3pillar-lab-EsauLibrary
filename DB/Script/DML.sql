USE libreria_esau;
GO

INSERT INTO client (NAME,PHONE,ADDRESS) VALUES ('Esau','3418787464','Guzman');
INSERT INTO client (NAME,PHONE,ADDRESS) VALUES ('Guillermo','6662221144','Chihuahua');
INSERT INTO client (NAME,PHONE,ADDRESS) VALUES ('Marco','6662221141','Guanatos');
INSERT INTO client (NAME,PHONE,ADDRESS) VALUES ('Orlando','6662221142','Sinaloa');
INSERT INTO client (NAME,PHONE,ADDRESS) VALUES ('Fernando','6662221143','Guanatos');
INSERT INTO client (NAME,PHONE,ADDRESS) VALUES ('Norberto','6662221144','Aguascalientes');
INSERT INTO client (NAME,PHONE,ADDRESS) VALUES ('Panfilo','6662221145','Oregon');
INSERT INTO client (NAME,PHONE,ADDRESS) VALUES ('Roberto','6662221146','DF');
INSERT INTO client (NAME,PHONE,ADDRESS) VALUES ('Arturo','6662221143','Guanatos');
INSERT INTO client (NAME,PHONE,ADDRESS) VALUES ('Manuelito','6662221148','Guzman');
INSERT INTO client (NAME,PHONE,ADDRESS) VALUES ('Diego','1112223366','Tamazula');
INSERT INTO client (NAME,PHONE,ADDRESS) VALUES ('Alejandra','6662225143','Guanatos');
INSERT INTO client (NAME,PHONE,ADDRESS) VALUES ('Ruby','7662221143','Yucatan');
INSERT INTO client (NAME,PHONE,ADDRESS) VALUES ('Braulio','6662221146','Guanatos');
INSERT INTO client (NAME,PHONE,ADDRESS) VALUES ('Fatima','6962221143','Guzman');
INSERT INTO client (PHONE,ADDRESS) VALUES ('6962221196','Guzman');
INSERT INTO client (PHONE,ADDRESS) VALUES ('6962221195','Guzman');

INSERT INTO employee (NAME,PHONE,ADDRESS,SALARY) VALUES ('GODINEZ','3315289966','Guanatos',10000.00);
INSERT INTO employee (NAME,PHONE,ADDRESS,SALARY) VALUES ('DORMAMU','3315289967','Guzman',15000.00);
INSERT INTO employee (NAME,PHONE,ADDRESS,SALARY) VALUES ('LUIS','3315289968','Zapotiltic',8000.00);
INSERT INTO employee (NAME,PHONE,ADDRESS,SALARY) VALUES ('OSCAR','3315289969','Tamazula',5000.00);
INSERT INTO employee (NAME,PHONE,ADDRESS,SALARY) VALUES ('ZAYZAR','3315289960','DF',5500.00);
INSERT INTO employee (NAME,PHONE,ADDRESS,SALARY) VALUES ('VALERIA','3315289961','Guanatos',12000.00);
INSERT INTO employee (NAME,PHONE,ADDRESS,SALARY) VALUES ('MANUEL','3315289962','Yucatan',10000.00);
INSERT INTO employee (NAME,PHONE,ADDRESS,SALARY) VALUES ('HUGO','3315289963','Sinaloa',10000.00);
INSERT INTO employee (NAME,PHONE,ADDRESS,SALARY) VALUES ('ALBERT','3315289964','San gabriel',2000.00);
INSERT INTO employee (NAME,PHONE,ADDRESS,SALARY) VALUES ('PAOLA','3315289965','Orlando',100000.00);
INSERT INTO employee (NAME,PHONE,ADDRESS,SALARY) VALUES ('JESUS','4315289966','Guanatos',12000.00);
INSERT INTO employee (NAME,PHONE,ADDRESS,SALARY) VALUES ('PEDRO','5315289966','Michoacan',25000.00);
INSERT INTO employee (NAME,PHONE,ADDRESS,SALARY) VALUES ('ROBERTO','6315289966','El paso',1000.00);
INSERT INTO employee (NAME,PHONE,ADDRESS,SALARY) VALUES ('NOHELY','7315289966','Guzman',4000.00);
INSERT INTO employee (NAME,PHONE,ADDRESS,SALARY) VALUES ('ELISA','8315289966','Aguascalientes',4000.00);
INSERT INTO employee (NAME,ADDRESS,SALARY) VALUES ('ELISA 2','Aguascalientes',4000.00);
INSERT INTO employee (NAME,ADDRESS,SALARY) VALUES ('ELISA 3','Aguascalientes',4000.00);

INSERT INTO authors (NAME,NATIONALITY) VALUES('Jodi Picoult', 'U.S');
INSERT INTO authors (NAME,NATIONALITY) VALUES('Ted Dekker', 'U.S');
INSERT INTO authors (NAME,NATIONALITY) VALUES('Stephen King', 'U.S');
INSERT INTO authors (NAME,NATIONALITY) VALUES('Angela Marsons', 'MEXICAN');
INSERT INTO authors (NAME,NATIONALITY) VALUES('Danielle Steel', 'U.S');
INSERT INTO authors (NAME,NATIONALITY) VALUES('Janet Evanovich', 'U.S');
INSERT INTO authors (NAME,NATIONALITY) VALUES('Sophie Kinsella', 'U.S');
INSERT INTO authors (NAME,NATIONALITY) VALUES('E.L. James', 'U.S');
INSERT INTO authors (NAME,NATIONALITY) VALUES('Whitney Gracia Williams', 'MEXICAN');
INSERT INTO authors (NAME,NATIONALITY) VALUES('J.K. Rowling', 'BRAZILIAN');
INSERT INTO authors (NAME,NATIONALITY) VALUES('M. R. Carey', 'U.S');
INSERT INTO authors (NAME,NATIONALITY) VALUES('Neil Gaiman', 'MEXICAN');
INSERT INTO authors (NAME,NATIONALITY) VALUES('Andy Weir', 'U.S');
INSERT INTO authors (NAME,NATIONALITY) VALUES('A.G. Riddle', 'U.S');
INSERT INTO authors (NAME,NATIONALITY) VALUES('Orson Scott Card', 'BRAZILIAN');

INSERT INTO books([NAME],DESCRIPTION,PRICE,STOCK,ID_AUTHOR) VALUES('A happy world','The adventures of a rebel guy who is in a controlled world',254.25,1,1);
INSERT INTO books([NAME],DESCRIPTION,PRICE,STOCK,ID_AUTHOR) VALUES('Leaving Time','A 13-year-old girl searches for her mother, who disappeared after a terrible accident. She gets some help from a psychic and a detective. Together, they find out that sometimes asking questions gets them answers they didn’t want to know…',120.25,18,2);
INSERT INTO books([NAME],DESCRIPTION,PRICE,STOCK,ID_AUTHOR) VALUES('1st to Die','Four women join together to catch a killer who’s murdering people in terrible ways. This is the first in a series, so if you like this one, you can continue reading about this team of women.',254.25,1,3);
INSERT INTO books([NAME],DESCRIPTION,PRICE,STOCK,ID_AUTHOR) VALUES('Three','Imagine that you’re driving your car when a phone rings. The person on the line says you have three minutes to confess your sin to the world, or your car will explode. What do you do? In this book, Kevin Parson is chased by a killer for something he’s not sure he did. Follow the thrilling ride.',150.25,15,4);
INSERT INTO books([NAME],DESCRIPTION,PRICE,STOCK,ID_AUTHOR) VALUES('Mr. Mercedes','This book is the first in a trilogy, or a set of three books. In it, a retired cop tries to stop a man from killing thousands of people. Will he be able to stop the terrible event in time?',120.00,5,5);
INSERT INTO books([NAME],DESCRIPTION,PRICE,STOCK,ID_AUTHOR) VALUES('Silent Scream','Someone is killing children. Detective Kim Stone is about to find out that they’ve been killing for a much longer time than anyone realized. But will Stone be able to stop the murderer before they strike again?',100.25,9,6);
INSERT INTO books([NAME],DESCRIPTION,PRICE,STOCK,ID_AUTHOR) VALUES('Until the End of Time','Does love last forever? The couples in this story believe so. This is a story about love that even death can’t destroy.',85.50,20,7);
INSERT INTO books([NAME],DESCRIPTION,PRICE,STOCK,ID_AUTHOR) VALUES('One for the Money','Stephanie Plum needs money, and she needs it fast. So she turns to hunting down people who should be in jail, starting with a guy she has a history with.',12.25,15,8);
INSERT INTO books([NAME],DESCRIPTION,PRICE,STOCK,ID_AUTHOR) VALUES('I have Got Your Number','A woman preparing for her wedding loses her cell phone. No problem! She decides to just use the cell phone she found in the trash at her hotel. So what if the man the phone belongs to doesn’t think that’s a good idea?',125.25,6,9);
INSERT INTO books([NAME],DESCRIPTION,PRICE,STOCK,ID_AUTHOR) VALUES('Fifty Shades of Grey','When Ana Steele goes for an interview, she is fascinated by the handsome and smart Christian Grey. The two begin a very physical relationship that’s all about control. This book is full of unconventional (less common) sexual material, and is for mature (adult) audiences only!',160.25,12,10);
INSERT INTO books([NAME],DESCRIPTION,PRICE,STOCK,ID_AUTHOR) VALUES('Sincerely, Carter','What happens when you fall in love with your best friend? Watch a relationship slowly go from close friendship to romance.',160.25,2,11);
INSERT INTO books([NAME],DESCRIPTION,PRICE,STOCK,ID_AUTHOR) VALUES('Harry Potter and the Sorcerer’s Stone','Young Harry Potter lives a sad life in a tiny closet under a staircase. One day, he gets an invitation to Hogwarts, a school where kids learn magic. His life changes forever.',50.50,3,12);
INSERT INTO books([NAME],DESCRIPTION,PRICE,STOCK,ID_AUTHOR) VALUES('The Girl with All the Gifts','A young girl has special gifts, but they don’t make her happy. Instead, she’s researched and treated like a lab animal (who might turn on her protectors at any moment…).',24.25,5,13);
INSERT INTO books([NAME],DESCRIPTION,PRICE,STOCK,ID_AUTHOR) VALUES('The Ocean at the End of the Lane','One day, a boy discovers that the family that lives down the lane is a bit…strange. This doesn’t stop him from becoming friends with the family’s little girl, and starting a strange and magical journey.',254.25,8,14);
INSERT INTO books([NAME],DESCRIPTION,PRICE,STOCK,ID_AUTHOR) VALUES('The Martian','An astronaut becomes the first man to walk on the planet Mars, but then things go horribly wrong. Presumed (thought to be) dead and completely cut off from the rest of the universe, the astronaut has to use his skills and intelligence to find a way back home.',60.25,17,15);
INSERT INTO books([NAME],DESCRIPTION,PRICE) VALUES('The Martian 2',NULL,60.25);
INSERT INTO books([NAME],DESCRIPTION,PRICE) VALUES('The Martian 3',NULL,60.25);

INSERT INTO loans (ID_BOOK,ID_EMPLOYEE,ID_CLIENT,[DATE]) VALUES (5,1,1,'2021-09-13');
INSERT INTO loans (ID_BOOK,ID_EMPLOYEE,ID_CLIENT,[DATE]) VALUES (2,1,2,'2021-09-13');
INSERT INTO loans (ID_BOOK,ID_EMPLOYEE,ID_CLIENT,[DATE]) VALUES (5,1,3,'2021-09-13');
INSERT INTO loans (ID_BOOK,ID_EMPLOYEE,ID_CLIENT,[DATE]) VALUES (5,1,4,'2021-09-13');
INSERT INTO loans (ID_BOOK,ID_EMPLOYEE,ID_CLIENT,[DATE]) VALUES (5,1,5,'2021-09-13');
INSERT INTO loans (ID_BOOK,ID_EMPLOYEE,ID_CLIENT,[DATE]) VALUES (6,8,6,'2021-09-13');
INSERT INTO loans (ID_BOOK,ID_EMPLOYEE,ID_CLIENT,[DATE]) VALUES (15,8,7,'2021-09-13');
INSERT INTO loans (ID_BOOK,ID_EMPLOYEE,ID_CLIENT,[DATE]) VALUES (8,8,8,'2021-09-13');
INSERT INTO loans (ID_BOOK,ID_EMPLOYEE,ID_CLIENT,[DATE]) VALUES (9,6,9,'2021-09-13');
INSERT INTO loans (ID_BOOK,ID_EMPLOYEE,ID_CLIENT,[DATE]) VALUES (15,6,10,'2021-09-13');
INSERT INTO loans (ID_BOOK,ID_EMPLOYEE,ID_CLIENT,[DATE]) VALUES (15,6,11,'2021-09-14');
INSERT INTO loans (ID_BOOK,ID_EMPLOYEE,ID_CLIENT,[DATE]) VALUES (2,15,12,'2021-09-14');
INSERT INTO loans (ID_BOOK,ID_EMPLOYEE,ID_CLIENT,[DATE]) VALUES (2,15,13,'2021-09-14');
INSERT INTO loans (ID_BOOK,ID_EMPLOYEE,ID_CLIENT,[DATE]) VALUES (4,1,14,'2021-09-15');
INSERT INTO loans (ID_BOOK,ID_EMPLOYEE,ID_CLIENT,[DATE]) VALUES (4,4,15,'2021-09-15');
INSERT INTO loans (ID_BOOK,ID_EMPLOYEE,ID_CLIENT,[DATE]) VALUES (1,4,15,'2021-09-15');

INSERT INTO returnss (ID_LOAN,DATE) VALUES (1,'2021-09-20');
INSERT INTO returnss (ID_LOAN,DATE) VALUES (2,'2021-09-20');
INSERT INTO returnss (ID_LOAN,DATE) VALUES (3,'2021-09-20');
INSERT INTO returnss (ID_LOAN,DATE) VALUES (4,'2021-09-20');
INSERT INTO returnss (ID_LOAN,DATE) VALUES (5,'2021-09-20');
INSERT INTO returnss (ID_LOAN,DATE) VALUES (6,'2021-09-20');
INSERT INTO returnss (ID_LOAN,DATE) VALUES (7,'2021-09-20');
INSERT INTO returnss (ID_LOAN,DATE) VALUES (8,'2021-09-20');
INSERT INTO returnss (ID_LOAN,DATE) VALUES (9,'2021-09-20');
INSERT INTO returnss (ID_LOAN,DATE) VALUES (10,'2021-09-20');
INSERT INTO returnss (ID_LOAN,DATE) VALUES (11,'2021-09-20');
INSERT INTO returnss (ID_LOAN,DATE) VALUES (12,'2021-09-20');
INSERT INTO returnss (ID_LOAN,DATE) VALUES (13,'2021-09-20');
INSERT INTO returnss (ID_LOAN,DATE) VALUES (14,'2021-09-20');
INSERT INTO returnss (ID_LOAN,DATE) VALUES (15,'2021-09-20');

INSERT INTO sales (ID_BOOK,ID_EMPLOYEE,ID_CLIENT,[DATE]) VALUES (1,1,1,'2021-09-13 15:00:00');
INSERT INTO sales (ID_BOOK,ID_EMPLOYEE,ID_CLIENT,[DATE]) VALUES (2,2,2,'2021-09-13 15:00:00');
INSERT INTO sales (ID_BOOK,ID_EMPLOYEE,ID_CLIENT,[DATE]) VALUES (3,3,3,'2021-09-13 15:00:00');
INSERT INTO sales (ID_BOOK,ID_EMPLOYEE,ID_CLIENT,[DATE]) VALUES (4,4,4,'2021-09-13 15:00:00');
INSERT INTO sales (ID_BOOK,ID_EMPLOYEE,ID_CLIENT,[DATE]) VALUES (5,5,5,'2021-09-13 15:00:00');
INSERT INTO sales (ID_BOOK,ID_EMPLOYEE,ID_CLIENT,[DATE]) VALUES (6,6,6,'2021-09-13 15:00:00');
INSERT INTO sales (ID_BOOK,ID_EMPLOYEE,ID_CLIENT,[DATE]) VALUES (7,7,7,'2021-09-13 15:00:00');
INSERT INTO sales (ID_BOOK,ID_EMPLOYEE,ID_CLIENT,[DATE]) VALUES (8,8,8,'2021-09-13 15:00:00');
INSERT INTO sales (ID_BOOK,ID_EMPLOYEE,ID_CLIENT,[DATE]) VALUES (9,9,9,'2021-09-13 15:00:00');
INSERT INTO sales (ID_BOOK,ID_EMPLOYEE,ID_CLIENT,[DATE]) VALUES (10,10,10,'2021-09-13 15:00:00');
INSERT INTO sales (ID_BOOK,ID_EMPLOYEE,ID_CLIENT,[DATE]) VALUES (11,11,11,'2021-09-13 15:00:00');
INSERT INTO sales (ID_BOOK,ID_EMPLOYEE,ID_CLIENT,[DATE]) VALUES (12,12,12,'2021-09-13 15:00:00');
INSERT INTO sales (ID_BOOK,ID_EMPLOYEE,ID_CLIENT,[DATE]) VALUES (13,13,13,'2021-09-13 15:00:00');
INSERT INTO sales (ID_BOOK,ID_EMPLOYEE,ID_CLIENT,[DATE]) VALUES (14,14,14,'2021-09-13 15:00:00');
INSERT INTO sales (ID_BOOK,ID_EMPLOYEE,ID_CLIENT,[DATE]) VALUES (15,15,15,'2021-09-13 15:00:00');
INSERT INTO sales (ID_BOOK,ID_EMPLOYEE,ID_CLIENT,[DATE]) VALUES (15,15,15,'2021-09-13 15:00:00');


UPDATE employee SET salary = 100000.00 WHERE ADDRESS = 'Guzman';
UPDATE employee SET salary = 200000.00 WHERE ADDRESS = 'Guanatos' AND salary > 10000.00 AND salary < 100000.00;
UPDATE books SET [NAME]='EXPENSIVE' WHERE PRICE > 150.00 AND PRICE < 300.00 AND [NAME] <> 'Three';


DELETE FROM loans WHERE ID_BOOK IN (SELECT ID_BOOK FROM books WHERE [NAME] = 'EXPENSIVE');
DELETE FROM sales WHERE ID_BOOK IN (SELECT ID_BOOK FROM books WHERE [NAME] = 'EXPENSIVE');
DELETE FROM books WHERE [NAME] = 'EXPENSIVE';


--ORDER BY
SELECT * FROM client ORDER BY NAME ASC;
SELECT * FROM client ORDER BY PHONE ASC;
SELECT * FROM books ORDER BY NAME DESC;
SELECT * FROM books ORDER BY DESCRIPTION ASC;
SELECT * FROM sales S JOIN books B ON S.ID_BOOK=B.ID_BOOK ORDER BY PRICE DESC;

--DISTINCT
SELECT DISTINCT NAME from books;
SELECT DISTINCT NAME from client;
SELECT DISTINCT NAME FROM employee;
SELECT DISTINCT DESCRIPTION FROM books;
SELECT DISTINCT PRICE FROM books;

--WHERE IS NULL
SELECT * FROM books WHERE DESCRIPTION IS NULL;
SELECT * FROM client WHERE NAME IS NULL;
SELECT * FROM sales S JOIN books B ON S.ID_BOOK=B.ID_BOOK WHERE PRICE IS NULL;
SELECT * FROM employee WHERE PHONE IS NULL;
SELECT * FROM loans WHERE [DATE] IS NULL;

--WHERE IS NOT NULL
SELECT * FROM books WHERE DESCRIPTION IS NOT NULL;
SELECT * FROM client WHERE NAME IS NOT NULL;
SELECT * FROM sales S JOIN books B ON S.ID_BOOK=B.ID_BOOK WHERE PRICE IS NOT NULL;
SELECT * FROM employee WHERE PHONE IS NOT NULL;
SELECT * FROM loans WHERE [DATE] IS NOT NULL;

--WHERE BETWEEN
SELECT * FROM sales S JOIN books B ON S.ID_BOOK=B.ID_BOOK WHERE PRICE BETWEEN 150.00 AND 200.00;
SELECT * FROM sales S JOIN books B ON S.ID_BOOK=B.ID_BOOK WHERE PRICE BETWEEN 100.00 AND 150.00;
SELECT * FROM loans WHERE [DATE] BETWEEN '2021-09-10' AND '2021-09-13';
SELECT * FROM loans WHERE [DATE] BETWEEN '2021-09-13' AND '2021-09-15';
SELECT * FROM employee WHERE SALARY BETWEEN 5000.00 AND 10000.00;

--WHERE LIKE
SELECT * FROM client WHERE NAME like 'e%';
SELECT * FROM client WHERE NAME like '%a';
SELECT * FROM employee WHERE ADDRESS LIKE '%Guana%';
SELECT * FROM employee WHERE PHONE LIKE '331%';
SELECT * FROM books WHERE DESCRIPTION LIKE '%kill%';

--INSERT INTO SELECT
INSERT INTO client SELECT NAME,PHONE,ADDRESS FROM employee WHERE SALARY < 10000.00;
INSERT INTO client SELECT NAME,PHONE,ADDRESS FROM employee WHERE SALARY > 10000.00;
INSERT INTO sales SELECT TOP(1) ID_BOOK,ID_EMPLOYEE,ID_CLIENT,[DATE] FROM loans;
INSERT INTO sales SELECT TOP(4) ID_BOOK,ID_EMPLOYEE,ID_CLIENT,[DATE] FROM loans WHERE [DATE] > '2021-09-14';
INSERT INTO employee SELECT NAME,PHONE,ADDRESS,5000.00 FROM client WHERE NAME LIKE '%a';
