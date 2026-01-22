use [Erp-Crm]
go

create table Customer(CustomerId int identity(1,1) primary key,
                      IsActive bit default 1,
                      IsDelete bit default 0,
					  Created  varchar(100) default user_name(),
					  Updated varchar(100) default user_name(),
					  CreatedDateTime datetime default getdate(),
					  UpdatedDateTime datetime default getdate(),
					  CustomerName varchar(50) not null,
					  CustomerAddress varchar(100) not null,
					  CustomerEmail Nvarchar(50) unique not null,
					  CustomerPhoneNo varchar(15) unique not null);

create table Category(CategoryId int identity(1,1) primary key,
                         IsActive bit default 1,
                         IsDelete bit default 0,
		    	         Created  varchar(100) default user_name(),
					     Updated varchar(100) default user_name(),
			             CreatedDateTime datetime default getdate(),
					     UpdatedDateTime datetime default  getdate(),
						 CategoryName varchar(255) unique not null,
                         CategoryDescription text null);

create table SubCategoryProducts(SubCategoryId int identity(1,1) primary key,
                               IsActive bit default 1,
                               IsDelete bit default 0,
		                       Created  varchar(100) default user_name(),
					           Updated varchar(100) default user_name(),
			                   CreatedDateTime datetime default getdate(),
			                   UpdatedDateTime datetime default getdate(), 
							   SubCategoryName varchar(266) unique not null,
							   CategoryId int,foreign key(CategoryId) references Category(CategoryId) on delete cascade,
							   SubCatDescription text null);

create table Products(ProductId int identity(1,1) primary key,
                      IsActive bit default 1,
                      IsDelete bit default 0,
		              Created  varchar(100) default user_name(),
					  Updated varchar(100) default user_name(),
			          CreatedDateTime datetime default getdate(),
			          UpdatedDateTime datetime default getdate(), 
					  ProductName varchar(255) not null,
					  StockQuantity int not null,
					  CategoryId int ,foreign key(CategoryId) references Category(CategoryId),
					  SubCategoryId int ,foreign key(SubCategoryId) references SubCategoryProducts(SubCategoryId) );

create table Orders(OrderId int identity(1,1) primary key,
                      IsActive bit default 1,
                      IsDelete bit default 0,
					  Created  varchar(100) default user_name(),
					  Updated varchar(100) default user_name(),
					  CreatedDateTime datetime default getdate(),
					  UpdatedDateTime datetime default getdate(),
                      ProductId int, foreign key(ProductId) references Products(ProductId) on delete cascade,
					  CustomerId int,foreign key(CustomerId) references Customer(CustomerId)on delete cascade,
					  quantity int not null);

create table CustomerPaymentDetails(PaymentId int identity(1,1) primary key,
                                  IsActive bit default 1,
                                  IsDelete bit default 0,
					              Created  varchar(100) default user_name(),
					              Updated varchar(100) default user_name(),
					              CreatedDateTime datetime default getdate(),
					              UpdatedDateTime datetime default getdate(),
                                   CustomerId int,foreign key(CustomerId) references Customer(CustomerId) on delete cascade,
								   OrderId int,foreign key(OrderId) references Orders(OrderId),
								   PayedAmount bigint not null,
								   PaymentMode varchar(50)not null,
								   TransactionStatus bit);

create table CustomerFeedback(CfId int identity(1,1) primary key,
                              IsActive bit default 1,
                              IsDelete bit default 0,
					          Created  varchar(100) default user_name(),
					          Updated varchar(100) default user_name(),
					          CreatedDateTime datetime default getdate(),
					          UpdatedDateTime datetime default getdate(),
                              CustomerId int,foreign key(CustomerId) references Customer(CustomerId) on delete cascade,
							  FeedbackStatus varchar(50) not null,
							  ComplainDescription varchar(100));

create table SalesOrders(SaleOrderId int identity(1,1) primary key,
                              IsActive bit default 1,
                              IsDelete bit default 0,
					          Created  varchar(100) default user_name(),
					          Updated varchar(100) default user_name(),
					          CreatedDateTime datetime default getdate(),
					          UpdatedDateTime datetime default getdate(),
							  ProductId int, foreign key(ProductId) references Products(ProductId) on delete cascade,
					         CustomerId int,foreign key(CustomerId) references Customer(CustomerId) on delete cascade,
							 quantity int,
                             ShippingStatus varchar(50) not null,
							 ShippingAddress varchar(255) not null,
							 BillingAddress varchar(255) not null);

create table AccountDetails(AdId int identity(1,1) primary key,
                              IsActive bit default 1,
                              IsDelete bit default 0,
					          Created  varchar(100) default user_name(),
					          Updated varchar(100) default user_name(),
					          CreatedDateTime datetime default getdate(),
					          UpdatedDateTime datetime default getdate(),
							  AccountId int not null,
							  RecieveAmount bigint not null,
							  RecieveDate datetime default getdate(),
							  PaymentId int, foreign key(PaymentId)references CustomerPaymentDetails(PaymentId) on delete cascade);

create table ExpenseManaging(Emid int identity(1,1) primary key,
                             IsActive bit default 1,
                              IsDelete bit default 0,
					          Created  varchar(100) default user_name(),
					          Updated varchar(100) default user_name(),
					          CreatedDateTime datetime default getdate(),
					          UpdatedDateTime datetime default getdate(),
							  AccountId int,
							  DebitDate datetime default getdate(),
							  TotalAmount bigint not null);

create table Employees(EmployeeId int identity(1,1) primary key,
                          IsActive bit default 1,
                          IsDelete bit default 0,
					      Created  varchar(100) default user_name(),
					      Updated varchar(100) default user_name(),
					      CreatedDateTime datetime default getdate(),
					      UpdatedDateTime datetime default getdate(),
						  EmployeeName varchar(50) not null,
						  EmployeeRole varchar(50) not null,
						  EmployeeAddress varchar(100) not null,
						  EmployeeEmail Nvarchar(50) not null,
						  EmployeePhoneNo varchar(15) not null);

/*create table PayrollManagement(PmId int identity(1,1) primary key,
                              IsActive bit default 1,
                              IsDelete bit default 0,
					          Created  varchar(100) default user_name(),
					          Updated varchar(100) default user_name(),
					          CreatedDateTime datetime default getdate(),
					          UpdatedDateTime datetime default getdate(),
							  EmployeeId int,foreign key(EmployeeId) references Employees(EmployeeId) on delete cascade,
							  InTime datetime ,
							  OutTime datetime,
							  WorkingHour time null,
							  Attendence varchar(50),
							  LeaveStatus varchar(50),
							  Salary bigint not null,
							  DayNameOfMonth varchar(50) not null);*/


create table Leads(LeadId int identity(1,1) primary key,
                         IsActive bit default 1,
                         IsDelete bit default 0,
		    	         Created  varchar(100) default user_name(),
					     Updated varchar(100) default user_name(),
			             CreatedDateTime datetime default getdate(),
					     UpdatedDateTime datetime default  getdate(), 
						 LeadName varchar(50) not null,
						 LeadAddress varchar(50) not null,
						 LeadSource varchar(50) not null,
						 LeadPhoneNo varchar(15) not null,
						 LeadEmail Nvarchar(50) not null,
						 LeadBudget bigint not null,
						 Leadtimeline datetime not null,
						 LeadScore varchar(50) not null);

ALTER TABLE ExpenseManaging DROP CONSTRAINT FK__ExpenseMa__Accou__3864608B;

SELECT name 
FROM sys.foreign_keys 
WHERE parent_object_id = OBJECT_ID('ExpenseManaging');

ALTER TABLE ExpenseManaging ADD CONSTRAINT FK_ExpenseManaging_AccountId 
FOREIGN KEY (AccountId) REFERENCES AccountDetails(AccountId) ON DELETE CASCADE;

drop table PayrollManagement;
select * from PayrollManagement;

create table EmployeeDailyAttendence(
             AttendenceId int identity(1,1) primary key,
			 IsActive bit default 1,
              IsDelete bit default 0,
		      Created  varchar(100) default user_name(),
			  Updated varchar(100) default user_name(),
			  CreatedDateTime datetime default getdate(),
			  UpdatedDateTime datetime default  getdate(),
			 EmployeeId int,foreign key(EmployeeId) references Employees(EmployeeId) on delete cascade,
			 AttendenceDate date not null,
			 InTime time default '09:00',
			 OutTime time default '17:00',
			 WorkingHours TIME NULL,
			 AttendanceStatus VARCHAR(50), --CHECK (AttendanceStatus IN ('Present', 'Absent', 'Half-Day')),
             LeaveStatus VARCHAR(50) DEFAULT 'No Leave',
			 constraint unique_entry unique(EmployeeId,AttendenceDate));

create table PayrollManagement(PmId int identity(1,1) primary key,
                              IsActive bit default 1,
                              IsDelete bit default 0,
					          Created  varchar(100) default user_name(),
					          Updated varchar(100) default user_name(),
					          CreatedDateTime datetime default getdate(),
					          UpdatedDateTime datetime default getdate(),
							  EmployeeId int,foreign key(EmployeeId) references Employees(EmployeeId) on delete cascade,
							  TotalWorkingHours decimal(5,2),
                              TotalLeaveDays int default 0,
                              TotalSalary bigint NOT NULL,
                          MonthYear VARCHAR(7) NOT NULL); 


ALTER TABLE EmployeeDailyAttendence Add Constraint ck_AttendanceStatus  CHECK (AttendanceStatus IN ('Present', 'Absent', 'Half-Day','Holiday'));

create table #temptableOrderdetails(ProductId int,CustomerId int,Quantity int,ShippingStatus varchar(50));

select * from Category;
select * from SubCategoryProducts;
select * from Products;
select* from Customer;
select * from Orders;
select * from SalesOrders;
select * from CustomerPaymentDetails;
select * from CustomerFeedback;
select * from AccountDetails;
select * from ExpenseManaging;
select * from Employees;
select * from Leads;
select * from EmployeeDailyAttendence;
select * from PayrollManagement;

select top 1 SubCategoryId from SubCategoryProducts order by SubCategoryId desc;

alter proc SetOrderDetails 
           as begin 
			  declare @CreateTime dateTime = getdate();		  
	               update Orders set IsActive = 0, IsDelete = 1,UpdatedDateTime = GETDATE()
				      where Month(CreatedDateTime) < month(@CreateTime);
			end;
         
exec SetOrderDetails;

update Orders set IsActive = 1, IsDelete = 0,UpdatedDateTime = GETDATE();

create proc SetSalesOrserDetails 
             as begin 
			     declare @CreateTime datetime = getdate();
				        update SalesOrders set IsActive = 0 , IsDelete = 1 , UpdatedDateTime = GETDATE()
						       where MONTH(CreatedDateTime) < MONTH(@CreateTime);
			 end;

alter proc PastAttendenceEmploye
              as begin 
			     declare @CreateTime datetime = getdate();
			     select COUNT(ED.AttendenceId)as TotalAttendenceInPastMonth , E.EmployeeName ,  
						                         from EmployeeDailyAttendence ED
						                         join Employees E on E.EmployeeId = ED.EmployeeId
						                        where MONTH(ED.CreatedDateTime) < MONTH(@CreateTime) 
												and ED.AttendanceStatus in ('Present','Half-Day')
												group by E.EmployeeName;

			end;

exec PastAttendenceEmploye;

create function customerdata(@customerCount int)
 returns int 
 as
    begin
	  declare @count int
	  select @count = count(C.CustomerName) from Customer C join Orders O on O.CustomerId = C.CustomerId
	  return @count
	end;

select dbo.customerdata(0) as totalCustomersOrders;

create function LeadScoredata()
  returns table
  as
    return 
	   (select LeadName , LeadPhoneNo from Leads where LeadScore = 'High');

select * from dbo.LeadScoredata();
     
alter function CustomerOrderDetails(@CustomerId int)
returns table
as 
    return
	 (select C.CustomerName , C.CustomerAddress , P.ProductName , O.Quantity as orderQuantity
	 from Customer c 
	 inner join Orders O on O.CustomerId = C.CustomerId
	 inner join Products P on O.ProductId = P.ProductId
	 where O.CustomerId = @CustomerId);

select * from CustomerOrderDetails(10);

alter function getOrderByCustomer(@OrderId int)
returns @Orders table (OrderId int primary key, OrderDate date, Amount decimal(12,0))
as
   begin
      insert into @Orders
	   select O.OrderId , O.CreatedDateTime as OrderDate , P.PayedAmount as TotalAmount
	   from Orders O 
	   inner join  CustomerPaymentDetails P on P.OrderId = O.OrderId
	   where P.TransactionStatus = 1 and O.OrderId =@OrderId
	  return
	end;

select * from dbo.getOrderByCustomer(2);

select C.CustomerName , P.ProductName , O.Quantity ,G.Amount
from Customer C 
inner join Orders O on O.CustomerId = C.CustomerId
inner join dbo.getOrderByCustomer(2) as G on O.OrderId = G.OrderId
inner join Products P on P.ProductId = O.ProductId;

select * from (select * from dbo.getOrderByCustomer(2)) as E;

alter proc getCustomerdata 
as begin
      select C.CustomerName , P.ProductName , O.Quantity ,Pd.PayedAmount
		from Customer C 
		inner join Orders O on O.CustomerId = C.CustomerId
	    inner join  CustomerPaymentDetails Pd on Pd.OrderId = O.OrderId
		inner join Products P on P.ProductId = O.ProductId
		where Pd.PayedAmount > (select Amount from dbo.getOrderByCustomer(2))
		
	end;

exec getCustomerdata;

create proc getCustomerdata2 @id int
as begin
      declare @amount int
	  set @amount = (select Amount from dbo.getOrderByCustomer(@id))
      select C.CustomerName , P.ProductName , O.Quantity ,Pd.PayedAmount
		from Customer C 
		inner join Orders O on O.CustomerId = C.CustomerId
	    inner join  CustomerPaymentDetails Pd on Pd.OrderId = O.OrderId
		inner join Products P on P.ProductId = O.ProductId
		where Pd.PayedAmount > @amount
		
	end;

exec getCustomerdata2 @id = 10;

alter function getEmployeedata(@empid int)
returns @details table(EmployeeName varchar(50),EmployeeRole varchar(50),EmployeeSalary bigint , EmplpyeeLeave int)
as begin
      insert into @details
	  select E.EmployeeName,E.EmployeeRole , P.TotalSalary , P.TotalLeaveDays
	  from Employees E
	  inner join PayrollManagement P on P.EmployeeId = E.EmployeeId
	  where E.EmployeeId = @empid
	  return
 end;

 select * from dbo.getEmployeedata(2);

select dbo.customerdata(0);
select CURRENT_TIMESTAMP;
select GETDATE();
select GETUTCDATE();
select YEAR('2025-03-11');
select DATEADD(year,3,'2025-03-11');
select DATEDIFF(day,'2025-03-11', '2028-03-11');
select DATENAME(weekday,'2025-03-11');
select DATEPART(SECOND,'2025-03-11 08:56:23');
select DAY('2025-03-9 08:56:23');
select ISDATE('2025');
select MONTH('2025/6/10');
select SCHEMA_NAME();
select SCHEMA_ID();
select SESSION_ID();
select SESSION_USER;
select SYSDATETIME();
select SYSDATETIMEOFFSET();
select SWITCHOFFSET('2025-03-11 11:07:24.7517430 -05:30',  '-07:00');
select SYSUTCDATETIME();
select TODATETIMEOFFSET('2025-03-11 11:07:24.751','-07:00');

alter function getPayedAmountByCustomer(@CustomerId int)
returns table 
as
   return
	   select sum(P.PayedAmount) as TotalAmount , C.CustomerName
	   from Customer C 
	   inner join  CustomerPaymentDetails P on  P.CustomerId = C.CustomerId 
	   where C.CustomerId = @CustomerId and P.TransactionStatus = 1
	   group by C.CustomerName ;
	
select * from dbo.getPayedAmountByCustomer(6);

create view MaxProduct as 
select count(S.ProductId) as TotalCount , P.ProductId ,Sum(S.Quantity) as TotalQuantity from SalesOrders S
inner join Products P on P.ProductId = S.ProductId
group by P.ProductId;


alter function findMaxSaleProduct()
returns varchar(50)
as begin
    declare @name varchar(50)
	declare @maxCount int

	set @maxCount = (select Max(TotalCount) from dbo.MaxProduct);

     select @name = P.ProductName from Products P 
					inner join dbo.MaxProduct M on M.ProductId = P.ProductId
					where M.TotalCount = @maxCount;

	 return @name
 end;

select dbo.findMaxSaleProduct() as NameOfProduct;
select NEWID();

select * from Customer
delete from Customer where CustomerId = 25
ALTER TABLE Customer
ADD CONSTRAINT UQ_CustomerName UNIQUE (CustomerName,CustomerPhoneNo);


CREATE TABLE Users (
    UserId INT IDENTITY PRIMARY KEY,
    Username VARCHAR(50) UNIQUE NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    Email VARCHAR(100),
    CreatedAt DATETIME DEFAULT GETDATE()
);

select * from Users;


--second part


use [Erp-Crm]
go

alter proc insertCustomer 
         @IsActive bit = '1',
		 @IsDelete bit = '0',
         @CustomerName varchar(50) ,
		 @CustomerAddress varchar(100),
		 @CustomerEmail Nvarchar(50),
		 @CustomerPhoneNo varchar(15),
		 @CreatedBy varchar(100) = null,
		 @UpdatedBy varchar(100) = null
as begin
  
     IF @CustomerName IS NULL OR @CustomerName = ''
    BEGIN
        RAISERROR('Customer Name cannot be NULL or empty.', 16, 1);
        RETURN;
    END

    insert into Customer(CustomerName,IsActive,IsDelete,CustomerAddress,CustomerEmail,CustomerPhoneNo,created,updated)
	values(@CustomerName,@IsActive,@IsDelete,@CustomerAddress,@CustomerEmail,@CustomerPhoneNo,
	ISNULL(@CreatedBy,user_name()),
	isnull(@UpdatedBy,user_name()));
	end;



execute  as user = 'user4'

exec insertCustomer 
      @IsActive = '0',
	  @IsDelete = '1',
      @CustomerName = 'Alice',
	  @CustomerAddress = 'UP',
	  @CustomerEmail = 'alice@gmail.com',
	  @CustomerPhoneNo = 7562393234;

revert;

select * from Customer;
delete from Customer where CustomerId = '5';
 
 update Customer set updated='user1' where CustomerId = '4';

 SET IDENTITY_INSERT Customer Off;
 insert into Customer(CustomerId,IsActive,IsDelete,created,CustomerName,CustomerAddress,CustomerEmail,CustomerPhoneNo)
 values('10','0','1','user1','Aesha','vapi','aesha@gmail.com','8855369113');


 alter proc insertCategory
          @IsActive bit = '1',
		 @IsDelete bit = '0',
		  @CreatedBy varchar(100) = null,
		 @UpdatedBy varchar(100) = null,
		 @CategoryName varchar(255),
		 @CatDescription text = null
as begin
         insert into Category(IsActive,IsDelete,CategoryName,CategoryDescription,created,updated)
		 values(@IsActive,@IsDelete,@CategoryName,@CatDescription,
		 ISNULL(@CreatedBy,user_name()),
	      isnull(@UpdatedBy,user_name()));
	end;

exec insertCategory 
        @IsActive = '0',
		 @IsDelete = '1',
        --@UpdatedBy = 'user1',
		@CategoryName = 'Category5',
		@CatDescription = 'cd5';

select * from Category;

alter proc insertSubCategory 
         @IsActive bit = '1',
		 @IsDelete bit = '0',
		  @CreatedBy varchar(100) = null,
		 @UpdatedBy varchar(100) = null,
		 @subCatName varchar(266),
		 @subCatdescription text = null,
		 @CatId int
as begin 
     insert into SubCategoryProducts(IsActive,IsDelete,created,updated,SubCategoryName,SubCatDescription,CategoryId)
	 values(@IsActive,@IsDelete,
	   ISNULL(@CreatedBy,user_name()),
	      isnull(@UpdatedBy,user_name()),
		  @subCatName ,@subCatdescription,@CatId);
end;

exec insertSubCategory
        @IsActive = '0',
		 @IsDelete = '1',
        --@UpdatedBy = 'user1',
        @subCatName = 'SubCat5',
		--@subCatdescription = 'sub category two is',
		@CatId = '4';

select * from SubCategoryProducts;

alter proc insertProducts 
           @IsActive bit = '1',
		   @IsDelete bit = '0',
		   @CreatedBy varchar(100) = null,
		   @UpdatedBy varchar(100) = null,
		   @ProductName varchar(255),
		   @stock int,
		   @catid int = null,
		   @SubCatId int = null
as begin 
    insert into Products(IsActive,IsDelete,created,updated,ProductName,StockQuantity,CategoryId,SubCategoryId)
	values(@IsActive ,@IsDelete,
		 ISNULL(@CreatedBy,user_name()),
	      isnull(@UpdatedBy,user_name()),
		  @ProductName,@stock,
		  isnull(@catid,null),
		  isnull(@SubCatId,null));
end;

exec insertProducts 
        --@IsActive = '0',
		 --@IsDelete = '1',
		 --@createdBy = 'user1',
		 --@UpdatedBy = 'user1',
		 @ProductName = 'Product3',
		 @stock = '10',
		 @catid = '4',
		 @SubCatId = '3';

select * from Products;

create proc insertOrders
          @IsActive bit = '1',
		   @IsDelete bit = '0',
		   @CreatedBy varchar(100) = null,
		   @UpdatedBy varchar(100) = null,
		   @ProdId int,
		   @CustId int,
		   @quant int
as begin 
      insert into Orders(IsActive,IsDelete,Created,Updated,ProductId,CustomerId,quantity)
	  values(@IsActive ,@IsDelete,
		 ISNULL(@CreatedBy,user_name()),
	      isnull(@UpdatedBy,user_name()),
		  @ProdId,@CustId,@quant);
end;

alter proc insertCustomerPaymentdetails
           @IsActive bit = '1',
		   @IsDelete bit = '0',
		   @CreatedBy varchar(100) = null,
		   @UpdatedBy varchar(100) = null,
		   @CustomerId int,
		   @OrderId int,
		   @PayedAmount bigint,
		   @PaymentMode varchar(50),
		   @TransactionStatus bit = null
as begin 
    insert into CustomerPaymentDetails(IsActive,IsDelete,Created,Updated,CustomerId,OrderId,PayedAmount,PaymentMode,TransactionStatus)
	values( @IsActive ,@IsDelete,
		 ISNULL(@CreatedBy,user_name()),
	      isnull(@UpdatedBy,user_name()),
		   @CustomerId,@OrderId,@PayedAmount,@PaymentMode,
		   isnull(@TransactionStatus,1));
end;

alter proc insertCustomerFeedback
            @IsActive bit = '1',
		   @IsDelete bit = '0',
		   @CreatedBy varchar(100) = null,
		   @UpdatedBy varchar(100) = null,
		   @CustomerId int,
		   @FeedbackStatus varchar(50),
		   @ComplainDescription varchar(100) = null
as begin 
       insert into CustomerFeedback(IsActive,IsDelete,Created,Updated,CustomerId,FeedbackStatus,ComplainDescription)
	   values( @IsActive ,@IsDelete,
		 ISNULL(@CreatedBy,user_name()),
	      isnull(@UpdatedBy,user_name()),
		  @CustomerId,@FeedbackStatus,
		  isnull(@ComplainDescription , null));
end;

alter proc insertSalesOrders 
           @IsActive bit = '1',
		   @IsDelete bit = '0',
		   @CreatedBy varchar(100) = null,
		   @UpdatedBy varchar(100) = null,
		   @productId int,
		   @customerId int,
		   @quantity int,
		   @shippingStatus varchar(50),
		   @shippingAddress varchar(255),
		   @billingAdress varchar(255)
as begin
    insert into SalesOrders(IsActive,IsDelete,Created,Updated,ProductId,CustomerId,quantity,ShippingStatus,ShippingAddress,BillingAddress)
	      values(@IsActive ,@IsDelete,
		 ISNULL(@CreatedBy,user_name()),
	      isnull(@UpdatedBy,user_name()),
		  @productId,@customerId,@quantity,@shippingStatus,@shippingAddress,@billingAdress);
end;

create proc insertAccountDetails
            @IsActive bit = '1',
		   @IsDelete bit = '0',
		   @CreatedBy varchar(100) = null,
		   @UpdatedBy varchar(100) = null,
		   @accountId int,
		   @RecieveAmount bigint,
		   @recevieDate datetime = null,
		   @paymentId int
as begin
    insert into AccountDetails(IsActive,IsDelete,Created,Updated,AccountId,RecieveAmount,RecieveDate,PaymentId)
	values(@IsActive ,@IsDelete,
		 ISNULL(@CreatedBy,user_name()),
	      isnull(@UpdatedBy,user_name()),
		  @accountId,@RecieveAmount,
		   ISNULL(@recevieDate,getdate()),
		   @paymentId);
end;

alter proc insertExpenseManaging 
         @IsActive bit = '1',
		   @IsDelete bit = '0',
		   @CreatedBy varchar(100) = null,
		   @UpdatedBy varchar(100) = null,
		   @AccountId int,
		   @DebitAmount bigint,
		   @DebitDate datetime = null
as begin
   declare @TotalCredit bigint;
   declare @TotalDebit bigint;
   declare @NewTotal bigint;

    select @TotalCredit = isnull(sum(RecieveAmount) , 0) from AccountDetails where AccountId = @AccountId;
	select @TotalDebit = ISNULL(sum(DebitAmount),0) from ExpenseManaging where AccountId = @AccountId;
	set @NewTotal = @TotalCredit - (@TotalDebit + @DebitAmount);
    insert into ExpenseManaging(IsActive,IsDelete,Created,Updated,AccountId,DebitAmount,DebitDate,TotalAmount)
	values(@IsActive ,
	       @IsDelete,
		 ISNULL(@CreatedBy,user_name()),
	      isnull(@UpdatedBy,user_name()),
		  @AccountId,
		  @DebitAmount,
		  ISNULL(@DebitDate , GETDATE()),
		  @NewTotal);
end;

create proc insertEmployees
            @IsActive bit = '1',
		   @IsDelete bit = '0',
		   @CreatedBy varchar(100) = null,
		   @UpdatedBy varchar(100) = null,
		   @EmpName varchar(50),
		   @EmpRole varchar(50),
		   @EmpAddress varchar(50),
		   @EmpEmail Nvarchar(50),
		   @EmpPhoneNo varchar(15)
as begin 
      insert into Employees(IsActive,IsDelete,Created,Updated,EmployeeName,EmployeeRole,EmployeeAddress,EmployeeEmail,EmployeePhoneNo)
	  values(@IsActive ,@IsDelete,
		 ISNULL(@CreatedBy,user_name()),
	      isnull(@UpdatedBy,user_name()),
		  @EmpName,@EmpRole,@EmpAddress,@EmpEmail,@EmpPhoneNo);
end;

/*alter proc insertPayrollManagement
            @IsActive bit = '1',
		   @IsDelete bit = '0',
		   @CreatedBy varchar(100) = null,
		   @UpdatedBy varchar(100) = null,
		   @EmpId int,
		   @InTime datetime = null,
		   @OutTime datetime = null,
		   @workingHour time,
		   @attendence varchar(50) = null,
		   @LeaveStatus varchar(50) = null,
		   @Salary bigint = null,
		   @DayOfMonth varchar(50)
as begin 
    insert into PayrollManagement(IsActive,IsDelete,Created,Updated,EmployeeId,InTime,OutTime,WorkingHour,Attendence,LeaveStatus,Salary,DayNameOfMonth)
	values(@IsActive ,@IsDelete,
		 ISNULL(@CreatedBy,user_name()),
	      isnull(@UpdatedBy,user_name()),
		  @EmpId,
		  ISNULL(@InTime,getdate()),
	      isnull(@OutTime,getdate()),
		  @workingHour,
		  ISNULL(@attendence, 'Unknown'), 
        ISNULL(@LeaveStatus, 'No Leave'),
        ISNULL(@Salary, 0), @DayOfMonth);
end;*/

create proc insertLeds 
           @IsActive bit = '1',
		   @IsDelete bit = '0',
		   @CreatedBy varchar(100) = null,
		   @UpdatedBy varchar(100) = null,
		   @LeadName varchar(50),
		   @LeadAddress varchar(50),
		   @LeadSource varchar(50),
		   @LeadPhoneNo varchar(15),
		   @LeadEmail Nvarchar(50),
		   @LeadBudget bigint,
		   @Leadtimeline datetime,
		   @LeadScore varchar(50)
as begin
    insert into Leads(IsActive,IsDelete,Created,Updated,LeadName,LeadAddress,LeadSource,LeadPhoneNo,LeadEmail,LeadBudget,Leadtimeline,LeadScore)
	values(@IsActive ,@IsDelete,
		 ISNULL(@CreatedBy,user_name()),
	      isnull(@UpdatedBy,user_name()),
		  @LeadName,@LeadAddress,@LeadSource,@LeadPhoneNo,@LeadEmail,@LeadBudget,@Leadtimeline,@LeadScore);
end;

exec insertProducts 
     -- @IsActive = '0',
	  --@IsDelete = '1',
      --@UpdatedBy = 'user1',
	  --@CreatedBy = 'user1',
	  @ProductName = 'Product10',
	  @stock = '50',
	  @catid = '3',
	  @SubCatId = '3';

--execute as user = 'user4'
exec insertOrders
      --@IsActive = '0',
	  --@IsDelete = '1',
      --@UpdatedBy = 'user1',
	  --@CreatedBy = 'user1',
	   @ProdId = '3',
	   @CustId = '2',
	   @quant = '15';
--revert;

select * from Category;
select * from SubCategoryProducts;
select * from Products;
select* from Customer;
select * from Orders;
select * from SalesOrders;
select * from CustomerPaymentDetails;
--select * from CustomerFeedback;
select * from AccountDetails;
--select ProductId,CustomerId,quantity from Orders;

exec insertCustomerPaymentdetails
      -- @IsActive = '0',
	  --@IsDelete = '1',
      --@UpdatedBy = 'user1',
	  --@CreatedBy = 'user1',  
	  @CustomerId = '12',
	  @OrderId = '21',
	  @PayedAmount = '7200',
	   @PaymentMode = 'Cash';
	   --@PaymentMode = 'Upi';
	 --@PaymentMode = 'Credt Card';
	  --@TransactionStatus = '0';

--DROP INDEX index_CustPaymnetDetails ON CustomerPaymentDetails;

--create nonclustered index index_CustPaymnetDetails on CustomerPaymentDetails(OrderId Asc);

exec insertCustomerFeedback
      --@IsActive = '0',
	  --@IsDelete = '1',
      --@UpdatedBy = 'user1',
	  --@CreatedBy = 'user1', 
	  @CustomerId = '7',
	  --@FeedbackStatus = 'Good quality',
	  @FeedbackStatus = 'Good Customer Support',
	  --@FeedbackStatus = 'Best Service',
	  --@FeedbackStatus = 'poor Service',
	  --@FeedbackStatus = 'Bad Managemnet',
	  --@FeedbackStatus = 'Waste of Money',
	  --@FeedbackStatus = 'Nothing',
	  --@ComplainDescription = 'Complain is',
	   --@ComplainDescription = 'Product is not working Properly',
		  @ComplainDescription = 'Product Maintainance is poor';
exec insertSalesOrders
     -- @IsActive = '0',
	  --@IsDelete = '1',
      --@UpdatedBy = 'user1',
	  --@CreatedBy = 'user1', 
	  @productId = '6',
	   @CustomerId = '8',
	   @quantity = '3',
	  -- @ShippingStatus = 'Delivered',
	     @ShippingStatus = 'Shipped',
		  --@ShippingStatus = 'Processing',
	  --@shippingAddress = 'Marine Drive',
	   --@billingAdress = 'Marine Drive';
	   --@shippingAddress = 'andheri',
	   --@billingAdress = 'andheri';
	   @shippingAddress = 'Oak Circle',
	   @billingAdress = 'Oak Circle';
	   --@shippingAddress = '24 Street',
	   --@billingAdress = '24 Street';
	   @shippingAddress = 'Satara',
	    @billingAdress = 'Satara';
	   @shippingAddress = 'Forest',
	   @billingAdress = 'Forest';
--SELECT * FROM Products WHERE ProductId = 11;

select * from CustomerPaymentDetails;
--select * from CustomerFeedback;
select * from AccountDetails;
select * from ExpenseManaging;

SELECT * FROM AccountDetails WHERE AccountId = '56472389';

exec insertAccountDetails
      -- @IsActive = '0',
	  --@IsDelete = '1',
      --@UpdatedBy = 'user1',
	  --@CreatedBy = 'user1', 
	   @accountId = '56472389',
       --@accountId = '53895601',
      -- @accountId = '65217800',
       --@accountId = '45762309',
	  @RecieveAmount = '40000',
	 --@recevieDate = '2024-012-13',
	  @paymentId = '20';

exec insertExpenseManaging
       -- @IsActive = '0',
	  --@IsDelete = '1',
      --@UpdatedBy = 'user1',
	  --@CreatedBy = 'user1', 
	     @AccountId = '56472389',
		 @DebitAmount = '2000';
		 --@DebitDate = '2025-02-23';

EXEC sp_fkeys 'ExpenseManaging';


exec insertEmployees
      -- @IsActive = '0',
	  --@IsDelete = '1',
      --@UpdatedBy = 'user1',
	  --@CreatedBy = 'user1', 
	  @EmpName = 'Amit',
      @EmpRole ='Marketing',
      @EmpAddress = 'Mumbai',
      @EmpEmail = 'amit@email.com',
      @EmpPhoneNo = '6344733401';

/*exec insertPayrollManagement
      -- @IsActive = '0',
	  --@IsDelete = '1',
      --@UpdatedBy = 'user1',
	  --@CreatedBy = 'user1', 
	  @EmpId = '1',
	  --@InTime = '',
	  --@OutTime = '',
	  @workingHour = '8',
	  @attendence = 'Present',
	  --@LeaveStatus = 'no',
	  @Salary = '30000',
	  @DayOfMonth = '25';*/

EXEC insertLeds  
     -- @IsActive = '1',
    -- @IsDelete = '0',
    -- @UpdatedBy = 'user1',
    -- @CreatedBy = 'user1',
    @LeadName = 'Cloud Experts',
    @LeadAddress = 'Mumbai',
    @LeadSource = 'Google Ads',
    @LeadPhoneNo = '9012345678',
    @LeadEmail = 'sales@cloudexperts.com',
    @LeadBudget = '600000',
    @Leadtimeline = '2026-01-10',
    @LeadScore = 'High';

select * from Category;
select * from SubCategoryProducts;
select * from Products;
select* from Customer;
select * from Orders;
select * from SalesOrders;
select * from CustomerPaymentDetails;
select * from CustomerFeedback;
select * from AccountDetails;
select * from ExpenseManaging;
select * from Employees;
select * from Leads;

create proc insertAccountDetails
            @IsActive bit = '1',
		   @IsDelete bit = '0',
		   @CreatedBy varchar(100) = null,
		   @UpdatedBy varchar(100) = null,
		   @accountId int,
		   @RecieveAmount bigint,
		   @recevieDate datetime = null,
		   @paymentId int
as begin
    insert into AccountDetails(IsActive,IsDelete,Created,Updated,AccountId,RecieveAmount,RecieveDate,PaymentId)
	values(@IsActive ,@IsDelete,
		 ISNULL(@CreatedBy,user_name()),
	      isnull(@UpdatedBy,user_name()),
		  @accountId,@RecieveAmount,
		   ISNULL(@recevieDate,getdate()),
		   @paymentId);
end;

alter proc insertExpenseManaging 
         @IsActive bit = '1',
		   @IsDelete bit = '0',
		   @CreatedBy varchar(100) = null,
		   @UpdatedBy varchar(100) = null,
		   @AccountId int,
		   @DebitAmount bigint,
		   @DebitDate datetime = null
as begin
   declare @TotalCredit bigint;
   declare @TotalDebit bigint;
   declare @NewTotal bigint;
   declare @newAmount bigint;
    if @AccountId != all(select AccountId from ExpenseManaging)
	begin
    select @TotalCredit = isnull(sum(RecieveAmount) , 0) from AccountDetails where AccountId = @AccountId;
	select @TotalDebit = ISNULL(sum(DebitAmount),0) from ExpenseManaging where AccountId = @AccountId;
	set @NewTotal = @TotalCredit - (@TotalDebit + @DebitAmount);
	end;
	else 
	   begin
	   select @newAmount = ISNULL(sum(TotalAmount),0) from ExpenseManaging where AccountId = @AccountId;
	   set @NewTotal = @newAmount - @DebitAmount;
	   end;
    insert into ExpenseManaging(IsActive,IsDelete,Created,Updated,AccountId,DebitAmount,DebitDate,TotalAmount)
	values(@IsActive ,
	       @IsDelete,
		 ISNULL(@CreatedBy,user_name()),
	      isnull(@UpdatedBy,user_name()),
		  @AccountId,
		  @DebitAmount,
		  ISNULL(@DebitDate , GETDATE()),
		  @NewTotal);
end;

exec insertAccountDetails
      -- @IsActive = '0',
	  --@IsDelete = '1',
      --@UpdatedBy = 'user1',
	  --@CreatedBy = 'user1', 
	   @accountId = '56472389',
       --@accountId = '53895601',
      -- @accountId = '65217800',
       --@accountId = '45762309',
	  @RecieveAmount = '40000',
	 --@recevieDate = '2024-012-13',
	  @paymentId = '20';

exec insertExpenseManaging
       -- @IsActive = '0',
	  --@IsDelete = '1',
      --@UpdatedBy = 'user1',
	  --@CreatedBy = 'user1', 
	     @AccountId = '53895601',
		 @DebitAmount = '3000';
		 --@DebitDate = '2025-02-23';

select * from AccountDetails;
select * from ExpenseManaging;

create proc insertEmployeeDailyAttendence
           @IsActive bit = '1',
		   @IsDelete bit = '0',
		   @CreatedBy varchar(100) = null,
		   @UpdatedBy varchar(100) = null,
		   @EmployeeId int,
		   @AttendenceDate date,
		   @InTime time = null,
		   @OutTime time = null,
		   @AttendanceStatus VARCHAR(50),
		   @LeaveStatus VARCHAR(50) = null
as begin 
     declare @TotalMinutes int;
	 set @TotalMinutes = DATEDIFF(minute,isnull(@InTime, '9:00'),isnull(@OutTime, '17:00'));
     declare @WorkingHours TIME ;
	 set @WorkingHours = TIMEFROMPARTS(@TotalMinutes / 60,@TotalMinutes % 60,0,0,0);

	 insert into EmployeeDailyAttendence(IsActive,IsDelete,Created,Updated,EmployeeId, AttendenceDate, InTime, OutTime, WorkingHours, AttendanceStatus, LeaveStatus)
    values (@IsActive ,
	       @IsDelete,
		 ISNULL(@CreatedBy,user_name()),
	      isnull(@UpdatedBy,user_name()),
		  @EmployeeId, 
		   @AttendenceDate,
		   isnull(@InTime, '9:00'),
		   isnull(@OutTime, '17:00'),
		   @WorkingHours, 
		   @AttendanceStatus, 
		   isnull(@LeaveStatus,'No Leave'));
end;

exec insertEmployeeDailyAttendence
       -- @IsActive = '0',
	  --@IsDelete = '1',
      --@UpdatedBy = 'user1',
	  --@CreatedBy = 'user1', 
	    @EmployeeId = '2',
		@AttendenceDate ='2025-02-28',
		--@InTime ='10:30',
		--@OutTime ='12:30',
		/*@InTime ='0:00',
		@OutTime ='00:00',
		@AttendanceStatus = 'Holiday';*/
		@AttendanceStatus = 'Present';
		@AttendanceStatus = 'Half-Day';
		@AttendanceStatus = 'Absent';
		@LeaveStatus = 'on Leave';

select * from EmployeeDailyAttendence;

update EmployeeDailyAttendence set  AttendanceStatus = 'Absent', LeaveStatus = 'on Leave' where AttendenceId = 45;

insert into EmployeeDailyAttendence(AttendenceDate ,AttendanceStatus)
 values('4-2-2025','Holiday');



 create proc insertPayrollManagement
           @IsActive bit = '1',
		   @IsDelete bit = '0',
		   @CreatedBy varchar(100) = null,
		   @UpdatedBy varchar(100) = null,
		    @EmployeeId int,
			@BaseSalaryOfOneHour bigint,
			@MonthYear varchar(7)
as begin
		declare	@TotalWorkingHours decimal(5,2);
         declare @TotalLeaveDays int;
          declare @TotalSalary bigint;
		  

		  set @TotalWorkingHours = (select 
		                           isnull(sum(DATEPART(HOUR, WorkingHours) + (DATEPART(MINUTE, WorkingHours) / 60.0)),0 )from EmployeeDailyAttendence
								   where EmployeeId = @EmployeeId and AttendanceStatus In ('present', 'Half-Day'));

          set @TotalLeaveDays = (select COUNT(AttendenceId) from EmployeeDailyAttendence  
		                  where EmployeeId = @EmployeeId and LeaveStatus = 'on Leave');

          set @TotalSalary = @BaseSalaryOfOneHour * @TotalWorkingHours;
  insert into PayrollManagement(IsActive,IsDelete,Created,Updated,EmployeeId,TotalWorkingHours,TotalLeaveDays,TotalSalary,MonthYear)
   values(@IsActive ,
	       @IsDelete,
		   ISNULL(@CreatedBy,user_name()),
	      isnull(@UpdatedBy,user_name()),
		  @EmployeeId, 
		  @TotalWorkingHours,
		  @TotalLeaveDays,
		  @TotalSalary,
		  @MonthYear);
end;
 
exec insertPayrollManagement
      -- @IsActive = '0',
	  --@IsDelete = '1',
      --@UpdatedBy = 'user1',
	  --@CreatedBy = 'user1', 
	  @EmployeeId  = '2', 
	  @BaseSalaryOfOneHour = '500',
		  @MonthYear = '2025-02';

select * from Category;
select * from SubCategoryProducts;
select * from Products;
select* from Customer;
select * from Orders;
select * from SalesOrders;
select * from CustomerPaymentDetails;
select * from CustomerFeedback;
select * from AccountDetails;
select * from ExpenseManaging;
select * from Employees;
select * from Leads;
select * from EmployeeDailyAttendence;
select * from PayrollManagement;

alter proc update_table
     @TableName varchar(50),
	 @PrimaryKey varchar(50),
	 @PrimaryKeyValue int
as begin
     declare @SqlQuery Nvarchar(max);
	 begin
	 set @SqlQuery = 'update ' + @TableName + 
	      ' set Updated = User_name(),
		    UpdatedDateTime = getdate() where ' + @PrimaryKey + ' = ' + cast(@PrimaryKeyValue as Nvarchar) ;
	 exec sp_executesql @SqlQuery;
	 end;
end;

execute as user = 'user4'
update Products set StockQuantity = '50' where ProductId = 7
exec update_table Products,ProductId,7;
revert;

--exec sp_rename 'SalesOrders.quantity','Quantity','COLUMN';

select P.ProductName,C.CategoryName,S.SubCategoryName ,Cu.CustomerName,
O.Quantity as OrderQuantity ,So.Quantity as SalesQuantity ,
So.ShippingStatus,CP.PayedAmount,CP.PaymentMode,CF.FeedbackStatus
from Products P
inner join Category C on P.CategoryId = C.CategoryId
inner join SubCategoryProducts S on S.CategoryId = C.CategoryId 
inner join Orders O on P.ProductId = O.ProductId
inner join Customer Cu on O.CustomerId = Cu.CustomerId
inner join SalesOrders So on (Cu.CustomerId = So.CustomerId and P.ProductId = So.ProductId)
inner join CustomerPaymentDetails CP 
on (O.CustomerId = CP.CustomerId and O.OrderId = CP.OrderId and CP.TransactionStatus = 1)
left join CustomerFeedback CF on O.CustomerId = CF.CustomerId
order by ProductName asc;

--delete from CustomerFeedback where CfId = 2;


create table #temptableOrderdetails(ProductId int,CustomerId int,Quantity int,ShippingStatus varchar(50));

insert into #temptableOrderdetails(ProductId ,CustomerId ,Quantity ,ShippingStatus)
select O.ProductId as ProductId ,
	   O.CustomerId as CustomerId  ,
	   O.Quantity,
	   S.ShippingStatus as ShippingStatus
from Orders O inner join CustomerPaymentDetails CP
	   on CP.OrderId = O.OrderId and CP.TransactionStatus = 1
	   inner join SalesOrders S on O.CustomerId = S.CustomerId and O.ProductId = S.ProductId;

select * from #temptableOrderdetails;


If exists((select IsActive , IsDelete from SalesOrders where IsActive = 1 and IsDelete = 0))
	begin
	(select distinct
         P.ProductName ,
	     P.StockQuantity,
		 Ca.CategoryName,
	     C.CustomerName,  
	     C.CustomerPhoneNo,
	     S.ShippingStatus,
	     CP.PayedAmount,
	     CP.PaymentMode,
		 O.Quantity as OrderQuantity,
		 A.AccountId,
	     CF.FeedbackStatus
     from #temptableOrderdetails tp
     inner join Products P on P.ProductId = tp.ProductId
     left join Customer C  on tp.CustomerId =C.CustomerId
      inner join SalesOrders S on S.CustomerID =tp.CustomerID
	  LEFT join Category Ca on Ca.CategoryId = P.CategoryId
	  left join Orders O on tp.ProductId = O.ProductId
      left join CustomerPaymentDetails CP on S.CustomerId  = CP.CustomerId 
	  inner join AccountDetails A on A.PaymentId = CP.PaymentId
       left join CustomerFeedback CF on CF.CustomerId = S.CustomerId);

            if exists(select TransactionStatus from CustomerPaymentDetails where TransactionStatus = 0 and PaymentMode = 'UPI')
			 begin
		       print('Transaction is failed') 
			   (select distinct
						 P.ProductName ,
						 P.StockQuantity,
						 S.Quantity AS SalesOrderQuantity,
						 C.CustomerName,
						 C.CustomerPhoneNo,
						 S.ShippingStatus,
						 CP.PayedAmount,
						 CP.PaymentMode,
						 CF.FeedbackStatus
					 from #temptableOrderdetails tp
					 inner join Products P on P.ProductId = tp.ProductId
					 left join Customer C  on tp.CustomerId =C.CustomerId
					  inner join SalesOrders S on S.CustomerID =tp.CustomerID
					  right join CustomerPaymentDetails CP on CP.CustomerId  = S.CustomerId 
					   left join CustomerFeedback CF on CF.CustomerId = tp.CustomerId);
					   if not exists (select TransactionStatus from CustomerPaymentDetails where TransactionStatus = 0 and PaymentMode = 'Credit Card')
					        print('Transaction is fail due to credir card is failed')
						else
						  print('Done')
			   end;
		end;
if exists((select IsActive , IsDelete from SalesOrders where IsActive = 0 and IsDelete = 1))
        begin
	      print('data is not Active')
		  (select * from Customer)
		end;
	 else 
	      print('Nothing')
		  select * from Products;



 select distinct
         P.ProductName ,
	     P.StockQuantity,
		 Ca.CategoryName,
	     C.CustomerName,  
	     C.CustomerPhoneNo,
	     S.ShippingStatus,
		case
		     when CP.TransactionStatus =1 
		         then CP.PayedAmount
		      else 0
		 end AS PayedAmount,
		case
		     when CP.TransactionStatus =1 
		         then CP.PaymentMode
		      else 'Not paid'
		 end AS PaymentMode,
		 O.Quantity as OrderQuantity,
		 A.AccountId,
	     CF.FeedbackStatus
     from #temptableOrderdetails tp
       inner join Products P on P.ProductId = tp.ProductId
       left join Customer C  on tp.CustomerId =C.CustomerId
       inner join SalesOrders S on S.CustomerID =tp.CustomerID
	   LEFT join Category Ca on Ca.CategoryId = P.CategoryId
	   left join Orders O on tp.ProductId = O.ProductId
       left join CustomerPaymentDetails CP on S.CustomerId  = CP.CustomerId 
	   inner join AccountDetails A on A.PaymentId = CP.PaymentId
       left join CustomerFeedback CF on CF.CustomerId = S.CustomerId;

select 
       C.CustomerName,
       C.CustomerAddress,
	   P.ProductName,
	   Cat.CategoryName,
	   SP.SubCategoryName,
	   /* case   
		   when SO.CustomerId=.CustomerId and SO.ProductId =SO.ProductId
		         then sum(SO.Quantity)
				    else 0
				end AS Quantity,*/
		SO.ShippingStatus,
	     /*case
		      when CPD.TransactionStatus =1
			     then 
			        'PayedAmount ' + CPD.PayedAmount + ' PaymentMode ' + CPD.PaymentMode
			   else 'not paid'
			  end AS PaymentDetails,*/
        case
		     when CPD.TransactionStatus =1 
		         then sum(CPD.PayedAmount)
		      else 0
		 end AS PayedAmount,
		case
		     when CPD.TransactionStatus =1 
		         then CPD.PaymentMode
		      else 'Not paid'
		 end AS PaymentMode,
	   CF.FeedbackStatus,
	   AD.AccountId,
	   sum(AD.RecieveAmount) as RecieveAmount
	from Customer C
	left join Orders O on C.CustomerId =O.CustomerId and O.IsActive = 1 and O.IsDelete = 0
	left join Products P on O.ProductId =  P.ProductId 
	inner join Category Cat on Cat.CategoryId = P.CategoryId
	left join SubCategoryProducts SP on  P.SubCategoryId= SP.CategoryId 
	left join SalesOrders SO on C.CustomerId= SO.CustomerId and SO.IsActive = 1 and SO.IsDelete = 0
	inner join CustomerPaymentDetails CPD on C.CustomerId = CPD.CustomerId
	left join CustomerFeedback CF on C.CustomerId =CF.CustomerId
	right join AccountDetails AD on AD.PaymentId = CPD.PaymentId
	where C.IsActive = 1 and C.IsDelete = 0
	group by C.CustomerName,C.CustomerAddress,P.ProductName,Cat.CategoryName,SP.SubCategoryName,
	SO.ShippingStatus,CPD.PaymentMode,CF.FeedbackStatus,AD.AccountId,CPD.TransactionStatus

if exists(select 1 from SalesOrders SO where SO.IsActive = 1 and SO.IsDelete = 0)
      begin 
	     select 
       C.CustomerName,
       C.CustomerAddress,
	   P.ProductName,
	   Cat.CategoryName,
	   SP.SubCategoryName,
		SO.ShippingStatus,
	  max(CPD.PayedAmount) as PayedAmount,
		case when CPD.PaymentMode = 'Credit card'
		      then 'Credit Card is used'
			  else CPD.PaymentMode
		     end as PaymentMode,
	   CF.FeedbackStatus,
	    case 
		    when AD.AccountId = 56472389 
			  then AD.AccountId
			  else '0'
			 end AS AccountId,
	
	   sum(AD.RecieveAmount) as RecieveAmount

			from Customer C
			left join Orders O on C.CustomerId =O.CustomerId
			 inner join Products P on O.ProductId =  P.ProductId 
			inner join Category Cat on Cat.CategoryId = P.CategoryId
			left join SubCategoryProducts SP on  Cat.CategoryId= SP.CategoryId 
			left join SalesOrders SO on C.CustomerId= SO.CustomerId
			inner join CustomerPaymentDetails CPD on C.CustomerId = CPD.CustomerId
			left join CustomerFeedback CF on C.CustomerId =CF.CustomerId
			right join AccountDetails AD on AD.PaymentId = CPD.PaymentId
			group by C.CustomerName,C.CustomerAddress,P.ProductName,Cat.CategoryName,SP.SubCategoryName,
			SO.ShippingStatus,CPD.PaymentMode,CF.FeedbackStatus,AD.AccountId,CPD.TransactionStatus
         end;

use msdb
go

exec sp_add_job @job_name = 'erpcrm job1';

exec sp_add_jobstep @job_name = 'erpcrm job1',
                     @step_name = 'erpstep',
					 @SubSystem =Tsql,
					 @Database_name = 'Erp-Crm',
					 @command = 'update Orders set Quantity= Quantity + 1,
					            UpdatedDateTime = getdate() where OrderId = 5';
exec sp_add_jobserver @job_name = 'erpcrm job1';

exec sp_update_jobstep   @step_name = 'erpstep',
                          @step_id = 1,
						  @job_name = 'erpcrm job1',
                         @command = 'update Orders set Quantity= Quantity + 1,
					            UpdatedDateTime = getdate() where OrderId = 6';


exec sp_add_job @job_name = 'insert subcategory';       

exec sp_add_jobstep @step_name = 'insert data',
                     @job_name = 'insert subcategory',
					 @SubSystem = tsql,
					 @Database_name = 'Erp-Crm',
					 @command = 'select C.CustomerName,P.ProductName,
					         sum(O.Quantity) as OrderedQuantity
							   from Customer C 
							   inner join Orders O on O.CustomerId = C.CustomerId
							   inner join Products P on P.ProductId =O.ProductId
							   group by C.CustomerName,P.ProductName';

exec sp_update_jobstep @step_name = 'insert data',
                       @step_id = '1',
					   @job_name = 'insert subcategory',
					   @output_file_name = 'C:\data\newreportdata';

exec sp_update_job @job_name = 'insert subcategory',
                    @notify_level_email = 1,
					@notify_email_operator_name = 'dba_admin';


exec sp_add_jobSchedule @name = 'jobexecute',
                        @freq_type = '16',
						 @job_name = 'insert subcategory',
						 @freq_interval = '16',
						 @freq_recurrence_factor = '1';


exec sp_add_jobserver  @job_name = 'insert subcategory';

exec sp_start_job @job_name = 'insert subcategory';
exec sp_stop_job @job_name = 'insert subcategory';

create proc JobInsertData 
                             @IsActive bit = '1',
							 @IsDelete bit = '0',
							 @CreatedBy varchar(100) = null,
							 @UpdatedBy varchar(100) = null,
							 @subCatdescription text = 'it is new added category'
					as begin 
					set nocount on;

					    declare @counter int = 0
					    declare  @CatId int
					    declare @i int = (select top 1 SubCategoryId from SubCategoryProducts order by SubCategoryId desc);
					    declare @subCatName varchar(266);

						while @counter < 3
						  begin
						set @subCatName = 'subCat'+ CAST(@i as varchar(10));
						print(@subCatName)

						set @CatId = (select top 1 CategoryId from Category order by NEWID())

						 insert into SubCategoryProducts(IsActive,IsDelete,created,updated,SubCategoryName,SubCatDescription,CategoryId)
						 values(@IsActive,@IsDelete,
						      ISNULL(@CreatedBy,user_name()),
							  isnull(@UpdatedBy,user_name()),
							  @subCatName ,@subCatdescription,@CatId);

							  set @i = @i + 1;
							  set @counter = @counter + 1;
                        end;
end;

exec JobInsertData ;

exec sp_add_job @job_name = 'insertDataSubCat',
                 @notify_level_email = '1',
				 @notify_email_operator_name = 'dba_admin';

exec sp_add_jobstep @step_name = 'InsertData',
                 @job_name = 'insertDataSubCat',
				 @command='exec JobInsertData ',
				 @output_file_name = 'C:\data\InsertSubCatData';

exec sp_add_jobschedule @schedule_id = 14,
                        @job_name = 'insertDataSubCat';

exec sp_start_job @job_name = 'insertDataSubCat';

alter proc SetOrderDetails 
           as begin 
			  declare @CreateTime dateTime = getdate();		  
	               update Orders set IsActive = 0, IsDelete = 1,UpdatedDateTime = GETDATE()
				      where Month(CreatedDateTime) < month(@CreateTime);
			end;
         
exec SetOrderDetails;

update Orders set IsActive = 1, IsDelete = 0,UpdatedDateTime = GETDATE();

create proc SetSalesOrderDetails 
             as begin 
			     declare @CreateTime datetime = getdate();
				        update SalesOrders set IsActive = 0 , IsDelete = 1 , UpdatedDateTime = GETDATE()
						       where MONTH(CreatedDateTime) < MONTH(@CreateTime);
			 end;
exec SetSalesOrderDetails;

exec sp_add_job @job_name = 'PastOrderStatusUpdate',
                 @notify_level_email = '1',
				 @notify_email_operator_name = 'dba_admin';

exec sp_add_jobstep @step_name = 'PastDataStatus',
                    @database_name = 'Erp-Crm',
					@job_name = 'PastOrderStatusUpdate',
					@command = 'exec SetOrderDetails
					            exec SetSalesOrderDetails';

exec sp_add_schedule @schedule_name = 'MonthlyStatusUpdate',
					 @freq_type = '16',
					 @freq_interval = '16',
					 @freq_recurrence_factor = '1';

exec sp_attach_schedule @schedule_name = 'MonthlyStatusUpdate',
                         @job_name = 'PastOrderStatusUpdate';

exec sp_add_jobserver @job_name = 'PastOrderStatusUpdate';

exec sp_start_job @job_name = 'PastOrderStatusUpdate';

alter proc PastAttendenceEmploye
              as begin 
			     declare @CreateTime datetime = getdate();
			     select COUNT(ED.AttendenceId) as TotalAttendenceInPastMonth , E.EmployeeName   
						                         from EmployeeDailyAttendence ED
						                         join Employees E on E.EmployeeId = ED.EmployeeId
						                        where MONTH(ED.CreatedDateTime) < MONTH(@CreateTime) 
												and ED.AttendanceStatus in ('Present','Half-Day')
												group by E.EmployeeName;

			end;

exec PastAttendenceEmploye;

create function customerdata(@customerCount int)
 returns int 
 as
    begin
	  declare @count int
	  select @count = count(C.CustomerName) from Customer C join Orders O on O.CustomerId = C.CustomerId
	  return @count
	end;

select dbo.customerdata(0) as totalCustomersOrders;

create function LeadScoredata()
  returns table
  as
    return 
	   (select LeadName , LeadPhoneNo from Leads where LeadScore = 'High');

select * from dbo.LeadScoredata();
     
alter function CustomerOrderDetails(@CustomerId int)
returns table
as 
    return
	 (select C.CustomerName , C.CustomerAddress , P.ProductName , O.Quantity as orderQuantity
	 from Customer c 
	 inner join Orders O on O.CustomerId = C.CustomerId
	 inner join Products P on O.ProductId = P.ProductId
	 where O.CustomerId = @CustomerId);

select * from CustomerOrderDetails(10);

alter function getOrderByCustomer(@OrderId int)
returns @Orders table (OrderId int primary key, OrderDate date, Amount decimal(12,0))
as
   begin
      insert into @Orders
	   select O.OrderId , O.CreatedDateTime as OrderDate , P.PayedAmount as TotalAmount
	   from Orders O 
	   inner join  CustomerPaymentDetails P on P.OrderId = O.OrderId
	   where P.TransactionStatus = 1 and O.OrderId =@OrderId
	  return
	end;

select * from dbo.getOrderByCustomer(2);

select C.CustomerName , P.ProductName , O.Quantity ,G.Amount
from Customer C 
inner join Orders O on O.CustomerId = C.CustomerId
inner join dbo.getOrderByCustomer(2) as G on O.OrderId = G.OrderId
inner join Products P on P.ProductId = O.ProductId;

select * from (select * from dbo.getOrderByCustomer(2)) as E;

alter proc getCustomerdata 
as begin
      select C.CustomerName , P.ProductName , O.Quantity ,Pd.PayedAmount
		from Customer C 
		inner join Orders O on O.CustomerId = C.CustomerId
	    inner join  CustomerPaymentDetails Pd on Pd.OrderId = O.OrderId
		inner join Products P on P.ProductId = O.ProductId
		where Pd.PayedAmount > (select Amount from dbo.getOrderByCustomer(2))
		
	end;

exec getCustomerdata;

create proc getCustomerdata2 @id int
as begin
      declare @amount int
	  set @amount = (select Amount from dbo.getOrderByCustomer(@id))
      select C.CustomerName , P.ProductName , O.Quantity ,Pd.PayedAmount
		from Customer C 
		inner join Orders O on O.CustomerId = C.CustomerId
	    inner join  CustomerPaymentDetails Pd on Pd.OrderId = O.OrderId
		inner join Products P on P.ProductId = O.ProductId
		where Pd.PayedAmount > @amount
		
	end;

exec getCustomerdata2 @id = 10;

alter function getEmployeedata(@empid int)
returns @details table(EmployeeName varchar(50),EmployeeRole varchar(50),EmployeeSalary bigint , EmplpyeeLeave int)
as begin
      insert into @details
	  select E.EmployeeName,E.EmployeeRole , P.TotalSalary , P.TotalLeaveDays
	  from Employees E
	  inner join PayrollManagement P on P.EmployeeId = E.EmployeeId
	  where E.EmployeeId = @empid
	  return
 end;

 select * from dbo.getEmployeedata(2);


alter function getPayedAmountByCustomer(@CustomerId int)
returns table 
as
   return
	   select sum(P.PayedAmount) as TotalAmount , C.CustomerName
	   from Customer C 
	   inner join  CustomerPaymentDetails P on  P.CustomerId = C.CustomerId 
	   where C.CustomerId = @CustomerId and P.TransactionStatus = 1
	   group by C.CustomerName ;
	
select * from dbo.getPayedAmountByCustomer(6);

create view MaxProduct as 
select count(S.ProductId) as TotalCount , P.ProductId ,Sum(S.Quantity) as TotalQuantity from SalesOrders S
inner join Products P on P.ProductId = S.ProductId
group by P.ProductId;


create function findMaxSaleOfProduct()
returns table 
as 
   return
    (select P.ProductName from Products P 
			inner join dbo.MaxProduct M on M.ProductId = P.ProductId
			where M.TotalCount = (select Max(TotalCount) from dbo.MaxProduct));


select * from dbo.findMaxSaleOfProduct() as NameOfProduct;

declare @date int;
set @date = (select MONTH(CreatedDateTime) from Orders )

if((@date = 2))
   select * from Orders;

if exists(select 1 from Orders where MONTH(CreatedDateTime) = 2)
   select * from Orders;
else
   print('not order in this month');

select * from getPayedAmountByCustomer(2);
select * from CustomerOrderDetails(2);
select * from getOrderByCustomer(4);
select * from Orders;

create table #tempdata(
                        OrderId int ,
                        OrderDate date,
						CustomerName varchar(50),
						ProductName varchar(50),
						PayedAmount bigint);



insert into #tempdata (OrderId,OrderDate,CustomerName,ProductName,PayedAmount)
	select O.OrderId as OrderId,
			cast(O.CreatedDateTime As date) as OrderDate ,
			C.CustomerName as CustomerName,
			P.ProductName as ProductName,
			(select Amount from dbo.getOrderByCustomer(O.OrderId)) as PayedAmount
			from Orders O
			inner join Customer C on C.CustomerId = O.CustomerId
			inner join Products P on P.ProductId = O.ProductId
			where MONTH(O.CreatedDateTime) = 2
	                        
select * from #tempdata;

create procedure get_detailed_order_report
    @customer_name nvarchar(50) = null,
    @start_date date = null,
    @end_date date = null,
    @min_amount decimal(12,2) = 0,
    @category_name nvarchar(255) = null
as
begin
    set nocount on;

    with customer_cte as (
        select 
            c.CustomerId,
            c.CustomerName,
            c.CustomerEmail,
            c.CustomerPhoneNo
        from customer c
        where (@customer_name is null or c.CustomerName like '%' + @customer_name + '%')
    ),
    
    product_cte as (
        select 
            p.ProductId,
            p.ProductName,
            p.StockQuantity,
            c.CategoryName,
            sc.SubCategoryName
        from products p
        inner join category c on p.CategoryId = c.CategoryId
        inner join SubCategoryProducts sc on p.SubCategoryId = sc.SubCategoryId
        where (@category_name is null or c.CategoryName = @category_name)
    ),
    
    order_cte as (
        select 
            o.OrderId,
            o.CustomerId,
            o.ProductId,
            o.quantity,
            o.CreatedDateTime as order_date
        from orders o
        where (@start_date is null or o.CreatedDateTime >= @start_date)
          and (@end_date is null or o.CreatedDateTime <= @end_date)
    ),
    
    payment_cte as (
        select 
            p.PaymentId,
            p.OrderId,
            p.PayedAmount,
            p.PaymentMode,
            p.TransactionStatus
        from CustomerPaymentDetails p
        where p.TransactionStatus = 1
          and p.PayedAmount >= @min_amount
    )

    select 
        c.CustomerName,
        c.CustomerEmail,
        c.CustomerPhoneNo,
        o.OrderId,
        o.order_date,
        p.ProductName,
        p.CategoryName,
        p.SubCategoryName,
        o.quantity,
        pay.PayedAmount,
        pay.PaymentMode,
        case 
            when pay.TransactionStatus = 1 then 'successful'
            else 'failed'
        end as transaction_status
    from order_cte o
    inner join customer_cte c on o.CustomerId = c.CustomerId
    inner join product_cte p on o.ProductId = p.ProductId
    inner join payment_cte pay on o.OrderId = pay.OrderId
    order by o.order_date desc;
end;


-- third part 
create table UserMst (
             UserId int  primary key identity(1,1), 
			 UserName Nvarchar(100),
			 --UserEmail Nvarchar(50),
			 UserphoneNo decimal(10,0));

alter table UserMst drop column UserEmail;

alter table UserMst
alter column UserName Nvarchar(100) not null;

alter table UserMst
alter column UserPhoneNo bigint ;

alter table UserMst
add constraint uq_phone unique (UserPhoneNo) ;

create table RoleMst(
             --RoleId uniqueidentifier primary key default newid(),
			 RoleId int  primary key identity(1,1),
			 RoleName varchar(50));

alter table RoleMst
alter column RoleName varchar(50) not null;

create table ModuleMst(
              ModuleId int primary Key identity(1,1),
			  ModuleName Varchar(50));

alter table ModuleMst
alter column ModuleName varchar(50) not null;

create table RoleModule(
             RoleModuleId int Primary Key identity(1,1),
			 RoleId int ,
			 ModuleId int,
			 foreign key (RoleId) references RoleMst(RoleId),
			 foreign key (ModuleId) references ModuleMst(ModuleId));


create table USerRole(
             UserRoleId int Primary Key identity(1,1),
			 UserId int ,
			 RoleID int,
			 foreign key (RoleId) references RoleMst(RoleId),
			 foreign key (UserId) references UserMst(UserId));
			 --constraint us_role unique (UserId ,RoleId));

alter proc InsertUserMaster @UserName Nvarchar(100) ,
                             @UserPhoneNo bigint
				as begin
				   if not exists (select UserName from UserMst where UserName = @UserName)
				   begin
				   insert into  UserMst(UserName,UserphoneNo)
				        Values (@UserName,@UserPhoneNo)
					end
					else print('not iserted data')
				end

exec InsertUserMaster @UserName = 'xyz' ,@UserPhoneNo = 98662458223;

select * from UserMst;

create proc insertRoleMst
           @roleName varchar(50)
as begin
       if not exists(select 1 from RoleMst where RoleName = @roleName)
       insert into RoleMst(RoleName)
	    values(@roleName)
end

exec insertRoleMst 'Employee';

select * from RoleMst;

create proc insertModuleMst 
		@ModuleName varchar(50)
	as begin
			   if not exists(select 1 from ModuleMst where ModuleName = @ModuleName)
			   insert into ModuleMst(ModuleName)
				values(@ModuleName)
end

exec insertModuleMst 'DepartmentList';

select * from ModuleMst;

alter proc insertRoleModule @RoleId int ,
			 @ModuleId int
as begin
         if not exists(select 1 from RoleModule where
		              RoleId = @RoleId and ModuleId = @ModuleId)
		begin
        insert into RoleModule(RoleId,ModuleId)
		values(@RoleId, @ModuleId )
		end
end

exec insertRoleModule 3,2;

select * from RoleModule

alter proc insertUserRole
             @UserId int ,
			 @RoleID int
as begin 
        if @RoleID != 1 and @RoleID != 2
		 begin
		    if not exists(select 1 from USerRole where
		              RoleId = @RoleId and UserId = @UserId)
					  begin
					     insert into USerRole(UserId,RoleID)
						 values(@UserId,@RoleID)
						end
		   else
		     print('already exist data')
		  end
		else 
		   begin 
		      if not exists(select 1 from USerRole where RoleID =@RoleID )
			  begin
			   if not exists(select 1 from USerRole Where UserId = @UserId)
			       begin
				      insert into USerRole(UserId,RoleID)
						 values(@UserId,@RoleID)
					end
				else print('user is already exist with this role')
			   end
			  else 
			    print('Not valid role and user')
			end
end

 exec insertUserRole  @UserId = 6 ,@RoleID = 4;
 select * from USerRole;
 delete  from USerRole where RoleID = 2;

 /*create proc get_listUserRole
    @userid int
as begin 
       if (@userid is null  or @userid = 0)
	     begin 
		     select distinct UM.UserName,R.RoleName,
			 STUFF(
			   (
			     select 
				 ','+ ModuleName from ModuleMst  
				 where M.ModuleId = RM.ModuleId
				 for XML path('')) ,1,1,'') as ModuleName
			 from UserMst UM
			 join USerRole UR on UM.UserId = UR.UserId
			 left join RoleMst R on UR.RoleID = R.RoleId
			 left join RoleModule RM on RM.RoleId = R.RoleId
			 left join ModuleMst M on M.ModuleId = RM.ModuleId
		  end
		else
		   begin
		     select UM.UserName,R.RoleName,STRING_AGG( ModuleName , ',') as ModuleName
			 from UserMst UM
			 join USerRole UR on UM.UserId = UR.UserId
			 left join RoleMst R on UR.RoleID = R.RoleId
			 left join RoleModule RM on RM.RoleId = R.RoleId
			 left join ModuleMst M on M.ModuleId = RM.ModuleId
			-- where UM.UserId = @userid
			 group by UM.UserName,R.RoleName
		   end
end*/

alter proc get_listUserRole
    @userid int null = null
as begin 
       if (@userid is null  or @userid = 0)
	     begin
		    select UM.UserName,UM.UserId,R.RoleName,R.RoleId
			 from UserMst UM
			 join USerRole UR on UM.UserId = UR.UserId
			 left join RoleMst R on UR.RoleID = R.RoleId
			 left join RoleModule RM on RM.RoleId = R.RoleId
			 left join ModuleMst M on M.ModuleId = RM.ModuleId
			 group by  UM.UserName,UM.UserId,R.RoleName,R.RoleId

			 select M.ModuleName ,M.ModuleId ,UM.UserId
			 from ModuleMst M 
			 left join RoleModule RM on M.ModuleId = RM.ModuleId
			 left join USerRole Ur on  RM.RoleId = Ur.RoleID
			 left join UserMst UM on UM.UserId = Ur.UserId
			 order by UM.UserId asc

		  end
		else
		   begin
		     select UM.UserName,UM.UserId,R.RoleName,R.RoleId
			 from UserMst UM
			 left join USerRole UR on UM.UserId = UR.UserId
			 left join RoleMst R on UR.RoleID = R.RoleId
			 left join RoleModule RM on RM.RoleId = R.RoleId
			where UM.UserId = @userid
			 group by UM.UserName,UM.UserId,R.RoleName,R.RoleId

			 select M.ModuleName ,M.ModuleId 
			 from ModuleMst M 
			 left join RoleModule RM on M.ModuleId = RM.ModuleId
			 left join USerRole Ur on  RM.RoleId = Ur.RoleID
			 left join UserMst UM on UM.UserId = Ur.UserId
			 where UM.UserId = @userid
		   end

end

execute get_listUserRole @userid = '2' ;




create table ModuleMst2 (
     Id int primary key identity(1,1),
	 NameOfModule Varchar(50) ,
	 ParentId int)

alter table ModuleMst2 drop constraint uk_id ;
alter table ModuleMst2 add constraint uk_id unique(NameOfModule,ParentId) ;

alter proc insertModuleMst2 
@NameOfModule Varchar(50),
@ParentId int = 0 
as begin 
      --declare @parentid2 int 
	 -- set @parentid2 = (select Id from ModuleMst2 where ParentId = '0')
     
     if exists(select 1 from ModuleMst2 where Id = @ParentId)
	    begin
	    insert into ModuleMst2 (NameOfModule ,ParentId)
		 values (@NameOfModule ,@ParentId)
		 end
     else 
	    insert into ModuleMst2 (NameOfModule,ParentId )
		 values (@NameOfModule,0)
end

exec insertModuleMst2 @NameOfModule = 'Delete dept',@ParentId  = 11;

select * from ModuleMst2 order by Id Asc;
delete from ModuleMst2 where ID=16;


create proc get_listOfModule 
      @Userid int null = null
as begin
      if (@userid is null  or @userid = 0)
	     begin
		    select UM.UserName,UM.UserId,R.RoleName,R.RoleId
			 from UserMst UM
			 join USerRole UR on UM.UserId = UR.UserId
			 left join RoleMst R on UR.RoleID = R.RoleId
			 left join RoleModule RM on RM.RoleId = R.RoleId
			 left join ModuleMst M on M.ModuleId = RM.ModuleId
			 group by  UM.UserName,UM.UserId,R.RoleName,R.RoleId;

			 select M.ModuleName ,M.ModuleId ,UM.UserId
			 from ModuleMst M 
			 left join RoleModule RM on M.ModuleId = RM.ModuleId
			 left join USerRole Ur on  RM.RoleId = Ur.RoleID
			 left join UserMst UM on UM.UserId = Ur.UserId
			 order by UM.UserId asc;

			  select M2.NameOfModule as ParentModulename,M2.ParentId ,UM.UserId,M2.Id
			 from  ModuleMst2 M2
			 left join ModuleMst M on M.ModuleName = M2.NameOfModule 
			 left join RoleModule RM on M.ModuleId = RM.ModuleId
			 left join USerRole Ur on  RM.RoleId = Ur.RoleID
			 left join UserMst UM on UM.UserId = Ur.UserId
			 where ParentId = 0 
			 order by Id asc;
			 
			 with ParentModule as (
  			 select M2.NameOfModule as ParentModulename,M2.ParentId ,UM.UserId
			 from  ModuleMst2 M2
			 left join ModuleMst M on M.ModuleName = M2.NameOfModule 
			 left join RoleModule RM on M.ModuleId = RM.ModuleId
			 left join USerRole Ur on  RM.RoleId = Ur.RoleID
			 left join UserMst UM on UM.UserId = Ur.UserId
			 where ParentId = 0 
			 )
			 
				 select M3.NameofModule as childModule,M3.ParentId as IdOfParentModule
				  from ModuleMst2 M3
				where M3.ParentId in (select Id from ModuleMst2
								   where NameOfModule in (select ParentModulename from ParentModule)
			
								 )
				order by M3.ParentId asc
				 

		  end
		else
		   begin
		     select UM.UserName,UM.UserId,R.RoleName,R.RoleId
			 from UserMst UM
			 left join USerRole UR on UM.UserId = UR.UserId
			 left join RoleMst R on UR.RoleID = R.RoleId
			 left join RoleModule RM on RM.RoleId = R.RoleId
			where UM.UserId = @userid
			 group by UM.UserName,UM.UserId,R.RoleName,R.RoleId;

			 select M.ModuleName ,M.ModuleId 
			 from ModuleMst M 
			 left join RoleModule RM on M.ModuleId = RM.ModuleId
			 left join USerRole Ur on  RM.RoleId = Ur.RoleID
			 left join UserMst UM on UM.UserId = Ur.UserId
			 where UM.UserId = @userid;

			 select M2.NameOfModule as ParentModulename,M2.ParentId ,UM.UserId,M2.Id
			 from  ModuleMst2 M2
			 left join ModuleMst M on M.ModuleName = M2.NameOfModule 
			 left join RoleModule RM on M.ModuleId = RM.ModuleId
			 left join USerRole Ur on  RM.RoleId = Ur.RoleID
			 left join UserMst UM on UM.UserId = Ur.UserId
			 where ParentId = 0 and UM.UserId = @Userid
			 order by Id asc;
			 
			 with ParentModule as (
  			 select M2.NameOfModule as ParentModulename,M2.ParentId ,UM.UserId
			 from  ModuleMst2 M2
			 left join ModuleMst M on M.ModuleName = M2.NameOfModule 
			 left join RoleModule RM on M.ModuleId = RM.ModuleId
			 left join USerRole Ur on  RM.RoleId = Ur.RoleID
			 left join UserMst UM on UM.UserId = Ur.UserId
			 where ParentId = 0 and UM.UserId =@Userid
			 )
			 
				 select M3.NameofModule as childModule,M3.ParentId as IdOfParentModule
				  from ModuleMst2 M3
				
				where M3.ParentId in (select Id from ModuleMst2
								   where NameOfModule in (select ParentModulename from ParentModule)
			
								 )
				order by M3.ParentId asc
				 

		   end
 end  
   
exec get_listOfModule @Userid = '5';

exec get_listOfModule @Userid = '7';

select * from ModuleMst;
select * from RoleMst;
select * from UserMst;
select * from RoleModule;
select * from USerRole;
select * from ModuleMst2 order by Id asc;

update ModuleMst2 set NameOfModule = 'Customerlist' where NameOfModule= 'userdata'

alter proc insertdataalltable 
	@ModuleName varchar(50),
	@rolename varchar(50),
	@Username varchar(50),
	@phoneno bigint,
	@NameOfModule Varchar(50),
    @ParentId int = 0 
as begin 
     declare @UserId int
	 declare @RoleId int
	 declare @ModuleId int


       if not exists (select UserName from UserMst where UserName = @UserName)
				   begin
				   insert into  UserMst(UserName,UserphoneNo)
				        Values (@UserName,@phoneno)
					end
					else print('not iserted data');

        if not exists(select 1 from RoleMst where RoleName = @roleName)
			   insert into RoleMst(RoleName)
				values(@roleName);

		 if not exists(select 1 from ModuleMst where ModuleName = @ModuleName)
			   insert into ModuleMst(ModuleName)
				values(@ModuleName);

        select @UserId = UserId from UserMst where UserName = @Username;

		select @RoleId = RoleId from RoleMst where RoleName =@rolename;

         if @RoleID != 1 and @RoleID != 2 
		 begin
		    if not exists(select 1 from USerRole where
		              RoleID = @RoleId and UserId = @UserId)
					  begin
					     insert into USerRole(UserId,RoleID)
						 values(@UserId,@RoleId)
						end
		   else
		     print('already exist data')
		  end
		else 
		   begin 
		      if not exists(select 1 from USerRole where RoleID =@RoleId )
			  begin
			   if not exists(select 1 from USerRole Where UserId = @UserId)
			       begin
				      insert into USerRole(UserId,RoleID)
						 values(@UserId,@RoleId)
					end
				else print('user is already exist with this role')
			   end
			  else 
			    print('Not valid role and user')
			end;

		if exists(select 1 from ModuleMst2 where Id = @ParentId)
				begin
					insert into ModuleMst2 (NameOfModule ,ParentId)
					 values (@NameOfModule , @ParentId)
				 end
			 else 
				insert into ModuleMst2 (NameOfModule,ParentId )
				 values (@NameOfModule,0);

         select @ModuleId = ModuleId from ModuleMst where ModuleName = @ModuleName;

        if not exists(select 1 from RoleModule where
						 RoleId = @RoleId and ModuleId = @ModuleId)
					begin
					insert into RoleModule(RoleId,ModuleId)
					values(@RoleId, @ModuleId )
					end

end

exec insertdataalltable 
           @ModuleName = DepartmentList,
		   @rolename = Users,
		   @Username = amin,
		   @phoneno = '2345691256',
		   @NameOfModule = updateuser,
		   @ParentId= 18;


alter proc updatealltable 
        @NewModuleName1 varchar(50) = null,
		 @ModuleName2 varchar(50) = null,
		 @roleid int = null,
		 @userid int = null,
		@rolename varchar(50) = null,
		@Username varchar(50) = null,
		@NameOfModule Varchar(50) = null,
		@ParentId int = null 
as begin
       if @NewModuleName1 = null or @ModuleName2 = null
	      print('not update name of module')
		else
		 begin
			   if exists(select ModuleName  from ModuleMst where ModuleName = @ModuleName2)
			   begin
			   update ModuleMst set ModuleName = @NewModuleName1 where ModuleName = @ModuleName2
			   update ModuleMst2 set NameOfModule = @NewModuleName1 where NameOfModule= @ModuleName2
			   end
         end

		 if @Username = null or @userid = null
		   print('not update name of user')
			else
			 begin
				  if exists(select UserName from UserMst where UserId = @userid)
				  begin
					 update UserMst set UserName = @Username where UserId = @userid
				  end
			  end

           if @rolename= null or @roleid = null
		   print('not update name of role')
			else
			 begin
				  if exists(select RoleName from RoleMst where RoleId = @roleid)
				  begin
					 update RoleMst set RoleName = @rolename where RoleId = @roleid
				  end
			  end

           if @NameOfModule= null or @ParentId = null
		   print('not update name of module')
			else
			 begin
				  if exists(select NameOfModule from ModuleMst2 where ParentId = @ParentId)
				  begin
					 update ModuleMst2 set NameOfModule = @NameOfModule where ParentId = @ParentId
				  end
			  end

end

exec updatealltable  @NewModuleName1 = null,@ModuleName2 = Userlist;

