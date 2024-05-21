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
6) SELECT 
