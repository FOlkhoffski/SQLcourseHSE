-- Создание таблицы guests
CREATE TABLE guests (
    guest_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    gender CHAR(1) CHECK (gender IN ('M', 'F')),
    phone VARCHAR(15),
    email VARCHAR(100)
);

-- Создание таблицы rooms
CREATE TABLE rooms (
    room_id INT PRIMARY KEY,
    room_INT INT UNIQUE NOT NULL,
    type VARCHAR(50) NOT NULL,
    price INT(10, 2) NOT NULL
);

-- Создание таблицы services
CREATE TABLE services (
    service_id INT PRIMARY KEY,
    service_name VARCHAR(100) NOT NULL,
    service_type VARCHAR(50) CHECK (service_type IN ('basic', 'vip')),
    price INT(10, 2) NOT NULL
);

DROP TABLE bookings
-- Создание таблицы bookings
CREATE TABLE bookings (
    booking_id INT PRIMARY KEY,
    guest_id INT,
    room_id INT,
    check_in DATE NOT NULL,
    check_out DATE NOT NULL,
    FOREIGN KEY (guest_id) REFERENCES guests(guest_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);

-- Создание таблицы reserved
CREATE TABLE reserved (
    reserved_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    reserve_date DATE,
    reserve_time TIMESTAMP NOT NULL,
    booking_id INT,
    FOREIGN KEY (employee_name) REFERENCES employees(employee_name),
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);

-- Создание таблицы opt_bookings
CREATE TABLE opt_bookings (
    service_date DATE,
    service_id INT,
    room_id INT,
    place VARCHAR(50) NOT NULL,
    PRIMARY KEY (service_date, service_id),
    FOREIGN KEY (service_id) REFERENCES services(service_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);

-- Создание таблицы employees
CREATE TABLE employees (
	id_emp INT, 
	employee_name VARCHAR(100) NOT NULL,
	emp_size VARCHAR(10) CHECK (emp_size IN ('XS', 'S', 'M', 'L', 'XL')),
	emp_left INT, 
	emp_right INT
);

-- Заполнение таблицы guests
INSERT INTO guests (guest_id, full_name, gender, phone, email) VALUES
(1, 'Иван Иванов', 'M', '1234567890', 'ivanovii@gmail.com'),
(2, 'Дмитрий Лапшин', 'M', '1342547893', 'smirnovami@mail.ru'),
(3, 'Александр Сорочайкин', 'M', '71123941513', 'PETRov@yahoo.com'),
(4, 'Степан Дидуренко', 'M', '89199468488', 'travaDID@edu.hse.ru'),
(5, 'Наталья Фирстова', 'F', '3900021235', 'kuznetsovahelga@gmail.com'),
(6, 'Яков Лава', 'F', '6934519820', 'yakapakhlava@gmail.com'),
(7, 'Володимир Абибасов','M', '8206724921', 'vladidas@mail.ru'),
(8, 'Карл Пирсон', 'M', '7911452176', NULL),
(9, 'Рональд Фишер', 'M', '6881372142', 'ftestbyme@mai.ru'),
(10, 'Андрей Марков', 'M', '7194632914', 'chainmark@yandex.ru'),
(11, 'Болеслав Терминатор', 'M', '2315152328', 'terminator228@list.ru'),
(12, 'Мирослав Трансформер', 'M', '8451839871', 'transformer420@yahoo.com');
    

-- Заполнение таблицы rooms
INSERT INTO rooms (room_id, room_INT, type, price) VALUES
(101, 1, 'одноместный', 30000.00),
(102, 2, 'двухместный', 50000.00),
(201, 3, 'люкс', 100000.00),
(202, 4, 'полулюкс', 70000.00),
(103, 5, 'стандарт', 40000.00),
(301, 6, 'одноместный', 35000.00);

-- Заполнение таблицы services
INSERT INTO services (service_id, service_name, service_type, price) VALUES
(1, 'завтрак', 'basic', 1500.00),
(2, 'уборка номера', 'basic', 1000.00),
(3, 'прачечная', 'vip', 2000.00),
(4, 'спа-услуги', 'vip', 5000.00),
(5, 'ужин', 'basic', 2000.00),
(6, 'room-service', 'basic', 500.00),
(7, 'мини-бар', 'basic', 1500.00),
(8, 'мини-бар', 'vip', 5000.00),
(9, 'частный гид', 'vip', 15000.00),
(10, 'концерт группы', 'vip', 20000.00);

-- Заполнение таблицы bookings
INSERT INTO bookings (booking_id, guest_id, room_id, check_in, check_out) VALUES
(111, 1, 101, '2024-06-01', '2024-06-10'),
(112, 2, 201, '2024-06-05', '2024-06-16'),
(113, 3, 102, '2024-06-07', '2024-06-12'),
(114, 4, 202, '2024-06-02', '2024-06-21'),
(115, 8, 301, '2024-06-03', '2024-06-08'), 
(116, 5, 102, '2024-06-07', '2024-06-12'),
(117, 12, 201, '2024-07-12', '2024-07-17'),
(118, 9, 202, '2024-06-22', '2024-06-24'),
(119, 11, 301, '2024-06-15', '2024-07-12');

-- Заполнение таблицы reserved
INSERT INTO reserved (reserved_id, employee_name, reserve_date, reserve_time, booking_id) VALUES
(1, 'Владимир Хихитрян', '2024-05-25', '10:10:00', 111),
(2, 'Ольга Бузова', '2024-05-26', '11:49:00', 112),
(3, 'Владимир Хихитрян', '2024-05-27', '12:23:00', 113),
(4, 'Наталья Емелина', '2024-05-28', '13:54:00', 114),
(5, 'Сергей Володилав', '2024-05-25', '14:01:00', 115),
(6, 'Татьяна Многофеева', '2024-05-25', '22:30:00', 118),
(7, 'Марк Кельберт', '2024-05-25', '23:15:00', 116);

-- Заполнение таблицы opt_bookings
INSERT INTO opt_bookings (service_date, service_id, room_id, place) VALUES
('2024-06-05', 1, 101, 'ресторан'),
('2024-06-05', 2, 102, 'номер'),
('2024-06-09', 3, 201, 'прачечная'),
('2024-06-03', 4, 202, 'спа-центр'),
('2024-06-06', 5, 301, 'ресторан');

-- Заполнение таблицы employees
INSERT INTO employees (id_emp, employee_name, emp_size, emp_left, emp_right) VALUES
(1111, 'Владимир Хихитрян', 'L', 1, 14),
(1112, 'Наталья Емелина', 'M', 2, 11), 
(1113, 'Юлия Войонкина', 'M', 12, 13),
(1114, 'Сергей Володилав', 'XS', 3, 8), 
(1115, 'Ольга Бузова', 'XS', 4, 5),
(1116, 'Марк Кельберт', 'XL', 6, 7),
(1117, 'Татьяна Многофеева', 'XS', 9, 10);

--- Создадим SQL запросы:

-- Число комнат в отеле
SELECT COUNT(*) AS room_id FROM rooms;

-- Вывести id всех бронирований, стоимость номера которых выше среднего
SELECT booking_id
FROM bookings
WHERE room_id IN (
    SELECT room_id
    FROM rooms
    WHERE price > (SELECT AVG(price) FROM rooms)
);

-- Вывести все комнаты, где были заказаны услуги "vip"
SELECT room_id
FROM opt_bookings
WHERE service_id IN (
    SELECT service_id
    FROM services
    WHERE service_type = 'vip'
);

-- Вывести всех гостей и их электронную почту, кто выезжает после 13 июня
SELECT DISTINCT g.full_name, g.email
FROM guests g
JOIN bookings b ON g.guest_id = b.guest_id
WHERE b.check_out >= '2023-06-13';

-- Вывести все комнаты с их текущей ценой и количеством бронирований:
SELECT r.room_INT, r.price, COUNT(b.booking_id) AS booking_count
FROM rooms r
LEFT JOIN bookings b ON r.room_id = b.room_id
GROUP BY r.room_INT, r.price;

-- Вывести сотрудников, делавших бронирования и их количество
SELECT r.employee_name, COUNT(r.reserved_id) AS total_reservations
FROM reserved r
WHERE r.booking_id IN (SELECT booking_id FROM bookings)
GROUP BY r.employee_name;

-- Вывести количество бронирований для каждого типа комнаты
SELECT r.type, COUNT(b.booking_id) AS booking_count 
FROM rooms r
LEFT JOIN bookings b ON r.room_id = b.room_id
GROUP BY r.type;

-- Добавим новый столбец к таблице guests для хранения даты рождения постояльцев
ALTER TABLE guests
ADD birth_date DATE;

-- Обновим цену всех номеров типа 'стандарт' и 'люкс', увеличив её на 7%
UPDATE rooms
SET price = price * 1.07
WHERE type IN ('стандарт', 'люкс');

-- Вывести имена и телефоны всех гостей, у которых нет электронной почты
SELECT full_name, phone
FROM guests
WHERE email IS NULL;

-- Вывести размер одежды сотрудников, которые сделали бронирование 25 июня
SELECT e.emp_size, COUNT(*) as size_count
FROM reserved r
JOIN employees e ON r.employee_name = e.employee_name
WHERE r.reserve_date = '2024-06-25'
GROUP BY e.emp_size;

-- Вывести все номера, которые были забронированы подчинёнными Натальи Емелиной
SELECT b.room_id
FROM bookings b
JOIN reserved r ON b.booking_id = r.booking_id
JOIN employees e1 ON r.employee_name = e1.employee_name
JOIN employees e2 ON e2.employee_name = 'Наталья Емелина'
WHERE e1.emp_left > e2.emp_left AND e1.emp_right < e2.emp_right;


