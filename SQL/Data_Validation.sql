
USE Delhi_Road_Accidents;
GO

-- =============================================
-- PROJECT: Delhi Road Accident Analysis
-- PERIOD: 2019-2023
-- SCRIPT: Data Validation
-- PURPOSE: Validate source and consolidated data
--          for completeness, consistency and accuracy.
-- =============================================


-- =============================================
-- 1. Initial Validation of Yearly Source Tables
-- =============================================

-- Check record counts and accident totals
-- in the yearly monthly accident tables.

SELECT 'Monthly_2019' AS Table_Name,
       COUNT(*) AS Total_Records,
       SUM(Accidents) AS Total_Accidents
FROM dbo.Monthly_2019
UNION ALL
SELECT 'Monthly_2020', COUNT(*), SUM(Accidents)
FROM dbo.Monthly_2020
UNION ALL
SELECT 'Monthly_2021', COUNT(*), SUM(Accidents)
FROM dbo.Monthly_2021
UNION ALL
SELECT 'Monthly_2022', COUNT(*), SUM(Accidents)
FROM dbo.Monthly_2022
UNION ALL
SELECT 'Monthly_2023', COUNT(*), SUM(Accidents)
FROM dbo.Monthly_2023;


-- Check record counts and accident totals
-- in the yearly time-slot accident tables.

SELECT 'TimeSlot_2019' AS Table_Name,
       COUNT(*) AS Total_Records,
       SUM(Accidents) AS Total_Accidents
FROM dbo.TimeSlot_2019
UNION ALL
SELECT 'TimeSlot_2020', COUNT(*), SUM(Accidents)
FROM dbo.TimeSlot_2020
UNION ALL
SELECT 'TimeSlot_2021', COUNT(*), SUM(Accidents)
FROM dbo.TimeSlot_2021
UNION ALL
SELECT 'TimeSlot_2022', COUNT(*), SUM(Accidents)
FROM dbo.TimeSlot_2022
UNION ALL
SELECT 'TimeSlot_2023', COUNT(*), SUM(Accidents)
FROM dbo.TimeSlot_2023;


-- =============================================
-- 2. Validate Consolidated Tables
-- =============================================

-- Check record counts and total accidents
-- in the consolidated monthly dataset.

SELECT
    COUNT(*) AS Total_Records,
    SUM(Accidents) AS Total_Accidents
FROM dbo.Monthly_Accidents;


-- Check record counts and total accidents
-- in the consolidated time-slot dataset.

SELECT
    COUNT(*) AS Total_Records,
    SUM(Accidents) AS Total_Accidents
FROM dbo.TimeSlot_Accidents;


-- =============================================
-- 3. Compare Overall Accident Totals
-- =============================================

-- Compare total accident counts between
-- monthly and time-slot datasets.

SELECT
    (SELECT SUM(Accidents)
     FROM dbo.Monthly_Accidents) AS Monthly_Total,

    (SELECT SUM(Accidents)
     FROM dbo.TimeSlot_Accidents) AS TimeSlot_Total,

    CASE
        WHEN (SELECT SUM(Accidents)
              FROM dbo.Monthly_Accidents)
           = (SELECT SUM(Accidents)
              FROM dbo.TimeSlot_Accidents)
        THEN 'MATCH'
        ELSE 'MISMATCH'
    END AS Validation_Status;


-- =============================================
-- 4. Compare Year-Wise Accident Totals
-- =============================================

-- Verify that yearly accident totals match
-- between the two consolidated datasets.

WITH Monthly_Yearly AS
(
    SELECT Year, SUM(Accidents) AS Monthly_Total
    FROM dbo.Monthly_Accidents
    GROUP BY Year
),
TimeSlot_Yearly AS
(
    SELECT Year, SUM(Accidents) AS TimeSlot_Total
    FROM dbo.TimeSlot_Accidents
    GROUP BY Year
)
SELECT
    COALESCE(M.Year, T.Year) AS Year,
    M.Monthly_Total,
    T.TimeSlot_Total,
    CASE
        WHEN M.Monthly_Total = T.TimeSlot_Total
        THEN 'MATCH'
        ELSE 'MISMATCH'
    END AS Validation_Status
FROM Monthly_Yearly M
FULL OUTER JOIN TimeSlot_Yearly T
    ON M.Year = T.Year
ORDER BY Year;


-- =============================================
-- 5. Check for NULL or Missing Values
-- =============================================

-- Check NULL values in the monthly dataset.

SELECT
    COUNT(*) - COUNT(Year) AS Null_Year,
    COUNT(*) - COUNT(Month) AS Null_Month,
    COUNT(*) - COUNT(Accidents) AS Null_Accidents,
    COUNT(*) - COUNT(State_UT) AS Null_State_UT
FROM dbo.Monthly_Accidents;


-- Check NULL values in the time-slot dataset.

SELECT
    COUNT(*) - COUNT(Year) AS Null_Year,
    COUNT(*) - COUNT(Time_Slot) AS Null_Time_Slot,
    COUNT(*) - COUNT(Accidents) AS Null_Accidents,
    COUNT(*) - COUNT(State_UT) AS Null_State_UT
FROM dbo.TimeSlot_Accidents;


-- =============================================
-- 6. Check for Duplicate Records
-- =============================================

-- Identify exact duplicate records in the
-- monthly accident dataset.

SELECT
    Year,
    Month,
    Accidents,
    State_UT,
    COUNT(*) AS Duplicate_Count
FROM dbo.Monthly_Accidents
GROUP BY Year, Month, Accidents, State_UT
HAVING COUNT(*) > 1;


-- Identify exact duplicate records in the
-- time-slot accident dataset.

SELECT
    Year,
    Time_Slot,
    Accidents,
    State_UT,
    COUNT(*) AS Duplicate_Count
FROM dbo.TimeSlot_Accidents
GROUP BY Year, Time_Slot, Accidents, State_UT
HAVING COUNT(*) > 1;


-- =============================================
-- 7. Verify Standardised Time-Slot Labels
-- =============================================

-- Check the number of distinct time-slot labels
-- remaining after text standardisation.

SELECT DISTINCT
    Time_Slot
FROM dbo.TimeSlot_Accidents
ORDER BY Time_Slot;


-- Count the number of unique time slots.

SELECT
    COUNT(*) AS Unique_Time_Slot_Count
FROM
(
    SELECT DISTINCT Time_Slot
    FROM dbo.TimeSlot_Accidents
) AS Unique_Time_Slots;


-- =============================================
-- END OF DATA VALIDATION
-- =============================================

