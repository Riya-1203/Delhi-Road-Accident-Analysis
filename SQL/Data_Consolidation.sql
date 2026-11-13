USE Delhi_Road_Accidents;
GO

-- =============================================
-- PROJECT: Delhi Road Accident Analysis
-- PERIOD: 2019-2023
-- SCRIPT: Data Consolidation
-- PURPOSE: Combine yearly datasets into
--          consolidated tables.
-- =============================================


-- =============================================
-- 1. Consolidate Monthly Accident Data
-- =============================================
-- Combine monthly accident records from 2019 to 2023.
SELECT
    Year,
    State_UT,
    Month,
    Accidents
INTO dbo.Monthly_Accidents
FROM dbo.Monthly_2019

UNION ALL

SELECT Year, State_UT, Month, Accidents
FROM dbo.Monthly_2020

UNION ALL

SELECT Year, State_UT, Month, Accidents
FROM dbo.Monthly_2021

UNION ALL

SELECT Year, State_UT, Month, Accidents
FROM dbo.Monthly_2022

UNION ALL

SELECT Year, State_UT, Month, Accidents
FROM dbo.Monthly_2023;


-- =============================================
-- 2. Consolidate Time-Slot Accident Data
-- =============================================
-- Combine time-slot accident records from 2019 to 2023.
SELECT
    Year,
    State_UT,
    Time_Slot,
    Accidents
INTO dbo.TimeSlot_Accidents
FROM dbo.TimeSlot_2019

UNION ALL

SELECT Year, State_UT, Time_Slot, Accidents
FROM dbo.TimeSlot_2020

UNION ALL

SELECT Year, State_UT, Time_Slot, Accidents
FROM dbo.TimeSlot_2021

UNION ALL

SELECT Year, State_UT, Time_Slot, Accidents
FROM dbo.TimeSlot_2022

UNION ALL

SELECT Year, State_UT, Time_Slot, Accidents
FROM dbo.TimeSlot_2023;

-- =============================================
-- END OF DATA CONSOLIDATION
-- =============================================



-- Combine time-slot accident records from 2019 to 2023.
