Commit — Created Visualization.R (Full Visualisation Script)

Commit Message: Added visualisation script (boxplot and overlapping histogram)

1. Loaded the dataset into R 
shopping_data <- read.csv("Shopping_CustomerData.csv")
Makes the dataset available for producing graphics.

2. Separated income values by gender
income_female <- shopping_data$AnnualIncome[shopping_data$CustomerGender == "Female"]
income_male   <- shopping_data$AnnualIncome[shopping_data$CustomerGender == "Male"]
Creates two vectors:
  •	income_female
  •	income_male
These are required for both the boxplot and the overlapping histogram.


3. Produced the Gender-wise Boxplot (left-side plot)
boxplot(AnnualIncome ~ CustomerGender,
        data = shopping_data,
        col = c("pink", "lightblue"),
        main = "Annual Income by Gender",
        ylab = "Annual Income (INR)",
        xlab = "Gender")

This code:
•	Creates the boxplot comparing male vs female income
•	Adds colours (pink for female, blue for male)
•	Adds titles and axis labels
•	Supports understanding of income spread and outliers
(The left plot in your image is produced by this.)


4. Calculated histogram bin counts to align y-axis
h_male   <- hist(income_male, plot = FALSE)
h_female <- hist(income_female, plot = FALSE)
y_limit  <- max(h_male$counts, h_female$counts)


5. Plotted the Male Histogram (semi-transparent blue)
hist(income_male,
     col = rgb(0.2, 0.2, 0.8, 0.5),
     xlim = x_limit,
     ylim = c(0, y_limit),
     main = "Income Distribution by Gender",
     xlab = "Annual Income (INR)",
     ylab = "Frequency")


6. Overlaid the Female Histogram (semi-transparent red)
hist(income_female,
     col = rgb(0.8, 0.2, 0.2, 0.5),
     add = TRUE)
•	Creates the overlapping histogram
•	Allows comparison of how income is distributed for each gender
This produces the right-side plot.


7. Added a legend
legend("topright",
       legend = c("Male", "Female"),
       fill   = c(rgb(0.2, 0.2, 0.8, 0.5),
                  rgb(0.8, 0.2, 0.2, 0.5)))
Ensures viewers know which colour represents which gender.
