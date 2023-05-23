CREATE SCHEMA `hw1` ;

CREATE TABLE `hw1`.`phone` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `productname` VARCHAR(45) NOT NULL,
  `manufacturer` VARCHAR(45) NULL DEFAULT NULL,
  `productcount` INT NULL DEFAULT NULL,
  `price` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`));
INSERT INTO `hw1`.`phone` (`productname`, `manufacturer`, `productcount`, `price`) VALUES ('iPhone X', 'Apple', '3', '76000');
INSERT INTO `hw1`.`phone` (`productname`, `manufacturer`, `productcount`, `price`) VALUES ('iPhone 8', 'Apple', '2', '51000');
INSERT INTO `hw1`.`phone` (`productname`, `manufacturer`, `productcount`, `price`) VALUES ('Galaxy S9', 'Samsung', '2', '56000');
INSERT INTO `hw1`.`phone` (`productname`, `manufacturer`, `productcount`, `price`) VALUES ('Galaxy S8', 'Samsung', '1', '41000');
INSERT INTO `hw1`.`phone` (`productname`, `manufacturer`, `productcount`, `price`) VALUES ('P20 Pro', 'Huawei', '5', '36000');

SELECT productname, manufacturer, price 
FROM hw1.phone
WHERE productcount > 2;
# две записи

SELECT * 
FROM hw1.phone
WHERE manufacturer = 'Samsung';
# две записи

SELECT * 
FROM hw1.phone
WHERE productname
REGEXP '(Iphone)';
# две записи

SELECT * 
FROM hw1.phone
WHERE productname
REGEXP '(Samsung)';
# пустой вывод

SELECT * 
FROM hw1.phone
WHERE productname
REGEXP '[1-9]';
# четыре записи

SELECT * 
FROM hw1.phone
WHERE productname
REGEXP '8';
# две записи

