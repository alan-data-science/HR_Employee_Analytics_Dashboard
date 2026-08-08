-- Q1: Employees who left by department
SELECT
    Department,
    COUNT(*) AS employees_left
FROM employees
WHERE Attrition = 'Yes'
GROUP BY Department
ORDER BY employees_left DESC;


-- Q2: Attrition rate by department
SELECT
    Department,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY Department
ORDER BY attrition_rate DESC;

-- Q3: Attrition by overtime
SELECT
    OverTime,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY OverTime
ORDER BY attrition_rate DESC;

-- Q4: Attrition by job role
SELECT
    JobRole,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY JobRole
ORDER BY attrition_rate DESC;

-- Q5: Average income by attrition
SELECT
    Attrition,
    COUNT(*) AS total_employees,
    ROUND(AVG(MonthlyIncome), 2) AS average_monthly_income
FROM employees
GROUP BY Attrition
ORDER BY average_monthly_income DESC;

-- Q6: Attrition by age group
SELECT
    CASE
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS age_group,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY age_group
ORDER BY attrition_rate DESC;

-- Q7: Attrition by experience
SELECT
    CASE
        WHEN TotalWorkingYears < 3 THEN '0-2 Years'
        WHEN TotalWorkingYears BETWEEN 3 AND 5 THEN '3-5 Years'
        WHEN TotalWorkingYears BETWEEN 6 AND 10 THEN '6-10 Years'
        WHEN TotalWorkingYears BETWEEN 11 AND 20 THEN '11-20 Years'
        ELSE '20+ Years'
    END AS experience_group,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY experience_group
ORDER BY attrition_rate DESC;

-- Q8: Average monthly income by department
SELECT
    Department,
    COUNT(*) AS total_employees,
    ROUND(AVG(MonthlyIncome), 2) AS average_monthly_income,
    MAX(MonthlyIncome) AS highest_monthly_income,
    MIN(MonthlyIncome) AS lowest_monthly_income
FROM employees
GROUP BY Department
ORDER BY average_monthly_income DESC;

-- Q9: Attrition by job satisfaction
SELECT
    JobSatisfaction,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;


-- Q10: Attrition by gender
SELECT
    Gender,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY Gender
ORDER BY attrition_rate DESC;

-- Q11: Attrition by job level
SELECT
    JobLevel,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY JobLevel
ORDER BY JobLevel;

-- Q12: Attrition by work-life balance
SELECT
    WorkLifeBalance,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;

-- Q13: Attrition by overtime and job satisfaction
SELECT
    OverTime,
    JobSatisfaction,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY OverTime, JobSatisfaction
ORDER BY attrition_rate DESC;

-- Q14: Attrition by years at company
SELECT
    CASE
        WHEN YearsAtCompany < 2 THEN 'Less than 2 Years'
        WHEN YearsAtCompany BETWEEN 2 AND 5 THEN '2-5 Years'
        WHEN YearsAtCompany BETWEEN 6 AND 10 THEN '6-10 Years'
        WHEN YearsAtCompany BETWEEN 11 AND 20 THEN '11-20 Years'
        ELSE '20+ Years'
    END AS company_tenure,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY company_tenure
ORDER BY attrition_rate DESC;

-- Q15: Attrition by performance rating
SELECT
    PerformanceRating,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY PerformanceRating
ORDER BY PerformanceRating;