
use sql_inventory;
select * from sql_store.order_items o join products p on o.product_id = p.product_id;

use sql_store;
select * from sql_inventory. products p join order_items o  on o.product_id = p.product_id;

select unit price  from products;
 
 use sql_hr;
 select * from employees e join employees m on e.employee_id = m.reports_to;
 select * from employees e join employees m on m.employee_id = e.reports_to;
 select * from employees m join employees e on m.employee_id = e.reports_to;
  select * from employees m join employees e on e.employee_id = m.reports_to;
 
 -- query to find an employee salary which is grater then manager salary in the employee table.
select e.first_name,e.salary, m.first_name as Manager_name, m.salary as M_Salary
 from employees e join employees m 
 on m.employee_id = e.reports_to where e.salary >m.salary order  by e.salary desc;
    
    -- query to find emp name and manager name in single table
   select e.first_name,e.last_name, m.first_name as Manager_name from employees e join employees m on m.employee_id = e.reports_to; 
    
  select e.first_name, m.first_name as Manager_name from employees e join employees m on m.employee_id = e.reports_to;
  
  
  use sql_invoicing;
  
  SELECT c.name, c.client_id,pm.name
FROM payments p
join clients c on c.client_id = p.client_id
join payment_methods pm  on pm.payment_method_id =p.payment_method	;

select p.product_id,p.name,oi.quantity from products p right join order_items oi on p.product_id = oi.product_id;

use sql_store;


SELECT *
 FROM order_items oi
join order_item_notes oin
using (order_id, product_id);


select e.employee_id, e.first_name, m.first_name as Man from employees e 
left join employees m 
on e.reports_to = m.employee_id ;


use sql_invoicing;

select p.date, c.name,p.amount,pm.name as mode
from payments p 
join clients c on p.client_id = c.client_id 
join payment_methods pm on p.payment_method = pm.payment_method_id;

select p.date, c.name,p.amount,pm.name as mode
from payments p 
join clients c using (client_id ) 
join payment_methods pm on p.payment_method = pm.payment_method_id;


select c.first_name as CName, p.name as PName from Customers c 
cross join products p;


select c.first_name as CName, p.name as PName from Customers c , products p;


create table orders_archieved as 
select * from orders;

select * from orders_archieved;

insert into orders_archieved select * from orders where order_date <'2018-01-01';

create table inovices_archieved as select * from invoices;


delete from orders_archieved where order_id =4;


