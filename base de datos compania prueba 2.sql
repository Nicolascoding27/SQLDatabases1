create table employeee(
emp_id INT PRIMARY KEY,
first_name varchar(20),
last_name varchar(20),
sex varchar(2),
salary INT, 
super_id INT,
branch_id INT);
SELECT * FROM employeee;
-- Ya creada la tabla employee podemos agregar la foreing key a ella misma que es super id 
ALTER TABLE employeee ADD
foreign key(super_id) references employeee(emp_id) ON DELETE SET NULL;
-- NOW WE NEED TO CREATE THE BRANCH TABLE TO ADD THE FOREING KEY 
create table branchi(
branch_id INT PRIMARY KEY, 
branch_name varchar(20),
mgr_id INT);
-- FOREING KEY BRANCH_ID 
ALTER TABLE employeee ADD
foreign key(branch_id) references branchi(branch_id) ON DELETE SET NULL;



 