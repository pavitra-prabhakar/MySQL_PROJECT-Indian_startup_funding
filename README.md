# 🚀 Indian Startup Funding — End-to-End MySQL Portfolio Project

![Status](https://img.shields.io/badge/Project_Status-Paused_at_Phase_3.2_(Strengthening_Basics)-amber?style=for-the-badge)
![Database](https://img.shields.io/badge/Database-MySQL_8.0-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Dataset](https://img.shields.io/badge/Dataset-Kaggle_(3044_Rows)-20BEFF?style=for-the-badge&logo=kaggle&logoColor=white)
![Version](https://img.shields.io/badge/Release-v0.3.2--alpha-blueviolet?style=for-the-badge)

---

## 📌 1. Project Genesis: Why, How & When I Started

* **When Started:** October 2026
* **Where It Came From:** While completing my **SQL for Data Science / Data Analytics** course, I finished **Module 1 (Getting Started with SQL)**, **Module 2 (Relational Databases & Tables)**, and **Module 3 (Intermediate SQL)**, and just entered **Module 4 (Accessing Databases using Python)**.
* **The Core Goal:** Before jumping ahead into Python-Database integration (Module 4) or Advanced Data Engineering topics (Module 6), I wanted to take a **real-world practical exam** of everything I learned in Modules 1, 2, and 3. 
* **The Challenge:** Most Kaggle datasets come as a single flat `.csv` file. Simply running `SELECT` on a single CSV table does not test **Relational Database Design (`CREATE`, `ALTER`, Primary/Foreign Keys)** or **Working with Multiple Tables (`JOIN` / Subqueries)**. Therefore, I designed a 6-Phase End-to-End Architecture to transform the messy **Indian Startup Funding (`startup_funding.csv`)** flat file into a normalized **3-Table Relational Database** in MySQL.

---

## ⏸️ 2. Current Project Status (Why It Is Paused right now)

> **Current Checkpoint:** `Phase 3 — Task 3.2 (String Standardization & Data Cleaning)`  
> **Current State:** **Intentionally Paused ⏸️**

### Why did I pause at Task 3.2?
While cleaning the messy `Amount in USD` column (which contains commas like `20,00,00,000`, text strings like `'Undisclosed'`, and `'N/A'`), converting messy text dates (`dd/mm/yyyy`) into proper SQL `DATE` types, and preparing for `INSERT INTO ... SELECT` relational table migration (Task 3.3), I realized that **rushing through syntax without 100% conceptual clarity is a mistake**.

Instead of copy-pasting code just to finish the project, I have **paused execution at Phase 3 (Task 3.2)** to go back, revise, and solidify my core SQL fundamentals:
1. Deepening my grip on `UPDATE` with complex `LIKE` string patterns and built-in string functions (`REPLACE`, `TRIM`, `UPPER`).
2. Mastering explicit Data Type Casting (`CAST`, `CONVERT`, `STR_TO_DATE`) and handling `NULL` values cleanly.
3. Practicing how `PRIMARY KEY` and `FOREIGN KEY` constraints behave during multi-table `INSERT INTO ... SELECT DISTINCT` operations.

Once my basics are rock-solid, I will resume from **Task 3.2 (Numeric & Date Casting)** and complete the remaining phases.

---

## 🎯 3. Syllabus-to-Project Mapping (What I Wanted to Test)

| Course Module | Topics Covered in Course | How It Is Tested in This Project |
| :--- | :--- | :--- |
| **Module 1: Getting Started with SQL** | `SELECT`, `INSERT`, `UPDATE`, `DELETE`, `COUNT`, `DISTINCT`, `LIMIT` | Staging table inspection, deleting corrupt rows, updating dirty city/industry names, migrating cleaned rows, and basic row counts. |
| **Module 2: Relational Databases & Tables** | DDL vs DML, `CREATE`, `ALTER`, `DROP`, `TRUNCATE`, Constraints (`PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `NOT NULL`, `CHECK`) | Dropping useless columns (`Remarks`), normalizing 1 flat CSV into 3 relational tables (`Industries`, `Startups`, `Funding_Deals`) with strict constraints. |
| **Module 3: Intermediate SQL** | String Patterns (`LIKE`), Ranges (`BETWEEN`, `IN`), `ORDER BY`, `GROUP BY`, `HAVING`, Built-in & Date/Time Functions, Sub-Queries, Multiple Tables | Removing commas from funding amounts, year/month trend analysis, scalar & correlated subqueries, and 3-table relational joins. |

---

## 🗂️ 4. Dataset Overview & Dirty Data Traps (`startup_funding.csv`)

The raw dataset from Kaggle contains **~3,044 rows** and **10 columns** with real-world data quality issues:

| Original Column Name | Description | Real-World Data Trap Identified |
| :--- | :--- | :--- |
| `Sr No` | Serial Number | Contains potential gaps after deleting corrupt rows. |
| `Date dd/mm/yyyy` | Deal Date | Stored as text; contains typos like `05/072018` or `.` |
| `Startup Name` | Name of the Startup | Contains URLs, extra spaces, and inconsistent casing. |
| `Industry Vertical` | Primary Sector | Same industry written as `eCommerce`, `E-Commerce`, `Ecommerce`. |
| `SubVertical` | Specific Niche | Contains many `NULL` / `NaN` values. |
| `City  Location` | Startup Headquarters | Split identities: `Bangalore` vs `Bengaluru`, `Gurgaon` vs `Gurugram`. |
| `Investors Name` | Funding Partners | Contains `'Undisclosed'`, `'N/A'`, and multiple comma-separated names. |
| `InvestmentnType` | Funding Stage | Typo in column header (`n`); `'Seed Funding'` vs `'Seed Round'`. |
| `Amount in USD` | Deal Value in USD | **Major Trap:** Stored as text with commas (`20,00,00,000`) & `'Undisclosed'`. |
| `Remarks` | Extra Notes | Over 85% `NULL` — dropped during Phase 2. |

---

## 🗺️ 5. End-to-End Execution Roadmap (6 Phases)

### ✅ Phase 1: Data Setup & Staging Inspection *(Completed)*
- [x] **Task 1.1:** Created `Startup_Ecosystem_DB` database in MySQL.
- [x] **Task 1.2:** Created `raw_startup_funding` staging table using `VARCHAR(500)` for all columns to bypass CSV import errors caused by commas and `'Undisclosed'` strings in `Amount in USD`.
- [x] **Task 1.3:** Inspected initial rows using `SELECT * ... LIMIT 20` and verified total row count with `SELECT COUNT(*)`.

### ✅ Phase 2: Relational Database Architecture & DDL Exam *(Completed)*
- [x] **Task 2.1 (`ALTER` & `DROP`):** Dropped the 85% empty `Remarks` column and renamed messy column headers (`InvestmentnType` ➔ `investment_type`, etc.).
- [x] **Task 2.2 (`CREATE TABLE` + Constraints):** Designed 3 normalized relational tables:
  - `Industries` (`industry_id` PK, `industry_vertical` UNIQUE NOT NULL)
  - `Startups` (`startup_id` PK, `startup_name` NOT NULL, `city`, `sub_vertical`, `industry_id` FK)
  - `Funding_Deals` (`deal_id` PK, `startup_id` FK, `deal_date`, `investors_name`, `investment_type`, `amount_usd` CHECK >= 0)
- [x] **Task 2.3 (`TRUNCATE` & `DROP`):** Practiced table lifecycle operations on `test_audit_log`.

### ⏸️ Phase 3: Data Cleaning & DML Migration *(Currently Paused at Task 3.2)*
- [x] **Task 3.1 (`DELETE`):** Removed corrupt rows where both `startup_name` or `deal_date` were completely `NULL`.
- [x] **Task 3.2a (`UPDATE` + `LIKE` — City & Industry Standardization):** Standardized `'Bangalore'` ➔ `'Bengaluru'`, `'Gurgaon'` ➔ `'Gurugram'`, and unified `'E-Commerce'` naming variations.
- [ ] **Task 3.2b (String Functions & Type Casting — *Next Up after Revision*):** Convert `'Undisclosed'` to `NULL`, strip commas using `REPLACE(amount_usd, ',', '')`, and alter `amount_usd` to `DECIMAL(18,2)` and `deal_date` to `DATE`.
- [ ] **Task 3.3 (`INSERT INTO ... SELECT`):** Migrate cleaned staging data into `Industries`, `Startups`, and `Funding_Deals`.

### ⏳ Phase 4: Exploratory Data Analysis — Level 1 Queries *(Upcoming)*
- [ ] **Q1 (`COUNT`, `DISTINCT`):** Total unique startups and distinct cities across India.
- [ ] **Q2 (`ORDER BY`, `LIMIT`):** Top 10 largest single funding deals in Indian startup history.
- [ ] **Q3 (`LIKE` Patterns):** Startups operating in `'Artificial Intelligence'`, `'Machine Learning'`, or `'Data'` sub-verticals.
- [ ] **Q4 (`BETWEEN` & `IN`):** Seed/Angel deals between $1M and $5M USD.
- [ ] **Q5 (`GROUP BY`):** Top 10 startup hub cities by registered startup count.
- [ ] **Q6 (`SUM`, `AVG`, `MAX`):** Total deals, total capital raised, and average ticket size per `investment_type`.
- [ ] **Q7 (`HAVING`):** Active investors with 10+ disclosed funding deals.

### ⏳ Phase 5: Advanced SQL Exam — Level 2 Queries *(Upcoming)*
- [ ] **Q8 & Q9 (Date/Time Functions):** Year-on-Year (`YEAR`) funding growth and peak deal-signing months (`MONTH`).
- [ ] **Q10 & Q11 (Multi-Table Joins):** Joining `Startups`, `Industries`, and `Funding_Deals` to find top-funded sectors in Bengaluru.
- [ ] **Q12, Q13 & Q14 (Subqueries):** Scalar subqueries (`> AVG(amount_usd)`), `IN` subqueries (billion-dollar industries), and correlated subqueries (highest-funded startup per city).
- [ ] **Q15 (Master Executive Report):** 3-table join summarizing multi-round startups.

### ⏳ Phase 6: Final Documentation & Insights *(Upcoming)*
- [ ] Add query output screenshots and executive business takeaways.

---

## 🤝 6. Repository Workflow & Collaboration

* **Repository Maintainer:** [@pavitra-prabhakar](https://github.com/pavitra-prabhakar)
* **Lead Developer & Collaborator:** [@Himanshu-5680](https://github.com/Himanshu-5680)
* **Workflow:** Managed via GitHub Issues, Kanban Project Board, Feature Branch Pull Requests, and Automated SQLFluff CI Actions.