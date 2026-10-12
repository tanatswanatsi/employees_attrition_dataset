# employees_attrition_dataset
SQL project cleaning and analyzing a 1,470-record employee HR dataset in MySQL. Covers attrition drivers, overtime impact, promotion gaps, and department-level salary trends. Key finding: employees working overtime left at nearly 3x the rate of those who didn't — the strongest predictor identified in the analysis

## Overview
This project uses MySQL to clean and analyze a real-world employee HR dataset of 1,470 records, examining attrition patterns, overtime impact, career growth, and compensation to identify what's actually associated with employees leaving.

## Why I Built This
I wanted to apply SQL to an HR dataset to practice identifying both data quality issues and workforce insights — going beyond simple cleaning to answer questions an HR or people-operations team would actually use to inform retention strategy.

## Dataset
1,470 employee records with fields including demographics, department, job role, salary, business travel frequency, overtime status, tenure (years at company, years since last promotion), and attrition status.

## Process

### Data Cleaning
- Verified no duplicate Employee IDs and no missing values
- **Key data quality finding:** identified hidden duplicate categories caused by trailing whitespace — e.g., "Marketing" and "Marketing " were being counted as two separate values in `Education Field`, along with similar issues in `Business Travel` and `Ethnicity`. Fixed by trimming all text columns.
- Renamed columns for readability (e.g., `EmployeeID` → `Employee ID`, `YearsAtCompany` → `Years At Company`)

### Exploratory Analysis
1. **Overall Attrition Rate** — 16.12% of employees (237 of 1,470) left the company
2. **Attrition Rate by Department** — Sales had the highest attrition rate at 20.63%, followed by Human Resources at 19.05%, while Technology had the lowest at 13.84%
3. **Overtime vs. Attrition** — employees working overtime left at a rate of 30.53%, nearly three times higher than the 10.44% rate for those who didn't work overtime
4. **Years Since Last Promotion vs. Attrition** — employees who left averaged just 1.4 years since their last promotion and 2.4 years of tenure, compared to 3.8 years since promotion and 5.0 years of tenure for those who stayed
5. **Average Salary by Department** — Human Resources had the highest average salary ($119,698.81), narrowly ahead of Sales ($119,117.61), while Technology had the lowest ($109,655.12)

## Key Findings
- **Overtime is the strongest attrition signal in this dataset** — employees working overtime left at nearly 3x the rate of those who didn't (30.53% vs. 10.44%), making it the single clearest risk factor identified.
- **Employees who leave tend to leave early and without recent promotion** — those who left had both shorter tenure (2.4 vs. 5.0 years) and a much shorter gap since their last promotion (1.4 vs. 3.8 years) than those who stayed, suggesting early-tenure employees may be leaving before having a chance to progress, rather than leaving due to being overlooked for promotion long-term.
- **Sales has the highest attrition despite not having the lowest salary** — Sales' attrition rate (20.63%) was the highest of all departments, even though its average salary ($119,117.61) was close to the top-paying department (HR), suggesting compensation alone isn't driving Sales' attrition — overtime or role-specific pressures are more likely contributors.
- **Technology has the lowest attrition and lowest salary** — somewhat counterintuitive, since Technology pays the least on average ($109,655.12) yet retains employees best (13.84% attrition), suggesting non-salary factors (role satisfaction, work-life balance, career growth) may matter more than pay alone in this dataset.

## Recommendations
- **Address overtime load as a top retention priority** — given overtime employees left at nearly 3x the rate of others, reducing mandatory overtime, redistributing workload, or increasing overtime compensation in overtime-heavy roles could meaningfully reduce attrition.
- **Focus retention efforts on early-tenure employees** — since employees who left had much shorter tenure on average, onboarding, mentorship, and early career development programs may help retain staff through their critical first 1-2 years.
- **Investigate Sales-specific pressures beyond pay** — since Sales has high attrition despite competitive pay, factors like workload, quota pressure, or overtime frequency within Sales specifically should be reviewed.
- **Use Technology's retention success as a model** — despite lower pay, Technology retains staff well; understanding what's working there (culture, flexibility, career paths) could inform retention strategy in higher-attrition departments.
- **Standardize data entry practices** — trailing whitespace inconsistencies in text fields suggest a need for input validation at the point of data entry (e.g., dropdown menus instead of free text).

## Tools Used
MySQL Workbench
