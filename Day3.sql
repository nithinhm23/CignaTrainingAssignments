CREATE TABLE Dept(
Deptno NUMBER(5) PRIMARY KEY,
Dname VARCHAR(255),
Loc VARCHAR(255));

CREATE TABLE Emps(
Empno NUMBER NOT NULL,
Ename VARCHAR(255), 
Job VARCHAR(20),
Sal NUMBER,
Deptno NUMBER(5),
CONSTRAINT Fk_deptno FOREIGN KEY (Deptno) REFERENCES Dept(Deptno));

DROP TABLE Emps;
INSERT INTO Dept(Deptno,Dname,Loc) VALUES (200, 'Data Analysis', 'Seattle');

INSERT INTO Dept(Deptno,Dname,Loc) VALUES (210, 'QA', 'Bengaluru');

INSERT INTO Dept(Deptno,Dname,Loc) VALUES (230, 'Sales', 'Hyderabad');

INSERT INTO Dept(Deptno,Dname,Loc) VALUES (300, 'Dev', 'Chennai');

INSERT INTO Dept(Deptno,Dname,Loc) VALUES (290, 'Accounting', 'Delhi');
SELECT * FROM Dept;

INSERT INTO Emps(Empno,Ename,Job,Sal,Deptno) VALUES (100,'Sam','Analyst',35000,200);

INSERT INTO Emps(Empno,Ename,Job,Sal,Deptno) VALUES (110,'Shyam','Tester',46000,210);

INSERT INTO Emps(Empno,Ename,Job,Sal,Deptno) VALUES (140,'Ram','RM',54000,230);

INSERT INTO Emps(Empno,Ename,Job,Sal,Deptno) VALUES (390,'Surya','Acc',30000,290);

INSERT INTO Emps(Empno,Ename,Job,Sal) VALUES (237,'Shyam','HR',34000);
SELECT * FROM Emps;

--RELATED QUERIES
--a.
SELECT e.Ename,d.Dname FROM Emps e INNER JOIN Dept d ON e.Deptno=d.Deptno;

--b
SELECT e.Ename,e.Job,d.Loc FROM Emps e INNER JOIN Dept d ON e.Deptno=d.Deptno;

--c
SELECT e.Ename FROM Emps e INNER JOIN Dept d on e.Deptno=d.Deptno Where Dname='Sales';

--d
SELECT
    d.Dname AS DepartmentName,
    d.Loc AS DepartmentLocation,
    e.Ename AS EmployeeName
FROM
    Dept d
LEFT JOIN
    Emps e
ON
    d.Deptno = e.Deptno;

--e
SELECT
    d.Dname AS DepartmentName,
    d.Loc AS DepartmentLocation,
    e.Ename AS EmployeeName,
    e.Job
FROM
    Emps e
FULL OUTER JOIN
    Dept d
ON
    e.Deptno = d.Deptno;

--f
SELECT d.Dname, SUM(e.Sal)AS Total_Salary FROM Dept d INNER JOIN Emps e ON d.Deptno=e.Deptno GROUP BY d.Dname;

--g
SELECT d.Dname, COUNT(e.Ename) AS Num_Emp FROM Dept d INNER JOIN Emps e ON d.Deptno=e.Deptno GROUP BY d.Dname HAVING COUNT(e.Ename)>0;

--h
SELECT E.Ename, D.Dname, D.Loc
FROM Emps E
JOIN Dept D ON E.Deptno = D.Deptno
WHERE D.Loc = (
    SELECT Loc
    FROM Dept
    WHERE Dname = 'Accounting'
);

--i
SELECT
    d.Dname,
    e.Ename,
    e.Sal
FROM
    Emps e
JOIN
    Dept d ON e.Deptno = d.Deptno
WHERE
    e.Sal = (SELECT MAX(e2.Sal) FROM Emps e2 WHERE e2.Deptno = e.Deptno);

--j
SELECT

    e.Ename,
    e.Sal
FROM
    Emps e
JOIN
    Dept d ON e.Deptno = d.Deptno
WHERE
    e.Sal > (SELECT AVG(e2.Sal) FROM Emps e2 WHERE e2.Deptno = e.Deptno);
