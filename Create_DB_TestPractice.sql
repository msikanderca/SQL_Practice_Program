DROP DATABASE IF EXISTS `sql_Training_TestDB`;
CREATE DATABASE `sql_Training_TestDB`; 
USE `sql_Training_TestDB`;

SET NAMES utf8 ;
SET character_set_client = utf8mb4 ;


CREATE TABLE `Worker` (
    `WORKER_ID` INT NOT NULL PRIMARY KEY,
    `FIRST_NAME` CHAR(25),
    `LAST_NAME` CHAR(25),
    `SALARY` INT,
    `JOINING_DATE` DATETIME,
    `DEPARTMENT` CHAR(25)
)ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
    (1, 'Monika', 'Arora', 100000, '2021-02-20 09:00:00', 'HR'),
    (2, 'Niharika', 'Verma', 80000, '2021-06-11 09:00:00', 'Admin'),
    (3, 'Vishal', 'Singhal', 300000, '2021-02-20 09:00:00', 'HR'),
    (4, 'Amitabh', 'Singh', 500000, '2021-02-20 09:00:00', 'Admin'),
    (5, 'Vivek', 'Bhati', 500000, '2021-06-11 09:00:00', 'Admin'),
    (6, 'Vipul', 'Diwan', 200000, '2021-06-11 09:00:00', 'Account'),
    (7, 'Satish', 'Kumar', 75000, '2021-01-20 09:00:00', 'Account'),
    (8, 'Geetika', 'Chauhan', 90000, '2021-04-11 09:00:00', 'Admin');

CREATE TABLE `Bonus` (
    `WORKER_REF_ID` INT,
    `BONUS_AMOUNT` INT,
    `BONUS_DATE` DATETIME,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE 
	
)ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO Bonus (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
    (1, 5000, '2023-02-20'),
    (2, 3000, '2023-06-11'),
    (3, 4000, '2023-02-20'),
    (1, 4500, '2023-02-20'),
    (2, 3500, '2023-06-11');

CREATE TABLE `Title` (
    `WORKER_REF_ID` INT,
    `WORKER_TITLE` CHAR(25),
    `AFFECTED_FROM` DATETIME,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
	
)ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
    (1, 'Manager', '2023-02-20 00:00:00'),
    (2, 'Executive', '2023-06-11 00:00:00'),
    (8, 'Executive', '2023-06-11 00:00:00'),
    (5, 'Manager', '2023-06-11 00:00:00'),
    (4, 'Asst. Manager', '2023-06-11 00:00:00'),
    (7, 'Executive', '2023-06-11 00:00:00'),
    (6, 'Lead', '2023-06-11 00:00:00'),
    (3, 'Lead', '2023-06-11 00:00:00');