DROP TABLE Ordered_item;
DROP TABLE Orders;
DROP TABLE Customers;
DROP TABLE Inventory;
DROP TABLE Product;
DROP TABLE Supplier;
DROP TABLE Address;

-- Create the Address table
CREATE TABLE Address (
	Door_no VARCHAR2(10),
	Street VARCHAR2(50),
	City VARCHAR2(50),
	State VARCHAR2(50),
	Pincode VARCHAR2(10),
	AID VARCHAR2(20) PRIMARY KEY
);

-- Create the Supplier table
CREATE TABLE Supplier (
	SID VARCHAR2(10) PRIMARY KEY,
	SName VARCHAR2(50),
	Ph_no VARCHAR2(20),
	EmailID VARCHAR2(50),
	AID VARCHAR2(10)
);

-- Create the Product table
CREATE TABLE Product (
	PID VARCHAR2(10) PRIMARY KEY,
	Price NUMBER,
	PName VARCHAR2(50),
	Description VARCHAR2(100)
);

-- Create the Inventory table
CREATE TABLE Inventory (
	PID VARCHAR2(10),
	SID VARCHAR2(10),
	Quantity NUMBER,
	MaxQuantity NUMBER,
	PRIMARY KEY (PID, SID),
 	CONSTRAINT fk_inventory_product FOREIGN KEY (PID) REFERENCES Product(PID),
	CONSTRAINT fk_inventory_supplier FOREIGN KEY (SID) REFERENCES Supplier(SID)
);

-- Create the Customers table
CREATE TABLE Customers (
	CID VARCHAR2(10) PRIMARY KEY,
	DOB DATE,
	Age NUMBER,
	Ph_no VARCHAR2(20),
	EmailID VARCHAR2(50),
	AID VARCHAR2(20)
);

-- Create the Orders table
CREATE TABLE Orders (
	OrderID VARCHAR2(10) PRIMARY KEY,
	CID VARCHAR2(10),
	OrderDate VARCHAR2(10),
	ReturnDuration INT,
	DeliveryDuration INT,
	AID VARCHAR2(20),
	CONSTRAINT fk_orders_customer	FOREIGN KEY (CID) REFERENCES Customers(CID)
);

-- Create the Ordered_item table
CREATE TABLE Ordered_item (
	OrderID VARCHAR2(10),
	PID VARCHAR2(10),
	Quantity NUMBER,
	PRIMARY KEY (OrderID, PID),
	CONSTRAINT fk_ordered_items_product FOREIGN KEY (PID) REFERENCES Product(PID),
	CONSTRAINT fk_ordered_items_order FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);


REM : Inserting values

-- Insert into Address table
INSERT INTO Address VALUES('20', 'North Street', 'Madurai', 'Tamil Nadu', '631234', 'A01');
INSERT INTO Address VALUES('30', 'West Street', 'Chennai', 'Tamil Nadu', '632234', 'A02');
INSERT INTO Address VALUES('40', 'East Street', 'Bangalore', 'Karnataka', '587330', 'A03');
INSERT INTO Address VALUES('20', 'Gandhi Street', 'Chennai', 'Tamil Nadu', '61434', 'A04');
INSERT INTO Address VALUES('50', 'Nehru Street', 'Chengalpat', 'Tamil Nadu', '677234', 'A05');
INSERT INTO Address VALUES('60', 'South Street', 'Ranipet', 'Tamil Nadu', '631318', 'A06');
INSERT INTO Address VALUES('70', 'Central Street', 'Salem', 'Tamil Nadu', '631219', 'A07');
INSERT INTO Address VALUES('80', 'Middle Street', 'Dindigul', 'Tamil Nadu', '631234', 'A08');
INSERT INTO Address VALUES('90', 'Ambedkar Street', 'Trichy', 'Tamil Nadu', '631114', 'A09');
INSERT INTO Address VALUES('23', 'Kamarajar Street', 'Madurai', 'Tamil Nadu', '639964', 'A10');


-- Insert into Supplier table
INSERT INTO Supplier VALUES ('S01', 'Supplier 1', '1234567890', 'supplier1@yahoo.com', 'A01');
INSERT INTO Supplier VALUES ('S02', 'Supplier 2', '9876543210', 'supplier2@yahoo.com', 'A02');
INSERT INTO Supplier VALUES ('S03', 'Supplier 3', '5555555555', 'supplier3@yahoo.com', 'A03');
INSERT INTO Supplier VALUES ('S04', 'Supplier 4', '1111111111', 'supplier4@yahoo.com', 'A04');
INSERT INTO Supplier VALUES ('S05', 'Supplier 5', '9999999999', 'supplier5@yahoo.com', 'A05');
INSERT INTO Supplier VALUES ('S06', 'Supplier 6', '4444444444', 'supplier6@yahoo.com', 'A06');
INSERT INTO Supplier VALUES ('S07', 'Supplier 7', '7777777777', 'supplier7@yahoo.com', 'A07');
INSERT INTO Supplier VALUES ('S08', 'Supplier 8', '2222222222', 'supplier8@yahoo.com', 'A08');
INSERT INTO Supplier VALUES ('S09', 'Supplier 9', '6666666666', 'supplier9@yahoo.com', 'A09');
INSERT INTO Supplier VALUES ('S10', 'Supplier 10', '3333333333', 'supplier10@yahoo.com', 'A10');


-- Insert into Product table
INSERT INTO Product VALUES ('P01', 10.99, 'Apple', 'Delicious and juicy fruit');
INSERT INTO Product VALUES ('P02', 39.99, 'Fan', 'Electric device for cooling');
INSERT INTO Product VALUES ('P03', 15.99, 'Water Bottle', 'Reusable container for carrying water');
INSERT INTO Product VALUES ('P04', 24.99, 'Watch', 'Timekeeping accessory worn on the wrist');
INSERT INTO Product VALUES ('P05', 8.99, 'Chocolate', 'Sweet treat made from cocoa');
INSERT INTO Product VALUES ('P06', 22.99, 'Bag', 'Carry-all accessory for belongings');
INSERT INTO Product VALUES ('P07', 16.99, 'Suitcase', 'Luggage for travel and storage');
INSERT INTO Product VALUES ('P08', 90.99, 'Mobile Phone', 'Portable device for communication and more');
INSERT INTO Product VALUES ('P09', 61.99, 'Headphone', 'Audio device worn over the ears');
INSERT INTO Product VALUES ('P10', 7.99, 'Orange', 'Citrus fruit with a refreshing taste');

-- Insert into Inventory table
INSERT INTO Inventory VALUES ('P01', 'S01', 50, 100);
INSERT INTO Inventory VALUES ('P02', 'S02', 25, 50);
INSERT INTO Inventory VALUES ('P03', 'S03', 100, 150);
INSERT INTO Inventory VALUES ('P04', 'S04', 75, 100);
INSERT INTO Inventory VALUES ('P05', 'S05', 60, 80);
INSERT INTO Inventory VALUES ('P06', 'S06', 30, 50);
INSERT INTO Inventory VALUES ('P07', 'S07', 80, 100);
INSERT INTO Inventory VALUES ('P08', 'S08', 40, 60);
INSERT INTO Inventory VALUES ('P09', 'S09', 90, 120);
INSERT INTO Inventory VALUES ('P10', 'S10', 70, 90);

-- Insert into Customers table
INSERT INTO Customers VALUES ('C01', TO_DATE('1990-05-15', 'YYYY-MM-DD'), 31, '1234567890', 'customer1@gmail.com', 'A01');
INSERT INTO Customers VALUES ('C02', TO_DATE('1985-09-23', 'YYYY-MM-DD'), 36, '9876543210', 'customer2@gmail.com', 'A02');
INSERT INTO Customers VALUES ('C03', TO_DATE('1992-03-10', 'YYYY-MM-DD'), 29, '5555555555', 'customer3@gmail.com', 'A03');
INSERT INTO Customers VALUES ('C04', TO_DATE('1988-11-27', 'YYYY-MM-DD'), 33, '1111111111', 'customer4@gmail.com', 'A04');
INSERT INTO Customers VALUES ('C05', TO_DATE('1995-07-18', 'YYYY-MM-DD'), 26, '9999999999', 'customer5@gmail.com', 'A05');
INSERT INTO Customers VALUES ('C06', TO_DATE('1987-01-05', 'YYYY-MM-DD'), 34, '4444444444', 'customer6@gmail.com', 'A06');
INSERT INTO Customers VALUES ('C07', TO_DATE('1993-09-08', 'YYYY-MM-DD'), 28, '7777777777', 'customer7@gmail.com', 'A07');
INSERT INTO Customers VALUES ('C08', TO_DATE('1991-12-20', 'YYYY-MM-DD'), 30, '2222222222', 'customer8@gmail.com', 'A08');
INSERT INTO Customers VALUES ('C09', TO_DATE('1994-04-02', 'YYYY-MM-DD'), 27, '6666666666', 'customer9@gmail.com', 'A09');
INSERT INTO Customers VALUES ('C10', TO_DATE('1989-08-12', 'YYYY-MM-DD'), 32, '3333333333', 'customer10@gmail.com', 'A10');


-- Insert into Orders table
INSERT INTO Orders VALUES ('O01', 'C01', '2023-06-01', 7, 3, 'A03');
INSERT INTO Orders VALUES ('O02', 'C02', '2023-06-02', 5, 2, 'A06');
INSERT INTO Orders VALUES ('O03', 'C03', '2023-06-03', 6, 4, 'A03');

-- Insert into Ordered_item table
INSERT INTO Ordered_item VALUES ('O01', 'P03', 2);
INSERT INTO Ordered_item VALUES ('O01', 'P04', 5);
INSERT INTO Ordered_item VALUES ('O01', 'P09', 10);
INSERT INTO Ordered_item VALUES ('O02', 'P10', 3);
INSERT INTO Ordered_item VALUES ('O02', 'P09', 4);
INSERT INTO Ordered_item VALUES ('O02', 'P06', 2);
INSERT INTO Ordered_item VALUES ('O03', 'P01', 5);
INSERT INTO Ordered_item VALUES ('O03', 'P02', 6);
INSERT INTO Ordered_item VALUES ('O03', 'P03', 6);



-- PlSql function for finding total price of ordered_items by a particular customer
CREATE OR REPLACE FUNCTION calculate_order_price(p_oid IN VARCHAR2) RETURN NUMBER AS
  v_total_price NUMBER := 0;
BEGIN
  FOR rec IN (SELECT oi.PID, oi.Quantity, p.Price
              FROM Ordered_item oi
              JOIN Product p ON oi.PID = p.PID
              WHERE oi.OrderID = p_oid)
  LOOP
    v_total_price := v_total_price + (rec.Quantity * rec.Price);
  END LOOP;

  RETURN v_total_price;
END;
/