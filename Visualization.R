# ==============================================================================
# 
# Purpose: Generate graphical representations for the report's Visualisation section.
# ==============================================================================

# 1. LOAD DATA
# ------------------------------------------------------------------------------
# Load the dataset (Ensure 'Shopping_CustomerData.csv' is in your working directory)
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

# Calculate bin counts first to determine the correct Y-axis limit
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

# Note: In your Appendix A, you will merge the contents of this file and Analysis.R
# to ensure all code is present and runs sequentially.