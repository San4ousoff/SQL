/*
Часть 1:
1. Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке: city, sname, snum, comm. (к первой или второй таблице, используя SELECT)
2. Напишите команду SELECT, которая вывела бы оценку(rating), сопровождаемую именем каждого заказчика в городе San Jose. (“заказчики”)
3. Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов без каких бы то ни было повторений. (уникальные значения в “snum“ “Продавцы”)
4. *Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G. Используется оператор "LIKE": (“заказчики”)
5. Напишите запрос, который может дать вам все заказы со значениями суммы выше чем $1,000. (“Заказы”, “amt” - сумма)
6. Напишите запрос который выбрал бы наименьшую сумму заказа. (Из поля “amt” - сумма в таблице “Заказы” выбрать наименьшее значение)
7. Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков, у которых рейтинг больше 100 и они находятся не в Риме.
*/

-- создаем таблицу salespeople
CREATE TABLE salespeople 
(
  snum INT PRIMARY KEY,
  sname VARCHAR(10),
  city VARCHAR(10),
  comm FLOAT  
);
-- заполняем таблицу данными
INSERT INTO salespeople (snum, sname, city, comm) VALUES 
(1001, "Peel", "London", 0.12),
(1002, "Serres", "San Jose", 0.13),
(1004, "Motika", "London", 0.11),
(1007, "Rifkin", "Barcelona", 0.15),
(1003, "Axelrod", "New York", 0.12);
-- выводим на экран всю таблицу
SELECT * FROM salespeople;
PRINT
-- создаем таблицу customers
CREATE TABLE customers 
(
  cnum INT PRIMARY KEY,
  cname VARCHAR(10),
  city VARCHAR(10),
  rating INT,
  snum INT,
  FOREIGN KEY (snum) REFERENCES salespeople(snum)
);
-- заполняем таблицу данными
INSERT INTO customers (cnum, cname, city, rating, snum) VALUES 
(2001, "Hoffman", "London", 100, 1001),
(2002, "Giovanni", "Rome", 200, 1003),
(2003, "Liu", "San Jose", 200, 1002),
(2004, "Grass", "Berlin", 300, 1002),
(2006, "Clemens", "London", 100, 1001),
(2008, "Cisneros", "San Jose", 300, 1007),
(2007, "Pereira", "Rome", 100, 1004);
-- выводим на экран всю таблицу
SELECT * FROM customers;
PRINT
-- создаем таблицу orders
CREATE TABLE orders
(
  onum INT PRIMARY KEY,
  amt FLOAT,
  odate DATE,
  cnum INT,
  snum INT,
  FOREIGN KEY (cnum) REFERENCES customers(cnum),
  FOREIGN KEY (snum) REFERENCES salespeople(snum)
);
-- заполняем таблицу данными
INSERT INTO orders (onum, amt, odate, cnum, snum) VALUES 
(3001, 18.69, "2016-10-03", 2008, 1007),
(3003, 767.19, "2016-10-03", 2001, 1001),
(3002, 1900.10, "2016-10-03", 2007, 1004),
(3005, 5160.45, "2016-10-03", 2003, 1002),
(3006, 1098.16, "2016-10-03", 2008, 1007),
(3009, 1713.23, "2016-10-04", 2002, 1003),
(3007, 75.75, "2016-10-04", 2004, 1002),
(3008, 4723.00, "2016-10-05", 2006, 1001),
(3010, 1309.95, "2016-10-06", 2004, 1002),
(3011, 9891.88, "2016-10-06", 2006, 1001);
-- выводим на экран всю таблицу
SELECT * FROM orders;
PRINT
-- пункт 1 части 1 ДЗ
SELECT city, sname, snum, comm FROM salespeople;
PRINT
-- пункт 2 части 1 ДЗ
SELECT rating, cname FROM customers 
WHERE city = 'San Jose';
PRINT
-- пункт 3 части 1 ДЗ
SELECT DISTINCT snum FROM salespeople;
PRINT
-- пункт 4 части 1 ДЗ
SELECT * FROM customers
WHERE cname LIKE 'G%';
PRINT
-- пункт 5 части 1 ДЗ
SELECT * FROM orders
WHERE amt > 1000;
PRINT
-- пункт 6 части 1 ДЗ
SELECT MIN(amt) FROM orders;
PRINT
-- пункт 7 части 1 ДЗ
SELECT * FROM customers 
WHERE rating > 100 AND city NOT IN ('Rome');