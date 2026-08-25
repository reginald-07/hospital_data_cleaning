# Hospital Data Cleaning & Analysis Project

## Overview
This project cleans, validates, and analyzes a 4-table hospital operations 
dataset (patients, staff, weekly service stats, and staff schedules) using SQL.

## Dataset
- `patients` — patient demographics, admission/discharge dates, service, satisfaction
- `staff` — staff roles and assigned services
- `services_weekly` — weekly capacity, demand, and outcomes per service
- `staff_schedule` — weekly attendance records per staff member

## Part 1: Data Cleaning

### Process
For each table, I:
1. Created a working copy (`_clean` suffix) to preserve the original raw data
2. Checked for null values across all columns
3. Checked for duplicate records
4. Validated logical rules (e.g. arrival date must come before departure date)
5. Checked categorical columns for spelling/casing inconsistencies

### Key Findings
- 12 patient records had `age = 0`, spread across all service types with 
  no clear pattern — flagged as `suspicious_age` rather than deleted, 
  since the underlying cause (data entry error vs. true infant) was unclear
- All other tables (staff, services_weekly, staff_schedule) passed 
  validation with no issues found

## Part 2: Analysis

### Question
What's driving patient refusals, and does staffing play a role?

### Method
1. Calculated refusal rate (refused ÷ requested × 100) per service using `services_weekly_clean`
2. Compared refusal rates against average available beds per service
3. Verified the relationship between demand, bed capacity, and refusals directly
4. Joined `staff_schedule_clean` with `services_weekly_clean` to test whether 
   biweekly staffing gaps affected bed capacity, satisfaction, or morale

### Key Findings

**1. Refusals are a pure bed-capacity mechanism.**
Emergency had the highest refusal rate (80.9%), far above surgery (24.8%), 
general_medicine (45.4%), and ICU (17.9%). Testing confirmed zero exceptions: 
whenever patient requests exceeded available beds, the hospital admitted 
exactly up to capacity and refused the remainder every time.

**2. Staffing does not explain refusals.**
The dataset shows a biweekly pattern where staff attendance drops to 0 for 
an entire week, alternating with fully staffed weeks. However, joining 
staffing data against bed capacity showed available beds stayed roughly 
constant regardless of staffing level.

**3. Staffing does not affect satisfaction or morale either.**
Comparing zero-staff weeks against staffed weeks showed no meaningful 
difference in average patient satisfaction (80.4 vs 79.8) or staff morale 
(74.8 vs 71.5) — ruling out staffing as a driver of either outcome.

### Conclusion
Refusals are driven entirely by bed capacity relative to demand, not by 
staffing levels. The biweekly staffing gaps present in the data appear to 
have no measurable downstream effect on capacity, refusals, satisfaction, 
or morale — a notable finding, since it rules out an initially plausible 
hypothesis.

## Tools
MySQL Workbench, SQL (data validation, joins, CTEs, aggregate functions)