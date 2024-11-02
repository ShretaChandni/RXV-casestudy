## Case Study Description

This is a comprehensive analysis of the efficacy and efficiency of the provided respiratory x virus (RXV) vaccine data. Here are key steps that outline the entire process, from initial data preparation to detailed analyses of efficacy and efficiency. The analysis approach is structured around key aspects commonly evaluated in clinical trials, such as:

1. Inclusion/Exclusion criteria (IE)
2. Randomization and treatment assignment (RANDOMIZATION)
3. Drug Administration (DA)
4. Adverse events (AE) 
5. Pharmacokinetics/pharmacodynamics (PK/PD)

## Steps Followed in This Project

1. **Data Preparation and Cleaning using SQL**
   - Check Data Quality: Inspect each dataset
   - Standardize Data Formats: Ensure consistent formatting
   - Merge Datasets: Integrate data from relevant domains

2. **Exploratory Data Analysis (EDA) using Tableau and Power BI**
   - Descriptive Statistics: Summarize demographics, baseline characteristics, and dosing information.
   - Adverse Event Overview: Explore the incidence of AEs across treatment groups.
   - Plot Distributions: Use histograms or density plots to view distribution trends in baseline characteristics, AE counts, and PK/PD values.

3. **Efficacy Analysis**
      This section evaluates the vaccine's effectiveness in preventing RXV infection.
   - Calculate Relative Risk (RR): Compare the risk of RXV infection in the vaccinated group versus the placebo group.
   - Formula used: `RR = Risk in Vaccine Group / Risk in Placebo Group`
   - Confidence Intervals and Statistical Tests: Calculate confidence intervals (usually 95%) for RR and perform hypothesis tests.

4. **Safety Analysis (Adverse Events)**
    Assess safety by analyzing adverse events' frequency, type, and severity (AEs).
   - **Incidence Rate of AEs**:
      - Calculate AE rates for both vaccinated and placebo groups.
      - Group AEs by severity and type (e.g., mild, moderate, severe).
   - **Comparative Analysis**:
      - Use Chi-square or Fisher’s Exact Test to compare AE proportions between groups.
      - Identify and summarize any significant safety concerns or AE patterns.
   - **Visualizations**:
      - Stacked bar charts or box plots to depict AE frequencies and severity levels across groups.

5. **Report and Interpretation**
   - Summarize Key Findings: Detail the main findings for each analysis section, emphasizing significant trends, outcomes, and safety concerns.
   - Visual Summary: Present key plots (e.g., Kaplan-Meier curves, AE frequency plots, PK/PD curves).
   - Interpret Results: Provide interpretations in lay terms for stakeholders, highlighting efficacy, safety, and operational efficiency insights.
   - Recommendation: Based on results, recommend next steps, such as dose adjustments, study extensions, or modifications to address identified issues.

---

## Step 1: Clean Data and Standardize Formats

### Reading Files in R

```r
install.packages("readr")
library(readr)

getwd()
data <- read.csv("AE.csv", header = TRUE)
data <- read.csv("PK_PD.csv", header = TRUE)
data <- read.csv("DA.csv", header = TRUE)
data <- read.csv("Rando.csv", header = TRUE)
data <- read.csv("IE.csv", header = TRUE)
data <- read.csv("DM.csv", header = TRUE)

### Removing Duplicates, Standardizing Date and Time Formats, Standardizing Categorical Variables, Merging Datasets

### SQL Code Snippets
### Removing Duplicates

DELETE FROM AE
WHERE SUBJID IS NULL;

DELETE FROM IE
WHERE SUBJID IS NULL;

### Standardize Date and Time Formats

UPDATE AE
SET AE_START_DATE = CAST(AE_START_DATE AS DATE);
UPDATE AE
SET AE_END_DATE = CAST(AE_END_DATE AS DATE);

UPDATE DA
SET DA_DATE = CAST(DA_DATE AS DATE);

UPDATE AE
SET AE_SEVERITY = UPPER(AE_SEVERITY);

UPDATE rando
SET `GROUP` = LOWER(`GROUP`);

### Merge Datasets

SELECT 
    AE.SUBJID, rando.SUBJID, AE_START_DATE, AE_SEVERITY,
    IE_REASON, rando.GROUP
FROM 
    AE
INNER JOIN 
    IE ON AE.SUBJID = IE.SUBJID 
INNER JOIN 
    rando ON AE.SUBJID = rando.SUBJID;

SELECT 
    SUBJID, COUNT(*) AS num_AE
FROM 
    AE
GROUP BY 
    SUBJID;

SELECT 
    rando.SUBJID, RANDO.GROUP,
    AE.AE_START_DATE, AE.AE_SEVERITY,
    IE.IE_REASON,
    DA.DA_DOSE, DA.DA_DATE,
    pk_pd.PK_CONCENTRATION, pk_pd.PK_SAMPLE_TIME
FROM 
    RANDO
LEFT JOIN 
    AE ON RANDO.SUBJID = AE.SUBJID
LEFT JOIN 
    IE ON RANDO.SUBJID = IE.SUBJID
LEFT JOIN 
    DA ON RANDO.SUBJID = DA.SUBJID
LEFT JOIN 
    pk_pd ON RANDO.SUBJID = pk_pd.SUBJID;

Note: This final query will yield a dataset that is cleaned, standardized, and merged across all domains (AE, IE, RANDOMIZATION, DA, PK/PD), ready for analysis. Adjust filtering criteria, and join types, as per data and analysis requirements.

Step 2: Exploratory Data Analysis (EDA) using Tableau and Power BI

![Image](https://github.com/user-attachments/assets/59d643ba-380b-47e3-b0b0-4d8ca09a4d19)

https://public.tableau.com/authoring/AEcomparisionbetweenPlaceboandTreatmentgrp/Dashboard1/Phase%20III%20RXV%20population%20Dose%20AE%20dashbord#1

## Step 3: Efficacy Analysis
      * Calculate Relative Risk (RR): Compare the risk of RXV infection in the vaccinated group versus the placebo group.
      * Used formula: RR = Risk in Vaccine Group/Risk in Placebo Group
    
install.packages("readr")
library(readr)

data <- read.csv("Rando.csv", header = TRUE)
  
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

![Image](https://github.com/user-attachments/assets/c96d128f-beff-48e6-a348-76700505b890)

**Interpretation
If RR < 1: The vaccinated group has a lower risk of RXV infection compared to the placebo group, suggesting the vaccine's effectiveness.
If RR > 1: The vaccinated group has a higher risk, which may imply that the vaccine is not effective.
If RR ≈ 1: There is no significant difference in risk between the two groups.

### Confidence Intervals and Statistical Tests: Calculate confidence intervals (usually 95%) for RR and perform hypothesis tests.

# Confidence Interval for Risk Ratio
rr_ci <- riskratio(table)
cat("Risk Ratio (Treatment / Placebo):", risk_ratio, "\n")
cat("95% Confidence Interval for Risk Ratio:", rr_ci$measure[1,], "\n")

# Chi-squared test for hypothesis testing
chi_square_test <- chisq.test(table)
cat("Chi-squared Test Result:\n")
print(chi_square_test)

![Image](https://github.com/user-attachments/assets/f3ae32b8-a536-4a50-b5db-e2542b7b8855)

