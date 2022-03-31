USE examples;

SELECT * FROM users;

/*TASK 1*/ 

UPDATE users
SET created_at = NOW(), updated_at = NOW();

/*TASK 2*/ 

ALTER TABLE users DROP COLUMN created_at; 
ALTER TABLE users DROP COLUMN updated_at; 

ALTER TABLE users ADD COLUMN created_at varchar(130);
ALTER TABLE users ADD COLUMN updated_at varchar(130);

INSERT INTO
	users (name, created_at, updated_at)
VALUES 
	('Oleg', '01.01.1990 12:00', '19.02.2020 12:00'),
	('Anna', '19.01.2019 12:00', '04.06.2019 12:00'),
	('Marina', '13.10.2016 12:00', '01.09.2018 12:00');

UPDATE users 
SET 
	created_at = STR_TO_DATE(created_at, '%d.%m.%Y %k:%i'),
	updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %k:%i');

ALTER TABLE users 
CHANGE updated_at updated_at  
DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP; 

ALTER TABLE users 
CHANGE created_at created_at 
DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP; 

/*TASK 3*/ 

DROP TABLE IF EXISTS storehouses;
CREATE TABLE storehouses (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Склады';

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  id SERIAL PRIMARY KEY,
  storehouse_id INT UNSIGNED,
  product_id INT UNSIGNED,
  value INT UNSIGNED COMMENT 'Запас товарной позиции на складе',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Запасы на складе';

INSERT INTO storehouses_products (storehouse_id, product_id, value)
VALUES 
	(1, 222, 0),
	(1, 1, 2500),
	(1, 2, 0),
	(1, 22, 30),
	(1, 229, 500),
	(1, 221, 1);

SELECT * FROM storehouses_products ORDER BY IF(value > 0, 0, 1), value;

/*TASK 4*/ 

SELECT name FROM users
WHERE DATE_FORMAT(birthday_at, '%M') IN ('may', 'august', 'june');

/*TASK 5*/

DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название раздела',
  UNIQUE unique_name(name(10))
) COMMENT = 'Разделы интернет-магазина';

INSERT INTO catalogs VALUES
  (NULL, 'Процессоры'),
  (NULL, 'Материнские платы'),
  (NULL, 'Видеокарты'),
  (NULL, 'Жесткие диски'),
  (NULL, 'Оперативная память');
 
SELECT * FROM catalogs WHERE id in (5, 1, 2) ORDER BY FIELD(id, 5, 1, 2);

/*TASK 1*/ 

SELECT AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) as AGE FROM users;

/*TASK 2*/

SELECT 
	DATE_FORMAT(DATE(CONCAT_WS('-', YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at))), '%W') AS birt_day, 
	COUNT(*) AS SUM
FROM users
GROUP BY birt_day
ORDER BY SUM;


