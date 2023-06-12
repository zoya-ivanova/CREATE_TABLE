/* 
Базы данных и SQL (семинары)
Урок 2. SQL – создание объектов, простые запросы выборки

1. Используя операторы языка SQL, создайте табличку “sales”. 
Заполните ее данными
*/

DROP TABLE IF EXISTS sales;
CREATE TABLE IF NOT EXISTS sales
(id INT PRIMARY KEY AUTO_INCREMENT,
order_data DATE NOT NULL,
count_product INT
);

SELECT * FROM sales;
INSERT sales(id, order_data, count_product)
VALUES
(1, '2022-01-01', 156),
(2, '2022-01-02', 180),
(3, '2022-01-03', 21),
(4, '2022-01-04', 124),
(5, '2022-01-05', 341);

/* 
2. Для данных таблицы “sales” укажите
тип заказа в зависимости от кол-ва :
меньше 100 - Маленький заказ
от 100 до 300 - Средний заказ
больше 300 - Большой заказ
*/

SELECT 
id AS 'ID заказа', 
count_product AS 'Количество',
	CASE
		WHEN count_product < 100 THEN 'Маленький заказ'
        WHEN count_product < 300 THEN 'Средний заказ'
        WHEN count_product >= 300 THEN 'Большой заказ'
    END AS 'Тип заказа'
    FROM sales;

SELECT 
id AS 'ID заказа', 
	CASE
		WHEN count_product < 100 THEN 'Маленький заказ'
        WHEN count_product < 300 AND count_product >= 100 THEN 'Средний заказ'
        WHEN count_product >= 300 THEN 'Большой заказ'
    END AS 'Тип заказа'
    FROM sales;            

-- 3. Создайте таблицу “orders”, заполните ее значениями

CREATE TABLE IF NOT EXISTS orders
(id INT PRIMARY KEY AUTO_INCREMENT,
employee_id VARCHAR(10) NOT NULL,
amount FLOAT (3,2), 
order_status VARCHAR(15)
);

SELECT * FROM orders;

INSERT orders(id, employee_id, amount, order_status)
VALUES
(1, 'e03', 15.0, 'OPEN'),
(2, 'e01', 25.50, 'OPEN'),
(3, 'e05', 100.70, 'CLOSED'),
(4, 'e02', 22.18, 'OPEN'),
(5, 'e04', 9.50, 'CANCELLED');

/* 4. Выберите все заказы. 
В зависимости от поля order_status выведите столбец
full_order_status:
OPEN – «Order is in open state»; 
CLOSED - «Order is closed»; 
CANCELLED - «Order is cancelled»
*/

SELECT
id,
employee_id, 
amount, 
order_status,
	IF (order_status = 'OPEN', 'Order is in open state',
		IF (order_status = 'CLOSED', 'Order is closed',
			IF (order_status = 'CANCELLED', 'Order is cancelled', 'Неопределено')))
	AS full_order_status
    FROM orders;

/*
5. Чем 0 отличается от null в sql?
0-это числовое значение, а NULL-нет, это специальное значение равное "значение не определено"
*/
