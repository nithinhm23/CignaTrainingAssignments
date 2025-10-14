CREATE TABLE Products(
  product_id NUMBER PRIMARY KEY, 
  product_name VARCHAR(255) NOT NULL,
  category VARCHAR(100),
  price NUMBER NOT NULL CHECK (price>0),
  stock_quantity NUMBER DEFAULT 0
);
INSERT INTO Products(product_id, product_name, category, price, stock_quantity) VALUES (1,'laptop','pc',55000,4);
INSERT INTO Products(product_id, product_name, category, price, stock_quantity) VALUES (2,'headphone','headset',5000,6);

CREATE TABLE Customers(
  customer_id NUMBER PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  email VARCHAR(200) UNIQUE,
  phone_number VARCHAR(20)
);
INSERT INTO Customers(customer_id,first_name,last_name,email,phone_number) VALUES (101,'Sam','Khan','samkhan12@gmail.com',9898090989);
INSERT INTO Customers(customer_id,first_name,last_name,email,phone_number) VALUES (102,'Syed','Ahmed','syedahmed212@gmail.com',8998090989);

CREATE TABLE Orders(
  order_id NUMBER PRIMARY KEY,
  customer_id NUMBER NOT NULL,
  order_date DATE DEFAULT SYSDATE,
  total_amount NUMBER NOT NULL CHECK (total_amount>=0),
  CONSTRAINT fk_order FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
INSERT INTO Orders(order_id,customer_id,order_date,total_amount) VALUES (200,101,SYSDATE,110000);
INSERT INTO Orders(order_id,customer_id,order_date,total_amount) VALUES (201,102,SYSDATE,25000);

CREATE TABLE Order_Details(
  order_detail_id NUMBER PRIMARY KEY,
  order_id NUMBER NOT NULL,
  product_id NUMBER NOT NULL,
  quantity NUMBER NOT NULL CHECK (quantity > 0),
  CONSTRAINT fk_order_details FOREIGN KEY (order_id) REFERENCES orders(order_id),
  CONSTRAINT fk_order_product FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO Order_Details(order_detail_id,order_id,product_id,quantity) VALUES (300200,200,1,2);
INSERT INTO Order_Details(order_detail_id,order_id,product_id,quantity) VALUES (300201,201,2,5);
