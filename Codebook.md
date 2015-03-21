The features included in this database come from the accelerometer and gyroscope 3-axial raw signals time-domain accelerometer-XYZ and time-domain gyroscope-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (time-domain body acceleration-XYZ and time-domain gravity acceleration-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (time-domain body acceleration jerk-XYZ and time-domain body gyroscope jerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (time-domain body acceleration magnitude, time-domain gravity acceleration magnitude, time-domain body acceleration jerk magnitude, time-domain body gyroscope magnitude, time-domain body gyroscope jerk magnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequency-domain body acceleration-XYZ, frequency-domain body acceleration jerk-XYZ, frequency-domain body gyroscope-XYZ, frequency-domain body acceleration jerk magnitude, frequency-domain body gyroscope magnitude, frequency-domain body gyroscope jerk magnitude. 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

###time-domain variables (units: seconds)

*  time-domain body acceleration-XYZ  
*  time-domain gravity acceleration-XYZ  
*  time-domain body acceleration jerk-XYZ  
*  time-domain body gryoscope-XYZ  
*  time-domain body gryoscope jerk-XYZ  
*  time-domain body acceleration magnitude  
*  time-domain gravity acceleration magnitude  
*  time-domain body acceleration jerk magnitude  
*  time-domain body gryoscope magnitude  
*  time-domain body gryoscope jerk magnitude  

###frequency-domain variables (units: hertz)

*  frequency-domain body acceleration-XYZ  
*  frequency-domain body acceleration jerk-XYZ  
*  frequency-domain body gryoscope-XYZ  
*  frequency-domain body acceleration magnitude  
*  frequency-domain body acceleration jerk magnitude  
*  frequency-domain body gryoscope magnitude  
*  frequency-domain body gryoscope jerk magnitude  

The reported set of variables that were estimated from these signals are: 

mean: Mean value  
standard deviation: Standard deviation