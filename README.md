
<div align="center" >
    <img src="Images/poster.png" alt="poster" width="650">
    <h1> Credit Card Database</h1>
</div>


## Introduction
 
 This dataset comprises `26,052` entries with `9` columns, detailing customer spending behavior over a specific period. It provides valuable insights into spending patterns, trends, and potential anomalies, making it a robust resource for analysis and strategic decision-making.


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

- Seprating the years from the Date Column
   ```python
   df['Date'] = pd.to_datetime(df['Date'])
   
   df['Year'] = df['Date'].dt.year
   
   print(df)
   ```

- Separating the country from the city column
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

## Data Visualization

## Conclusion

---

<p align="center">
 <i>This project was solely exicuted by // Nomaan Ansari //</i>
</p>

