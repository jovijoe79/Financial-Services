-- DATA CLEANING

SELECT *
FROM financial_services;

CREATE TABLE `financial_services_staging` (
  `MyUnknownColumn` int DEFAULT NULL,
  `name` text,
  `rating` double DEFAULT NULL,
  `reviews` text,
  `company_type` text,
  `Head_Quarters` text,
  `Company_Age` text,
  `No_of_Employee` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO financial_services_staging
SELECT *
FROM financial_services;

SELECT * 
FROM financial_services_staging;


ALTER TABLE financial_services_staging
DROP COLUMN reviews;

UPDATE financial_services_staging
SET MyUnknownColumn = MyUnknownColumn + 1;

UPDATE financial_services_staging
SET company_type = 'Private'
WHERE company_type LIKE 'C%';
UPDATE financial_services_staging
SET company_type = 'Public'
WHERE company_type LIKE 'A%';
UPDATE financial_services_staging
SET company_type = 'Public'
WHERE company_type LIKE 'T%';
UPDATE financial_services_staging
SET company_type = 'Private'
WHERE company_type LIKE 'K%';
UPDATE financial_services_staging
SET company_type = 'Public'
WHERE company_type LIKE 'W%';
UPDATE financial_services_staging
SET company_type = 'Private'
WHERE company_type LIKE 'V%';
UPDATE financial_services_staging
SET company_type = 'Private'
WHERE company_type LIKE 'G%';
UPDATE financial_services_staging
SET company_type = 'Public'
WHERE company_type LIKE 'I%';
UPDATE financial_services_staging
SET company_type = 'Public'
WHERE company_type LIKE 'F%';
UPDATE financial_services_staging
SET company_type = NULL
WHERE company_type = '';
DELETE
FROM financial_services_staging
WHERE company_type IS NULL;
SELECT DISTINCT company_type
FROM financial_services_staging;
UPDATE financial_services_staging
SET company_type = 'Private'
WHERE company_type LIKE '5%';



UPDATE financial_services_staging
SET company_type = 'Private'
WHERE company_type LIKE 'J%';
UPDATE financial_services_staging
SET company_type = 'Private'
WHERE company_type LIKE 'S%';

UPDATE financial_services_staging
SET company_type = 'Public'
WHERE company_type LIKE 'M%';

UPDATE financial_services_staging
SET company_type = 'Private'
WHERE company_type LIKE 'B%';

UPDATE financial_services_staging
SET company_type = 'Private'
WHERE company_type LIKE 'Gu%';

UPDATE financial_services_staging
SET company_type = 'Private'
WHERE company_type LIKE 'N%';

UPDATE financial_services_staging
SET company_type = 'Private'
WHERE company_type LIKE 'Pun%';

UPDATE financial_services_staging
SET company_type = 'Public'
WHERE company_type LIKE 'M%';

UPDATE financial_services_staging
SET company_type = 'Public'
WHERE company_type LIKE 'D%';

UPDATE financial_services_staging
SET company_type = 'Private'
WHERE company_type LIKE 'L%';


SELECT *
FROM financial_services_staging;

WITH CTE_2 AS
(
SELECT *, LEFT(Head_Quarters, CHAR_LENGTH(Head_Quarters) - LOCATE('+', Head_Quarters)) AS Location
FROM financial_services_staging
)
UPDATE financial_services_staging
JOIN CTE_2
	ON financial_services_staging.MyUnknownColumn = CTE_2.MyUnknownColumn
SET financial_services_staging.Head_Quarters = CTE_2.Location;

WITH CTE_3 AS
(
SELECT *,  LEFT(Company_Age, CHAR_LENGTH(Company_Age) - LOCATE(' ', Company_Age)) AS LEFTS
FROM financial_services_staging
), CTE_4 AS 
(
SELECT *,  LEFT(LEFTS, CHAR_LENGTH(LEFTS) - LOCATE(' ', LEFTS))
FROM CTE_3
)
SELECT *
FROM CTE_4;

select *
from financial_services_staging;

UPDATE financial_services_staging
SET No_of_Employee = 1000
WHERE No_of_Employee LIKE '5K%';
UPDATE financial_services_staging
SET No_of_Employee = 1000
WHERE No_of_Employee LIKE '501%';

UPDATE financial_services_staging
SET No_of_Employee = 700
WHERE No_of_Employee LIKE '201%';

UPDATE financial_services_staging
SET No_of_Employee = 1000
WHERE No_of_Employee LIKE '51%';

UPDATE financial_services_staging
SET No_of_Employee = 50
WHERE No_of_Employee LIKE '11%';

UPDATE financial_services_staging
SET No_of_Employee = 10
WHERE No_of_Employee LIKE '1-%';

SELECT DISTINCT No_of_Employee
FROM financial_services_staging;

UPDATE financial_services_staging
SET No_of_Employee = 1000
WHERE No_of_Employee LIKE '10K%';

UPDATE financial_services_staging
SET No_of_Employee = 50000
WHERE No_of_Employee LIKE '50K%';

UPDATE financial_services_staging
SET No_of_Employee = 5000
WHERE No_of_Employee LIKE '1K%';

SELECT *
FROM financial_services_staging;

DELETE
FROM financial_services_staging
WHERE name = ''
OR rating = ''
OR company_type = ''
OR Head_Quarters = ''
OR Company_Age = ''
OR No_of_Employee = '';

SELECT *
FROM financial_services_staging;



