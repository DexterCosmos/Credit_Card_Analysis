SELECT * FROM credit_card;


1. -- Total Expenditure per City

SELECT City, SUM(Amount) AS Total_Expenditure
FROM credit_card
GROUP BY City
ORDER BY Total_Expenditure DESC;


2. -- Gender-wise Expenditure

SELECT Gender, SUM(Amount) AS Total_Expenditure
FROM credit_card
GROUP BY Gender
ORDER BY Total_Expenditure DESC;


3. -- Card Type Usage

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

4. -- Expenditure by Expense Type

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

5. -- Monthly Expenditure

SELECT 
    MONTH(`Month`) AS Month,
    SUM(`Amount`) AS TotalSpend
FROM 
    credit_card
GROUP BY 
    Month
ORDER BY 
    Month;

