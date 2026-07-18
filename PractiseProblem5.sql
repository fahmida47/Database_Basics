create database PractiseProblem_no_5;
use PractiseProblem_no_5;

CREATE TABLE Category
(
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Product1
(
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Brand VARCHAR(50) NOT NULL,
    Price FLOAT CHECK (Price BETWEEN 1000 AND 100000),
    Country VARCHAR(50) DEFAULT 'Bangladesh',
    CategoryID INT,

    FOREIGN KEY (CategoryID)
    REFERENCES Category(CategoryID)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

INSERT INTO Category
VALUES
(11,'Laptop'),
(12,'Mobile');

INSERT INTO Product1
(ProductID, ProductName, Brand, Price, CategoryID)
VALUES
(101,'ThinkPad','Lenovo',85000,11),
(102,'Galaxy A35','Samsung',38000,12),
(103,'IdeaPad','Lenovo',62000,11),
(104,'iPhone 13','Apple',92000,12),
(105,'Pavilion','HP',73000,11),
(106,'Redmi Note 13','Xiaomi',28000,12),
(107,'Victus','HP',92000,11),
(108,'Realme 12','Realme',30000,12);

SELECT * FROM Category;

SELECT * FROM Product1;

SELECT ProductID, ProductName, Brand, Price, CategoryID FROM Product1;

SELECT TOP 5 *
FROM Product1
ORDER BY Price DESC, ProductID ASC;

SELECT *
FROM Product1
WHERE Brand IN ('HP','Lenovo','Samsung')
AND Price BETWEEN 30000 AND 90000
ORDER BY Price ASC;

SELECT *
FROM Product1
WHERE CategoryID = 11
AND (ProductName LIKE 'I%d'
     OR ProductName LIKE 'V%d');