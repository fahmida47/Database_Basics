Create database LibraryDB;
use LibraryDB;


--Publishers--
Create table Publishers(
	PubID int Primary key,
	PubName varchar(100) not null,
	City varchar(50) not null
);

--Members--
Create table Members(
	MemberID int Primary key,
	MName varchar(100) not null,
	City varchar(50) not null,
	MemberType varchar(50) not null,
	joinDate date not null
);

--Books--
Create table Books(
	BookID int Primary key,
	Title varchar(100) not null,
	Category varchar(50) not null,
	PubID int not null,
	Price Decimal(10,2) not null Check(Price>=0),
	CopiesAvailable int not null Check(CopiesAvailable>=0),
	Constraint FK_Books_Publishers
	Foreign key (PubID) references Publishers(PubID)
);

--Loans--
Create table Loans(
	LoanID int Primary key,
	MemberID int not null,
	BookID int not null,
	LoanDate date not null,
	ReturnDate date null
	Constraint FK_Loans_Members
    Foreign key (MemberID) references Members(MemberID),

    Constraint FK_Loans_Books
    Foreign key (BookID) references Books(BookID)
);

--Fines--
Create table Fines(
	FineID int Primary key,
	LoanID int not null,
	Amount Decimal(10,2) not null Check(Amount>=0), 
	Paid char(1) NOT NULL check (Paid IN ('Y', 'N')),
	Constraint FK_Fines_Loans
    Foreign key (LoanID) references Loans(LoanID)
);

--BookAudit--
Create table BookAudit(
	AuditID int identity(1,1) Primary key,
	BookID int not null,
	BEvent varchar(50) not null,
	OldCopies int not null,
	NewCopies int not null,
	EventDate date not null,
	Constraint FK_BookAudit_Books
    Foreign key (BookID) references Books(BookID)
);

-- Publishers--
Insert into Publishers (PubID, PubName, City) values
(1, 'Oxford Press', 'London');
Insert into Publishers (PubID, PubName, City) values
(2, 'Adorn Publication', 'Dhaka');
Insert into Publishers (PubID, PubName, City) values
(3, 'Pearson', 'New York');
Insert into Publishers (PubID, PubName, City) values
(4, 'Rupa Books', 'Kolkata');

--Members--
Insert into Members (MemberID, MName, City, MemberType, JoinDate) values
(1, 'Arif', 'Dhaka', 'Student', '2024-01-10');
Insert into Members (MemberID, MName, City, MemberType, JoinDate) values
(2, 'Bithi', 'Khulna', 'Teacher', '2023-05-20');
Insert into Members (MemberID, MName, City, MemberType, JoinDate) values
(3, 'Chandan', 'Dhaka', 'Public', '2024-03-15');
Insert into Members (MemberID, MName, City, MemberType, JoinDate) values
(4, 'Dola', 'Sylhet', 'Student', '2025-02-01');
Insert into Members (MemberID, MName, City, MemberType, JoinDate) values
(5, 'Emon', 'Dhaka', 'Teacher', '2025-06-11');

-- Books
Insert into Books(BookID, Title, Category, PubID, Price, CopiesAvailable) values
(101, 'Database Systems', 'Academic', 3, 3500.00, 4);
Insert into Books(BookID, Title, Category, PubID, Price, CopiesAvailable) values
(102, 'Operating Systems', 'Academic', 3, 3000.00, 2);
Insert into Books(BookID, Title, Category, PubID, Price, CopiesAvailable) values
(103, 'Bangla Literature', 'Fiction', 2, 800.00, 10);
Insert into Books(BookID, Title, Category, PubID, Price, CopiesAvailable) values
(104, 'Data Structures', 'Academic', 1, 2500.00, 0);
Insert into Books(BookID, Title, Category, PubID, Price, CopiesAvailable) values
(105, 'History of Bengal', 'History', 2, 1200.00, 5);
Insert into Books(BookID, Title, Category, PubID, Price, CopiesAvailable) values
(106, 'Advanced Physics', 'Science', 1, 4200.00, 1);

-- Loans
Insert into Loans(LoanID, MemberID, BookID, LoanDate, ReturnDate) values
(1001, 1, 101, '2026-01-05', '2026-01-20');
Insert into Loans(LoanID, MemberID, BookID, LoanDate, ReturnDate) values
(1002, 1, 102, '2026-02-01', NULL);
Insert into Loans(LoanID, MemberID, BookID, LoanDate, ReturnDate) values
(1003, 2, 101, '2026-02-10', '2026-02-15');
Insert into Loans(LoanID, MemberID, BookID, LoanDate, ReturnDate) values
(1004, 2, 103, '2026-03-01', '2026-03-30');
Insert into Loans(LoanID, MemberID, BookID, LoanDate, ReturnDate) values
(1005, 3, 104, '2026-03-05', NULL);
Insert into Loans(LoanID, MemberID, BookID, LoanDate, ReturnDate) values
(1006, 1, 106, '2026-04-01', '2026-04-05');
Insert into Loans(LoanID, MemberID, BookID, LoanDate, ReturnDate) values
(1007, 4, 101, '2026-04-10', NULL);
Insert into Loans(LoanID, MemberID, BookID, LoanDate, ReturnDate) values
(1008, 2, 106, '2026-05-02', '2026-05-10');

-- Fines
Insert into Fines(FineID, LoanID, Amount, Paid) values
(2001, 1004, 150.00, 'N');
Insert into Fines(FineID, LoanID, Amount, Paid) values
(2002, 1002, 200.00, 'N');
Insert into Fines(FineID, LoanID, Amount, Paid) values
(2003, 1006, 50.00, 'Y');
Insert into Fines(FineID, LoanID, Amount, Paid) values
(2004, 1005, 300.00, 'N');
Insert into Fines(FineID, LoanID, Amount, Paid) values
(2005, 1003, 75.00, 'Y');

select * from Publishers;
select * from Members;
select * from Books;
select * from Loans;
select * from Fines;
select * from BookAudit;

--Q1--
Create table Reservations(
	ResID int Primary key,
	MemberID int not null,
	BookID int not null,
	ResDate date not null default cast(GETDATE() as date),
	Status1 varchar(50) default 'Pending',

	Constraint FK_Reservations_Member
	Foreign key (MemberID) references Members(MemberID),

	Constraint FK_Reservations_Book
	Foreign key (BookID) references Books(BookID),

	Constraint CK_Reservations_Status
	Check (Status1 IN ('Pending','Collected','Cancelled')),
	Constraint UQ_Reservations_Member_Book
	Unique (MemberID,BookID)
);
--Q1.1--
Insert into Reservations (ResID,MemberID,BookID) 
values (1,3,105);
select * from Reservations
where ResID=1;

--Q1.2--
Insert into Reservations (ResID,MemberID,BookID) 
values (2,3,105);

--Q1.3--
Insert into Reservations (ResID,MemberID,BookID) 
values (3,9,105);

--Q2--
select m.MName,b.Title,p.PubName,l.LoanDate
from Members m
left join Loans l
    on m.MemberID = l.MemberID
left join  Books b
    on l.BookID = b.BookID
left join  Publishers p
    on b.PubID = p.PubID
order by m.MName,l.LoanDate;

--Q3--
select Category,Count(*) as NumofBooks,avg(Price) as avgPrice
from Books
group by Category
having avg(Price)>1500
order by avgPrice Desc;

--Q4--
select BookID,Title,Price 
from Books
where Price>(
	select avg(Price)
	from Books
	);

--Q5--
select m.MName
from Members m
join Loans l
    on m.MemberID=l.MemberID
join Books b
    on l.BookID=b.BookID
join Publishers p
    on b.PubID=p.PubID
where p.PubName='Pearson'
group by m.MemberID,m.MName
having count(Distinct b.BookID)=
       (
           select count(*)
           from Books b1
           join Publishers p1
               on b1.PubID=p1.PubID
           where p1.PubName='Pearson'
       );

--Q6--
go
Create view OutstandingLoans as
select l.LoanID,m.MName,b.Title,l.LoanDate,f.Amount as UnpaidFine
from Loans l
join Members m
    on l.MemberID=m.MemberID
join Books b
    on l.BookID=b.BookID
left join Fines f
    on l.LoanID=f.LoanID
where l.ReturnDate is null 
and (f.Paid = 'N' or f.Paid is null)
go

select * from OutstandingLoans
order by LoanDate;

--Q7--
go
Create Procedure sp_MemberFineStatus
    @MemberID int
as
Begin
    Declare @Name varchar(100);
    Declare  @LoanCount int;
    Declare  @TotalFine int;

    select @Name=MName
    from Members
    where MemberID=@MemberID;

    select @LoanCount=COUNT(*)
    from Loans
    where MemberID=@MemberID;

    if @LoanCount=0
    Begin
        Select @Name as MemberName,
               'No loan record' as Status2;
        return;
    End

    select @TotalFine=sum(f.Amount)
    from Loans l
    left join Fines f
    on l.LoanID = f.LoanID
    and f.Paid = 'N'
    where l.MemberID=@MemberID;
    if @TotalFine is null
        set @TotalFine=0;

    if @TotalFine>=300
        select @Name as MemberName,
               @TotalFine as TotalUnpaidFine,
               'Blocked' as Status2;

    else if @TotalFine>=100
        select @Name as MemberName,
               @TotalFine as TotalUnpaidFine,
               'Warning' as Status2;

    else
        select @Name as MemberName,
               @TotalFine AS TotalUnpaidFine,
               'Clear' AS Status2;

End;
go

Exec sp_MemberFineStatus 1;
Exec sp_MemberFineStatus 3;
Exec sp_MemberFineStatus 4;
Exec sp_MemberFineStatus 5;

--Q8--
go
Create procedure sp_ReviewBooks
as
Begin
    Declare @BookID int=101;
    Declare @Title varchar(100);
    Declare @LoanCount int;

    while @BookID<=106
    Begin
        select @Title = Title
        from Books
        where BookID=@BookID;

        select @LoanCount=count(*)
        from Loans
        where BookID=@BookID;

        if @LoanCount>=3
            update Books
            set CopiesAvailable = CopiesAvailable + 5
            where BookID=@BookID;

        else if @LoanCount=0
            update Books
            set Price=Price * 0.75
            where BookID=@BookID;

        select @Title as BookTitle,
               @LoanCount as LoanCount;
        print @Title + ': ' + Convert(varchar(10), @LoanCount) + ' loan(s)';
        set @BookID=@BookID + 1;
    End
End;
go

Exec sp_ReviewBooks;

--Q9--
go
Create trigger trg_BookCopiesAudit
on Books
after Update
as
Begin
    Insert into BookAudit
    (
        BookID,
        BEvent,
        OldCopies,
        NewCopies,
        EventDate
    )
    select
            d.BookID,
            'COPIES CHANGED',
            d.CopiesAvailable,
            i.CopiesAvailable,
            GETDATE()
    from deleted d
    join inserted i
        on d.BookID=i.BookID
    Where d.CopiesAvailable<>i.CopiesAvailable;
End;
go

Update Books
set CopiesAvailable=CopiesAvailable+2
where Category='Academic';

select * from BookAudit;
go

Update Books
set Price=Price+100
where BookID=103;

select * from BookAudit;
go

Update Books
set CopiesAvailable=CopiesAvailable
where BookID=106;

select * from BookAudit;
go

--Q10--
Begin try

   Begin transaction;

    Insert into Loans (LoanID, MemberID, BookID, LoanDate, ReturnDate)
    values(1009, 5, 103, GETDATE(), NULL);

    Update Books
    set CopiesAvailable=CopiesAvailable-1
    where BookID=103;

    save transaction FirstBookIssued;

    Insert into Loans(LoanID, MemberID, BookID, LoanDate, ReturnDate)
    values (1010, 5, 104, GETDATE(), NULL);

    Update Books
    set CopiesAvailable=CopiesAvailable-1
    where BookID=104;

    commit transaction;

End try

Begin catch

    print 'Error Message: '+error_message();

    if error_number()=547
        print 'CHECK constraint violated';

    if @@TRANCOUNT>0
    Begin
        rollback transaction FirstBookIssued;
        commit transaction;
    End

End catch;
go

select * from Loans
order by LoanID;

select * from Books
order by BookID;

