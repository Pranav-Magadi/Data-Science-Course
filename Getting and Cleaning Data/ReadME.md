The run_analysis.R script works *ONLY* after setting the working directory to a folder which contains the following files:

x_test.txt
x_train.txt
y_test.txt
y_train.txt
activity_labels.txt
subject_test.txt
subject_train.txt
features.txt

The script reads the data from these files into R and performs the following functions:

1) Labelling : It labels the columns in the x_test and x_train datasets using the names from features.
		It further assigns the activity ids given in y_test and y_train names from activity_labels.
		It also names the subject_test and subject_train column names.

2) Merging : First, the test dataset is created using cbind to bind subject_test, y_test, and x_test.
		The same is done to create a train dataset. The two are then merged using rbind.
		This merged dataset is called combdata.

3) Extracting : the mean and std data for each measurement is extracted using the grep function and 
		stored in a dataset called mean_std_data.

4) Creating tidydata: the mean_std_data data table is melted and casted into a data table called tidydata
			which has the averages of the mean and std measurements for each activity and subject.
			
5) Writing tidydata: the tidydata dataset is then written to a text file using write.table and row.names=FALSE