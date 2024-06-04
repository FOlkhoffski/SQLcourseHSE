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
    room_number INT UNIQUE NOT NULL,
    type VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

-- Создание таблицы services
CREATE TABLE services (
    service_id INT PRIMARY KEY,
    service_name VARCHAR(100) NOT NULL,
    service_type VARCHAR(50) CHECK (service_type IN ('basic', 'vip')),
    price DECIMAL(10, 2) NOT NULL
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
(4, 'Степан Дидуренко', 'M', '214901235', 'sidova@hse.ru'),
(5, 'Наталья Фирстова', 'F', '3900021235', 'kuznetsovahelga@gmail.com'),
(6, 'Яков Лава', 'F', '6934519820', 'yakapakhlava@gmail.com'),
(7, 'Володимир Абибасов','M', '8206724921', 'vladidas@mail.ru'),
(8, 'Карл Пирсон', 'M', '7911452176', 'chisquare@stat.com'),
(9, 'Рональд Фишер', 'M', '6881372142', 'ftestbyme@mai.ru'),
(10, 'Андрей Марков', 'M', '7194632914', 'chainmark@yandex.ru'),
(11, 'Болеслав Терминатор', 'M', '2315152328', 'terminator228@list.ru'),
(12, 'Мирослав Трансформер', 'M', '8451839871', 'transformer420@yahoo.com');
    

-- Заполнение таблицы rooms
INSERT INTO rooms (room_id, room_number, type, price) VALUES
(1, 101, 'одноместный', 30000.00),
(2, 102, 'двухместный', 50000.00),
(3, 201, 'люкс', 100000.00),
(4, 202, 'полулюкс', 70000.00),
(5, 301, 'стандарт', 40000.00);

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
(10, 'концерт группы', 'vip', 20000.00)

-- Заполнение таблицы bookings
INSERT INTO bookings (booking_id, guest_id, room_id, check_in, check_out) VALUES
(111, 1, 101, '2024-06-01', '2024-06-10'),
(112, 2, 201, '2024-06-05', '2024-06-15'),
(113, 3, 102, '2024-06-07', '2024-06-12'),
(114, 4, 202, '2024-06-02', '2024-06-09'),
(115, 8, 301, '2024-06-03', '2024-06-08'),
(116, 5, 102, '2024-06-07', '2024-06-12');

-- Заполнение таблицы reserved
INSERT INTO reserved (reserved_id, employee_name, reserve_time, booking_id) VALUES
(1, 'Владимир Хихитрян', '2024-05-25 10:00:00', 11),
(2, 'Ольга Бузова', '2024-05-26 11:00:00', 12),
(3, 'Владимир Хихитрян', '2024-05-27 12:00:00', 13),
(4, 'Наталья Емелина', '2024-05-28 13:00:00', 14),
(5, 'Сергей Володилав', '2024-05-29 14:00:00', 15);

-- Заполнение таблицы opt_bookings
INSERT INTO opt_bookings (service_date, service_id, room_id, place) VALUES
('2024-06-05', 1, 101, 'ресторан'),
('2024-06-05', 2, 102, 'номер'),
('2024-06-09', 3, 201, 'прачечная'),
('2024-06-03', 4, 202, 'спа-центр'),
('2024-06-06', 5, 301, 'ресторан');
