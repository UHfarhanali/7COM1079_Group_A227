# # 7COM1079 – Team Research and Development Project  
## Group A227 – Analysis, Visualisation & Hypothesis Testing

## Project Overview
This project investigates the research question:

**Is there a significant difference in mean Annual Income between Male and Female customers?**

Using R, the team completed:
- Data loading and preparation
- Visualisation (Boxplot + Overlapping Histograms)
- Statistical Analysis (Welch’s Two-Sample t-test)
- Interpretation and conclusion

## Repository Contents
- **Shopping_CustomerData.csv** – main dataset used for analysis and visualisation  
- **Shopping_ShoppingIndexData.csv** – additional dataset provided  
- **Analysis.R** – runs Welch’s t-test, extracts p-value, prints conclusion  
- **Visualization.R** – generates boxplot and overlapping histogram  
- **7COM1079_Final report_template.docx** – final written report  
- **commit_Abusalah_Saghir24156957.txt** – Abu-Salah commit explanation (evidence of work)

## Team Members & Contributions
**Abu-Salah Saghir**
- Uploaded datasets to GitHub
- Created `Analysis.R` (Welch t-test + p-value + automated conclusion)
- Wrote commit evidence file for analysis work

**Farhan Ali**
- Created `Visualization.R` (boxplot + overlapping histogram)
- Produced visuals used in the report

**Muhammad Faizan**
- Wrote the final report and organised documentation structure

## Summary of Findings
- **P-value ≈ 0.359**
- **Conclusion:** Do not reject the Null Hypothesis  
- **Interpretation:** No significant difference in mean Annual Income between Male and Female customers in this dataset.

## How to Run (RStudio)
1. Download/clone the repository.
2. Open RStudio and set working directory to the folder containing the files.
3. Run:
```r
source("Analysis.R")
source("Visualization.R")
