/* CREATING TABLES */
/* DATA TYPES
https://docs.microsoft.com/es-es/sql/t-sql/data-types/data-types-transact-sql?view=sql-server-ver15
*/

-- Create the employee table
CREATE TABLE employee (
    emp_id INT NOT NULL,
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    sex CHAR(1),
    salary INT,
    super_id INT,
    branch_id INT,
    PRIMARY KEY (emp_id)
);


-- Now that the employee table has been created, we can add a foreign key pointing to itself for the supervisor id
ALTER TABLE employee ADD
FOREIGN KEY (super_id) REFERENCES employee (emp_id) ON DELETE SET NULL;

-- Create the branch table
CREATE TABLE branch(
    branch_id INT,
    branch_name VARCHAR(20),
    mgr_id INT,
    PRIMARY KEY (branch_id),
    FOREIGN KEY (mgr_id) REFERENCES employee (emp_id) ON DELETE SET NULL
);


-- Alter employee table to add foreign key: Branch
ALTER TABLE employee ADD
FOREIGN KEY (branch_id) REFERENCES branch (branch_id) ON DELETE SET NULL;

-- Create the client table
CREATE TABLE client(
    client_id INT,
    client_name VARCHAR(30),
    branch_id INT,
    PRIMARY KEY (client_id),
    FOREIGN KEY (branch_id) REFERENCES branch (branch_id) ON DELETE SET NULL
);

-- Create works_with table
CREATE TABLE works_with(
    emp_id INT,
    client_id INT,
    total_sales INT,
    PRIMARY KEY (emp_id, client_id),
    FOREIGN KEY (emp_id) REFERENCES employee (emp_id) ON DELETE CASCADE,
    FOREIGN KEY (client_id) REFERENCES client (client_id) ON DELETE CASCADE
);

-- Create branch_supplier with table
CREATE TABLE branch_supplier(
    branch_id INT,
    supplier_name VARCHAR(30),
    supply_type VARCHAR(30),
    PRIMARY KEY (branch_id, supplier_name),
    FOREIGN KEY (branch_id) REFERENCES branch (branch_id) ON DELETE CASCADE
);

-- DROP TABLES employee;
SHOW TABLES;

/* ADDING ATTRIBUTES */

-- Add first employee
INSERT INTO employee
VALUES (100, 'David', 'Wallace', 'M', 250000, NULL, NULL);

-- Add first branch
INSERT INTO branch
VALUE (1, 'Corporate', 100);

-- Update branch_id column on the employee table
UPDATE employee
SET branch_id = 1
WHERE emp_id = 100;

-- Add second employee
INSERT INTO employee
VALUE (101, 'Jan', 'Levinson', 'F', 110000, 100, 1);

-- Add third employee
INSERT INTO employee
VALUE (102, 'Michael', 'Scott', 'M', 75000, 100, NULL);

-- Add second branch
INSERT INTO branch
VALUE (2, 'Scranton', 102);

-- Update third employee branch
UPDATE employee
SET branch_id = 2
WHERE emp_id = 102;

-- Add employees: 103, 104 and 105
INSERT INTO employee
VALUE 
    (103, 'Angela', 'Martin', 'F', 63000, 102, 2),
    (104, 'Kelly', 'Kapoor', 'F', 55000, 102, 2),
    (105, 'Stanley', 'Hudson', 'M', 69000, 102, 2);

-- Add employee 106
INSERT INTO employee
VALUE (106, 'Josh', 'Porter', 'M', 78000, 100, NULL);

-- Add third branch in the branch table
INSERT INTO branch
VALUE(3, 'Stamford', 106);

-- Update employee 106
UPDATE employee
SET branch_id = 3
WHERE emp_id = 106;
SELECT * FROM employee;
-- Add employees: 107 and 108
INSERT INTO employee
VALUE
    (107, 'Andy', 'Bernard', 'M', 65000, 106, 3),
    (108, 'Jim', 'Halpert', 'M', 71000, 106, 3);

-- Adding attributes to the branch supplier table
INSERT INTO branch_supplier
VALUES
    (2, 'Hammer Mill', 'Paper'),
    (2, 'Uni-ball', 'Writing Utensils'),
    (3, 'Patriot Paper', 'Paper'),
    (2, 'J.T. Forms & Labels', 'Custom Forms'),
    (3, 'Uni-ball', 'Writing Utensils'),
    (3, 'Hammer Mill', 'Paper'),
    (3, 'Stamford Lables', 'Custom Forms');
-- Adding attributes to the client table
INSERT INTO client
VALUES
    (400, 'Dunmore Highschool', 2),
    (401, 'Lackawana Country', 2),
    (402, 'FedEx', 3),
    (403, 'John Daly Law, LLC', 3),
    (404, 'Scranton Whitepages', 2),
    (405, 'Times Newspaper', 3),
    (406, 'FedEx', 2);

-- Adding attributes to the client table
INSERT INTO works_with
VALUES
    (105, 400, 55000),
    (102, 401, 267000),
    (108, 402, 22500),
    (107, 403, 5000),
    (108, 403, 12000),
    (105, 404, 33000),
    (107, 405, 26000),
    (102, 406, 15000),
    (105, 406, 130000);
-- Basic queries    
SELECT * FROM employee
ORDER BY salary ASC;
SELECT * FROM Works_with 
ORDER BY total_sales ASC; 
-- SELECCIONAR SOLO LAS 4 PRIMERAS ROWS 
SELECT * FROM employee
LIMIT 4; 
-- SELECT ALL EMPLOYEES WHOSE SALARIES ARE BETWEEN 55000 AND 75000
SELECT first_name AS NAME,last_name AS APELLIDO,salary AS PLATA FROM employee
WHERE salary >= 55000 AND salary <=75000
ORDER BY salary ASC;