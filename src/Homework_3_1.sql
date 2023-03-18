CREATE TABLE employee (
id BIGSERIAL NOT NULL PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
gender VARCHAR(6) NOT NULL,
age INT NOT NULL);

INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('John', 'Smith', 'male', 45),
       ('Katherine', 'Beagle', 'female', 36);

-- Задание 1
-- 1. Доведите количество записей в таблице до 5.

INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('William', 'Hopes', 'male', 26),
       ('Rose', 'Higgins', 'female', 23),
       ('Ted', 'Mills', 'male', 52);

-- 2. Получите информацию об именах и фамилиях по всем сотрудникам.
--    Колонки должны называться «Имя» и «Фамилия».

SELECT first_name AS Имя,
       last_name AS Фамилия
FROM employee;

-- 3. Получите всю информацию о сотрудниках, которые младше 30 или старше 50 лет.

SELECT *
FROM employee
WHERE age < 30
   OR age > 50;

-- 4. Получите всю информацию о сотрудниках, которым от 30 до 50 лет.

SELECT *
FROM employee
WHERE age BETWEEN 30 AND 50;

-- 5. Выведите полный список сотрудников, которые отсортированы по фамилиям в обратном порядке.

SELECT last_name  AS Фамилия,
       first_name AS Имя,
       gender     AS Пол,
       age        AS Возраст
FROM employee
ORDER BY Фамилия DESC;

-- 6. Выведите сотрудников, имена которых длиннее 4 символов.

SELECT *
FROM employee
WHERE char_length(first_name) > 4;

-- Задание 2
-- 1. Измените имена у двух сотрудников так, чтобы на 5 сотрудников было только 3 разных имени,
--    то есть чтобы получились две пары тезок и один сотрудник с уникальным именем.

UPDATE employee
SET first_name = 'Katherine'
WHERE id = 4;

UPDATE employee
SET first_name = 'John'
WHERE id = 5;

-- 2. Посчитайте суммарный возраст для каждого имени. Выведите в двух столбцах «имя» и «суммарный возраст».

SELECT first_name AS Имя,
       sum(age)   AS Суммарный_возраст
FROM employee
GROUP BY first_name;

-- 3. Выведите имя и самый юный возраст, соответствующий имени.

SELECT first_name AS Имя,
       age        AS Минимальный_возраст
FROM employee
WHERE age = (SELECT MIN(age)
             FROM employee);

-- 4. Выведите имя и максимальный возраст только для неуникальных имен.
--    Результат отсортируйте по возрасту в порядке возрастания.

SELECT first_name AS Имя,
       MAX(age)   AS Максимальный_возраст
FROM employee
GROUP BY first_name
HAVING COUNT(first_name) > 1
ORDER BY Максимальный_возраст;











