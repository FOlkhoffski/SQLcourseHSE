CREATE TABLE schools (
  snum NUMERIC(1) PRIMARY KEY, 
  sname VARCHAR(20) 
);

INSERT INTO schools VALUES(1, 'Школа № 763');
INSERT INTO schools VALUES(2, 'Школа № 123');
INSERT INTO schools VALUES(3, 'Школа № 245');

CREATE TABLE pupils (
  pupnum INT PRIMARY KEY, 
  snum INT REFERENCES schools, 
  pupname VARCHAR(50) NOT NULL,
  birth DATE, 
  score NUMERIC(3)
);

INSERT INTO pupils VALUES(1, 1, 'Петров Юрий Борисович', '01-FEB-2004', 99);
INSERT INTO pupils VALUES(2, 1, 'Козлов Иван Петрович', '12-MAR-2002', 85);
INSERT INTO pupils VALUES(3, 2, 'Иванова Анна Сергеевна', '23-APR-2004', 83);
INSERT INTO pupils VALUES(4, 3, 'Селиванова Ольга Петровна', '12-MAY-2005', 100);
INSERT INTO pupils VALUES(5, 3, 'Барсуков Илья Борисович', '13-JUL-2003', 34);
INSERT INTO pupils VALUES(6, 3, 'Сидорова Мария Викторовна', '02-JUN-2001', 56);

CREATE TABLE parents (
  pupnum INT REFERENCES pupils, 
  parname VARCHAR(50),
  sex CHAR(2), 
  CHECK (sex IN ('м','ж'))
);

INSERT INTO parents VALUES (1, 'Петров Борис' , 'м');
INSERT INTO parents VALUES (1, 'Петрова Ольга' , 'ж');
INSERT INTO parents VALUES (2, 'Козлов Пётр' , 'м');
INSERT INTO parents VALUES (2, 'Козлова Инна' , 'ж');
INSERT INTO parents VALUES (3, 'Иванов Сергей' , 'м');
INSERT INTO parents VALUES (3, 'Иванова Алла' , 'ж');
INSERT INTO parents VALUES (4, 'Селиванова Инна' , 'ж');
INSERT INTO parents VALUES (5, 'Барсуков Борис' , 'м');
INSERT INTO parents VALUES (5, 'Кузнецова Ольга' , 'ж');
INSERT INTO parents VALUES (6, 'Сидорова Анна' , 'ж');

1) SELECT COUNT(*) AS Число_учеников FROM pupils;
2) SELECT MIN(score) as Минимальный_балл, MAX(score) as Максимальный_балл FROM pupils;
3) SELECT AVG(score) as Средний_балл FROM pupils WHERE snum = 2;
4) SELECT snum as Номер_школы, AVG(score) as Средний_балл FROM pupils GROUP BY (snum);
5) SELECT snum as Номер_школы, COUNT(*) as Количество_учеников FROM pupils GROUP BY snum;
6) SELECT s.sname as Название_школы FROM schools s NATURAL JOIN pupils p GROUP BY(s.sname) HAVING COUNT(*)>2;
7) SELECT p.pupname as ФИО_ученика, par.parname as ФИО_родителя FROM pupils p JOIN parents par ON p.pupnum = par.pupnum;
8) SELECT p.pupname as ФИО_ученика, COUNT(par.parname) as Кол_во_родителей FROM parents par JOIN pupils p ON p.pupnum = par.pupnum GROUP BY(p.pupname); 
9) -- Просчитать количество женщин-родителей в каждой школе

--- Дополнительные 5 запросов к БД
1) -- Вывести имена родиетей высокобалльников 
  SELECT p.pupname as ФИО_ученика, par.parname as ФИО_родителя FROM pupils p WHERE score > 80 JOIN parents par ON p.pupnum = par.parnum;
2) -- Вывести список всех учеников с именами и полом их родителей
SELECT p.pupname AS ФИО_ученика, par.parname AS ФИО_родителя, 'м' AS Пол_родителя
FROM pupils p
JOIN parents pa ON pu.pupnum = pa.pupnum
WHERE par.sex = 'м'
UNION
SELECT p.pupname AS ФИО_ученика, pa.parname AS ФИО_родителя, 'ж' AS Пол_родителя
FROM pupils p
JOIN parents par ON p.pupnum = par.pupnum
WHERE par.sex = 'ж';
3) -- Вывести возраст старших и младших учеников 
SELECT s.sname AS Название_школы, 
       MAX(YEAR(CURDATE()) - YEAR(p.birth)) AS Самый_старый, 
       MIN(YEAR(CURDATE()) - YEAR(p.birth)) AS Самый_молодой
FROM schools s
JOIN pupils p ON s.snum = p.snum
GROUP BY s.sname;
4) --  Вывести количество родителей по школе
SELECT s.sname AS Название_школы, COUNT(par.parname) AS Число_родителей
FROM schools s
JOIN pupils p ON s.snum = p.snum
JOIN parents par ON p.pupnum = par.pupnum
GROUP BY s.sname;
5) -- Запрос для получения имен учеников и их родителей-женщин, отсортированных по именам учеников 
  SELECT p.pupname AS pupil_name, par.parname AS ФИО_родителя
FROM pupils p
WHERE par.sex = 'ж'
JOIN parents par ON p.pupnum = par.pupnum
ORDER BY p.pupname;









  --------------
---Создаём таблицу «Школы»
CREATE TABLE school ( 
schoolno NUMERIC(3) CONSTRAINT pk_sch PRIMARY KEY, 
name VARCHAR(80) NOT NULL);

---Заполняем данными таблицу «Школы»
INSERT INTO school  VALUES(001, 'Школа № 763');
INSERT INTO school  VALUES(002, 'Школа № 123');
INSERT INTO school  VALUES(003, 'Школа № 245');
INSERT INTO school  VALUES(004, 'Школа № 145');
INSERT INTO school  VALUES(005, 'Школа № 255');

---Создаём таблицу «Школы2»
CREATE TABLE school2 ( 
schoolno NUMERIC(3), 
name VARCHAR(80) NOT NULL);

---Заполняем данными таблицу «Школы2»
INSERT INTO school2  VALUES(001, 'Школа № 763');
INSERT INTO school2  VALUES(002, 'Школа № 123');
INSERT INTO school2  VALUES(333, 'Школа № 845');
INSERT INTO school2  VALUES(444, 'Школа № 245');
INSERT INTO school2  VALUES(555, 'Школа № 655');

---Создаём таблицу «Ученики»
CREATE TABLE pupil(  
  pupnum    number(3,0) CONSTRAINT pk_pup PRIMARY KEY,
  schoolno    number(3,0),  	
  pupname     varchar2(50) NOT NULL,  
  born     date,  
  grade   number(10,1)
);

---Заполняем данными таблицу «Ученики» 
INSERT INTO pupil  VALUES(001, 001, 'Петров Юрий Борисович', '01-FEB-2004', 99);
INSERT INTO pupil  VALUES(002, 001, 'Козлов Иван Петрович', '12-MAR-2002', 85);
INSERT INTO pupil  VALUES(003, 002, 'Иванова Анна Сергеевна', '23-APR-2004', 83);
INSERT INTO pupil  VALUES(004, 003, 'Селиванова Ольга Петровна', '12-MAY-2005', 100);
INSERT INTO pupil  VALUES(005, 003, 'Барсуков Илья Борисович', '13-JUL-2003', 34);
INSERT INTO pupil  VALUES(006, 003, 'Сидорова Мария Викторовна', '02-JUN-2001', 56);
INSERT INTO pupil  VALUES(007, 012, 'Спиридов Василий Иванович', '01-JUL-2001', 96);
INSERT INTO pupil  VALUES(777, 013, 'Васильев Иван Петрович', '02-AUG-2001', 86);

1) SELECT * FROM school CROSS JOIN pupil;
2) SELECT * FROM school s JOIN pupil p on p.schoolno = s.schoolno; 
3) SELECT * FROM school UNION SELECT * FROM school2;
4) SELECT * FROM school MINUS SELECT * FROM school2;
5) SELECT * FROM school INTERSECT SELECT * FROM school2;
6) SELECT * FROM school s LEFT JOIN pupil p ON s.schoolno = p.schoolno;
7) SELECT * FROM school s RIGHT JOIN pupil p ON s.schoolno = p.schoolno;
8) SELECT * FROM school s FULL OUTER JOIN pupil p ON s.schoolno = p.schoolno;
9) SELECT DISTINCT name FROM school JOIN pupil ON school.schoolno = pupil.schoolno;


--- Дополнительные 5 запросов:
1) -- Школы и ученики, родившиеся после 2003 года
SELECT s.name AS Название_школы, 
       COUNT(p.pupnum) AS Число_учеников
FROM school s
JOIN pupil p ON s.schoolno = p.schoolno
WHERE p.born > DATE '2003-01-01'
GROUP BY s.name;

2) -- Список школ с общим количеством учеников и их средней оценкой, включая школы без учеников
SELECT s.name AS Название_школы, 
       COUNT(p.pupnum) AS Число_учеников, 
       COALESCE(AVG(p.grade), 0) AS Средняя_оценка
FROM school s
LEFT JOIN pupil p ON s.schoolno = p.schoolno
GROUP BY s.name;

3) -- Школы со средней оценкой выше 80 и числом учеников в ней
SELECT s.name AS Название_школы, 
       AVG(p.grade) AS Средняя_оценка, 
       COUNT(p.pupnum) AS Число_учеников
FROM school s
JOIN pupil p ON s.schoolno = p.schoolno
GROUP BY s.name
HAVING AVG(p.grade) > 80;

4) -- Объединённый список школ с указанием таблицы, из которой была взята запись 
SELECT schoolno, name, 'school' AS источник
FROM school
UNION
SELECT schoolno, name, 'school2' AS источник
FROM school2;
 
