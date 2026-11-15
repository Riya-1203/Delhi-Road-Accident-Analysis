
USE Delhi_Road_Accidents;
GO

-- =============================================
-- PROJECT: Delhi Road Accident Analysis
-- PERIOD: 2019-2023
-- SCRIPT: Data Cleaning
-- PURPOSE: Identify and standardise inconsistent
--          characters in Time_Slot values.
-- =============================================


-- =============================================
-- 1. Investigate Inconsistent Time-Slot Labels
-- =============================================

-- Check distinct time-slot values and inspect
-- character length and character codes.
-- This helps identify differences such as
-- regular hyphens (-) and en dashes (–).

SELECT DISTINCT
    Time_Slot,
    LEN(Time_Slot) AS Character_Length,
    DATALENGTH(Time_Slot) AS Storage_Length,
    UNICODE(SUBSTRING(Time_Slot, 6, 1))
        AS Sixth_Character_Code
FROM dbo.TimeSlot_Accidents
ORDER BY Time_Slot;


-- =============================================
-- 2. Standardise Time-Slot Labels
-- =============================================

-- Replace en dashes (–) with regular hyphens (-)
-- to ensure consistent time-slot labels.
-- This prevents the same time slot from being
-- treated as different groups during analysis.

UPDATE dbo.TimeSlot_Accidents
SET Time_Slot = REPLACE(
    Time_Slot,
    NCHAR(8211),
    '-'
);


-- =============================================
-- END OF DATA CLEANING
-- =============================================

