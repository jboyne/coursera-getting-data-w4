## Class Project for week4 for  "Getting and Cleaning Data"

The project for [Getting and Cleaning Data](https://www.coursera.org/course/getdata) was related to getting data  related to ["Human Activity Recognition Using Smartphones" data set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), perform an analysis on the data set, and output a tidy data set.

**Here are the steps that must be performed before running the R script:**

1. I Downloaded the zip file from [this URL](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
2. ALL of the following files were placed in the working directory
	* `subject_test.txt`
	* `X_train.txt`
	* `X_test.txt`
	* `y_train.txt`
	* `y_test.txt`
	* `features.txt`
	* `subject_train.txt`

**Once those steps are complete, you can run the R script ([run_analysis.R](run_analysis.R)).** Note that this script will requires the [reshape2 package](http://cran.r-project.org/web/packages/reshape2/index.html), which can be located in CRAN.

**The output of the R script is a tidy data set, [tidy.csv](tidy.csv).**

You can read more about the data and the analysis in the [code book](CodeBook.md).
