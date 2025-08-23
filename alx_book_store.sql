-- import mysql.connector

-- alx_book_store = mysql.connector.connect(
--   host="localhost",
--   user="root",
--   password="your_password",
--   database="alx_book_store"
-- )

-- mycursor = alx_book_store.cursor()

-- mycursor.execute("""
-- CREATE TABLE books (
--   id INT AUTO_INCREMENT PRIMARY KEY,
--   title VARCHAR(130),
--   author_id INT,
--   price DOUBLE,
--   published_date DATE,
--   FOREIGN KEY (author_id) REFERENCES authors(id)
-- );
-- """)

-- mycursor.execute("""
-- CREATE TABLE authors (
--   author_id INT AUTO_INCREMENT PRIMARY KEY,
--   author_name VARCHAR(215)
-- );
-- """)

-- mycursor.execute("""
-- CREATE TABLE customers (
--   customer_id INT AUTO_INCREMENT PRIMARY KEY,
--   customer_name VARCHAR(215),
--   email VARCHAR(215),
--   address TEXT
-- );
-- """)

-- mycursor.execute("""
-- CREATE TABLE orders (
--   order_id INT AUTO_INCREMENT PRIMARY KEY,
--   customer_id INT,
--   order_date DATE,
--   FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
-- );
-- """)

-- mycursor.execute("""
-- CREATE TABLE order_details (
--   order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
--   order_id INT,
--   book_id INT,
--   quantity DOUBLE,
--   FOREIGN KEY (order_id) REFERENCES orders(order_id),
--   FOREIGN KEY (book_id) REFERENCES books(id)
-- );


-- Create Database
CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

-- Create Authors table
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- Create Books table
CREATE TABLE IF NOT EXISTS Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT NOT NULL,
    price DOUBLE NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Create Customers table
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE,
    address TEXT
);

-- Create Orders table
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Create Order_Details table
CREATE TABLE IF NOT EXISTS Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
