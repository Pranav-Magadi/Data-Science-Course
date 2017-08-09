The run_analysis.R script works *ONLY* when the working directory is set to a folder containing all of the following files:
x_test.txt
x_train.txt
y_test.txt
y_train.txt
activity_labels.txt
subject_test.txt
subject_train.txt
features.txt

The script first reads in the data from the above files and stores them in objects with the same name as the file.

The second step is to assign the proper labels to the columns of the tables of the datasets read in.
This is accomplished by using the names function to directly assign names to the columns.

The next step uses the ~cbind~ to create a data table *test* from subject_test, y_test, and x_test.
The same method is used to create a data table *train*.
*test* and *train* are then merged using ~rbind~ into a data table called *combdata*.

the mean std measurements are extracted and stored in *mean_std_data* with the help of the ~grep~ function.

the final *tidydata* dataset is created by using ~melt~ on *mean_std_data* to create *melted* and then using ~dcast~
 to form *tidydata* which contains the average of each variable for each activity and each subject.

the ~write.table~ function is used with ~row.names=FALSE~ to write *tidydata* to a file called tidydata.txt.