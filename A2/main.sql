--Create the DEPARTMENT table if it does not exist
CREATE TABLE IF NOT EXISTS DEPARTMENT (
EMPLOYEE_ID TEXT,
NAME TEXT,
DEPARTMENT_ID TEXT,
MANAGER_ID TEXT,
SALARY REAL 
);
--insert sample data into the DEPARTMENT table
INSERT INTO DEPARTMENT (EMPLOYEE_ID, NAME, DEPARTMENT_ID, MANAGER_ID, SALARY) VALUES
('100', 'JOHN', '90', '100', 24000),
('101', 'JAMES', '90', '100', 17000),
('102', 'TROY', '90', '102', 9000),
('103', 'REX', '960', '103', 48000),
('104', 'DIANA', '60', '103', 25000),
('105', 'LUV', '50', '100', 4200),
('106', 'DAVID', '90', '1020', 6000);
--Query to count the number of epmloyees in each department
SELECT department_id,
COUNT(*)
FROM DEPARTMENT
GROUP BY department_id;
--Query to sum the salary of each department
SELECT department_id, SUM(salary)
FROM DEPARTMENT
GROUP BY DEPARTMENT_ID;
--Query to count the number of employees and sum the salary in each department
SELECT DEPARTMENT_ID
COUNT(*) 
SUM(SALARY)
FROM DEPARTMENT
GROUP BY DEPARTMENT_ID;
--Query to sum the salary of employees with a specific manager
SELECT DEPARTMENT_ID
SUM(SALARY)
FROM DEPARTMENT
WHERE MANAGER_ID = '103'
GROUP BY DEPARTMENT_ID;
--Query to find departments with more than 2 employees
SELECT DEPARTMENT_ID
FROM DEPARTMENT
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) > 2;