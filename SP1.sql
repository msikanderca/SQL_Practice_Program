CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCustomersByCountry`(IN country Varchar(50))
BEGIN 
    SELECT CustomerName, ContactName
    FROM Customer
    WHERE country = country ;
END


