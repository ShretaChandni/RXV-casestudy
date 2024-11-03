install.packages("survival")
install.packages("survminer")

library(survival)
library(survminer)

df <- data.frame(
  time = c(5, 10, 12, 15, 20, 25, 30, 35, 40, 45),
  status = c(1, 1, 0, 1, 0, 1, 1, 0, 1, 0),
  group = c("Treatment", "Treatment", "Treatment", "Placebo", "Placebo", "Treatment", "Placebo", "Treatment", "Placebo", "Placebo")
)

df$time <- as.numeric(df$time)
df$status <- as.numeric(df$status)
df$group <- as.factor(df$group)

library(survival)
km_fit <- survfit(Surv(time, status) ~ group, data = df)


# Sample data
df <- data.frame(
  time = c(5, 10, 12, 15, 20, 25, 30, 35, 40, 45),
  status = c(1, 1, 0, 1, 0, 1, 1, 0, 1, 0),
  group = c("Treatment", "Treatment", "Treatment", "Placebo", "Placebo", "Treatment", "Placebo", "Treatment", "Placebo", "Placebo")
)

# Convert to appropriate types
df$time <- as.numeric(df$time)
df$status <- as.numeric(df$status)
df$group <- as.factor(df$group)

# Fit Kaplan-Meier model
km_fit <- survfit(Surv(time, status) ~ group, data = df)
summary(km_fit)

# Plot Kaplan-Meier curve
ggsurvplot(
  km_fit, 
  data = df, 
  risk.table = TRUE, 
  pval = TRUE, 
  conf.int = TRUE,
  xlab = "Time (days)", 
  ylab = "Survival Probability",
  title = "Kaplan-Meier Survival Curves",
  legend.title = "Group",
  legend.labs = c("Treatment", "Placebo")
)
