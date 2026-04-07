DROP DATABASE IF EXISTS `sql_Training_employee`;
CREATE DATABASE `sql_Training_employee`; 
USE `sql_Training_employee`;

SET NAMES utf8 ;
SET character_set_client = utf8mb4 ;

CREATE TABLE `employee` (
  `name` varchar(50) NOT NULL,
  `age` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  `salary` varchar(50) NOT NULL,
  PRIMARY KEY (`name`)
)ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `employee` VALUES ('Ramesh','20','Finance','50000');
INSERT INTO `employee` VALUES ('Suresh','22','Finance','50000');
INSERT INTO `employee` VALUES ('Ram','28','Finance','20000');
INSERT INTO `employee` VALUES ('Deep','25','Sales','30000');
INSERT INTO `employee` VALUES ('Pradeep','22','Sales','20000');



CREATE TABLE `contest` (
  `c_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
    PRIMARY KEY (`c_id`)
)ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `contest` VALUES (1,'2015-02-01','2015-02-04');
INSERT INTO `contest` VALUES (2,'2015-02-02','2015-02-05');
INSERT INTO `contest` VALUES (3,'2015-02-03','2015-02-07');
INSERT INTO `contest` VALUES (4,'2015-02-04','2015-02-06');
INSERT INTO `contest` VALUES (5,'2015-02-06','2015-02-09');
INSERT INTO `contest` VALUES (6,'2015-02-08','2015-02-10');
INSERT INTO `contest` VALUES (7,'2015-02-10','2015-02-11');


CREATE TABLE floating_value (  
user_id int NOT NULL AUTO_INCREMENT,
float_val float,
PRIMARY KEY(user_id));
INSERT floating_value(float_val) VALUES (1.9);
INSERT floating_value(float_val) VALUES (1.1);
INSERT floating_value(float_val) VALUES (3.9);
INSERT floating_value(float_val) VALUES (5.0);
INSERT floating_value(float_val) VALUES (10.9);


CREATE TABLE `employee_trigger` (
  `name` varchar(50) NOT NULL,
  `age` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  `salary` varchar(50) NOT NULL,
  PRIMARY KEY (`name`)
)ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `employee_trigger` VALUES ('Ramesh1','20','Finance','50000');
INSERT INTO `employee_trigger` VALUES ('Suresh1','22','Finance','50000');
INSERT INTO `employee_trigger` VALUES ('Ram1','28','Finance','20000');
INSERT INTO `employee_trigger` VALUES ('Deep1','25','Sales','30000');
INSERT INTO `employee_trigger` VALUES ('Pradeep1','22','Sales','20000');

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customername` varchar(50) NOT NULL,
  `contactname` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `customer` VALUES (1,'Shubham','Thakur','India');
INSERT INTO `customer` VALUES (2,'Aman','Chopra','Australia');
INSERT INTO `customer` VALUES (3,'Naveen','Tulasi','Sri Lanka');
INSERT INTO `customer` VALUES (4,'Aditya','Arpan','Austria');
INSERT INTO `customer` VALUES (5,'Nishant','Jain','Spain');