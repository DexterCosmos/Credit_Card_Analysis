
<div align="center" >
    <img src="images/Poster.png" alt="poster" width="450">
    <h1> Credit Card Database</h1>
</div>


## Introduction
 
 This dataset comprises `26,052` entries with `10` columns, detailing customer spending behavior over a specific period. It provides valuable insights into spending patterns, trends, and potential anomalies, making it a robust resource for analysis and strategic decision-making.


## Data Analysis

This section outlines the process of data cleaning and standardization using Python to enhance the dataset's readability and prepare it for further analysis. The cleaning process ensures consistency, removes errors, handles missing values, and formats the data appropriately, creating a reliable foundation for accurate insights and meaningful interpretation.

### Python

1. Importing the libraries

    ```python
    import pandas as pd
    import numpy as np
    import pymysql
    from sqlalchemy import create_engine

    df = pd.read_csv('credit_card_transactions - India.csv')
    ```

2. Analysis of Dataset

   ```python
   df.head()

   df.describe()

   df.info()

   df.shape

   df.duplicated().sum()
   ```

3. Standardizing and Cleaning Data
   
- Date Conversion from object to int64

   ```python
   df['Date'] = pd.to_datetime(df['Date'])
   
   df['Date_as_int'] = df['Date'].dt.strftime('%Y%m%d')
   
   df.Date

   df.info()
   ```

- Seprating the years and months from the Date Column

   ```python
   df['Date'] = pd.to_datetime(df['Date'])
   
   df['Year'] = df['Date'].dt.year
   
   print(df)
   ```

   ```python
   df['Date'] = pd.to_datetime(df['Date'])
   
   df['Month'] = df['Date'].dt.strftime('%b')
   
   print(df)
   ```

- Seprating the country from the city column

   ```python
   df['Date'] = pd.to_datetime(df['Date'])
   
   df['Year'] = df['Date'].dt.year
   
   print(df)

   df.info()

   df.head()
   ```

4. Removing Index Column

   ```python
   df = df.drop(columns=['index'])

   print(df)
   ```

5. Saving the file in .csv format

   ```python
   df.to_csv('cleaned_data.csv', index=False)
   ```

6. Pushing Dataset to SQL

- Creating a connection to the database

   ```python
   engine_sql = create_engine('mysql+pymysql://root:Cosmos.90@localhost:3306/credit_card_db')
   ```

- Pushing the dataset to SQL

   ```python
   df.to_sql(name='credit_card', con=engine_sql, if_exists='replace', index=False)
   ```

## Insights Analysis

In this section, I have analyzed the insights derived from the cleaned and standardized dataset. This analysis was performed using SQL queries, ensuring a structured and efficient approach to extracting meaningful information.

### Key Insights

- Total Expenditure per City
- Gender-wise Expenditure
- Card Type Usage
- Expenditure by Expense Type
- Monthly Expenditure
- Yearly Expenditure
- Total Spending by Country
- Monthly Spending Trends by Year
- Spending Breakdown by Expense Type
- Spending Trends by Card Type and Year
- Average Spending by Gender

### **Prototype**

   ```sql
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
   ```

   ```sql
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
   ```

   ```sql
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
   ```

## Data Visualization

In this section, I present visualizations that showcase the insights derived from the cleaned and standardized dataset. These visualizations provide a clear and intuitive representation of the analyzed data, enabling better understanding and decision-making.

- Dashboard 1

<img src="Images/Dashboard1.png" alt="dashboard1">

- Dashboard 2

<img src="Images/Dashboard2.png" alt="dashboard2">

- Dashboard 3

<img src="Images/Dashboard3.png" alt="dashboard3">

## Impact

In this project, I have successfully analyzed the insights derived from the cleaned and standardized dataset using a combination of Power BI, SQL, and Python. SQL was employed to efficiently query and manipulate the data, ensuring a structured and systematic extraction of relevant information. Python was utilized for advanced data preprocessing, exploratory analysis, and integration with visualization tools. Finally, Power BI was used to create interactive and visually compelling dashboards, enabling a clear and intuitive representation of the insights to support informed decision-making.

## Tools

- Power BI

- SQL

- Python - Libraries [pandas, numpy, pymysql, sqlalchemy]

- Excel

- Jupyter Notebook

---

<p align="center">
 <i>This project was solely exicuted by // <b>Nomaan Ansari</b> //</i>
</p>
