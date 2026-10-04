# week1-data-cleaning-r
Week 1 internship project on data cleaning, preprocessing, and preliminary analysis using R and the Titanic dataset.
# Week 1 - Data Cleaning and Preliminary Analysis with R

## Project Title

Data Cleaning and Preliminary Analysis with R

## Project Overview

This project is part of Week 1 of the internship program. The main focus of this project is data cleaning, preprocessing, and preliminary exploratory data analysis using R.

The Titanic dataset is used for this analysis because it contains both numerical and categorical variables along with missing values. This makes it suitable for demonstrating common data-cleaning and preprocessing techniques.

## Objectives

The main objectives of this project are:

* Import a publicly available dataset into R.
* Understand the structure of the dataset.
* Identify and handle missing values.
* Detect duplicate records.
* Detect outliers.
* Perform data transformation.
* Normalize numerical variables.
* Encode categorical variables.
* Calculate descriptive statistics.
* Perform correlation analysis.
* Create meaningful visualizations.
* Identify initial patterns and insights.
* Document the complete data-cleaning process.

## Dataset

### Dataset Name

Titanic Dataset

### Dataset Description

The Titanic dataset contains information about passengers who travelled on the RMS Titanic.

Important variables include:

| Variable    | Description                            | Data Type   |
| ----------- | -------------------------------------- | ----------- |
| PassengerId | Unique passenger identification number | Numerical   |
| Survived    | Survival status                        | Binary      |
| Pclass      | Passenger class                        | Categorical |
| Name        | Passenger name                         | Categorical |
| Sex         | Passenger gender                       | Categorical |
| Age         | Passenger age                          | Numerical   |
| SibSp       | Number of siblings/spouses aboard      | Numerical   |
| Parch       | Number of parents/children aboard      | Numerical   |
| Fare        | Passenger fare                         | Numerical   |
| Embarked    | Port of embarkation                    | Categorical |

## Tools and Technologies

* R
* RStudio
* CSV
* ggplot2
* dplyr
* tidyr

## Project Structure

```text
week1-data-cleaning-r/
│
├── README.md
├── data/
│   ├── titanic_raw.csv
│   └── titanic_cleaned.csv
├── R/
│   └── data_cleaning_analysis.R
├── output/
│   ├── summary_statistics.csv
│   ├── correlation_matrix.csv
│   ├── missing_values.png
│   ├── age_distribution.png
│   ├── survival_by_gender.png
│   ├── survival_by_class.png
│   └── correlation_heatmap.png
├── report/
│   └── Week1_Data_Cleaning_Report.docx
└── screenshots/
    ├── dataset_import.png
    ├── missing_values.png
    ├── cleaning_process.png
    └── R_output.png
```

## Data Cleaning Process

### 1. Dataset Import

The dataset was imported into R using the `read.csv()` function.

```r
data <- read.csv("data/titanic_raw.csv",
                 stringsAsFactors = FALSE)
```

### 2. Dataset Inspection

The structure and summary of the dataset were examined using:

```r
head(data)
str(data)
summary(data)
dim(data)
```

### 3. Missing Values

Missing values were identified using:

```r
colSums(is.na(data))
```

Numerical missing values such as Age were handled using the median. Categorical missing values such as Embarked were handled using the most frequent category.

### 4. Duplicate Records

Duplicate records were checked using:

```r
sum(duplicated(data))
```

Duplicate records were removed where required.

### 5. Outlier Detection

Boxplots and the Interquartile Range method were used to identify possible outliers in numerical variables such as Age and Fare.

### 6. Normalization

Min-Max normalization was applied to selected numerical variables.

### 7. Categorical Encoding

Categorical variables were converted into numerical representations where required for analysis.

For example, the Sex variable was encoded as:

```text
Male = 0
Female = 1
```

### 8. Exploratory Data Analysis

Exploratory analysis was performed using:

* Histograms
* Bar charts
* Boxplots
* Summary statistics
* Correlation analysis

## Outputs

The project generates:

* Summary statistics
* Correlation matrix
* Missing-value analysis
* Age distribution
* Survival by gender
* Survival by passenger class
* Correlation analysis

## Initial Findings

The preliminary analysis provides the following observations:

* The dataset contains both numerical and categorical variables.
* Some variables contain missing observations.
* Age contains missing values that require preprocessing.
* Fare contains a wide range of values.
* Passenger class shows a relationship with survival.
* Gender shows a noticeable relationship with survival.
* Data preprocessing improves the quality of the dataset for further analysis.
* Correlation analysis helps identify relationships among numerical variables.

## How to Run the Project

1. Install R and RStudio.
2. Clone or download this repository.
3. Place the raw dataset inside the `data` folder.
4. Open RStudio.
5. Open `R/data_cleaning_analysis.R`.
6. Run the script.
7. Check the generated files in the `output` folder.
8. Refer to the report in the `report` folder.

## Conclusion

This project demonstrates a complete basic data-cleaning and preliminary-analysis workflow using R.

The project covers missing-value handling, duplicate detection, outlier detection, normalization, categorical encoding, descriptive statistics, correlation analysis, and visualization.

The cleaned dataset can be used for further statistical analysis and machine-learning applications.

## Author

Internship Week 1 Project

**Project:** Data Cleaning and Preliminary Analysis with R

**Language:** R

**IDE:** RStudio
