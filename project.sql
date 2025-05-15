CREATE TABLE Tester(
 testerID INT PRIMARY KEY,
 name VARCHAR(100),
 phone INT,
 Email VARCHAR,
 Age INT(100),
 ShoeSize DECIMAL(20,1),
 FOREIGN KEY (shoesID) REFERENCES Shoes (shoesID),
 FOREIGN KEY (ReviewID) REFERENCES review (ReviewID),
 FOREIGN KEY (VisualID) REFERENCES visual (VisualID)

);
INSERT INTO Tester (testerID,
 name,
 phone ,
 Email ,
 Age,
 ShoeSize)
VALUES
(1,Abdi, 509-876-888,ahahah@gmail.com, 17, 10.5),
(2, zara , 678-876-9876, iuhfkfh@gmail.com, 20 ,7),
(3, uda, 565-566-9876, usdf@gmail.com, 40, 6.7);




CREATE TABLE  Shoes(
 ShoesID INT PRIMARY KEY,
 BrandID VARCHAR(100),
 PriceID DECIMAL(1000,0)
 FOREIGN KEY (BrandID) REFERENCES Brand (BrandID),
 FOREIGN KEY (ReviewID) REFERENCES review (ReviewID),
 FOREIGN KEY (VisualID) REFERENCES visual (VisualID),
 FOREIGN KEY (MaterialID) REFERENCES Material (MaterialID)


);
INSERT INTO Shoes (shoesID,
 BrandID,
 PriceID
 )
VALUES
(1, Nike, 140),
(2, addidas , 78),
(3, underarmor, 76);



CREATE TABLE  Brand(
 shoesID VARCHAR PRIMARY KEY,
 BrandID VARCHAR(100),
 PriceID DECIMAL(1000,0)
 FOREIGN KEY (CompanyID) REFERENCES company (CompanyID)
 );
 INSERT INTO Brand (ShoesID,
 BrandID,
 PriceID
 )
VALUES
(1, Nike, 140),
(2, addidas , 78),
(3, underarmor, 76);




CREATE TABLE   review(
 ReviewID Int PRIMARY KEY,
 ratings NVARCHAR (10,1),
 descriptionOfShoes VARCHAR (1000),
 FOREIGN KEY (testerID) REFERENCES Tester (testerID)
);
INSERT INTO review (ReviewID,
 ratings,
 descriptionOfShoes,
 testerID
 )
VALUES
(1, 9/10, 'the shoes is to good to be this price',1),
(2, 7/10 , 'The shoes was good but was avg', 2),
(3, 6/10, 'it was colorfull',3);



CREATE TABLE  site(
siteID  NVarcher PRIMARY KEY,
TESTPlace VARCHAR (100),
weather NVARCHAR (100)
FOREIGN KEY (CompanyID) REFERENCES company (CompanyID)
);
INSERT INTO site (siteID,
 TESTPlace,
 weather
 )
VALUES
(213, 'arizona tucson', 100),
(134, 'mexico' , 90),
(3, 'Minneapolis Minnesota', 24);




CREATE TABLE Material(
 MaterialID NVARCHAR PRIMARY KEY,
 cost INT (8000),
 hardsoftness NVARCHAR (1000)
 FOREIGN KEY (CompanyID) REFERENCES company (CompanyID)
);
INSERT INTO Material(MaterialID,
 cost,
 hardsoftness
 )
VALUES
(1, 20.00, 'soft'),
(2, 30 , 'hard'),
(4, 20, 'soft');




CREATE TABLE  company(
 CompanyID NVARCHAR PRIMARY KEY,
 Location NVARCHAR (1000),
 Popularity VARCHAR,
 FOREIGN KEY (testerID) REFERENCES Tester (testerID),
 FOREIGN KEY (ShoesID) REFERENCES shoes (ShoesID),
 FOREIGN KEY (MaterialID) REFERENCES Material (MaterialID)
);
INSERT INTO company (CompanyID,
 Location,
 Popularity
 )
VALUES
(1, 'califonia', 'popular'),
(2, 'new york' , 'not very popular'),
(3, 'ohio', 'popular');




CREATE TABLE  visual(
 VisualID NVARCHAR PRIMARY KEY
 color NVARCHAR,
 FOREIGN KEY (testerID) REFERENCES Tester (testerID),
 FOREIGN KEY (ShoesID) REFERENCES shoes (ShoesID)
);
INSERT INTO visual (VisualID,
 color
 )
VALUES
(2, 'black'),
(3, 'gray'),
(4, 'white');
UPDATE review SET rating  = '10/10' WHERE testerID = '4';

CREATE PROCEDURE UpdateTester
    @testerID INT,
    @name VARCHAR(100),
    @phone VARCHAR(20),
    @Email VARCHAR(100),
    @Age INT,
    @ShoeSize DECIMAL(4,1)
AS
BEGIN
    UPDATE Tester
    SET name = @name,
        phone = @phone,
        Email = @Email,
        Age = @Age,
        ShoeSize = @ShoeSize
    WHERE testerID = @testerID;
END;

CREATE PROCEDURE InsertTester
    @testerID INT,
    @name VARCHAR(100),
    @phone VARCHAR(20),
    @Email VARCHAR(100),
    @Age INT,
    @ShoeSize DECIMAL(4,1)
AS
BEGIN
    INSERT INTO Tester (testerID, name, phone, Email, Age, ShoeSize)
    VALUES (@testerID, @name, @phone, @Email, @Age, @ShoeSize);
END;

CREATE PROCEDURE DeleteTester
    @testerID INT
AS
BEGIN
    DELETE FROM Tester
    WHERE testerID = @testerID;
END;






