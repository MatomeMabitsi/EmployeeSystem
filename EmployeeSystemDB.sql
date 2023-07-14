Use Master
GO

If exists (Select * from sys.databases where name = 'EmployeeManagementSystem')
Drop Database EmployeeManagementSystem
GO

Create Database EmployeeManagementSystem
GO

Use EmployeeManagementSystem
GO

-- Create the Employees table
CREATE TABLE Employees (
  EmployeeID int Primary Key identity(1,1)NOT NULL ,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  Email VARCHAR(50) NOT NULL,
  PhoneNo VARCHAR(10) NOT NULL,
  Department VARCHAR(50) NOT NULL,
  Occupation VARCHAR(50) NOT NULL
);

-- Insert data into the Employees table
INSERT INTO Employees (FirstName, LastName, Email, PhoneNo, Department, Occupation)
VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890', 'Sales', 'Sales Manager'),
('Jane', 'Doe', 'jane.doe@example.com', '4567890123', 'Marketing', 'Marketing Manager'),
('Bill', 'Smith', 'bill.smith@example.com', '7890123456', 'IT', 'IT Manager');

-- Create the Users table
CREATE TABLE Users (
  UserID int Primary Key identity(1,1)NOT NULL ,
  UserName VARCHAR(50) NOT NULL,
  [Password] VARCHAR(50) NOT NULL
);

-- Insert data into the Users table
INSERT INTO Users (UserName, [Password])
VALUES
('MatomeMab', 'password'),
('MatomeTom', 'password');

-- Create UserRoles table

CREATE TABLE UserRoles (
UserRoleID int Primary Key identity(1,1)NOT NULL ,
RoleName Varchar(20) not null,
UserID int references Users(UserID)
);
