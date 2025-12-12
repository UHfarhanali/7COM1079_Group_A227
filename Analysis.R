# ==============================================================================
# 7COM1079 Group Project - Analysis & Visualization
# Research Question: Is there a significant difference in mean Annual Income 
#                    between Male and Female customers?
# ==============================================================================

# 1. LOAD DATA
# ------------------------------------------------------------------------------
# Reading the dataset from the CSV file so we can access all columns such as 
# CustomerGender and AnnualIncome for analysis and visualization.
shopping_data <- read.csv("Shopping_CustomerData.csv")

# 2. VISUALIZATION
# ------------------------------------------------------------------------------
# Setting the plotting area to 1 row and 2 columns so both graphs appear side by side.
par(mfrow = c(1, 2)) 

# --- Plot 1: Boxplot (Main Plot) ---
# Creating a boxplot to compare the distribution of Annual Income between genders.
# This helps show differences in medians, spread, and any outliers.
boxplot(AnnualIncome ~ CustomerGender, 
        data = shopping_data,
        main = "Annual Income by Gender",
        xlab = "Gender",
        ylab = "Annual Income (INR)",
        col = c("pink", "lightblue"),
        border = "black")

# --- Plot 2: Overlapping Histogram (Gender-wise Distribution) ---
# Creating separate income lists for males and females for histogram plotting.
income_male <- shopping_data$AnnualIncome[shopping_data$CustomerGender == "Male"]
income_female <- shopping_data$AnnualIncome[shopping_data$CustomerGender == "Female"]

# Getting histogram counts without plotting them to calculate correct Y-axis limit.
# This ensures both histograms fit properly on the same plot.
h_male <- hist(income_male, plot = FALSE)
h_female <- hist(income_female, plot = FALSE)
y_limit <- max(h_male$counts, h_female$counts)
x_limit <- range(shopping_data$AnnualIncome)

# Plotting male income histogram in semi-transparent blue.
hist(income_male, 
     col = rgb(0.2, 0.2, 0.8, 0.5), # Blue with 50% transparency
     xlim = x_limit, 
     ylim = c(0, y_limit),
     main = "Income Distribution by Gender",
     xlab = "Annual Income (INR)")

# Overlaying female income histogram in semi-transparent red on the previous plot.
hist(income_female, 
     col = rgb(0.8, 0.2, 0.2, 0.5), # Red with 50% transparency
     add = TRUE) # This overlays instead of replacing the previous plot.

# Adding a legend to identify the male and female distributions.
legend("topright", 
       legend = c("Male", "Female"), 
       fill = c(rgb(0.2, 0.2, 0.8, 0.5), rgb(0.8, 0.2, 0.2, 0.5)), 
       bty = "n")

# Resetting plotting layout back to default (1 plot on screen).
par(mfrow = c(1, 1))

# 3. STATISTICAL ANALYSIS
# ------------------------------------------------------------------------------
# Performing Welch's t-test to compare mean Annual Income between genders.
# Welch's test is used because it does NOT assume equal variances.
t_test_result <- t.test(AnnualIncome ~ CustomerGender, data = shopping_data, var.equal = FALSE)

# 4. OUTPUT RESULTS
# ------------------------------------------------------------------------------
# Printing the full t-test result including t-value, df, p-value, and confidence interval.
print("--- T-Test Results ---")
print(t_test_result)

# Extracting the p-value from the test result for reporting.
p_value <- t_test_result$p.value
cat("\nP-value:", format(p_value, scientific = FALSE), "\n")

# Based on the p-value, printing whether we reject or do not reject the null hypothesis.
if(p_value < 0.05) {
  cat("Conclusion: Reject the Null Hypothesis (Significant difference found).\n")
} else {
  cat("Conclusion: Do not reject the Null Hypothesis (No significant difference).\n")
}
