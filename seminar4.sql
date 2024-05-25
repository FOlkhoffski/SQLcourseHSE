CREATE TABLE tree1 (
    name VARCHAR(50) PRIMARY KEY,
    boss VARCHAR(50),
    salary INT
);

INSERT INTO tree1 VALUES('Иванов', NULL, 1000);
INSERT INTO tree1 VALUES('Петров', 'Иванов', 900);
INSERT INTO tree1 VALUES('Сидоров', 'Иванов', 850);
INSERT INTO tree1 VALUES('Смирнов', 'Петров', 840);
INSERT INTO tree1 VALUES('Федоров', 'Петров', 800);
INSERT INTO tree1 VALUES('Андреев', 'Сидоров', 700);
INSERT INTO tree1 VALUES('Алексеев', 'Сидоров', 700);
INSERT INTO tree1 VALUES('Борисов', 'Сидоров', 740);

SELECT name FROM tree1 WHERE boss = 'Иванов';

CREATE TABLE tree2 (
    name VARCHAR(50),
    salary INT,
    edgepath VARCHAR(50)
);

INSERT INTO tree2 VALUES('Иванов', 1000, '1');
INSERT INTO tree2 VALUES('Петров', 900, '1.1');
INSERT INTO tree2 VALUES('Сидоров', 850, '1.2');
INSERT INTO tree2 VALUES('Смирнов', 840, '1.1.1');
INSERT INTO tree2 VALUES('Федоров', 800, '1.1.2');
INSERT INTO tree2 VALUES('Андреев', 700, '1.2.1');
INSERT INTO tree2 VALUES('Алексеев', 700, '1.2.2');
INSERT INTO tree2 VALUES('Борисов', 740, '1.2.3');
-- Выводим Петрова и всех его подчинённых
SELECT name FROM tree2 WHERE edgepath LIKE '1.1%';

-- Выводим Андреева и всех его начальников
SELECT name FROM tree2 WHERE '1.2.1' LIKE edgepath || '%';

CREATE TABLE tree3 (
    name VARCHAR(50) NOT NULL PRIMARY KEY,
    salary INT,
    lft INT NOT NULL UNIQUE CHECK (lft>0),
    rght INT NOT NULL UNIQUE CHECK (rght>1),
    CONSTRAINT order_okay CHECK (lft<rght)
);

INSERT INTO tree3 VALUES('Иванов', 1000, 1, 16);
INSERT INTO tree3 VALUES('Петров', 900, 2, 7);
INSERT INTO tree3 VALUES('Сидоров', 850, 8, 15);
INSERT INTO tree3 VALUES('Смирнов', 840, 3, 4);
INSERT INTO tree3 VALUES('Федоров', 800, 5, 6);
INSERT INTO tree3 VALUES('Андреев', 700, 9, 10);
INSERT INTO tree3 VALUES('Алексеев', 700, 11, 12);
INSERT INTO tree3 VALUES('Борисов', 740, 13, 14);

--Выводим Сидорова и всех его подчиненных
SELECT y.name
FROM tree3 x, tree3 y
WHERE y.lft BETWEEN x.lft AND x.rght AND x.name = 'Сидоров';


SELECT name
FROM tree3
WHERE lft BETWEEN (SELECT lft FROM tree3 WHERE name = 'Сидоров')
AND () WHERE name = 'Сидоров';
AND () WHERE name = 'Сидоров';

-- Выводим Борисова и всех его начальников

SELECT y.name
FROM tree3 x, tree3 y
WHERE x.name = 'Борисов' AND y.lft <= x.lft AND y.rght >= x.lft ;

SELECT name
FROM tree3
WHERE lft <= (SELECT lft FROM tree3 WHERE name = 'Борисов')
AND rght >= (SELECT rght FROM tree3 WHERE name = 'Борисов');

SELECT * FROM tree3
