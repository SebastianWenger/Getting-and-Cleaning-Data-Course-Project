# Getting-and-Cleaning-Data-Course-Project

1. Pulls training and test data and binds x testing+training together by row, along with y testing+training by row.
2. Binds each of these with the subject and activity data.
3. Subsets the subject, activity, and variables by whether the rows corresponding name has "mean" or "std" in it.
4. Factorizes the activity column into 6 levels, with corresponding labels from a text file.
5. Modifies "name" column by elaborating on certain acronyms.
6. Merges all of the subsetted data into a single data set.
7. Creates second data set with the mean of every variable according to each subject and activity.
