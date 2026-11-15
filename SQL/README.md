
# SQL Scripts

This folder contains the SQL scripts used in the Delhi Road Accident Analysis project, covering accident data from 2019 to 2023.

SQL Server was used to consolidate, clean, validate and analyse the accident datasets.

## Database

**Database Name:** `Delhi_Road_Accidents`

## SQL Scripts

### 1. Data_Consolidation.sql

- Combines yearly monthly accident tables (2019–2023) into one consolidated table.
- Combines yearly time-slot accident tables (2019–2023) into one consolidated table.
- Uses `UNION ALL` to combine records.

### 2. Data_Cleaning.sql

- Investigates inconsistent time-slot labels.
- Uses `LEN()`, `DATALENGTH()` and `UNICODE()` to identify character differences.
- Standardises en dashes (–) to regular hyphens (-) using `UPDATE` and `REPLACE()`.

### 3. Data_Validation.sql

- Checks record counts and accident totals in yearly source tables.
- Validates consolidated datasets.
- Compares overall and year-wise accident totals.
- Checks for NULL values and duplicate records.
- Verifies the standardised time-slot labels.

### 4. Data_Analysis.sql

- Identifies months and time slots with the highest accident counts.
- Analyses year-wise accident trends and percentage changes.
- Compares monthly and time-slot patterns across 2019–2023.
- Identifies the highest and lowest accident months and time slots for each year.
- Calculates average annual and monthly accident counts.

## SQL Concepts Used

- SELECT and WHERE
- GROUP BY and ORDER BY
- Aggregate functions: SUM(), AVG(), COUNT()
- CASE statements
- UNION ALL
- Common Table Expressions (CTEs)
- Window functions: LAG() and RANK()
- NULL and duplicate checks
- UPDATE and REPLACE()

## Tools Used

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
