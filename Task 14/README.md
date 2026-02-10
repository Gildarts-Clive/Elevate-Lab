# Retail Sales ETL Pipeline

This project implements a simple ETL (Extract, Transform, Load) pipeline for a Retail Sales Dataset using Python (pandas) and SQLite.

## Project Structure

```
Task 14/
├── raw/                    # Contains the original dataset
│   └── retail_sales_dataset.csv
├── processed/              # Contains transformed CSV files
│   ├── customers.csv
│   ├── products.csv
│   ├── orders.csv
│   └── processed_data.csv  # Master cleaned dataset
├── output/                 # Contains the SQLite database
│   └── database.sqlite
├── task14_etl.ipynb        # Jupyter Notebook with ETL logic and analysis
└── README.md               # This file
```

## ETL Steps

1.  **Extract**:
    - Loads the raw data from `raw/retail_sales_dataset.csv`.

2.  **Transform**:
    - **Cleaning**: specific checks for duplicates and missing values.
    - **Standardization**: Converts column names to snake_case and `date` to datetime objects.
    - **Feature Engineering**: Adds `year`, `month`, `quarter`, `estimated_cost`, `estimated_profit`, and `age_group` columns.
    - **Splitting**: Separates data into `Customers`, `Products`, and `Orders` tables for normalization.

3.  **Load**:
    - Exports cleaned data to `processed/` as CSV files.
    - Loads tables into a SQLite database at `output/database.sqlite`.

4.  **Analysis**:
    - Includes visualizations for Sales Trends, Category Performance, and Customer Demographics.

## How to Run

1.  Open `task14_etl.ipynb` in Jupyter Notebook, VS Code, or Google Colab.
2.  Run all cells sequentially.
3.  Check the `processed/` and `output/` directories for the generated files.
