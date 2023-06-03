-- Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов
CREATE VIEW CheapCars 
AS SELECT Name 
FROM Cars 
WHERE Cost<25000;
SELECT * FROM CheapCars;

-- Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов 
-- (используя оператор ALTER VIEW)
ALTER VIEW CheapCars 
AS SELECT Name 
FROM Cars WHERE Cost<30000;
SELECT * FROM CheapCars;

-- Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
CREATE VIEW SelectCars
AS SELECT *
FROM Cars
WHERE Name = 'Skoda' OR Name = 'Audi';
SELECT * FROM SelectCars;

-- Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю
SELECT an_name, an_price 
FROM Analysis 
JOIN Orders ON Orders.ord_an = Analysis.an_id 
WHERE Orders.ord_datetime >= '2020-02-05' AND Orders.ord_datetime < '2020-02-12';

-- Добавьте новый столбец под названием «время до следующей станции»
SELECT name, time, 
LEAD(time) OVER(ORDER BY time ASC) - time AS time_to_next_station 
FROM stations;


