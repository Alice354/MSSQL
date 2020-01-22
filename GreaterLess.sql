use COMPANY;
go

--SSN and lname of married female employees working on 3 or more projects
SELECT  e.SSN, e.LNAME
FROM WORKS_ON w, EMPLOYEE e, DEPENDENT d
WHERE e.SSN = w.ESSN AND d.RELATIONSHIP = 'Spouse' AND e.SSN = d.ESSN AND e.SEX = 'F' 
GROUP BY e.SSN, e.LNAME		-- GROUP BY should match SELECT
HAVING COUNT(w.PNO)>2		-- HAVING should follow GROUP BY

--last name and ssn of employees who work in any project(s) where there
--are more female than male employees
SELECT e.FNAME, e.SSN
	FROM EMPLOYEE e, WORKS_ON w
	where w.ESSN = e.SSN AND
	 (SELECT COUNT(*)
	 FROM WORKS_ON wf, EMPLOYEE ef
	 WHERE wf.ESSN = ef.SSN and ef.SEX = 'F' and w.PNO = wf.PNO) >
	 (SELECT COUNT(*)
	 FROM WORKS_ON wm, EMPLOYEE em
	 WHERE wm.ESSN = em.SSN and em.SEX = 'M' and w.PNO = wm.PNO);