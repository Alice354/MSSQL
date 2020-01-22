use COMPANY;
go

CREATE TRIGGER dbo.Audit_Dept_UPDATE ON dbo.DEPAR
FOR UPDATE 
AS
  BEGIN
	DECLARE @date_of_change DATETIME,
	 @old_deptNAME varchar(15),
	 @new_deptNAME varchar(15),
	 @old_deptNUMBER tinyint,
	 @new_deptNUMBER tinyint,
	 @old_mngrSSN int,
	 @new_mngrSSN int,
	 @DEFAULT int;

	SET @DEFAULT = 1;
--Update Audit table Name on delete 
	SELECT @old_deptNAME = d.DNAME FROM deleted d
	SELECT @new_deptNAME = i.DNAME FROM inserted i

/**Update DEPART table
**DEPAR, EMPLO, Audit_Dept_Table tables are affected
**/
UPDATE DEPAR SET DNUMBER = 99 WHERE DNUMBER= 4
SELECT * FROM DEPAR
SELECT * FROM EMPLO
select * from Audit_Dept_Table
