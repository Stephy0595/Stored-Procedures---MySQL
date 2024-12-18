CREATE DATABASE Assignment9;

USE Assignment9;

CREATE TABLE Workers (
Worker_Id INT, 
FirstName VARCHAR(25), 
LastName VARCHAR(25), 
Salary INT, 
JoiningDate DATE,
Department VARCHAR(25));

INSERT INTO Workers (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department) VALUES
(1, 'Arjun', 'Nair',26000, '2024-05-02', 'IT'),
(2, 'Evelyn Grace', 'Thompson', 20000,'2024-06-12', 'MARKETING'),
(3, 'Benjamin Lucas', 'Reed',20000, '2024-03-26', 'IT'),
(4, 'Rahul', 'Gupta', 40000, '2024-01-21','HR'),
(5, 'Aaliya', 'Sharma', 22000,'2024-07-11','INSURANCE'),
(6, 'Isabella Rose', 'Bennett', 35000,'2024-08-03', 'ACCOUNTS'),
(7, 'Kavya', 'Iyer', 35000, '2024-07-23', 'ACCOUNTS'),
(8, 'Siddarth', 'Mohan', 26000, '2024-06-10', 'MARKETING'),
(9, 'Deepthi', 'Varma', 24000,'2024-04-29', 'IT'),
(10, 'Suraj', 'Joshi', 37000,'2024-07-16', 'IT'); 

DELIMITER //
CREATE PROCEDURE sp_add_worker(
    IN p_Worker_Id INT,
    IN p_FirstName VARCHAR(25),
    IN p_LastName VARCHAR(25),
    IN p_Salary INT,
    IN p_JoiningDate DATE,
    IN p_Department VARCHAR(25)
)
BEGIN
    INSERT INTO Workers (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department) 
    VALUES (p_Worker_Id, p_FirstName, p_LastName, p_Salary, p_JoiningDate, p_Department);
END //
DELIMITER ;

CALL sp_add_worker(11, 'John', 'Doe', 25000, '2024-09-01', 'HR');
SELECT * FROM Workers WHERE Worker_Id = 11;

DELIMITER $$

CREATE PROCEDURE sp_GetWorkerSalary(
    IN p_Worker_Id INT,
    OUT p_Salary INT
)
BEGIN
    SELECT Salary INTO p_Salary
    FROM Workers
    WHERE Worker_Id = p_Worker_Id;

    IF p_Salary IS NULL THEN
        SET p_Salary = 0;
    END IF;
END$$

DELIMITER ;

SET @salary = 0;
CALL sp_GetWorkerSalary(5, @salary);
SELECT @salary;

DELIMITER $$

CREATE PROCEDURE sp_UpdateDepartment(
    IN p_Worker_Id INT,
    IN p_Department VARCHAR(25)
)
BEGIN
    -- Update the department for the given Worker_Id
    UPDATE Workers
    SET Department = p_Department
    WHERE Worker_Id = p_Worker_Id;
END$$

DELIMITER ;

CALL sp_UpdateDepartment(7, 'FINANCE');

SELECT * FROM Workers WHERE Worker_Id = 7;

DELIMITER $$

CREATE PROCEDURE sp_GetWorkerCountByDepartment(
    IN p_Department VARCHAR(25),
    OUT p_workerCount INT
)
BEGIN
   
    SELECT COUNT(*) INTO p_workerCount
    FROM Workers
    WHERE Department = p_Department;
END$$

DELIMITER ;

SET @workerCount = 0;
CALL sp_GetWorkerCountByDepartment('MARKETING', @workerCount);

SELECT @workerCount;

DELIMITER $$

CREATE PROCEDURE sp_GetAvgSalaryByDepartment(
    IN p_Department VARCHAR(25),
    OUT p_avgSalary DECIMAL(10, 2)
)
BEGIN
   
    SELECT AVG(Salary) INTO p_avgSalary
    FROM Workers
    WHERE Department = p_Department;
END$$

DELIMITER ;

SET @avgSalary = 0;
CALL sp_GetAvgSalaryByDepartment('IT', @avgSalary);

SELECT @avgSalary;