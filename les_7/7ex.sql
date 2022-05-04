USE shops;

/*1. Составьте список пользователей users, 
 * которые осуществили хотя бы один заказ orders в интернет магазине*/

INSERT INTO orders (user_id)
SELECT id FROM users WHERE  name = "Сергей";

INSERT INTO orders_products (order_id, product_id, total)
	SELECT LAST_INSERT_ID(), id, 1
	FROM products
	WHERE name = 'Gigabyte H310M S2H';

INSERT INTO orders (user_id)
SELECT id FROM users WHERE  name = "Мария";

INSERT INTO orders_products (order_id, product_id, total)
	SELECT LAST_INSERT_ID(), id, 1
	FROM products
	WHERE name = 'AMD FX-8320E';

/* 1 вариант*/
SELECT id, name  FROM users
WHERE users.id IN (
	SELECT user_id FROM orders
	);
/* 2 вариант*/
SELECT users.id, users.name FROM users
JOIN orders
ON orders.user_id = users.id;

/*2. Выведите список товаров products и разделов catalogs, которые соответствуют товару.*/

/*1 вариант*/
SELECT id, name, description, price, 
	(SELECT name FROM catalogs
		WHERE products.catalog_id = id)  AS catalog_name
FROM products;

/*2 вариант*/
SELECT p.id, p.name, p.description, c.name AS catalog_name
FROM products AS p
LEFT JOIN
	catalogs AS c 
ON p.catalog_id = c.id;

/*3.(по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
 * Поля from, to и label содержат английские названия городов, поле name — русское. 
 * Выведите список рейсов flights с русскими названиями городов.*/

CREATE TABLE flights (
	id SERIAL PRIMARY KEY,
	from_ VARCHAR(300),
	to_ VARCHAR(300)
);

INSERT INTO flights (from_, to_) VALUES
	('moscow', 'omsk'),
	('novgorod', 'kazan'),
	('irkutsk', 'moscow'),
	('omsk', 'irkutsk'),
	('moscow', 'kazan');

CREATE TABLE cities (
	id SERIAL PRIMARY KEY,
	label VARCHAR(300),
	name VARCHAR(300)
);

INSERT INTO cities (label, name) VALUES
	('moscow', 'Москва'),
	('novgorod', 'Новгород'),
	('irkutsk', 'Иркутск'),
	('omsk', 'Омск'),
	('kazan', 'Казань');

/*1 вариант*/
SELECT (SELECT name FROM cities WHERE label = flights.from_) AS 'from',
	   (SELECT name FROM cities WHERE label = flights.to_) AS 'to'
FROM flights;

/*2 вариант*/
SELECT f.id, cities_from.name, cities_to.name
FROM flights AS f
LEFT JOIN cities AS cities_from 
ON f.from_ = cities_from.label
LEFT JOIN cities AS cities_to 
ON f.to_ = cities_to.label;











