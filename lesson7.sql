-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

SELECT u.id, u.name FROM users u INNER JOIN (SELECT user_id FROM orders GROUP BY user_id) o ON o.user_id = u.id;

-- Выведите список товаров products и разделов catalogs, который соответствует товару.

SELECT p.id, p.name, c.`name` category FROM products p INNER JOIN catalogs c ON c.id = p.catalog_id;

-- (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). Поля from, to и label содержат английские названия городов, поле name — русское. Выведите список рейсов flights с русскими названиями городов.

-- CREATE TABLE IF NOT EXISTS cities (label VARCHAR(100) PRIMARY KEY NOT NULL, `name` VARCHAR(255) NOT NULL);
-- TRUNCATE cities;
-- INSERT INTO cities VALUES ("Minsk", "Минск"), ("London", "Лондон"), ("Moscow", "Москва"), ("Paris", "Париж"), ("Helsinki", "Хельсинки");

-- CREATE TABLE IF NOT EXISTS flights (id SERIAL, `from` VARCHAR(100) NOT NULL, `to` VARCHAR(100) NOT NULL);
-- TRUNCATE flights;
-- INSERT INTO flights (`from`, `to`) SELECT c1.label `from`, c2.label `to` FROM cities c1 INNER JOIN cities c2 ON c2.label != c1.label ORDER BY RAND();

SELECT fc.name `from`, ft.name `to` FROM flights f INNER JOIN cities fc ON fc.label = f.`from` INNER JOIN cities ft ON ft.label = f.`to`;