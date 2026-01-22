# Data Cleaning and Analysis Explanation

This document outlines the rationale behind each step taken in the analysis of the Titanic dataset (`tested.csv`).

## 1. Import and Load
**Comparison**: `df = pd.read_csv('tested.csv')`
**Reasoning**: We use the pandas library because it is the industry standard for data manipulation in Python. Loading the data into a DataFrame (`df`) allows for efficient tabular operations.

## 2. Inspection (`head`, `info`, `isnull`)
**Reasoning**:
-   `.head()`: Provides a quick visual check to ensure the data loaded correctly and headers are aligned.
-   `.info()`: Shows data types (int, float, object) to spot inconsistencies (e.g., numbers stored as text).
-   `.isnull().sum()`: Crucial for identifying which columns have missing data. In this dataset, we identified `Age`, `Fare`, and `Cabin` as having null values.

## 3. Cleaning Missing Values
**Reasoning**:
-   **Dropping `Cabin`**: This column had a very high percentage of missing values (approx. 78%). Imputing (guessing) this data would introduce too much noise, so removing the column is the safer approach for general analysis.
-   **Filling `Age` with Median**: Age data often contains outliers (very old or very young passengers) which can skew the *mean*. The *median* is more robust to outliers and provides a better central representation for imputation.
-   **Filling `Fare` with Mean**: Since `Fare` is a continuous numerical variable and usually follows a somewhat standard spacing, the mean is a standard imputation method for the few missing values found.

## 4. Removing Duplicates
**Reasoning**: Duplicate rows can bias analysis by over-representing certain data points. We explicitly check the row count before and after `.drop_duplicates()` to confirm data integrity.

## 5. Converting Datatypes (`Age` to `int`)
**Reasoning**: Age is logically better represented as a whole number for demographic grouping. Converting `float` (e.g., 24.0) to `int` (24) makes the data cleaner and easier to read without losing significant precision for this context.

## 6. Feature Engineering
**Reasoning**:
-   **`FamilySize`**: The original dataset splits family relations into `SibSp` (siblings/spouses) and `Parch` (parents/children). Combining these gives a single metric for "family size," which is often a strong predictor of survival (e.g., large families might move slower).
-   **`AgeCategory`**: Raw age numbers can be noisy. Grouping them into categories (Child, Teen, Adult, Senior) allows for higher-level analysis, such as "Children had a higher survival rate."

## 7. Saving Data
**Reasoning**: We save to `tested_cleaned.csv` to preserve the clean state. Using `index=False` prevents pandas from adding an unnecessary index column to the CSV file.
