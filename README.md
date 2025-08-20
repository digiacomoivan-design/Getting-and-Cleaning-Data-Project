# Getting-and-Cleaning-Data-Project

## Github link
https://github.com/digiacomoivan-design/Getting-and-Cleaning-Data-Project

## About this project
This project is part of the "Getting and Cleaning Data" course (Coursera, Johns Hopkins University).  
It is one of the course assignments designed to practice downloading, cleaning, and preparing data.

The raw data comes from experiments with 30 volunteers wearing a Samsung Galaxy S smartphone while doing different activities (like walking, sitting, standing, etc.). The smartphone’s accelerometer and gyroscope recorded sensor signals.  
The objective of this project is to combine the data, extract only the useful measurements, clean the variable names, and create a tidy dataset with the calculated averages.

## Files in this repository
- `run_analysis.R`: the R script that does all the steps (download, clean, and prepare the data).
- `tidy_data.txt`: the final tidy dataset produced by the script.
- `CodeBook.md`: explains the data, the variables, and what cleaning steps were done.

## How to run the script
1. Make sure you have R or RStudio installed.
2. Place the file `run_analysis.R` in your working directory (the folder where you want the data and results to be saved).
3. Open R or RStudio, set the working directory to that folder and run the "run_analysis.R" script.
4. When it finishes, you will find a file called tidy_data.txt in your folder. This is the final cleaned dataset.

## What the script does (step by step)

1) Downloads and unzips the original dataset (if you don’t already have it).
2) Reads the information about variables and activities.
3) Loads the training and test datasets, then combines them into one.
4) Keeps only the measurements related to mean and standard deviation.
5) Replaces activity numbers with descriptive names (like WALKING, SITTING).
6) Cleans the variable names so they are easier to read.
7) Creates a new dataset that shows the average of each variable for each subject and each activity.
8) Orders the data by subject and activity.
9) Saves this final dataset as tidy_data.txt.
