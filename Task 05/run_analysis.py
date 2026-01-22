import pandas as pd
import numpy as np

# 1. Load Data
df = pd.read_csv('tested.csv')

# 2. Inspect Data
print(df.head())
print(df.info())
print(df.isnull().sum())

# 3. Clean Data
# Drop 'Cabin' (too many missing values), fill Age (median) and Fare (mean)
df.drop(columns=['Cabin'], inplace=True, errors='ignore')
df['Age'] = df['Age'].fillna(df['Age'].median())
df['Fare'] = df['Fare'].fillna(df['Fare'].mean())

# 4. Remove Duplicates
rows_before = len(df)
df.drop_duplicates(inplace=True)
rows_after = len(df)
print(f"Rows before: {rows_before}, Rows after: {rows_after}. Duplicates removed: {rows_before - rows_after}")

# 5. Convert Datatypes
df['Age'] = df['Age'].astype(int)

# 6. Feature Engineering
# Create FamilySize and AgeCategory
df['FamilySize'] = df['SibSp'] + df['Parch'] + 1
df['AgeCategory'] = pd.cut(df['Age'], bins=[0, 12, 19, 60, 200], labels=['Child', 'Teen', 'Adult', 'Senior'])

# 7. Save Data
df.to_csv('tested_cleaned.csv', index=False)
print("Data cleaned and saved to 'tested_cleaned.csv'")
