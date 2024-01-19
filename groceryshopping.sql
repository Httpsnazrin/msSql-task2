CREATE DATABASE GroceryStore;
USE GroceryStore;


CREATE TABLE Products(
    ProductId int PRIMARY KEY,
    ProductName nvarchar(50),
    Category nvarchar(50),
    Price decimal(10, 2),
    DepartmentId int
);


CREATE TABLE Departments(
    DepartmentId int PRIMARY KEY,
    DepartmentName nvarchar(50)
);


INSERT INTO Departments (DepartmentId, DepartmentName)
VALUES (1, 'Produce'), (2, 'Dairy'), (3, 'Bakery');


INSERT INTO Products (ProductId, ProductName, Category, Price, DepartmentId)
VALUES (1, 'Apples', 'Fruits', 2.99, 1),
       (2, 'Milk', 'Dairy', 1.99, 2),
       (3, 'Bread', 'Bakery', 3.49, 3);


CREATE VIEW ProductDetails AS
    SELECT 
        P.ProductId,
        P.ProductName,
        P.Category,
        P.Price,
        D.DepartmentId
    FROM 
        Products P
    INNER JOIN
         Departments D ON D.DepartmentId = P.DepartmentId;


CREATE PROCEDURE ProductsByCategory
@ProductName nvarchar(50)
AS
BEGIN
    SELECT * FROM ProductDetails
    WHERE ProductName = @ProductName;
END;


SELECT * FROM Products;
SELECT * FROM Departments;