
-- Create an authors table
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Birthdate DATE
);
-- Create a books table
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    AuthorID INT,
    PublicationYear INT,
    Price DECIMAL(10,2),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);
--Insert data into Authors table
INSERT INTO Authors (AuthorID, FirstName, LastName, BirthDate) 
VALUES
(1, 'Jane', 'Austen', '1775-12-16'),
(2, 'George', 'Orwell', '1903-06-25'),
(3, 'J.K.', 'Rowling', '1965-07-31'),
(4, 'Ernest', 'Hemingway', '1899-07-21'),
(5, 'Virginia', 'Woolf', '1882-01-25')

INSERT INTO Books (BookID, Title, AuthorID, PublicationYear, Price) 
VALUES 
(1, 'Pride and Prejudice', 1, 1813, 12.99),
(2, '1984', 2, 1949, 10.99),
(3, 'Harry Potter and the Philosopher''s Stone', 3, 1997, 15.99),
(4, 'The Old Man and the Sea', 4, 1952, 11.99),
(5, 'To The Lighthouse', 5, 1927, 13.99)

-- Create a view that pulls data from the Authors and the Books tables
CREATE VIEW RecentBooks AS 
SELECT 
    BookID,
    Title,
    PublicationYear,
    Price
FROM 
    Books
WHERE 
    PublicationYear > 1990;


CREATE VIEW BookDetails AS 
SELECT b.BookID, b.Title, a.FirstName + '  ' + a.LastName AS AutherName, b.PublicationYear,
b.Price 
FROM Books b
JOIN Authers a ON b.AuthorID = a.AutherID;


-- Create a view that shows the number of books and the average price of books
CREATE VIEW AuthorStats AS
SELECT a.AuthorID, a.FirstName + ' ' + a.LastName AS AuthorName,
COUNT(b.BookID) AS BookCount,
AVG(b.Price) AS AverageBookPrice
FROM Authors a LEFT JOIN Books b ON a.AuthorID = b.AuthorID
GROUP BY a.AuthorID, a.FirstName, a.LastName;

SELECT Title, Price FROM BookDetails;


SELECT * FROM RecentBooks;


SELECT * FROM AutherStats;


-- Create an updateable view for author's firstname and lastname
CREATE VIEW AuthorContactInfo AS 
SELECT AuthorID, FirstName, LastName 
FROM Authors;



UPDATE AuthorContactInfo 
SET FirstName = 'Joanne'
WHERE AuthorID = 3;

SELECT * FROM AuthorContactInfo;



CREATE TABLE BookPriceAudit(
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    BookID INT,
    OldPrice DECIMAL(10,2),
    NewPrice DECIMAL(10,2),
    ChangeDate DATETIME DEFAULT GETDATE()
);

CREATE TRIGGER trg_BookPriceChange
ON Books
AFTER UPDATE
AS
BEGIN
    IF UPDATE(Price)
    BEGIN
        INSERT INTO BookPriceAudit (BookID, OldPrice, NewPrice)
        SELECT 
            i.BookID,
            d.Price,
            i.Price
        FROM inserted i
        JOIN deleted d ON i.BookID = d.BookID
    END
END;

UPDATE Books SET Price = 14.99 WHERE BookID = 1;

SELECT * FROM trg_BookPriceAudit;










