1) SELECT COUNT(*) AS Число_учеников FROM pupils
2) SELECT MIN(score), MAX(score) FROM pupils
3) SELECT AVG(score) FROM pupils WHERE snum = 123
4) SELECT AVG(score) FROM pupils GROUP BY (snum)
5) SELECT schoolno, COUNT(*) FROM pupils GROUP BY snum


