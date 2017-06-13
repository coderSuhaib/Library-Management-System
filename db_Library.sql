USE db_library

-- Creating the publisher list so I can link the publisher_id a fk from the tbl_book.publisher_Id
CREATE TABLE tbl_publisher (
	publisher_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Publisher_name VARCHAR(70) NOT NULL,
	publisher_address VARCHAR(100) NOT NULL,
	publisher_phone VARCHAR(50)
); 


INSERT INTO tbl_publisher 
	(Publisher_name, publisher_address, publisher_phone)
	VALUES
	('Henry Holt & Co', '175 Fifth Avenue, New York, NY 10010',	'646-307-5095'),
	('Scholastic', '557 Broadway, New York, NY 100121', '1(866) 233-1692'),
	('Signet books', '80 Strand, London, WC2R 0RL', '440(20)7139-3000'),
	('Viking Press', '80 Strand, London, WC2R 0RL', '440(20)7139-3000'),
	('Doubleday', '80 Strand, London, WC2R 0RL', '440(20)7139-3000'),
	('Farrar, Straus and Giroux', '175 Fifth Avenue, New York, NY 10010', '1.888.330.8477'),
	('Chapman & Hall', '6000 Broken Sound Parkway NW, Suite 300, Boca Raton, FL 33487', '1-800-272-7737'),
	('J. B. Lippincott & Co', '2001 Market Street, Philadelphia, PA 19103', '215.521.8300'),
	('Chatto & Windus', '80 Strand, London, WC2R 0RL', '440(20)7139-3000'),
	('Harper & Brothers', '222 Rosewood Drive, Danvers, MA 01923', '(978)750-8400'),
	('Ticknor, Reed & Fields', '9205 Southpark Center Loop, Orlando, FL 32819', '1.800.225.3362'),
	('Delacorte', '1745 Broadway, 15-3, New York, NY 10019', '(212)414-3393'),	
	('Secker and Warburg', '80 Strand, London, WC2R 0RL', '440(20)7139-3000')
;

SELECT * FROM tbl_publisher;






--This is the book list with the book id, Name of the book and the publisher_id that is linked to tbl_publisher.publisher_id

CREATE TABLE tbl_book (
		book_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		title VARCHAR(70) NOT NULL,
		publisher_id INT NOT NULL CONSTRAINT fk_publisher_id FOREIGN KEY REFERENCES tbl_publisher(publisher_id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO tbl_book 
	(title, publisher_id)
	VALUES 
	('The Lost Tribe', 1),
	('Harry Potter and the Philosophers Stone', 2),
	('Harry Potter and the Chamber of Secrets', 2),
	('Harry Potter and the Prisoner of Azkaban', 2),
	('Harry Potter and the Goblet of Fire', 2),
	('Harry Potter and the Order of the Phoenix', 2),
	('Harry Potter and the Half-Blood Prince', 2),
	('Harry Potter and the Deathly Hallows', 2),
	('The Green Mile', 3),
	('Cujo', 4),
	('The Underground Railroad', 5),
	('Freedom', 6),
	('A Tale of Two Cities', 7),
	('Great Expectations',7),
	('To Kill a Mockingbird', 8),
	('Adventures of Huckleberry Finn', 9),
	('The Grapes of Wrath', 4),
	('Moby-Dick', 10), 
	('The Scarlet Letter', 11),
	('Slaughterhouse-Five', 12),
	('Animal Farm', 13)
;

SELECT * from tbl_book;




--I did not assing a PRIMARY KEY to the book_id This way I can use the book_id from tbl_books.

CREATE TABLE tbl_bookAuthors (
		book_id INT NOT NULL, 
		author_name VARCHAR(70) NOT NULL 
);


INSERT INTO tbl_bookAuthors
	(book_id, author_name)
	VALUES 
	(1, 'Mark lee'),
	(2, 'J.K. Rowling'),
	(3, 'J.K. Rowling'),
	(4, 'J.K. Rowling'),
	(5, 'J.K. Rowling'),
	(6, 'J.K. Rowling'),
	(7, 'J.K. Rowling'),
	(8, 'J.K. Rowling'),
	(9, 'Stephen King'),
	(10, 'Stephen King'),
	(11, 'Colson Whitehead'),
	(12, 'Jonathan Franzen'),
	(13, 'Charles Dickens'),
	(14, 'Charles Dickens'),
	(15, 'Harper Lee'),
	(16, 'Mark Twain'),
	(17, 'John Steinbeck'),
	(18, 'Herman Melville'),
	(19, 'Nathaniel Hawthorne'),
	(20, 'Kurt Vonnegut'),
	(21, 'George Orwell')
;

Select * from tbl_bookAuthors;




-- I'm creating the tbl_libaryBranch so I can use the branch_id for the next table. 

CREATE TABLE tbl_libraryBranch (
	branch_id INT PRIMARY KEY NOT NULL IDENTITY(100,10),
	branch_name VARCHAR(50) NOT NULL,
	branch_address VARCHAR(70) NOT NULL
);


INSERT INTO  tbl_libraryBranch 
	(branch_name, branch_address)
	VALUES 
	('Medford Library', '205 S Central Ave, Medford, OR 97501'),
	('White City Library', '3143 Avenue C, White City, OR 97503'),
	('Central Library', '116 S 3rd St, Central Point, OR 97502'),
	('Jacksonvill Library', '340 W C St, Jacksonville, OR 97530'),
	('Sharpstown Library', '205 S Central Ave, Medford, OR 97501'),
	('Phoenix Library', '510 W 1st St, Phoenix, OR 97535'),
	('Ashland Library', '410 Siskiyou Blvd, Ashland, OR 97520'),
	('Gold Hill Library', '202 Dardanelles St, Gold Hill, OR 97525'),
	('Talent Library', '101 Home St, Talent, OR 97540')
;

SELECT * FROM tbl_libraryBranch;





CREATE TABLE tbl_bookCopies (
	book_id INT NOT NULL, 
	branch_id INT NOT NULL,
	num_of_copies INT NULL
);


INSERT INTO tbl_bookCopies 
	(book_id, branch_id, num_of_copies)
	VALUES
	(1, 100, 2),(1, 110, 3),(1, 120, 6),(1, 130, 2),(1, 140, 2),(1, 180, 2),(2, 100, 4),(2, 110, 2),
	(2, 120, 2),(2, 130, 3),(2, 140, 2),(2, 150, 4),(2, 160, 2),(2, 170, 2),(2, 180, 3),(3, 100, 4),
	(3, 110, 2),(3, 120, 2),(3, 130, 3),(3, 140, 2),(3, 150, 4),(3, 160, 2),(3, 170, 2),(3, 180, 3),
	(4, 100, 4),(4, 110, 2),(4, 120, 2),(4, 130, 3),(4, 140, 2),(4, 150, 4),(4, 160, 2),(4, 170, 2),
	(4, 180, 3),(5, 100, 4),(5, 110, 2),(5, 120, 2),(5, 130, 3),(5, 140, 2),(5, 150, 4),(5, 160, 2),
	(5, 170, 2),(5, 180, 3),(6, 100, 4),(6, 110, 2),(6, 120, 2),(6, 130, 3),(6, 140, 2),(6, 150, 4),
	(6, 160, 2),(6, 170, 2),(6, 180, 3),(7, 100, 4),(7, 110, 2),(7, 120, 2),(7, 130, 3),(7, 140, 2),
	(7, 150, 4),(7, 160, 2),(7, 170, 2),(7, 180, 3),(8, 100, 4),(8, 110, 2),(8, 120, 2),(8, 130, 3),	
	(8, 140, 2),(8, 150, 4),(8, 160, 2),(8, 170, 2),(8, 180, 3),(9, 100, 4),(9, 110, 2),(9, 120, 2),
	(9, 130, 3),(9, 140, 2),(9, 150, 4),(9, 160, 2),(9, 170, 2),(9, 180, 3),(10, 100, 4),(10, 110, 2),
	(10, 120, 2),(10, 130, 3),(10, 140, 2),(10, 150, 4),(10, 160, 2),(10, 170, 2),(10, 180, 3),(11, 100, 4),
	(11, 110, 2),(11, 120, 2),(11, 130, 3),(11, 140, 2),(11, 150, 4),(11, 160, 2),(11, 170, 2),(11, 180, 3),
	(12, 100, 4),(12, 110, 2),(12, 120, 2),(12, 130, 3),(12, 140, 2),(12, 150, 4),(12, 160, 2),(12, 170, 2),
	(12, 180, 3),(13, 100, 4),(13, 110, 2),(13, 120, 2),(13, 130, 3),(13, 140, 2),(13, 150, 4),(13, 160, 2),
	(13, 170, 2),(13, 180, 3),(14, 100, 4),(14, 110, 2),(14, 120, 2),(14, 130, 3),(14, 140, 2),(14, 150, 4),
	(14, 160, 2),(14, 170, 2),(14, 180, 3),(14, 100, 4),(15, 110, 2),(15, 120, 2),(15, 130, 3),	(16, 140, 2),
	(16, 150, 4),(16, 160, 2),(16, 170, 2),(17, 180, 3),(17, 100, 4),(17, 110, 2),(18, 120, 2),(18, 130, 3),	
	(18, 140, 2),(18, 150, 4),(18, 160, 2),(19, 170, 2),(19, 180, 3),(19, 100, 4),(19, 110, 2),(19, 120, 2),
	(19, 130, 3),(19, 140, 2),(20, 150, 4),(20, 160, 2),(20, 170, 2),(20, 180, 3),(20, 100, 4),(20, 110, 2),
	(21, 120, 2),(21, 130, 3),(21, 140, 2),(21, 150, 4),(21, 160, 2),(21, 170, 2),(21, 180, 3),(5,150,2)
;

SELECT * FROM tbl_bookCopies;





Create TABLE tbl_borrower(
	card_num Int PRIMARY KEY NOT NULL IDENTITY (10000,5),
	borrower_name VARCHAR(70) NOT NULL, 
	borrower_address VARCHAR(70) NOT NULL,
	borrower_phone VARCHAR(30)
);  


INSERT INTO tbl_borrower 
	(borrower_name, borrower_address, borrower_phone)
	VALUES
	('Jim Jones', '2205 Dewling Avenue, Medford, 97501', '625-558-0549'),
	('Jorden West', '4982 L Avenue, Medford, 97501', '541-502-4718'),
	('Ken Wood', '2219 Dewing Avenue, Medford, 97501', '697-555-0142'),
	('Kevin Brown', '5989 Concord Ave, Medford, 97501', '819-555-0175'),
	('Mary Gibson', '8629 Partridge Dr, Medford, 97501', '612-555-0100'),
	('Mark McArthur', '717 Westwood Court, Medford, 97504', '849-555-0139'),
	('Rebecca Simon', '3494 Jamie Way, Medford, 97501', '330-555-2568'),
	('Kim Baker', '4983 Hilltop Road, Medford, 97504', '970-555-0138'),
	('Jim Foster', '5935 Isabel, Medford, 97504', '913-555-0172'),
	('Nancy Anderson', '1094 Loveridge Circle, Medford, 97501', '399-555-0176'),
	('Thomas hill', '2176 Apollo Way, Medford, 975014', '913-555-0196'), 
	('Barry Johnson', '6432 Vista Way, Medford, 97501', '320-555-0195')
;

SELECT * FROM tbl_borrower;




CREATE TABLE tbl_bookLoans (
	book_id INT NOT NULL,
	branch_id VARCHAR(50) NOT NULL,
	card_Num VARCHAR(70) NOT NULL,
	date_out date NOT NULL,
	Due_date date NOT NULL
);

INSERT INTO tbl_bookLoans
	(book_id, branch_id, card_Num, date_out, Due_date)
	VALUES
	(3, 150, 10030, '2017-06-02', '2017-06-16'),(4, 150, 10030, '2017-06-02', '2017-06-16'),(1, 160, 10015, '2017-06-10', '2017-06-24'),
	(1, 170, 10045, '2017-06-05', '2017-06-19'),(1, 180, 10005, '2017-06-01', '2017-06-15'),(1, 140, 10030, '2017-06-06', '2017-06-20'),
	(2, 140, 10035, '2017-06-06', '2017-06-20'),(4, 120, 10010, '2017-06-14', '2017-06-28'),(8, 150, 10030, '2017-06-01', '2017-06-15'),
	(18, 150, 10030, '2017-06-02', '2017-06-16'),(5, 150, 10030, '2017-05-30', '2017-06-13'),(5, 160, 10015, '2017-06-10', '2017-06-24'),
	(5, 170, 10045, '2017-06-05', '2017-06-19'),(4, 180, 10005, '2017-06-01', '2017-06-15'),(4, 140, 10040, '2017-06-06', '2017-06-20'),
	(4, 140, 10035, '2017-06-06', '2017-06-20'),(21, 120, 10040, '2017-06-13', '2017-06-27'),(12, 150, 10040, '2017-06-02', '2017-06-16'),
	(9, 150, 10040, '2017-06-02', '2017-06-16'),(11, 150, 10040, '2017-06-02', '2017-06-16'),(10, 160, 10015, '2017-06-10', '2017-06-24'),
	(10, 170, 10045, '2017-06-05', '2017-06-19'),(17, 180, 10005, '2017-06-01', '2017-06-15'),(16, 140, 10030, '2017-06-06', '2017-06-20'),
	(20, 140, 10035, '2017-06-06', '2017-06-20'),(14, 120, 10010, '2017-06-14', '2017-06-28'),(18, 150, 10030, '2017-06-01', '2017-06-15'),
	(18, 150, 10000, '2017-06-02', '2017-06-16'),(15, 150, 10030, '2017-05-30', '2017-06-13'),(15, 160, 10015, '2017-06-10', '2017-06-24'),
	(19, 170, 10025, '2017-06-05', '2017-06-19'),(20, 180, 10005, '2017-06-01', '2017-06-15'),(20, 140, 10015, '2017-06-06', '2017-06-20'),
	(9, 140, 10020, '2017-06-06', '2017-06-20'),(14, 120, 10000, '2017-06-14', '2017-06-28'),(18, 150, 10035, '2017-06-01', '2017-06-15'),
	(18, 150, 10000, '2017-06-02', '2017-06-16'),(15, 150, 10020, '2017-05-30', '2017-06-13'),(15, 160, 10045, '2017-06-10', '2017-06-24'),
	(15, 170, 10025, '2017-06-05', '2017-06-19'),(20, 180, 10015, '2017-06-01', '2017-06-15'),(20, 140, 10045, '2017-06-06', '2017-06-20'),
	(19, 140, 10020, '2017-06-06', '2017-06-20'),(10, 150, 10030, '2017-05-30', '2017-06-13'),(10, 140, 10030, '2017-05-30', '2017-06-13')
;


-- How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown Library"?


CREATE PROC dbo.getBookcount
AS
SELECT 
	tbl_book.title AS 'Book Title', tbl_bookCopies.num_of_copies AS 'Number of Copies', tbl_libraryBranch.branch_name AS 'Library Branch'
	From tbl_book
	INNER JOIN tbl_bookCopies ON tbl_bookCopies.book_id = tbl_book.book_id
	INNER JOIN tbl_libraryBranch ON tbl_libraryBranch.branch_id = tbl_bookCopies.branch_id

	WHERE tbl_book.title = 'The Lost Tribe' AND tbl_libraryBranch.branch_name = 'Sharpstown Library'
; 
Go 

-- How many copies of the book titled "The Lost Tribe" are owned by each library branch?

CREATE PROC dbo.getBookNumber
AS
SELECT 
	tbl_book.title AS 'Book Title', tbl_bookCopies.num_of_copies AS 'Number of Copies', tbl_libraryBranch.branch_name AS 'Library Branch'
	From tbl_book
	INNER JOIN tbl_bookCopies ON tbl_bookCopies.book_id = tbl_book.book_id
	INNER JOIN tbl_libraryBranch ON tbl_libraryBranch.branch_id = tbl_bookCopies.branch_id

	WHERE tbl_book.title = 'The Lost Tribe'
;
Go 


-- Retrieve the names of all borrowers who do not have any books checked out.

CREATE PROC dbo.getNonActiveNames
AS
SELECT * FROM tbl_borrower
	LEFT JOIN tbl_bookLoans ON tbl_bookLoans.card_Num = tbl_borrower.card_num
	WHERE tbl_bookLoans.card_Num IS NULL
; 
Go 



-- For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title,
-- the borrower's name, and the borrower's address.

CREATE PROC dbo.getbooksDueToday
AS
SELECT 
	tbl_book.title AS 'Book Title', tbl_borrower.borrower_name AS'Name:', tbl_borrower.borrower_address AS 'Address:', 
	tbl_bookLoans.Due_date AS 'Due Date'
	FROM tbl_bookLoans
	INNER JOIN tbl_borrower ON tbl_borrower.card_num = tbl_bookLoans.card_Num
	INNER JOIN tbl_libraryBranch ON tbl_libraryBranch.branch_id = tbl_bookLoans.branch_id
	INNER JOIN tbl_book ON tbl_book.book_id = tbl_bookLoans.book_id
	WHERE tbl_bookLoans.Due_date = '2017-06-13' AND tbl_libraryBranch.branch_name='Sharpstown library'
;
Go 


--For each library branch, retrieve the branch name and the total number of books loaned out from that branch.

CREATE PROC dbo.getbooksCheckedOut
AS
SELECT 
	tbl_libraryBranch.branch_name AS 'Library', count(tbl_bookLoans.branch_id) AS 'books loaned out'
	FROM tbl_libraryBranch
	INNER JOIN tbl_bookLoans ON tbl_bookLoans.branch_id = tbl_libraryBranch.branch_id
	GROUP by tbl_libraryBranch.branch_name
;
Go 



--Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out.

CREATE PROC dbo.getMultipleBookCheckout
AS
SELECT 
	tbl_borrower.borrower_name AS 'NAME:', tbl_borrower.borrower_address AS 'ADDRESS:', Count(tbl_bookLoans.card_Num) AS 'Books Checked Out'
	FROM tbl_borrower
	Inner JOIN tbl_bookLoans ON tbl_bookLoans.card_Num = tbl_borrower.card_num
	GROUP BY tbl_borrower.borrower_name, tbl_borrower.borrower_address Having COUNT(tbl_bookLoans.card_Num) > 5
;
Go 


-- For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned 
--by the library branch whose name is "Central".


CREATE PROC dbo.getBookByAuthor
AS
SELECT 
	tbl_book.title AS 'Book Title', tbl_bookCopies.num_of_copies AS 'Number of Copies'
	FROM tbl_bookCopies
	INNER JOIN tbl_book ON tbl_book.book_id = tbl_bookCopies.book_id
	INNER JOIN tbl_bookAuthors ON tbl_bookAuthors.book_id = tbl_book.book_id
	INNER JOIN tbl_libraryBranch ON tbl_libraryBranch.branch_id = tbl_bookCopies.branch_id
	WHERE tbl_bookAuthors.author_name = 'Stephen King' AND tbl_libraryBranch.branch_name = 'Central Library'
;
Go 
