SELECT * FROM raw_startup_funding
WHERE startup_name IS NULL or deal_date IS NULL;

DELETE FROM raw_startup_funding
WHERE startup_name IS NULL OR deal_date IS NULL;

SELECT city FROM raw_startup_funding
WHERE city IN('Gurgaun','Bangalore','Delhi','Gurgaon');
UPDATE raw_startup_funding
    SET city = 'Gurugram'
        WHERE city IN ('Gurgaun%','Gurgaon');
UPDATE raw_startup_funding
    SET city = 'Benguluru'
    WHERE city LIKE 'Bangalore%';
UPDATE raw_startup_funding
    SET city = 'New Delhi'
    WHERE city LIKE 'Delhi';

SELECT industry_vertical FROM raw_startup_funding;
UPDATE industries SET industry_vertical = 'E-Commerce' WHERE industry_vertical LIKE  '%commerce%' ;

SELECT amount_usd FROM raw_startup_funding
WHERE amount_usd IN ('Undisclosed','unknown','N/A','Unknown')

UPDATE raw_startup_funding 
    SET amount_usd = '0'
    WHERE amount_usd IN ('Undisclosed','unknown','N/A','Unknown');

SELECT amount_usd FROM raw_startup_funding
WHERE amount_usd = 0;

SELECT amount_usd FROM raw_startup_funding;

UPDATE raw_startup_funding
SET amount_usd = REPLACE(REPLACE(amount_usd , ',',''),'+','')
WHERE amount_usd LIKE '%,%' OR amount_usd LIKE '%+%';

SELECT amount_usd FROM raw_startup_funding;

-- changing date format from DD-MM-YYYY to YYYY-MM-DD.
SELECT deal_date FROM raw_startup_funding;
UPDATE raw_startup_funding
SET deal_date = STR_TO_DATE(deal_date,'%d/%m/%Y');

-- finding how much there's messy data.

SELECT deal_date FROM raw_startup_funding
WHERE deal_date LIKE '%.%' OR deal_date LIKE '%//%';

-- got an dirty date lets fix it.
UPDATE raw_startup_funding
SET deal_date = '12/05/2015'
SET deal_date = '05/07/2018'
WHERE deal_date = '05/072018' OR deal_date = '12/05.2015';

UPDATE raw_startup_funding 
SET deal_date = STR_TO_DATE(deal_date,'%d/%m/%Y');
ALTER TABLE raw_startup_funding MODIFY amount_usd DECIMAL(18,2),
MODIFY deal_date DATE;
