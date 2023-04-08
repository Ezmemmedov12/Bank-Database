CREATE TABLE Account
(
 Account_id          INT NOT NULL,
 Account_number      NUMBER NOT NULL,
 Product_id          INT NOT NULL,
 Open_emp_id         INT NOT NULL,
 Acc_type_code       NCHAR NOT NULL,
 Status              INT NOT NULL,
 Currency_code       NVARCHAR2(100) NOT NULL,
 Current_balance     FLOAT NOT NULL,
 Open_date           DATE NOT NULL,
 Close_date          DATE NOT NULL,
 Balance_AZN        FLOAT NOT NULL,
 Rate_AZN           FLOAT NOT NULL,
 CONSTRAINT PK_1 PRIMARY KEY (Account_id),
 CONSTRAINT FK_10 FOREIGN KEY (Product_id) REFERENCES Product (Product_id),
 CONSTRAINT FK_5 FOREIGN KEY (Currency_code) REFERENCES Currency (Currency_code),
 CONSTRAINT FK_7 FOREIGN KEY (Status) REFERENCES Account_status (Account_status_id),
 CONSTRAINT FK_8 FOREIGN KEY (Acc_type_code) REFERENCES Account_type (Account_type_code),
 CONSTRAINT FK_9 FOREIGN KEY (Open_emp_id) REFERENCES Employee (Employee_id)
);

CREATE TABLE Account_holder
(
 Account_holder_id     INT NOT NULL,
 Account_id            INT NOT NULL,
 Customer_id           INT NOT NULL,
 CONSTRAINT PK_1 PRIMARY KEY (Account_holder_id),
 CONSTRAINT FK_1 FOREIGN KEY (Account_id) REFERENCES Account (Account_id),
 CONSTRAINT FK_4 FOREIGN KEY (Customer_id) REFERENCES Customer (Customer_id)
);

CREATE TABLE Account_status
(
 Account_status_id     INT NOT NULL,
 Account_status        NVARCHAR2(100) NOT NULL,
 Account_id            INT NOT NULL,
 Description           NVARCHAR2(100) NOT NULL,
 CONSTRAINT PK_1 PRIMARY KEY (Account_status_id),
 CONSTRAINT FK_6 FOREIGN KEY (Account_id) REFERENCES Account (Account_id)
);

CREATE TABLE Account_type
(
 Account_type_code     NCHAR NOT NULL,
 Account_type          NCHAR NOT NULL,
 Description           NVARCHAR2(100) NOT NULL,
 CONSTRAINT PK_109 PRIMARY KEY (Account_type_code)
);

CREATE TABLE Branch
(
 Branch_id          INT NOT NULL,
 Branch_name        NVARCHAR2(100) NOT NULL,
 Branch_manager     INT NOT NULL,
 Address            NVARCHAR2(100) NOT NULL,
 Sort_Code          NUMBER NOT NULL,
 Branch_type        NVARCHAR2(100) NOT NULL,
 CONSTRAINT PK_5 PRIMARY KEY (Branch_id),
 CONSTRAINT FK_45 FOREIGN KEY (Branch_manager) REFERENCES Employee (Employee_id)
);


CREATE TABLE Currency
(
 Currency_code     NVARCHAR2(100) NOT NULL,
 Currency_name     NVARCHAR2(100) NOT NULL,
 Rate_AZN          FLOAT NOT NULL,
 Currency_date     DATE NOT NULL,
 CONSTRAINT PK_78 PRIMARY KEY (Currency_code)
);


CREATE TABLE Customer
(
 Customer_id           INT NOT NULL,
 Name                  NCHAR NOT NULL,
 Surname               NCHAR NOT NULL,
 Gender                NCHAR NOT NULL,
 PIN_code              NVARCHAR2(100) NOT NULL,
 Date_of_birth         DATE NOT NULL,
 Phone_number          NVARCHAR2(100) NOT NULL,
 Email                 NVARCHAR2(100) NOT NULL,
 City                  NVARCHAR2(100) NOT NULL,
 Address               NVARCHAR2(100) NOT NULL,
 Registration_date     DATE NOT NULL,
 Title                 NVARCHAR2(100) NOT NULL,
 Age                   NUMBER NOT NULL,
 Estimated_income      FLOAT NOT NULL,
 CONSTRAINT PK_1 PRIMARY KEY (Customer_id)
);


SELECT * FROM Customer;


CREATE TABLE Department
(
 Department_id       INT NOT NULL,
 Department_name     NVARCHAR2(100) NOT NULL,
 CONSTRAINT PK_8 PRIMARY KEY (Department_id)
);

CREATE TABLE Deposit
(
 Deposit_id                  INT NOT NULL,
 Branch_id                   INT NOT NULL,
 Product_id                  INT NOT NULL,
 Account_id                  INT NOT NULL,
 "Period"                    NUMBER NOT NULL,
 Amount                      FLOAT NOT NULL,
 Interest_rate_per_year      FLOAT NOT NULL,
 Interest_rate_per_month     FLOAT NOT NULL,
 Total_percentage            FLOAT NOT NULL,
 Deposit_income              FLOAT NOT NULL,
 Total_paid                  FLOAT NOT NULL,
 CONSTRAINT PK_1 PRIMARY KEY (Deposit_id),
 CONSTRAINT FK_16 FOREIGN KEY (Account_id) REFERENCES Account (Account_id),
 CONSTRAINT FK_17 FOREIGN KEY (Product_id) REFERENCES Product (Product_id),
 CONSTRAINT FK_18 FOREIGN KEY (Branch_id) REFERENCES Branch (Branch_id)
);



CREATE TABLE Employee
(
 Employee_id         INT NOT NULL,
 Name                NCHAR NOT NULL,
 Superior_emp_id     INT NOT NULL,
 Department_id       INT NOT NULL,
 Branch_id           INT NOT NULL,
 Surname             NCHAR NOT NULL,
 Gender              NCHAR NOT NULL,
 PIN_code            NVARCHAR2(100) NOT NULL,
 Date_of_birth       DATE NOT NULL,
 Phone_number        NVARCHAR2(100) NOT NULL,
 Email               NVARCHAR2(100) NOT NULL,
 City                NVARCHAR2(100) NOT NULL,
 Address             NVARCHAR2(100) NOT NULL,
 Title               NVARCHAR2(100) NOT NULL,
 Start_date          DATE NOT NULL,
 Salary              FLOAT NOT NULL,
 CONSTRAINT PK_324 PRIMARY KEY (Employee_id),
 CONSTRAINT FK_127 FOREIGN KEY (Branch_id) REFERENCES Branch (Branch_id),
 CONSTRAINT FK_153 FOREIGN KEY (Department_id) REFERENCES Department (Department_id),
 CONSTRAINT FK_284 FOREIGN KEY (Superior_emp_id) REFERENCES Employee (Employee_id)
);



CREATE TABLE Loan
(
 Loan_id                     INT NOT NULL,
 Branch_id                   INT NOT NULL,
 Product_id                  INT NOT NULL,
 Account_id                  INT NOT NULL,
 Amount                      FLOAT NOT NULL,
 "Period"                    NUMBER NOT NULL,
 Interest_rate_per_year      FLOAT NOT NULL,
 Interest_rate_per_month     FLOAT NOT NULL,
 Total_percentage            FLOAT NOT NULL,
 Additional_paid             FLOAT NOT NULL,
 Total_paid                  FLOAT NOT NULL,
 Amount_paid_per_month       FLOAT NOT NULL,
 CONSTRAINT PK_1 PRIMARY KEY (Loan_id),
 CONSTRAINT FK_14 FOREIGN KEY (Product_id) REFERENCES Product (Product_id),
 CONSTRAINT FK_15 FOREIGN KEY (Branch_id) REFERENCES Branch (Branch_id),
 CONSTRAINT FK_3 FOREIGN KEY (Account_id) REFERENCES Account (Account_id)
);


CREATE TABLE Product
(
 Product_id            INT NOT NULL,
 Product_name          NVARCHAR2(100) NOT NULL,
 Product_manager       INT NOT NULL,
 Account_type_code     NCHAR NOT NULL,
 Date_launched         DATE NOT NULL,
 CONSTRAINT PK_41 PRIMARY KEY (Product_id),
 CONSTRAINT FK_22 FOREIGN KEY (Account_type_code) REFERENCES Account_type (Account_type_code),
 CONSTRAINT FK_23 FOREIGN KEY (Product_manager) REFERENCES Employee (Employee_id)
);


CREATE TABLE Transactions
(
 Transaction_id       INT NOT NULL,
 Account_id           INT NOT NULL,
 Description          NVARCHAR2(100) NOT NULL,
 Money_in             FLOAT NULL,
 Money_out            FLOAT NOT NULL,
 Balance              FLOAT NOT NULL,
 Transaction_date     DATE NOT NULL,
 CONSTRAINT PK_1 PRIMARY KEY (Transaction_id),
 CONSTRAINT FK_2 FOREIGN KEY (Account_id) REFERENCES Account (Account_id)
);




select * from Account;
select * from Account_holder;
select * from Account_status;
select * from Account_type;
select * from Branch;
select * from Currency;
select * from Customer;
select * from Department;
select * from Deposit;
select * from Employee;
select * from Loan;
select * from Product;
select * from Transactions;


