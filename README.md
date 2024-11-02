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

## Step 1: Clean Data and Standardize Formats using SQL

1. Removing Duplicates: Ensuring each table is free of duplicates, especially for unique identifiers like subject_id
2. Standardize Date and Time Formats: Ensuring date columns are in the same format, like YYYY-MM-DD. In SQL, use functions like CAST or CONVERT for this.
3. Merge Datasets: To create a comprehensive dataset, use SQL joins

Note: The final datasets are available in the repository (SUBJ_NumAE.csv, SUBJ_AE_Rando_IE_DA_PK_PD.csv, Sub_AE_IE_GRP.csv), these files are ready for analysis. 

## Step 2: Exploratory Data Analysis (EDA) using Tableau and Power BI

![dashbord](https://github.com/user-attachments/assets/7b7550c6-abce-4a31-8e66-dee0339d81ff)

https://public.tableau.com/authoring/AEcomparisionbetweenPlaceboandTreatmentgrp/Dashboard1/Phase%20III%20RXV%20population%20Dose%20AE%20dashbord#1

## Step 3: Efficacy Analysis using R
      * Calculate Relative Risk (RR): Compare the risk of RXV infection in the vaccinated group versus the placebo group.
      * Used formula: RR = Risk in Vaccine Group/Risk in Placebo Group

![Image](https://github.com/user-attachments/assets/c96d128f-beff-48e6-a348-76700505b890)

**Interpretation
**If RR < 1:** The vaccinated group has a lower risk of RXV infection compared to the placebo group, suggesting the vaccine's effectiveness.
**If RR > 1:** The vaccinated group has a higher risk, which may imply that the vaccine is not effective.
**If RR ≈ 1: **There is no significant difference in risk between the two groups.

### Confidence Intervals and Statistical Tests: Calculate confidence intervals (usually 95%) for RR and perform hypothesis tests.

![Image](https://github.com/user-attachments/assets/f3ae32b8-a536-4a50-b5db-e2542b7b8855)

**Interpretation
**Risk Ratio:** If the RR is less than 1, it suggests the treatment reduces the risk of infection. An RR greater than 1 suggests increased risk.
**Confidence Interval:** If the CI does not include 1, it suggests a statistically significant difference between groups.
**Chi-squared Test:** If the p-value is less than 0.05, it indicates a significant difference in infection rates between the two groups.
