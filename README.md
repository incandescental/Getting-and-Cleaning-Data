# Read me file for tidying and summary of 'Human Activity Recognition Using Smartphones Dataset'

Data retrieved from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip on the 24/12/2015

Data Authors: Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.

#  Related files

run_analysis.R
CodeBook.md

# Requirements

R programming language: https://www.r-project.org
'dplyr' library: https://cran.r-project.org/web/packages/dplyr/index.html

This code was written and tested in R version 3.2.3 (2015-12-10) -- "Wooden Christmas-Tree" running in a terminal on Linux Mint 17.2

# Running the code

After downloading the dataset from the link above, open an R session and move the 'UCI HAR Dataset' directory to the location of your current working directory. Then run the code, ensuring that the dplyr library is installed on your system first. 

The run_analysis.R script produces a summarised data frame and exports it to a file named 'tidy_data_set.txt' in your working directory.

A full explanation of the variables and construction of the data frame can be found in the accompanying CodeBook.md file.
