use employee;

-- Calculate Maximum amount of hourly wage paid and Minimum amount of fixed Salary paid in the company.
select max(amount) from basepay where type = 'hourly';
select min(amount) from basepay where type = 'salary';

-- Count the number of employees working in a company.
select count(emp_id) from employee;

-- Details of employee whose age is less than 28 and also provide phoneNo.
select *from employee where age < 28;

-- Show the corresponding job position of employees while left outer joining the employee and position table.
SELECT 
    e.emp_id, p.position_id
FROM
    employee e
        LEFT JOIN
    position p ON e.position_id = p.position_id
GROUP BY e.emp_id;

-- Find the amount of fixed salary of employee with last name ‘Sharma”.
SELECT 
    b.amount
FROM
    basepay b
        JOIN
    employee e ON b.position_id = e.position_id
WHERE
    b.type = 'salary' AND e.lname = 'sharma';
    
-- Print the full name of employee whose netPay is 1500
SELECT 
    CONCAT(fname, lname)
FROM
    employee
        JOIN
    payroll ON employee.emp_id = payroll.emp_id
WHERE
    netpay = 1500;
    
-- Join the department and position table to show the position name corresponding to department name ordered by department name
SELECT 
    p.position_name, d.dep_name
FROM
    position p
        JOIN
    department d ON p.dep_id = d.dep_id
ORDER BY d.dep_name;

-- Show the basePay type and amount corresponding to job position, order by type and amount.
SELECT 
    b.type, b.amount, p.position_name
FROM
    basepay b
        LEFT JOIN
    position p ON b.position_id = p.position_id
ORDER BY b.type , b.amount;

-- Fetch the employee id , first and last name of employee whose payroll is already generated.
select e.emp_id, e.fname, e.lname from employee e where emp_id in (select emp_id from payroll);