-- Active: 1792285929382@@127.0.0.1@3306@startup_ecosystem_db
CREATE Table `raw_startup_funding` (
    `Sr No` INT ,
    `Date` VARCHAR(500),
    `Startup Name` VARCHAR(500),
    `Industry Vertical` VARCHAR(500),
    `SubVertical` VARCHAR(500),
    `City  Location` VARCHAR(500),
    `Investors Name` VARCHAR(500),
    `InvestmentnType` VARCHAR(500),
    `Amount in USD` VARCHAR(500),
    `Remarks` VARCHAR(500) 
);

-- Load data into table.
SHOW GLOBAL VARIABLES LIKE 'local_infile';
--if off then turn it on.
SET GLOBAL local_infile = 1;

-- loading data into table.

LOAD DATA LOCAL INFILE 'C:/Users/HimanshuG/Downloads/SQL coursera/Projects/Indian startup funding/raw_data/startup_funding.csv'
INTO TABLE raw_startup_funding  
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(`Sr No`, `Date`, `Startup Name`, `Industry Vertical`, `SubVertical`, `City  Location`, `Investors Name`, `InvestmentnType`, `Amount in USD`, `Remarks`);

SELECT * FROM raw_startup_funding
LIMIT 10;

ALTER TABLE raw_startup_funding 
DROP COLUMN `Remarks` ;

ALTER TABLE raw_startup_funding
RENAME COLUMN `Date` TO `deal_date`;

ALTER TABLE raw_startup_funding
RENAME COLUMN `Sr No` TO `sr_no`;

ALTER TABLE raw_startup_funding
RENAME COLUMN `Startup Name` TO `startup_name`,
RENAME COLUMN `Industry Vertical` TO `industry_vertical`,
RENAME COLUMN `SubVertical` TO `sub_vertical`,
RENAME COLUMN `City  Location` TO `city`,
RENAME COLUMN `Investors Name` TO `investors_name`,
RENAME COLUMN `InvestmentnType` TO `investment_type`,
RENAME COLUMN `Amount in USD` TO `amount_usd` ;

SELECT * FROM raw_startup_funding
LIMIT 10;

