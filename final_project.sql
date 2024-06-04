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
    employee_name VARCHAR(100) NOT NULL,
    reserve_time TIMESTAMP NOT NULL,
    booking_id INT,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);

-- Создание таблицы opt_bookings
CREATE TABLE opt_bookings (
    service_date DATE,
    service_id INT,
    room_id INT,
    PRIMARY KEY (service_date, service_id),
    place VARCHAR(100) NOT NULL,
    FOREIGN KEY (service_id) REFERENCES services(service_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
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
(1, 101, 'одноместный', 30000.00),
(2, 102, 'двухместный', 50000.00),
(3, 201, 'люкс', 100000.00),
(4, 202, 'полулюкс', 70000.00),
(5, 301, 'стандарт', 40000.00),
(6, 103, 'одноместный', 35000.00);

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
(111, 1, 101, TO_DATE('2024-06-01', 'YYYY-MM-DD'), TO_DATE('2024-06-10', 'YYYY-MM-DD')),
(112, 2, 201, TO_DATE('2024-06-05', 'YYYY-MM-DD'), TO_DATE('2024-06-16', 'YYYY-MM-DD')),
(113, 3, 102, TO_DATE('2024-06-07', 'YYYY-MM-DD'), TO_DATE('2024-06-12', 'YYYY-MM-DD')),
(114, 4, 202, TO_DATE('2024-06-02', 'YYYY-MM-DD'), TO_DATE('2024-06-21', 'YYYY-MM-DD')),
(115, 8, 301, TO_DATE('2024-06-03', 'YYYY-MM-DD'), TO_DATE('2024-06-08', 'YYYY-MM-DD')),
(116, 5, 102, TO_DATE('2024-06-07', 'YYYY-MM-DD'), TO_DATE('2024-06-12', 'YYYY-MM-DD'));

-- Заполнение таблицы reserved
INSERT INTO reserved (reserved_id, employee_name, reserve_time, booking_id) VALUES
(1, 'Владимир Хихитрян', TO_TIMESTAMP('2024-05-25 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 111),
(2, 'Ольга Бузова', TO_TIMESTAMP('2024-05-26 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 112),
(3, 'Владимир Хихитрян', TO_TIMESTAMP('2024-05-27 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 113),
(4, 'Наталья Емелина', TO_TIMESTAMP('2024-05-28 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 114),
(5, 'Сергей Володилав', TO_TIMESTAMP('2024-05-29 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 115);

-- Заполнение таблицы opt_bookings
INSERT INTO opt_bookings (service_date, service_id, room_id, place) VALUES
(TO_DATE('2024-06-05', 'YYYY-MM-DD'), 1, 101, 'ресторан'),
(TO_DATE('2024-06-05', 'YYYY-MM-DD'), 2, 102, 'номер'),
(TO_DATE('2024-06-09', 'YYYY-MM-DD'), 3, 201, 'прачечная'),
(TO_DATE('2024-06-03', 'YYYY-MM-DD'), 4, 202, 'спа-центр'),
(TO_DATE('2024-06-06', 'YYYY-MM-DD'), 5, 301, 'ресторан');



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

-- Вывести всех гостей, кто выезжает после 13 июня
SELECT DISTINCT g.full_name, g.email
FROM guests g
JOIN bookings b ON g.guest_id = b.guest_id
WHERE b.check_out >= TO_DATE('2023-06-13', 'YYYY-MM-DD');

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

-- Выведем имена и телефоны всех гостей, у которых нет электронной почты
SELECT full_name, phone
FROM guests
WHERE email IS NULL;


