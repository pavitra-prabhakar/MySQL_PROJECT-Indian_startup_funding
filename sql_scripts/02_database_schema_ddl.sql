-- Active: 1792285929382@@127.0.0.1@3306@startup_ecosystem_db
CREATE TABLE `Industries` (
    industry_id INT PRIMARY KEY AUTO_INCREMENT,
    industry_vertical VARCHAR(150) NOT NULL UNIQUE
);

CREATE TABLE `Startups` (
    startup_id INT PRIMARY KEY AUTO_INCREMENT,
    startup_name VARCHAR(150) NOT NULL,
    city VARCHAR(100),
    sub_vertical VARCHAR(255),
    industry_id INT REFERENCES Industries(industry_id)
);
CREATE TABLE `Funding_Deals`(
    deal_id INT PRIMARY KEY AUTO_INCREMENT,
    startup_id INT REFERENCES Startups(startup_id),
    deal_date DATE,
    investors_name VARCHAR(500),
    investment_type VARCHAR(100),
    amount_usd DECIMAL(18,2), CHECK (amount_usd >=0)
);

CREATE TABLE `test_audit_log` (
    deal_date DATE,
    investors_name VARCHAR(500),
    investment_type VARCHAR(100)     
); 
SELECT * FROM test_audit_log
LIMIT 10;
INSERT INTO test_audit_log 
(deal_date,investors_name,investment_type)
VALUES ('2010-10-10','Himanshu','Equity'),
       ('2011-11-11','Priyanshu','Equity'),
       ('2012-12-12','Chandra','Equity')
;

TRUNCATE TABLE test_audit_log;
DROP TABLE test_audit_log;