# Phase III, randomized, unblind, placebo-controlled, multicenter study to evaluate the efficacy of a Respiratory X Virus vaccine in infants and toddlers

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
   - **Survival Analysis**:
      - Kaplan-Meier curves are used to estimate the survival function from lifetime data.
   - **Visualizations**:
      - Donut chart to depict AE frequencies and severity levels across groups using powerBI.   

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

   ### Calculate Relative Risk (RR): Compare the risk of RXV infection in the vaccinated group versus the placebo group.
 
![RR calculation](https://github.com/user-attachments/assets/e219c2d8-bd1e-4c17-87ef-1f73d09cfe79)

![Risk in Group](https://github.com/user-attachments/assets/bde5dc45-ed02-4e3d-a783-a6e6de5c819f)

![Image](https://github.com/user-attachments/assets/c96d128f-beff-48e6-a348-76700505b890)

**Interpretation of RR value**

**If RR < 1:** The vaccinated group has a lower risk of RXV infection compared to the placebo group, suggesting the vaccine's effectiveness.

**If RR > 1:** The vaccinated group has a higher risk, which may imply that the vaccine is not effective.

**If RR ≈ 1:** There is no significant difference in risk between the two groups.

   ### Confidence Intervals and Statistical Tests: Calculate confidence intervals (usually 95%) for RR and perform hypothesis tests.

![Image](https://github.com/user-attachments/assets/f3ae32b8-a536-4a50-b5db-e2542b7b8855)

**Interpretation of Confidence Interval**

**Risk Ratio:** If the RR is less than 1, it suggests the treatment reduces the risk of infection. An RR greater than 1 suggests increased risk.

**Confidence Interval:** If the CI does not include 1, it suggests a statistically significant difference between groups.

**Chi-squared Test:** If the p-value is less than 0.05, it indicates a significant difference in infection rates between the two groups.

## Step 4: Safety Analysis (Adverse Events)

**Survival Analysis**

### Kaplan-Meier Survival Curves

![Kaplan-MeierSurvivalCurves](https://github.com/user-attachments/assets/db382ed8-d748-4743-afdc-0b6b39480971)

### AE frequencies and severity levels
   Donut chart to depict AE frequencies and severity levels across groups using powerBI.

 ![Total AE VS AE relation and severity](https://github.com/user-attachments/assets/b4462788-1709-4bf1-ba9c-ed337d7515a2)

## Pharmacokinetics/Pharmacodynamics (PK/PD) Assessment:##
   Graphical representations of the drug concentration over time, highlighting the relationship between the pharmacokinetics using R and PK response average for total subjects using powerBI
   
   ![PKPD](https://github.com/user-attachments/assets/5523b0fc-a341-430d-ba59-dd23713bb31a)
   ![image](https://github.com/user-attachments/assets/63df06a5-8d17-4679-a105-22bda2c85170)

## Step 5: Report and Interpretation

**Summarize Key Findings**
In this section, I present a detailed summary of the main findings from our analyses. Each key analysis is highlighted, focusing on significant trends, outcomes, and safety concerns:

**Efficacy Analysis:** The results indicate a marked reduction in RXV infections among the vaccinated group compared to the placebo group, suggesting the vaccine's effectiveness. The Risk Ratio calculated shows a lower incidence of infections in the vaccinated cohort, with a 95% Confidence Interval not encompassing 1, reinforcing the statistical significance of these findings.

**Safety Analysis:** The frequency of adverse events (AEs) was systematically assessed. While the incidence of AEs was higher in the vaccinated group compared to placebo, the majority were mild and transient. However, some serious AEs warrant further investigation to ensure participant safety and confidence in the vaccine.

**Pharmacokinetics/Pharmacodynamics (PK/PD) Assessment:** The PK/PD curves illustrated a favorable pharmacokinetic profile, indicating effective drug absorption and distribution with a strong correlation to therapeutic effects.

### Visual Summary To facilitate understanding, we present visual representations of the key data:

**Kaplan-Meier Curves:** These curves illustrate the survival function over time, allowing us to visualize the time to event (infection) differences between the vaccinated and placebo groups.

**Adverse Event Donet chart:**  These plots display the frequency and severity of reported adverse events across both groups, providing a clear visual representation of safety data.

**PK/PD Curves in Tablue Dashbord:** Graphical representations of the drug concentration over time, highlighting the relationship between the pharmacokinetics and the observed pharmacodynamic effects.

### Interpret Results

**Efficacy:**  The data shows that the vaccine is effective in reducing the incidence of RXV infections, suggesting that vaccination is a viable strategy for disease prevention.

**Safety:**  While the vaccine is generally well-tolerated, the occurrence of some serious adverse events indicates the need for ongoing monitoring and possible adjustments to the vaccination protocol.

**Operational Efficiency:**  The efficient data collection and analysis methodologies employed in this study provide a robust framework for future research, ensuring that potential challenges can be addressed swiftly.

### Recommendation
Based on the results, we propose the following next steps:

**Dose Adjustments:** Given the safety profile, we recommend evaluating the potential for dose modifications to optimize efficacy while minimizing adverse events.

**Study Extensions:** Consider extending the study duration to gather long-term efficacy and safety data, ensuring a comprehensive understanding of the vaccine's impact over time.

**Protocol Modifications:** Address identified safety concerns by implementing enhanced monitoring protocols for adverse events and revising inclusion criteria to mitigate risks for vulnerable populations.

By following these recommendations, we can further strengthen the study's findings, improve participant safety, and enhance the overall effectiveness of the vaccination strategy.

