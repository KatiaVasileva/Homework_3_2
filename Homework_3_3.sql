-- Задание 1
-- 1. Создайте таблицу city с колонками city_id и city_name.

CREATE TABLE city
(
    city_id   BIGSERIAL   NOT NULL PRIMARY KEY,
    city_name VARCHAR(50) NOT NULL
);

-- 2. Добавьте в таблицу employee колонку city_id.

ALTER TABLE employee ADD COLUMN city_id INT;

-- 3. Назначьте эту колонку внешним ключом. Свяжите таблицу employee с таблицей city.

ALTER TABLE employee ADD FOREIGN KEY (city_id) REFERENCES city(city_id);

-- 4. Заполните таблицу city и назначьте работникам соответствующие города.

INSERT INTO city (city_name)
VALUES ('New York'),
       ('London'),
       ('Moscow'),
       ('Paris'),
       ('Madrid');

UPDATE employee SET city_id = 1 WHERE id = 1;
UPDATE employee SET city_id = 3 WHERE id = 2;
UPDATE employee SET city_id = 2 WHERE id = 3;
UPDATE employee SET city_id = 6 WHERE id = 4;
UPDATE employee SET city_id = 4 WHERE id = 5;

-- Задание 2
-- Создайте ряд запросов к созданной таблице.
-- 1. Получите имена и фамилии сотрудников, а также города, в которых они проживают.

SELECT first_name, last_name, city_name
FROM city
JOIN employee ON city.city_id = employee.city_id;

-- 2. Получите города, а также имена и фамилии сотрудников, которые в них проживают.
-- Если в городе никто из сотрудников не живет, то вместо имени должен стоять null.

SELECT city_name, first_name, last_name
FROM city
LEFT JOIN employee ON city.city_id = employee.city_id;

-- 3. Получите имена всех сотрудников и названия всех городов.
-- Если в городе не живет никто из сотрудников, то вместо имени должен стоять null.
-- Аналогично, если города для какого-то из сотрудников нет в списке, должен быть получен null.

SELECT first_name, last_name, city_name
FROM city
FULL OUTER JOIN employee ON city.city_id = employee.city_id;

-- 4. Получите таблицу, в которой каждому имени должен соответствовать каждый город.

SELECT last_name, city_name
FROM employee
CROSS JOIN city;

-- 5. Получите имена городов, в которых никто не живет.

SELECT city_name
FROM city
LEFT OUTER JOIN employee ON city.city_id = employee.city_id
WHERE employee.id is NULL;












