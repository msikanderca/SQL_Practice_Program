use sql_Training_employee;

select * from employee_trigger;

delimiter $$
CREATE TRIGGER  Check_age  BEFORE INSERT ON employee_trigger
FOR EACH ROW
BEGIN
	IF NEW.age < 25 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'ERROR: AGE MUST BE ATLEAST 25 YEARS!';
	END IF;
END; $$
 delimiter 