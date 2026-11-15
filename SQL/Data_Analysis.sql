
USE Delhi_Road_Accidents;
GO

-- =============================================
-- PROJECT: Delhi Road Accident Analysis
-- PERIOD: 2019-2023
-- SCRIPT: Data Analysis
-- PURPOSE: Analyse monthly, yearly and time-slot
--          accident trends and patterns.
-- =============================================


-- =============================================
-- 1. Overall Monthly Accident Patterns
-- =============================================

-- Identify which months recorded the highest
-- total number of accidents across all five years.

SELECT
    Month,
    SUM(Accidents) AS Total_Accidents,
    AVG(CAST(Accidents AS DECIMAL(10,2)))
        AS Average_Accidents
FROM dbo.Monthly_Accidents
GROUP BY Month
ORDER BY Total_Accidents DESC;


-- =============================================
-- 2. Overall Time-Slot Accident Patterns
-- =============================================

-- Identify which time slots recorded the highest
-- total number of accidents across all five years.

SELECT
    Time_Slot,
    SUM(Accidents) AS Total_Accidents,
    AVG(CAST(Accidents AS DECIMAL(10,2)))
        AS Average_Accidents
FROM dbo.TimeSlot_Accidents
GROUP BY Time_Slot
ORDER BY Total_Accidents DESC;


-- =============================================
-- 3. Year-Wise Accident Trends
-- =============================================

-- Calculate total accidents for each year.

SELECT
    Year,
    SUM(Accidents) AS Total_Accidents
FROM dbo.Monthly_Accidents
GROUP BY Year
ORDER BY Year;


-- Calculate year-over-year changes in accident counts.

WITH Yearly_Accidents AS
(
    SELECT
        Year,
        SUM(Accidents) AS Total_Accidents
    FROM dbo.Monthly_Accidents
    GROUP BY Year
),
Yearly_Comparison AS
(
    SELECT
        Year,
        Total_Accidents,
        LAG(Total_Accidents) OVER (ORDER BY Year)
            AS Previous_Year_Accidents
    FROM Yearly_Accidents
)
SELECT
    Year,
    Total_Accidents,
    Previous_Year_Accidents,
    Total_Accidents - Previous_Year_Accidents
        AS Change_In_Accidents,
    CAST(
        (Total_Accidents - Previous_Year_Accidents) * 100.0
        / NULLIF(Previous_Year_Accidents, 0)
        AS DECIMAL(10,2)
    ) AS Percentage_Change
FROM Yearly_Comparison
ORDER BY Year;


-- =============================================
-- 4. Monthly Accident Patterns Across Years
-- =============================================

-- Compare accident counts for each month
-- across the five years.

SELECT
    Month,
    SUM(CASE WHEN Year = 2019 THEN Accidents ELSE 0 END)
        AS [2019],
    SUM(CASE WHEN Year = 2020 THEN Accidents ELSE 0 END)
        AS [2020],
    SUM(CASE WHEN Year = 2021 THEN Accidents ELSE 0 END)
        AS [2021],
    SUM(CASE WHEN Year = 2022 THEN Accidents ELSE 0 END)
        AS [2022],
    SUM(CASE WHEN Year = 2023 THEN Accidents ELSE 0 END)
        AS [2023]
FROM dbo.Monthly_Accidents
GROUP BY Month
ORDER BY
    CASE Month
        WHEN 'January' THEN 1
        WHEN 'February' THEN 2
        WHEN 'March' THEN 3
        WHEN 'April' THEN 4
        WHEN 'May' THEN 5
        WHEN 'June' THEN 6
        WHEN 'July' THEN 7
        WHEN 'August' THEN 8
        WHEN 'September' THEN 9
        WHEN 'October' THEN 10
        WHEN 'November' THEN 11
        WHEN 'December' THEN 12
    END;


-- =============================================
-- 5. Time-Slot Accident Patterns Across Years
-- =============================================

-- Compare accident counts for each time slot
-- across the five years.

SELECT
    Time_Slot,
    SUM(CASE WHEN Year = 2019 THEN Accidents ELSE 0 END)
        AS [2019],
    SUM(CASE WHEN Year = 2020 THEN Accidents ELSE 0 END)
        AS [2020],
    SUM(CASE WHEN Year = 2021 THEN Accidents ELSE 0 END)
        AS [2021],
    SUM(CASE WHEN Year = 2022 THEN Accidents ELSE 0 END)
        AS [2022],
    SUM(CASE WHEN Year = 2023 THEN Accidents ELSE 0 END)
        AS [2023]
FROM dbo.TimeSlot_Accidents
GROUP BY Time_Slot
ORDER BY Time_Slot;


-- =============================================
-- 6. Highest and Lowest Accident Months Per Year
-- =============================================

-- Rank months by accident count within each year.
-- Identify the highest and lowest accident months.

WITH Monthly_Ranking AS
(
    SELECT
        Year,
        Month,
        SUM(Accidents) AS Total_Accidents,
        RANK() OVER (
            PARTITION BY Year
            ORDER BY SUM(Accidents) DESC
        ) AS Highest_Rank,
        RANK() OVER (
            PARTITION BY Year
            ORDER BY SUM(Accidents) ASC
        ) AS Lowest_Rank
    FROM dbo.Monthly_Accidents
    GROUP BY Year, Month
)
SELECT
    Year,
    Month,
    Total_Accidents,
    'Highest' AS Accident_Level
FROM Monthly_Ranking
WHERE Highest_Rank = 1

UNION ALL

SELECT
    Year,
    Month,
    Total_Accidents,
    'Lowest' AS Accident_Level
FROM Monthly_Ranking
WHERE Lowest_Rank = 1
ORDER BY Year, Accident_Level;


-- =============================================
-- 7. Highest and Lowest Accident Time Slots Per Year
-- =============================================

-- Rank time slots by accident count within each year.
-- Identify the highest and lowest accident time slots.

WITH TimeSlot_Ranking AS
(
    SELECT
        Year,
        Time_Slot,
        SUM(Accidents) AS Total_Accidents,
        RANK() OVER (
            PARTITION BY Year
            ORDER BY SUM(Accidents) DESC
        ) AS Highest_Rank,
        RANK() OVER (
            PARTITION BY Year
            ORDER BY SUM(Accidents) ASC
        ) AS Lowest_Rank
    FROM dbo.TimeSlot_Accidents
    GROUP BY Year, Time_Slot
)
SELECT
    Year,
    Time_Slot,
    Total_Accidents,
    'Highest' AS Accident_Level
FROM TimeSlot_Ranking
WHERE Highest_Rank = 1

UNION ALL

SELECT
    Year,
    Time_Slot,
    Total_Accidents,
    'Lowest' AS Accident_Level
FROM TimeSlot_Ranking
WHERE Lowest_Rank = 1
ORDER BY Year, Accident_Level;


-- =============================================
-- 8. Average Annual Accident Count
-- =============================================

-- Calculate the average annual accident count
-- across the five years.

WITH Yearly_Accidents AS
(
    SELECT
        Year,
        SUM(Accidents) AS Total_Accidents
    FROM dbo.Monthly_Accidents
    GROUP BY Year
)
SELECT
    AVG(CAST(Total_Accidents AS DECIMAL(10,2)))
        AS Average_Annual_Accidents
FROM Yearly_Accidents;


-- =============================================
-- 9. Average Monthly Accident Count
-- =============================================

-- Calculate the average number of accidents
-- recorded per month across the entire period.

SELECT
    AVG(CAST(Accidents AS DECIMAL(10,2)))
        AS Average_Monthly_Accidents
FROM dbo.Monthly_Accidents;


-- =============================================
-- END OF DATA ANALYSIS
-- =============================================

