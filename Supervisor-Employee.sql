use COMPANY;
go

/*Employee name, employee's Supervisor name, department number & name*/
SELECT e.FNAME, e.LNAME, s.FNAME as SuperFNAME, s.LNAME as SuperLNAME, d.DNUMBER, d.DNAME 
FROM EMPLOYEE e Left Outer Join EMPLOYEE s
ON e.SUPERSSN = s.SSN, DEPARTMENT d 
WHERE d.DNUMBER = e.DNO
order by d.DNUMBER, e.FNAME;

/* Employee name, employee's Supervisor name, department number & name
* Department 7 included
*/
SELECT e.FNAME, e.LNAME, s.FNAME as SuperFNAME, s.LNAME as SuperLNAME, d.DNUMBER, d.DNAME 
FROM DEPARTMENT d Left Outer Join EMPLOYEE e
ON d.DNUMBER = e.DNO Left Outer Join EMPLOYEE s
ON  e.SUPERSSN = s.SSN
Order by d.DNUMBER, e.FNAME	


