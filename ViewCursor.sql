use COMPANY;
go

/*************DO NOT RUN AT THE SAME TIME****************
**************RUN ONE SECTION AT A TIME******************/

/*Create a view named VDept_Budget
* reports a headcount for each department */
CREATE VIEW VDept_Budget AS
SELECT d.DNAME as Dept_Name, d.DNUMBER as Dept_Number, COUNT(distinct e.SSN) as No_Emp
FROM DEPARTMENT d, EMPLOYEE e
where e.DNO = d.DNUMBER
group by DNAME, DNUMBER

/*Add columns Sum_Salary and Ave_Salary to view*/
ALTER VIEW VDept_Budget as
SELECT d.DNAME as Dept_Name, d.DNUMBER as Dept_Number, COUNT(distinct e.SSN) as No_Emp, 
		SUM(e.SALARY)as Sum_Salary, AVG(e.SALARY) as Ave_Salary
FROM DEPARTMENT d, EMPLOYEE e
WHERE e.DNO = d.DNUMBER
GROUP BY DNAME,DNUMBER

/*check if view is empty by counting rows*/
DECLARE @Count as smallint;	--count rows
DECLARE cursor_count CURSOR FOR 
	SELECT COUNT(*) FROM VDept_Budget where Dept_Name = Dept_Name
OPEN cursor_count		 
FETCH NEXT FROM cursor_count INTO @Count
WHILE @@FETCH_STATUS = 0
IF @Count > 0
	BEGIN
		PRINT 'VDept_Budget is NOT empty'
		RETURN
	END
CLOSE cursor_count;
DEALLOCATE cursor_count;
