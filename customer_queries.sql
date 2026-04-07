select * from customer;

-- Execute the stored procedure with parameter "Sri lanka"
-- EXEC GetCustomersByCountry @Country = 'Sri lanka';

   SELECT CustomerName, ContactName
    FROM Customer
    WHERE Country = "Sri lanka" ;
    
    
-- EXECUTE sql_training_employee.GetCustomersByCountry (Srilanka);


-- EXECute GetCustomersByCountry  in country = 'Sri lanka'; 


CALL GetCustomersByCountry ('Sri Lanka');