# Hospital Data Cleaning Project

## Overview
This project cleans and validates a 4-table hospital operations dataset 
(patients, staff, weekly service stats, and staff schedules) using SQL. 
The goal was to ensure data quality before moving into analysis.

## Dataset
- `patients` — patient demographics, admission/discharge dates, service, satisfaction
- `staff` — staff roles and assigned services
- `services_weekly` — weekly capacity, demand, and outcomes per service
- `staff_schedule` — weekly attendance records per staff member

## Process
For each table, I:
1. Created a working copy (`_clean` suffix) to preserve the original raw data
2. Checked for null values across all columns
3. Checked for duplicate records
4. Validated logical rules (e.g. arrival date must come before departure date)
5. Checked categorical columns for spelling/casing inconsistencies

## Key Findings
- 12 patient records had `age = 0`, spread across all service types with 
  no clear pattern — flagged as `suspicious_age` rather than deleted, 
  since the underlying cause (data entry error vs. true infant) was unclear
- All other tables (staff, services_weekly, staff_schedule) passed 
  validation with no issues found

## Tools
MySQL Workbench, SQL
