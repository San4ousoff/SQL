-- создаем таблицу employees
CREATE TABLE employees
(
  id VARCHAR(4) PRIMARY KEY UNIQUE,
  name VARCHAR(40) NOT NULL
);
-- заполняем таблицу данными
INSERT INTO employees (id, name) VALUES 
("e01", "Ivan"),
("e02", "Petr"),
("e03", "Sveta"),
("e04", "Anna"),
("e05", "Gena");
-- выводим на экран всю таблицу
SELECT * FROM employees;
PRINT
-- создаем таблицу orders
CREATE TABLE orders
(
  id INT PRIMARY KEY AUTO_INCREMENT,
  employeeid VARCHAR(4), 
  amount FLOAT NOT NULL,
  orderstatus VARCHAR(10),
  FOREIGN KEY (employeeid) REFERENCES employees(id)
);
-- заполняем таблицу данными
INSERT INTO orders (employeeid, amount, orderstatus) VALUES 
("e03", 15.00, "OPEN"),
("e01", 25.50, "OPEN"),
("e05", 100.70, "CLOSED"),
("e02", 22.18, "OPEN"),
("e04", 9.50, "CANCELLED"),
("e04", 99.99, "OPEN");
-- выводим на экран всю таблицу
SELECT * FROM orders;
PRINT
-- уточняем поле orderstatus в order_summary 
SELECT id, orderstatus,
    CASE 
        WHEN orderstatus = 'OPEN' THEN 'Order is in open state.'
        WHEN orderstatus = 'CLOSED' THEN 'Order is closed.'
        WHEN orderstatus = 'CANCELLED' THEN 'Order is canselled.'
    END as order_summary
FROM orders;
/*