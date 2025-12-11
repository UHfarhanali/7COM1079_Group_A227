# ==============================================================================
# 7COM1079 Group Project - Analysis & Visualization
# Research Question: Is there a significant difference in mean Annual Income 
#                    between Male and Female customers?
# ==============================================================================

# 1. LOAD DATA
# ------------------------------------------------------------------------------
# Load the dataset from the CSV file
shopping_data <- read.csv("Shopping_CustomerData.csv")

# 2. VISUALIZATION
# ------------------------------------------------------------------------------
# Set up a 1x2 plotting area to show graphs side-by-side
par(mfrow = c(1, 2)) 

# --- Plot 1: Boxplot (Main Plot) ---
# Visualizes the spread and median of Annual Income for each Gender
boxplot(AnnualIncome ~ CustomerGender, 
        data = shopping_data,
        main = "Annual Income by Gender",
        xlab = "Gender",
        ylab = "Annual Income (INR)",
        col = c("pink", "lightblue"),
        border = "black")

# --- Plot 2: Overlapping Histogram (Gender-wise Distribution) ---
# Create subsets for Male and Female income
income_male <- shopping_data$AnnualIncome[shopping_data$CustomerGender == "Male"]
income_female <- shopping_data$AnnualIncome[shopping_data$CustomerGender == "Female"]

# Calculate bin counts first to determine the correct Y-axis limit (so no bars are cut off)
h_male <- hist(income_male, plot = FALSE)
h_female <- hist(income_female, plot = FALSE)
y_limit <- max(h_male$counts, h_female$counts)
x_limit <- range(shopping_data$AnnualIncome)

# Plot Male Histogram (Blue, semi-transparent)
hist(income_male, 
     col = rgb(0.2, 0.2, 0.8, 0.5), # RGB with 0.5 Alpha (Transparency)
     xlim = x_limit, 
     ylim = c(0, y_limit),
     main = "Income Distribution by Gender",
     xlab = "Annual Income (INR)")

# Plot Female Histogram (Red, semi-transparent) on top
hist(income_female, 
     col = rgb(0.8, 0.2, 0.2, 0.5), # RGB with 0.5 Alpha
     add = TRUE) # add=TRUE overlays this plot on the previous one

# Add a Legend to distinguish the groups
legend("topright", 
       legend = c("Male", "Female"), 
       fill = c(rgb(0.2, 0.2, 0.8, 0.5), rgb(0.8, 0.2, 0.2, 0.5)), 
       bty = "n")

# Reset plotting layout
par(mfrow = c(1, 1))

# 3. STATISTICAL ANALYSIS
# ------------------------------------------------------------------------------
# Perform an Independent Samples T-test (Welch's t-test)
t_test_result <- t.test(AnnualIncome ~ CustomerGender, data = shopping_data, var.equal = FALSE)

# 4. OUTPUT RESULTS
# ------------------------------------------------------------------------------
print("--- T-Test Results ---")
print(t_test_result)

# Print P-value and Conclusion
p_value <- t_test_result$p.value
cat("\nP-value:", format(p_value, scientific = FALSE), "\n")

if(p_value < 0.05) {
  cat("Conclusion: Reject the Null Hypothesis (Significant difference found).\n")
} else {
  cat("Conclusion: Do not reject the Null Hypothesis (No significant difference).\n")
}