-- Use Master database
Use Master
GO

-- Drop the database if it exists
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'EmployeeManagementSystem')
BEGIN
    ALTER DATABASE EmployeeManagementSystem SET SINGLE_USER WITH ROLLBACK IMMEDIATE
    DROP DATABASE EmployeeManagementSystem
END
GO

-- Create the database
CREATE DATABASE EmployeeManagementSystem
GO

-- Use the EmployeeManagementSystem database
USE EmployeeManagementSystem
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



-- Create UserRoles table

CREATE TABLE Roles (
RoleID int Primary Key identity(1,1)NOT NULL ,
RoleName Varchar(20) not null
);

INSERT INTO Roles (RoleName)
VALUES
('Admin'),
('Employee');

-- Create the Users table
CREATE TABLE Users (
  UserID int Primary Key identity(1,1)NOT NULL ,
  UserName VARCHAR(50) NOT NULL,
  [Password] VARCHAR(50) NOT NULL,
  RoleID int references Roles(RoleID)
);

-- Insert data into the Users table
INSERT INTO Users (UserName, [Password],RoleID)
VALUES
('MatomeMab', 'password123',1),
('MatomeTom', 'password',2),
('Mahlatse', 'Bohlale',2),
('Moya', 'Momo',1);

Create table UserRoles(
UserRoleID int Primary Key identity(1,1)NOT NULL ,
UserID int references Users(UserID),
RoleID int references Roles(RoleID)
);

create table Tasks (
TaskID int Primary Key identity(1,1)NOT NULL ,
TaskName VARCHAR(50) NOT NULL,
TaskDescription VARCHAR(300) NOT NULL,
EmployeeID int references Employees(EmployeeID)
);
