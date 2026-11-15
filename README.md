# Delhi Road Accident Analysis (2019–2023)

## Project Overview

This project analyses road accident data for Delhi (UT) from 2019 to 2023 to understand annual trends, monthly accident patterns, and the distribution of accidents across different time slots.

The project uses data published by the **National Crime Records Bureau (NCRB)** in its *Chapter 1A – Traffic Accidents* reports. The data was manually extracted, organised, cross-checked, and analysed using Excel, SQL Server, and Power BI.

The objective is to identify patterns in reported road accidents and present the findings through an interactive Power BI dashboard.

## Project Objectives

- Analyse year-wise road accident trends from 2019 to 2023.
- Identify months with the highest and lowest accident counts in each year.
- Examine accident distribution across different time slots.
- Compare monthly and time-slot accident totals to validate consistency.
- Build an interactive Power BI dashboard to present the findings.

## Tools and Technologies

| Tool | Purpose |
|---|---|
| Microsoft Excel | Data extraction, organisation, and cross-checking |
| SQL Server | Data consolidation, cleaning, validation, and analysis |
| Power BI | Interactive dashboard and data visualisation |
| GitHub | Project documentation, version control, and portfolio presentation |

## Dataset

- **Geographical scope:** Delhi (UT)
- **Study period:** 2019–2023
- **Source:** National Crime Records Bureau (NCRB)
- **Source reports:** Chapter 1A – Traffic Accidents

Two datasets were prepared for the analysis:

1. **Monthly Accident Data:** 12 monthly records for each year.
2. **Time-Slot Accident Data:** 8 time-slot records for each year.

Both datasets contain 100 records combined: 60 monthly records and 40 time-slot records.

The original data was extracted from NCRB reports and converted into CSV files for analysis.

## Project Workflow

1. **Data Collection:** Obtained the relevant accident statistics from NCRB reports for 2019–2023.
2. **Data Preparation:** Manually extracted the required information, organised it in Excel, and cross-checked the values against the source reports.
3. **Data Consolidation:** Imported the yearly CSV files into SQL Server and combined them into consolidated monthly and time-slot tables.
4. **Data Cleaning and Validation:** Standardised inconsistent time-slot labels, checked data types, validated annual totals, and checked for missing and duplicate records.
5. **Data Analysis:** Used SQL queries to examine annual trends, monthly patterns, and time-slot distributions.
6. **Dashboard Development:** Created an interactive Power BI report with two analysis pages.

## Key Findings

- A total of **25,783 road accidents** were recorded across the five-year study period.
- The highest annual accident count was recorded in **2023 (5,715)**.
- The lowest annual accident count was recorded in **2020 (4,187)**.
- Annual accident counts increased from 2020 through 2023.
- The month with the highest accident count varied across the five years.
- The **03:00–06:00** time slot consistently recorded the lowest accident count in each year.
- The highest accident count in each year occurred in either the **18:00–21:00** or **21:00–24:00** time slot.

These findings describe patterns in reported accidents and do not establish the causes behind them.

## Power BI Dashboard

The Power BI report contains two pages:

### 1. Monthly Accident Analysis

Examines monthly accident patterns across 2019–2023, allowing users to compare accident counts across years.

### 2. Time-Slot Analysis

Examines the distribution of accidents across eight time slots and compares patterns across the five-year period.

The report includes KPIs, visualisations, a matrix, and year-based slicers for interactive exploration.

The Power BI report and dashboard screenshots are available in the [`PowerBI`](PowerBI/) folder.

## Repository Structure

```text
Delhi-Road-Accident-Analysis/
│
├── Data/
│   ├── Source/
│   └── Processed/
│       ├── Monthly_Accidents/
│       └── Time_Slot_Accidents/
│
├── Documentation/
│   ├── Data_Cleaning_Documentation.md
│   └── Project_Findings.md
│
├── SQL/
│   ├── Data_Consolidation.sql
│   ├── Data_Cleaning.sql
│   ├── Data_Validation.sql
│   ├── Data_Analysis.sql
│   └── README.md
│
├── PowerBI/
│   ├── Delhi_Accident_File.pbix
│   ├── README.md
│   └── Dashboard_Screenshots/
│
└── README.md
```

## Limitations

- The analysis covers only five years (2019–2023).
- The study is limited to the available variables in the NCRB reports.
- The analysis does not include detailed geographical breakdowns within Delhi.
- The findings identify patterns and associations, not causal relationships.
- The results depend on accidents recorded and reported in the source data.

## Conclusion

This project demonstrates an end-to-end data analytics workflow, from collecting and preparing data to performing SQL-based analysis and developing an interactive Power BI dashboard.

It provided practical experience in data extraction, data cleaning, validation, SQL querying, data visualisation, and project documentation.

## Data Source

National Crime Records Bureau (NCRB), Ministry of Home Affairs, Government of India.

Official website: https://www.ncrb.gov.in/
