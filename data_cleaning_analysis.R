library(ggplot2)
library(dplyr)
library(tidyr)

data <- read.csv("data/titanic_raw.csv",
                 stringsAsFactors = FALSE)

print(head(data))
print(str(data))
print(summary(data))
print(dim(data))

missing_values <- colSums(is.na(data))
print(missing_values)

missing_percentage <- colSums(is.na(data)) /
  nrow(data) * 100

print(missing_percentage)

write.csv(
  data.frame(
    Variable = names(missing_values),
    Missing_Count = as.numeric(missing_values),
    Missing_Percentage = as.numeric(missing_percentage)
  ),
  "output/missing_values.csv",
  row.names = FALSE
)

duplicate_count <- sum(duplicated(data))
print(duplicate_count)

data <- data[!duplicated(data), ]

data$Sex <- as.factor(data$Sex)
data$Pclass <- as.factor(data$Pclass)
data$Embarked <- as.factor(data$Embarked)

data$Age[is.na(data$Age)] <-
  median(data$Age, na.rm = TRUE)

data$Fare[is.na(data$Fare)] <-
  median(data$Fare, na.rm = TRUE)

mode_embarked <- names(
  sort(table(data$Embarked),
       decreasing = TRUE)
)[1]

data$Embarked[is.na(data$Embarked)] <-
  mode_embarked

print(colSums(is.na(data)))

png("output/missing_values.png",
    width = 800,
    height = 600)

barplot(
  colSums(is.na(data)),
  main = "Missing Values After Cleaning",
  xlab = "Variables",
  ylab = "Missing Values"
)

dev.off()

png("output/age_distribution.png",
    width = 800,
    height = 600)

hist(
  data$Age,
  main = "Age Distribution",
  xlab = "Age",
  ylab = "Frequency"
)

dev.off()

png("output/survival_by_gender.png",
    width = 800,
    height = 600)

ggplot(
  data,
  aes(x = Sex, fill = factor(Survived))
) +
  geom_bar() +
  labs(
    title = "Survival by Gender",
    x = "Gender",
    y = "Number of Passengers",
    fill = "Survived"
  )

dev.off()

png("output/survival_by_class.png",
    width = 800,
    height = 600)

ggplot(
  data,
  aes(x = Pclass, fill = factor(Survived))
) +
  geom_bar() +
  labs(
    title = "Survival by Passenger Class",
    x = "Passenger Class",
    y = "Number of Passengers",
    fill = "Survived"
  )

dev.off()

png("output/correlation_heatmap.png",
    width = 800,
    height = 600)

numeric_data <- data %>%
  select(
    Survived,
    Age,
    SibSp,
    Parch,
    Fare
  )

correlation_matrix <- cor(
  numeric_data,
  use = "complete.obs"
)

heatmap(
  correlation_matrix,
  main = "Correlation Heatmap"
)

dev.off()

Age_Q1 <- quantile(data$Age, 0.25)
Age_Q3 <- quantile(data$Age, 0.75)
Age_IQR <- Age_Q3 - Age_Q1

Age_lower <- Age_Q1 - 1.5 * Age_IQR
Age_upper <- Age_Q3 + 1.5 * Age_IQR

age_outliers <- data[
  data$Age < Age_lower |
  data$Age > Age_upper,
]

print(age_outliers)

Fare_Q1 <- quantile(data$Fare, 0.25)
Fare_Q3 <- quantile(data$Fare, 0.75)
Fare_IQR <- Fare_Q3 - Fare_Q1

Fare_lower <- Fare_Q1 - 1.5 * Fare_IQR
Fare_upper <- Fare_Q3 + 1.5 * Fare_IQR

fare_outliers <- data[
  data$Fare < Fare_lower |
  data$Fare > Fare_upper,
]

print(fare_outliers)

data$Age_normalized <-
  (data$Age - min(data$Age)) /
  (max(data$Age) - min(data$Age))

data$Fare_normalized <-
  (data$Fare - min(data$Fare)) /
  (max(data$Fare) - min(data$Fare))

data$Sex_encoded <-
  ifelse(data$Sex == "male", 0, 1)

data$Survived_encoded <-
  ifelse(data$Survived == 1, 1, 0)

summary_statistics <- data %>%
  summarise(
    Mean_Age = mean(Age),
    Median_Age = median(Age),
    SD_Age = sd(Age),
    Mean_Fare = mean(Fare),
    Median_Fare = median(Fare),
    SD_Fare = sd(Fare)
  )

print(summary_statistics)

write.csv(
  summary_statistics,
  "output/summary_statistics.csv",
  row.names = FALSE
)

write.csv(
  correlation_matrix,
  "output/correlation_matrix.csv"
)

write.csv(
  data,
  "data/titanic_cleaned.csv",
  row.names = FALSE
)

print("Data cleaning and analysis completed successfully.")
