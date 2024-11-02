install.packages("ggplot2", dependencies = TRUE)
library(ggplot2)



install.packages("readr")
library(readr)

getwd()
data <- read.csv("AE.csv", header = TRUE)
data <- read.csv("PK_PD.csv", header = TRUE)
data <- read.csv("DA.csv", header = TRUE)
data <- read.csv("Rando.csv", header = TRUE)
data <- read.csv("IE.csv", header = TRUE)
data <- read.csv("DM.csv", header = TRUE)

  
  
# Sample data
df <- data.frame(
  group = c(rep("Treatment", 100), rep("placebo", 100)),
  infection = c(sample(c(1, 0), 100, replace = TRUE, prob = c(0.1, 0.9)),
                sample(c(1, 0), 100, replace = TRUE, prob = c(0.2, 0.8)))
)

# Create a contingency table
table <- table(df$group, df$infection)

# Check the structure of the table to ensure correct indexing
print(table)

# Calculate the number of infections and total individuals in each group
treatment_infections <- table["Treatment", "1"]
placebo_infections <- table["placebo", "1"]

treatment_total <- sum(table["Treatment", ])
placebo_total <- sum(table["placebo", ])

# Calculate risks
risk_treatment <- treatment_infections / treatment_total
risk_placebo <- placebo_infections / placebo_total

# Calculate Risk Ratio
risk_ratio <- risk_treatment / risk_placebo

# Print the results
cat("Risk in Treatment Group:", risk_treatment, "\n")
cat("Risk in Placebo Group:", risk_placebo, "\n")
cat("Risk Ratio (Treatment / Placebo):", risk_ratio, "\n")


# Load necessary package
install.packages("epitools") 
library(epitools)

# Sample data
set.seed(123)  # For reproducibility
df <- data.frame(
  group = c(rep("Treatment", 100), rep("Placebo", 100)),
  infection = c(sample(c(1, 0), 100, replace = TRUE, prob = c(0.1, 0.9)),
                sample(c(1, 0), 100, replace = TRUE, prob = c(0.2, 0.8)))
)

# Create a contingency table
table <- table(df$group, df$infection)

# Calculate infections and totals
treatment_infections <- table["Treatment", "1"]
placebo_infections <- table["Placebo", "1"]

treatment_total <- sum(table["Treatment", ])
placebo_total <- sum(table["Placebo", ])

# Calculate risks
risk_treatment <- treatment_infections / treatment_total
risk_placebo <- placebo_infections / placebo_total

# Calculate Risk Ratio
risk_ratio <- risk_treatment / risk_placebo

# Confidence Interval for Risk Ratio
rr_ci <- riskratio(table)
cat("Risk Ratio (Treatment / Placebo):", risk_ratio, "\n")
cat("95% Confidence Interval for Risk Ratio:", rr_ci$measure[1,], "\n")

# Chi-squared test for hypothesis testing
chi_square_test <- chisq.test(table)
cat("Chi-squared Test Result:\n")
print(chi_square_test)
