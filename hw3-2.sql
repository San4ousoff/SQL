/*
Часть 2:
1. Отсортируйте поле “зарплата” в порядке убывания и возрастания
2. Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой (возможен подзапрос)
3. Выполните группировку всех сотрудников по специальности , суммарная зарплата которых превышает 100000
*/
-- создаем таблицу employees
CREATE TABLE employees
(
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(10) NOT NULL,
  surname VARCHAR(10) NOT NULL,
  specialty VARCHAR(10) NOT NULL,
  seniority INT NOT NULL,
  salary INT NOT NULL,
  age INT NOT NULL
);
-- заполняем таблицу данными
INSERT INTO employees (name, surname, specialty, seniority, salary, age) VALUES
("Вася", "Васькин", "начальник", 40, 100000, 60),
("Петя", "Петькин", "начальник", 8, 70000, 30),
("Катя", "Каткина", "инженер", 2, 70000, 25),
("Саша", "Сашкин", "инженер", 12, 50000, 35),
("Иван", "Иванов", "рабочий", 40, 30000, 59),
("Петр", "Петров", "рабочий", 20, 25000, 40),
("Сидор", "Сидоров", "рабочий", 10, 20000, 35),
("Антон", "Антонов", "рабочий", 8, 19000, 28),
("Юра", "Юркин", "рабочий", 5, 15000, 25),
("Максим", "Воронин", "рабочий", 2, 11000, 22),
("Юра", "Галкин", "рабочий", 3, 12000, 24),
("Люся", "Люськина", "уборщик", 10, 10000, 49);
-- выводим на экран всю таблицу
SELECT * FROM employees;
PRINT
-- пункт 1 части 2 ДЗ
-- возрастание
SELECT * FROM employees
ORDER BY salary;
PRINT
-- убывание
SELECT * FROM employees
ORDER BY salary DESC;
PRINT
-- пункт 2 части 2 ДЗ
SELECT * FROM (SELECT * FROM employees ORDER BY salary DESC LIMIT 5) as top_salary
ORDER BY salary;
PRINT
-- пункт 3 части 2 ДЗ
SELECT specialty, SUM(salary) AS sum_salary FROM employees
GROUP BY specialty
HAVING sum_salary > 100000;