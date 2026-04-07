SELECT * FROM sql_training_employee.floating_value;

SELECT float_val,
CASE
    WHEN float_val > 5 THEN "The value is greater than 5"
    WHEN float_val = 5 THEN "The value is 5"
    ELSE "The value is under 5"
END as float_txt
FROM floating_value;


SELECT float_val,
CASE
    WHEN LENGTH(float_val) > 4 THEN "The length is greater than 4"
    WHEN LENGTH(float_val) = 4 THEN "The length is 4"
    ELSE "The length is less than 4"
END as float_txt
FROM floating_value;