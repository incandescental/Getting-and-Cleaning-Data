# Code Book for tidying and summary of 'Human Activity Recognition Using Smartphones Dataset'

# Study Design

The data are provided in two sections 'test' and 'train', along with additional files describing the methodology and variables. There are also additional 'inertial signals' data which have not been used for this exercise.

For this exercise, data frames have been constructed in R using the variables provided in the 'features.txt' file for both the 'train' and 'test' datasets. The subject undertaking the exercise, and the activity they were undertaking, were then added as columns one and two using the subject_train.txt/ subject_test.txt and y_train.txt/ y_test.txt respectively. The variable values were populated from the X_test.txt/X_train.txt files.

The train and test data frames were then concatenated to make one larger data frame, consisting of 10,299 rows of 563 variables. The assignment required only the variables relating to the mean and standard deviation for each measurement. These were identified using R's 'grep' function, searching for 'mean' and 'std' within the full list of variables, identifying 81 out of the original set of 563. 

The 'Activity' variable until this point had been identified only numerically. In order to make this more readable, R's 'merge' function was used to create a new column in the data frame, using the 'activity_labels.txt' file provided with the dataset to assign the following activities to the numerical identifiers provided:

1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

The numerical identifiers were then removed in favour of the more descriptive character identifiers.

A number of substitutions were then made in the naming of the variables to make them more readily readable using the 'gsub()' function. 

The data frame was then summarised by activity and subject using the 'summarise_each' function from the 'dplyr' package and applying the 'mean' function to the values of each variable. 

The final data frame contains 180 mean values of 81 variables and is exported to a text file entitled "tidy_data_set.txt"  

A 'wide' format was maintained for this summary in line with the tidy data principles of one variable per column and one observation per row. However, the end user can easily transpose the table to their requirements using a variety of R functions.

# Code Book

The 81 variables are listed below:

 [1] "Activity"                                      
 [2] "Subject"                                       
 [3] "Body Acceleration (Time)-mean()-X"             
 [4] "Body Acceleration (Time)-mean()-Y"             
 [5] "Body Acceleration (Time)-mean()-Z"             
 [6] "Gravity Acceleration (Time)-mean()-X"          
 [7] "Gravity Acceleration (Time)-mean()-Y"          
 [8] "Gravity Acceleration (Time)-mean()-Z"          
 [9] "Body Acceleration (Time)-Jerk-mean()-X"        
[10] "Body Acceleration (Time)-Jerk-mean()-Y"        
[11] "Body Acceleration (Time)-Jerk-mean()-Z"        
[12] "Body Gyro (Time)-mean()-X"                     
[13] "Body Gyro (Time)-mean()-Y"                     
[14] "Body Gyro (Time)-mean()-Z"                     
[15] "Body Gyro (Time)-Jerk-mean()-X"                
[16] "Body Gyro (Time)-Jerk-mean()-Y"                
[17] "Body Gyro (Time)-Jerk-mean()-Z"                
[18] "Body Acceleration (Time)-Magnitude-mean()"     
[19] "Gravity Acceleration (Time)-Magnitude-mean()"  
[20] "Body Acceleration (Time)-Jerk Magnitude-mean()"
[21] "Body Gyro (Time)-Magnitude-mean()"             
[22] "Body Gyro (Time)-Jerk Magnitude-mean()"        
[23] "Body Acceleration (Freq)-mean()-X"             
[24] "Body Acceleration (Freq)-mean()-Y"             
[25] "Body Acceleration (Freq)-mean()-Z"             
[26] "Body Acceleration (Freq)-meanFreq()-X"         
[27] "Body Acceleration (Freq)-meanFreq()-Y"         
[28] "Body Acceleration (Freq)-meanFreq()-Z"         
[29] "Body Acceleration (Freq)-Jerk-mean()-X"        
[30] "Body Acceleration (Freq)-Jerk-mean()-Y"        
[31] "Body Acceleration (Freq)-Jerk-mean()-Z"        
[32] "Body Acceleration (Freq)-Jerk-meanFreq()-X"    
[33] "Body Acceleration (Freq)-Jerk-meanFreq()-Y"    
[34] "Body Acceleration (Freq)-Jerk-meanFreq()-Z"    
[35] "Body Gyro (Freq)-mean()-X"                     
[36] "Body Gyro (Freq)-mean()-Y"                     
[37] "Body Gyro (Freq)-mean()-Z"                     
[38] "Body Gyro (Freq)-meanFreq()-X"                 
[39] "Body Gyro (Freq)-meanFreq()-Y"                 
[40] "Body Gyro (Freq)-meanFreq()-Z"                 
[41] "Body Acceleration (Freq)-Magnitude-mean()"     
[42] "Body Acceleration (Freq)-Magnitude-meanFreq()" 
[43] "Body Acceleration Jerk Magnitude-mean()"       
[44] "Body Acceleration Jerk Magnitude-meanFreq()"   
[45] "Body Gyro Magnitude-mean()"                    
[46] "Body Gyro Magnitude-meanFreq()"                
[47] "Body Gyro Jerk Magnitude-mean()"               
[48] "Body Gyro Jerk Magnitude-meanFreq()"           
[49] "Body Acceleration (Time)-std()-X"              
[50] "Body Acceleration (Time)-std()-Y"              
[51] "Body Acceleration (Time)-std()-Z"              
[52] "Gravity Acceleration (Time)-std()-X"           
[53] "Gravity Acceleration (Time)-std()-Y"           
[54] "Gravity Acceleration (Time)-std()-Z"           
[55] "Body Acceleration (Time)-Jerk-std()-X"         
[56] "Body Acceleration (Time)-Jerk-std()-Y"         
[57] "Body Acceleration (Time)-Jerk-std()-Z"         
[58] "Body Gyro (Time)-std()-X"                      
[59] "Body Gyro (Time)-std()-Y"                      
[60] "Body Gyro (Time)-std()-Z"                      
[61] "Body Gyro (Time)-Jerk-std()-X"                 
[62] "Body Gyro (Time)-Jerk-std()-Y"                 
[63] "Body Gyro (Time)-Jerk-std()-Z"                 
[64] "Body Acceleration (Time)-Magnitude-std()"      
[65] "Gravity Acceleration (Time)-Magnitude-std()"   
[66] "Body Acceleration (Time)-Jerk Magnitude-std()" 
[67] "Body Gyro (Time)-Magnitude-std()"              
[68] "Body Gyro (Time)-Jerk Magnitude-std()"         
[69] "Body Acceleration (Freq)-std()-X"              
[70] "Body Acceleration (Freq)-std()-Y"              
[71] "Body Acceleration (Freq)-std()-Z"              
[72] "Body Acceleration (Freq)-Jerk-std()-X"         
[73] "Body Acceleration (Freq)-Jerk-std()-Y"         
[74] "Body Acceleration (Freq)-Jerk-std()-Z"         
[75] "Body Gyro (Freq)-std()-X"                      
[76] "Body Gyro (Freq)-std()-Y"                      
[77] "Body Gyro (Freq)-std()-Z"                      
[78] "Body Acceleration (Freq)-Magnitude-std()"      
[79] "Body Acceleration Jerk Magnitude-std()"        
[80] "Body Gyro Magnitude-std()"                     
[81] "Body Gyro Jerk Magnitude-std()"

The full description of the methodology for this study is available in the features_info.txt file provided with the dataset. 

The remaining variables are only those pertaining to the mean and standard deviations of the signals gathered from the accelerometer and gyroscope. The following abbreviations have been retained in the variable names for the sake of brevity:

mean(): Mean value
std(): Standard deviation

# Body Acceleration and Gravity Acceleration

These time domain data come from the accelerometer 3-axial raw signals. These were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. The acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).

# Body Gyro

These time domain data come from the gyroscope 3-axial raw signals. The gyroscope units are rad/seg.

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

# Jerk

The body linear acceleration and angular velocity were derived in time to obtain Jerk signals. Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm. 

# Freq

A Fast Fourier Transform (FFT) was applied to some of these signals producing frequency domain signals. 







