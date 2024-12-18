# Stored Procedures

This repository contains SQL scripts for creating and invoking stored procedures for managing records in a Worker table. The Worker table consists of the following fields:

Worker_Id INT

FirstName CHAR(25)

LastName CHAR(25)

Salary INT

JoiningDate DATETIME

Department CHAR(25)

### Table of Contents

     * Add a New Worker Record

     * Retrieve Salary of a Worker

     * Update Worker Department

     * Retrieve Worker Count by Department
     
     * Retrieve Average Salary by Department

1. Add a New Worker Record :
   
This stored procedure takes in IN parameters for all the columns in the Worker table and adds a new record.

2. Retrieve Salary of a Worker:
   
This stored procedure takes in an IN parameter for WORKER_ID and an OUT parameter for SALARY. It retrieves the salary of the worker with the given ID.

3. Update Worker Department:
   
This stored procedure takes in IN parameters for WORKER_ID and DEPARTMENT. It updates the department of the worker with the given ID.

4. Retrieve Worker Count by Department:
   
This stored procedure takes in an IN parameter for DEPARTMENT and an OUT parameter for p_workerCount. It retrieves the number of workers in the given department.

5. Retrieve Average Salary by Department:
   
This stored procedure takes in an IN parameter for DEPARTMENT and an OUT parameter for p_avgSalary. It retrieves the average salary of all workers in the given department.

