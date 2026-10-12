select *
from employee;

-- 1 creating a staging table

CREATE TABLE employee_staging LIKE employee;
INSERT INTO employee_staging SELECT * FROM employee;

-- 2 fix column names

ALTER TABLE employee_staging
RENAME COLUMN ï»¿EmployeeID TO `Employee ID`;

ALTER TABLE employee_staging
RENAME COLUMN LastName TO `Last Name`;

ALTER TABLE employee_staging
RENAME COLUMN FirstName TO `First Name`;

ALTER TABLE employee_staging
RENAME COLUMN BusinessTravel TO `Business Travel`;

ALTER TABLE employee_staging
RENAME COLUMN `DistanceFromHome (KM)` TO `Distance From Home (km)`;

ALTER TABLE employee_staging
RENAME COLUMN EducationField TO `Education Field`;

ALTER TABLE employee_staging
RENAME COLUMN JobRole TO `Job Role`;

ALTER TABLE employee_staging
RENAME COLUMN MaritalStatus TO `Marital Status`;

ALTER TABLE employee_staging
RENAME COLUMN StockOptionLevel TO `Stock Option Level`;

ALTER TABLE employee_staging
RENAME COLUMN HireDate TO `Hire Date`;

ALTER TABLE employee_staging
RENAME COLUMN YearsAtCompany TO `Years At Company`;

ALTER TABLE employee_staging
RENAME COLUMN YearsInMostRecentRole TO `Years In Most Recent Role`;

ALTER TABLE employee_staging
RENAME COLUMN YearsSinceLastPromotion TO `Years Since Last Promotion`;

ALTER TABLE employee_staging
RENAME COLUMN YearsWithCurrManager TO `Years With Current Manager`;

-- 3 checking for duplicates

SELECT `Employee ID`, COUNT(*)
FROM employee_staging
GROUP BY `Employee ID`
HAVING COUNT(*) > 1;

-- 4 trimming whitespaces

SET SQL_SAFE_UPDATES = 0;

UPDATE employee_staging
SET Gender = TRIM(Gender),
    `Business Travel` = TRIM(`Business Travel`),
    Department = TRIM(Department),
    State = TRIM(State),
    Ethnicity = TRIM(Ethnicity),
    `Education Field` = TRIM(`Education Field`),
    `Job Role` = TRIM(`Job Role`),
    `Marital Status` = TRIM(`Marital Status`),
    OverTime = TRIM(OverTime),
    Attrition = TRIM(Attrition);
    
    -- 5 modify column
    
   ALTER TABLE employee_staging MODIFY COLUMN `Hire Date` DATE; 
   
   -- 6 numeric range checksum table
   
   SELECT MIN(Age), MAX(Age), MIN(Salary), MAX(Salary)
FROM employee_staging;


