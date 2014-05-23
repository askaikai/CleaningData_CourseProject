CodeBook for: CleaningData_CourseProject
========================================

### STUDY DESIGN
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' (in the original dataset) for more details. 

### FEATURE SELECTION FROM THE ORIGINAL DATA SET
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

### CREATING THE TIDY DATASET
In the process of creating the tidy data set, the following steps were taken;
* Data from the train and test sessions were merged, and subject IDs and activity labels were added as new columns.
* Only the variables that were related to the mean and standard deviation (std) were extracted. These variables were selected based on the variable names: any variables with "mean" or "std" were selected. 
* Activity label were coded so they would make sense in English, such that:
    1 -> "WALKING""
    2 -> "WALKING_UPSTAIRS"
    3 -> "WALKING_DOWNSTAIRS"
    4 -> "SITTING"
    5 -> "STANDING"
    6 -> "LAYING"
* Variable names were cleaned and organized with the following standard:
    all in lower-case (e.g. Body -> body)
    all punctuations (e.g. "()") were replaced with "."
    use a full word instead of abbreviations (e.g. 'Mag' -> 'magnitude', except for 'fft')
    words were separated with "." (e.g. "BodyAcc" -> "body.acceleration", following this: https://google-styleguide.googlecode.com/svn/trunk/Rguide.xml#identifiers).    
* "meanSd_allData.txt" was written out this point.
* Finally, mean of each variable was calculated for each activity and for each subject. The output of this final step is "meanSd_bySubByActivity.txt".
    
Thus, these are the main measurements (x,y,z as separate variables. mean/std/angle were derived from each measurement)    
time.body.acceleration.x/y/z
time.gravity.acceleration.x/y/z
time.body.acceleration.jerk.x/y/z
time.body.gyroscope.x/y/z
time.body.gyroscope.jerk.x/y/z
time.body.acceleration.magnitude
time.gravity.acceleration.magnitude
time.body.acceleration.jerk.magnitude
time.body.gyroscope.magnitude
time.body.gyroscope.jerk.magnitude
fft.body.acceleration.x/y/z
fft.body.acceleration.jerk.x/y/z
fft.body.gyroscope.x/y/z
fft.body.acceleration.magnitude
fft.body.acceleration.jerk.magnitude
fft.body.gyroscope.magnitude
fft.body.gyroscope.jerk.magnitude

Additional vectors that contain "mean"
gravity.mean
time.body.acceleration.mean
time.body.acceleration.jerk.mean
time.body.gyroscope.mean
time.body.gyroscope.jerk.mean

Finally, variables "sub.id" denotes unique subject numbers, and "activity" is type of activity subjects were performing while mesurements were obtained.

### LIST OF VARIABLES
 [1] "sub.id"                                             
 [2] "activity"                                           
 [3] "time.body.acceleration.mean.x"                      
 [4] "time.body.acceleration.mean.y"                      
 [5] "time.body.acceleration.mean.z"                      
 [6] "time.body.acceleration.std.x"                       
 [7] "time.body.acceleration.std.y"                       
 [8] "time.body.acceleration.std.z"                       
 [9] "time.gravity.acceleration.mean.x"                   
[10] "time.gravity.acceleration.mean.y"                   
[11] "time.gravity.acceleration.mean.z"                   
[12] "time.gravity.acceleration.std.x"                    
[13] "time.gravity.acceleration.std.y"                    
[14] "time.gravity.acceleration.std.z"                    
[15] "time.body.acceleration.jerk.mean.x"                 
[16] "time.body.acceleration.jerk.mean.y"                 
[17] "time.body.acceleration.jerk.mean.z"                 
[18] "time.body.acceleration.jerk.std.x"                  
[19] "time.body.acceleration.jerk.std.y"                  
[20] "time.body.acceleration.jerk.std.z"                  
[21] "time.body.gyroscope.mean.x"                         
[22] "time.body.gyroscope.mean.y"                         
[23] "time.body.gyroscope.mean.z"                         
[24] "time.body.gyroscope.std.x"                          
[25] "time.body.gyroscope.std.y"                          
[26] "time.body.gyroscope.std.z"                          
[27] "time.body.gyroscope.jerk.mean.x"                    
[28] "time.body.gyroscope.jerk.mean.y"                    
[29] "time.body.gyroscope.jerk.mean.z"                    
[30] "time.body.gyroscope.jerk.std.x"                     
[31] "time.body.gyroscope.jerk.std.y"                     
[32] "time.body.gyroscope.jerk.std.z"                     
[33] "time.body.acceleration.magnitude.mean"              
[34] "time.body.acceleration.magnitude.std"               
[35] "time.gravity.acceleration.magnitude.mean"           
[36] "time.gravity.acceleration.magnitude.std"            
[37] "time.body.acceleration.jerk.magnitude.mean"         
[38] "time.body.acceleration.jerk.magnitude.std"          
[39] "time.body.gyroscope.magnitude.mean"                 
[40] "time.body.gyroscope.magnitude.std"                  
[41] "time.body.gyroscope.jerk.magnitude.mean"            
[42] "time.body.gyroscope.jerk.magnitude.std"             
[43] "fft.body.acceleration.mean.x"                       
[44] "fft.body.acceleration.mean.y"                       
[45] "fft.body.acceleration.mean.z"                       
[46] "fft.body.acceleration.std.x"                        
[47] "fft.body.acceleration.std.y"                        
[48] "fft.body.acceleration.std.z"                        
[49] "fft.body.acceleration.mean.frequency.x"             
[50] "fft.body.acceleration.mean.frequency.y"             
[51] "fft.body.acceleration.mean.frequency.z"             
[52] "fft.body.acceleration.jerk.mean.x"                  
[53] "fft.body.acceleration.jerk.mean.y"                  
[54] "fft.body.acceleration.jerk.mean.z"                  
[55] "fft.body.acceleration.jerk.std.x"                   
[56] "fft.body.acceleration.jerk.std.y"                   
[57] "fft.body.acceleration.jerk.std.z"                   
[58] "fft.body.acceleration.jerk.mean.frequency.x"        
[59] "fft.body.acceleration.jerk.mean.frequency.y"        
[60] "fft.body.acceleration.jerk.mean.frequency.z"        
[61] "fft.body.gyroscope.mean.x"                          
[62] "fft.body.gyroscope.mean.y"                          
[63] "fft.body.gyroscope.mean.z"                          
[64] "fft.body.gyroscope.std.x"                           
[65] "fft.body.gyroscope.std.y"                           
[66] "fft.body.gyroscope.std.z"                           
[67] "fft.body.gyroscope.mean.frequency.x"                
[68] "fft.body.gyroscope.mean.frequency.y"                
[69] "fft.body.gyroscope.mean.frequency.z"                
[70] "fft.body.acceleration.magnitude.mean"               
[71] "fft.body.acceleration.magnitude.std"                
[72] "fft.body.acceleration.magnitude.mean.frequency"     
[73] "fft.body.acceleration.jerk.magnitude.mean"          
[74] "fft.body.acceleration.jerk.magnitude.std"           
[75] "fft.body.acceleration.jerk.magnitude.mean.frequency"
[76] "fft.body.gyroscope.magnitude.mean"                  
[77] "fft.body.gyroscope.magnitude.std"                   
[78] "fft.body.gyroscope.magnitude.mean.frequency"        
[79] "fft.body.gyroscope.jerk.magnitude.mean"             
[80] "fft.body.gyroscope.jerk.magnitude.std"              
[81] "fft.body.gyroscope.jerk.magnitude.mean.frequency"   
[82] "angle.time.body.acceleration.mean.gravity"          
[83] "angle.time.body.acceleration.jerk.mean.gravity.mean"
[84] "angle.time.body.gyroscope.mean.gravity.mean"        
[85] "angle.time.body.gyroscope.jerk.mean.gravity.mean"   
[86] "angle.x.gravity.mean"                               
[87] "angle.y.gravity.mean"                               
[88] "angle.z.gravity.mean"
