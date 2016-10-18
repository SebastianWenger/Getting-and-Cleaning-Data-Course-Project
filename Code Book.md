Tidy Dataset Codebook
=============================

Data source
-----------
This dataset is derived from the "Human Activity Recognition Using Smartphones Data Set" which was originally made avaiable here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Variables
| variable name | format     | description |
|-----------|------------|-------------------------------|
| subject  | integer <br> ranging from 1 to 30 | The subject of the experiment |
| activity_label      | factor <br> 6 levels: <br> WALKING <br> WALKING_UPSTAIRS <br> WALKING_DOWNSTAIRS <br> SITTING <br>  STANDING <br> LAYING | performed activity name  |
| 66 features       | character | name of a varible used in the data set, varying as described below in "Feature Selection"  |



Feature Selection 
-----------------
All variables that include a mean or standard deviation of the following were pulled. Each of the features below were separated into "X', "Y", and "Z" components.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag


The mean and standard deviation of the following were pulled as well, however they do not contain a axis component.

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean
