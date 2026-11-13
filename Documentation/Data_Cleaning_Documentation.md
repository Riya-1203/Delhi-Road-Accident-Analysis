### Data Cleaning Issue: Inconsistent Time-Slot Labels

**Problem Identified:**

During the SQL analysis of road accidents by time slot (2019–2023), the query returned 13 rows instead of the expected 8 time slots.

**Investigation:**
I investigated the issue by checking the distinct time-slot values, character lengths and character codes in the consolidated dataset. 
The investigation revealed that some time-slot labels used an en dash (–), while others used a regular hyphen (-). Although these characters looked almost 
identical, SQL Server treated them as different text values.
As a result, identical time intervals were grouped separately, producing duplicate-looking rows in the analysis.

**Solution Implemented:**
I standardised the time-slot labels in the consolidated table by replacing all en dashes with regular hyphens. 
This ensured that identical time intervals followed a consistent naming convention. The original yearly tables were left unchanged.

**Validation:**
After standardisation, I reran the distinct-value check and the time-slot comparison analysis. The result contained exactly 8 unique time slots instead of 13.

**Learning Outcome:**
This issue highlighted the importance of text standardisation during data cleaning. 
Even small differences in special characters can affect grouping and produce misleading analytical results. 
Standardising categorical values helps ensure accurate SQL analysis and reliable reporting.
