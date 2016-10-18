# Getting-and-Cleaning-Data-Course-Project

###Step 1:
-------
* Pulls all data from the "UCI HAR Dataset" file.

* Creates "id" column based on initial row number for easier referencing.

* Merges all of the training data together into `mergetrain` along with all of the test data together into `mergetest`.

* Binds the training data `mergetrain` and test data `mergetest` together by row.

###Step 2:
-------
* Selects features which follow the naming criteria specified in `specific_features` where "mean" and "std" are selected for.

###Step 3:
-------

* Activities, previously denoted numerically, are assigned names at 6 levels which correspond to `activities`.

###Step4:
-------

* Unnecessary characters in 'specific_features' such as "-" or "()" are removed from feature names.

* Feature names are added to their corresponding column.

###Step 5:
-------

* Means are found for each variable by subject and activity using 'aggregate'.

* Tidy dataset outputted as "meandata.txt".
