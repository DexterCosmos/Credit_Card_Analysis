
-- Total Expenditure per City

SELECT City, SUM(Amount) AS Total_Expenditure
FROM credit_card
GROUP BY City
ORDER BY Total_Expenditure DESC;


----------------------------------------------------------------------------------------------------

-- Gender-wise Expenditure

SELECT Gender, SUM(Amount) AS Total_Expenditure
FROM credit_card
GROUP BY Gender
ORDER BY Total_Expenditure DESC;


----------------------------------------------------------------------------------------------------

-- Card Type Usage

SELECT 
    `Card Type`,
    COUNT(*) AS UsageCount, 
    SUM(`Amount`) AS TotalSpend
FROM 
    credit_card
GROUP BY 
    `Card Type`
ORDER BY 
    UsageCount DESC;


----------------------------------------------------------------------------------------------------

-- Expenditure by Expense Type

SELECT 
    `Exp Type`,
    COUNT(*) AS UsageCount, 
    SUM(`Amount`) AS TotalSpend
FROM 
    credit_card
GROUP BY 
    `Exp Type`
ORDER BY 
    UsageCount DESC;


----------------------------------------------------------------------------------------------------

-- Monthly Expenditure

SELECT 
    MONTH(STR_TO_DATE(`Month`, '%M')) AS MonthNum,
    `Month`,
    SUM(`Amount`) AS TotalSpend
FROM 
    credit_card
GROUP BY 
    MonthNum, `Month`
ORDER BY 
    `Month`;


----------------------------------------------------------------------------------------------------

-- Yearly Expenditure

SELECT 
    YEAR(`Date`) AS Year,
    SUM(`Amount`) AS TotalSpend
FROM 
    credit_card
GROUP BY 
    YEAR(`Date`)
ORDER BY 
    Year;


----------------------------------------------------------------------------------------------------

-- Total Spending by Country

WITH Country_Spending AS (
    SELECT 
        Country,
        SUM(Amount) AS Total_Amount
    FROM credit_card
    GROUP BY Country
)
SELECT 
    Country,
    Total_Amount
FROM Country_Spending
ORDER BY Total_Amount DESC;

----------------------------------------------------------------------------------------------------

-- Monthly Spending Trends by Year

WITH Monthly_Trend AS (
    SELECT 
        Year,
        Month,
        SUM(Amount) AS Total_Amount
    FROM credit_card
    GROUP BY Year, Month
)
SELECT 
    Year,
    Month,
    Total_Amount
FROM Monthly_Trend
ORDER BY Year, Month DESC;

----------------------------------------------------------------------------------------------------

-- Spending Breakdown by Expense Type

WITH Expense_Breakdown AS (
    SELECT 
        `Exp Type`,
        SUM(`Amount`) AS Total_Amount
    FROM credit_card
    GROUP BY `Exp Type`
)
SELECT 
    `Exp Type`,
    Total_Amount
FROM Expense_Breakdown
ORDER BY Total_Amount DESC;


----------------------------------------------------------------------------------------------------

-- Spending Trends by Card Type and Year

WITH Card_Yearly_Trend AS (
    SELECT 
        `Card Type`,
        Year,
        SUM(Amount) AS Total_Amount
    FROM credit_card
    GROUP BY `Card Type`, Year
)
SELECT 
    `Card Type`,
    Year,
    Total_Amount
FROM Card_Yearly_Trend
ORDER BY `Card Type`, Year;

----------------------------------------------------------------------------------------------------

-- Average Spending by Gender

WITH Average_Spending AS (
    SELECT 
        Gender,
        AVG(Amount) AS Average_Amount
    FROM credit_card
    GROUP BY Gender
)
SELECT 
    Gender,
    Average_Amount
FROM Average_Spending;

--- END ---