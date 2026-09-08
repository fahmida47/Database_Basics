create database sql_trigger_practise_01;
use sql_trigger_practise_01;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    AmountPaid DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO Customers (CustomerID, CustomerName, City)
VALUES
(1, 'Rahim', 'Dhaka'),
(2, 'Karim', 'Chattogram'),
(3, 'Sadia', 'Dhaka'),
(4, 'Mina', 'Rajshahi');

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
(101, 1, '2026-01-10', 15000.00),
(102, 1, '2026-01-15', 25000.00),
(103, 2, '2026-01-20', 10000.00),
(104, 3, '2026-01-22', 30000.00),
(105, 4, '2026-01-25', 18000.00);

INSERT INTO Payments (PaymentID, OrderID, AmountPaid)
VALUES
(1, 101, 15000.00),
(2, 102, 10000.00),
(3, 103, 10000.00),
(4, 104, 20000.00),
(5, 105, 18000.00);

select * from Customers;
select * from Orders;
select * from Payments;

----Q2----
go
Create view OutstandingOrders AS
select
    c.CustomerName,
    o.OrderID,
    o.TotalAmount,
    p.AmountPaid,
    o.TotalAmount-p.AmountPaid AS OutstandingAmount
from Customers c
join Orders o
on c.CustomerID=o.CustomerID
join Payments p
on o.OrderID=p.OrderID
where o.TotalAmount-p.AmountPaid>0;
go
Select * from OutstandingOrders;

----Q3----
go
Create Procedure CheckCustomersOrders
@CustomerID INT
AS
Begin
 Declare @OrderCount INT;
 select @OrderCount=COUNT(*)
 from Orders
 where CustomerID=@CustomerID;
 if @OrderCount=0
 begin
    print 'NO Orders found';
 end
 else if @OrderCount>2
 begin 
    print 'Premium Customer';
 end
 else
 begin
    print 'Regular Customer';
 end
End;
go

EXEC CheckCustomersOrders @CustomerID = 1;
EXEC CheckCustomersOrders @CustomerID = 2;
EXEC CheckCustomersOrders @CustomerID = 47;

---Q3---
go
Create Procedure COllectRemainingPayment 
@OrderID INT
AS
Begin
    Declare @remainingorder Decimal(10,2);
    select @remainingorder=o.TotalAmount-p.AmountPaid
    from Orders o
    join Payments p
    on o.OrderID=p.OrderID
    where o.OrderID=@OrderID;
    if @remainingorder=0
    begin
        print 'Already Paid';
    end
    else 
    begin
        while @remainingorder>0
        begin
        set @remainingorder=@remainingorder-1000;
        if @remainingorder<0
        begin
            set @remainingorder=0;
        end
            print @remainingorder;
        end
    end
End;
go
EXEC CollectRemainingPayment @OrderID = 101;
EXEC CollectRemainingPayment @OrderID = 102;


