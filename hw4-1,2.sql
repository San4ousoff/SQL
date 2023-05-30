CREATE TABLE AUTO 
(       
 REGNUM VARCHAR(10) PRIMARY KEY, 
 MARK VARCHAR(10), 
 COLOR VARCHAR(15),
 RELEASEDT DATE, 
 PHONENUM VARCHAR(15)
);

 -- AUTO
INSERT INTO AUTO (REGNUM, MARK, COLOR, RELEASEDT, PHONENUM ) VALUES
(111114,'LADA', 'КРАСНЫЙ', date'2008-01-01', '9152222221'),
(111115,'VOLVO', 'КРАСНЫЙ', date'2013-01-01', '9173333334'),
(111116,'BMW', 'СИНИЙ', date'2015-01-01', '9173333334'),
(111121,'AUDI', 'СИНИЙ', date'2009-01-01', '9173333332'),
(111122,'AUDI', 'СИНИЙ', date'2011-01-01', '9213333336'),
(111113,'BMW', 'ЗЕЛЕНЫЙ', date'2007-01-01', '9214444444'),
(111126,'LADA', 'ЗЕЛЕНЫЙ', date'2005-01-01', null),
(111117,'BMW', 'СИНИЙ', date'2005-01-01', null),
(111119,'LADA', 'СИНИЙ', date'2017-01-01', 9213333331);
-- select * from AUTO;

-- Задание 1
select MARK, COLOR, count(*) as count
from AUTO
where MARK in ('BMW', 'LADA')
group by mark, color;

-- Задание 2
select distinct a1.mark, 
  (select count(*) 
  from auto a2
  where a2.mark != a1.mark) as count
from auto a1;