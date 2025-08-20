# CodeBook - Getting and Cleaning Data Project

This CodeBook is part of the course assignment for "Getting and Cleaning Data" (Coursera, Johns Hopkins University)..  
It describes the variables, the data, and the steps taken to clean the dataset.

## Source of the data
The original data comes from the *Human Activity Recognition Using Smartphones* dataset:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  

The data was collected from 30 volunteers who wore a Samsung Galaxy S smartphone while performing six different activities.  
The phone’s accelerometer and gyroscope recorded motion signals, which were then processed to create many measurement variables.

## Final dataset: `tidy_data.txt`
The tidy dataset contains the average of selected measurements for each subject and each activity.

- **Rows**: 180 (30 subjects × 6 activities)  
- **Columns**: 68  
  - 1 column for `subject`  
  - 1 column for `activity`  
  - 66 columns with averaged measurements  

## Variables

- **subject**: ID of the participant (values from 1 to 30).  
- **activity**: the activity performed, with values:
  - WALKING  
  - WALKING_UPSTAIRS  
  - WALKING_DOWNSTAIRS  
  - SITTING  
  - STANDING  
  - LAYING  

- **Measurements**: averages of sensor signals (accelerometer and gyroscope).  
  Examples of variable names:
  - `TimeBodyAccelerometerMeanX`  
  - `TimeBodyAccelerometerMeanY`  
  - `TimeBodyAccelerometerStandardDeviationZ`  
  - `TimeGravityAccelerometerMeanX`  
  - `FrequencyBodyGyroscopeMeanX`  
  - `FrequencyBodyGyroscopeStandardDeviationY`  

## Data cleaning and transformations steps
The following transformations were applied in `run_analysis.R`:

1. Merged training and test datasets into a single dataset.  
2. Extracted only the variables containing **mean()** and **std()**.  
3. Replaced activity codes with descriptive activity names.  
4. Cleaned up variable names to make them more descriptive:
   - `t` → `Time`  
   - `f` → `Frequency`  
   - `Acc` → `Accelerometer`  
   - `Gyro` → `Gyroscope`  
   - `Mag` → `Magnitude`  
   - `BodyBody` → `Body`  
   - `-mean()` → `Mean`  
   - `-std()` → `StandardDeviation`  
   - `Freq()` → `Frequency`  
5. Created a tidy dataset with the **average of each variable for each subject and activity**.  
6. Ordered the dataset by subject and activity.

## Units

- **Accelerometer**: approximately in *g* (gravitational units), normalized.  
- **Gyroscope**: radians/second, normalized.  
- **Magnitudes and FFT-derived features**: dimensionless (unitless).  

## Source of the data
The original dataset is **Human Activity Recognition Using Smartphones**, available here:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  

It contains measurements collected from the accelerometer and gyroscope of a Samsung Galaxy S smartphone.  
Data was gathered from **30 subjects**, each performing **6 activities**.

---

## Final dataset: `tidy_data.txt`

- **Rows**: 180 (30 subjects × 6 activities)  
- **Columns**: 68  
  - 1 column for `subject`  
  - 1 column for `activity`  
  - 66 columns with the **average** of selected sensor signals  



