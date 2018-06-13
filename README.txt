This file contains the instructions on how to run the programs
All the programs were written in R.

NOTE: All the programs needs the path to segmentation.data and segmentation.test text files. 
These text files are also provided along with our submission.
R codes are commented.
Packages can be installed using the console of RStudio as 
install.packages("package name here")

SVM and Decision Trees are implemented together in SVM_DTrees.R file.
The path to the text files containig data has to be set as to provide access to the files before running this program.
Package for implementing Decision Trees:  rpart
Package for implementing SVM: e1071
Both the above mentioned packages have to be installed before running this script.
The program can be run in RStudio or via server ( Rscript filename ).
The program takes few seconds to a minute or two to complete and give the output.
The program prints the error rate and confusion matrix into the console.

Naive Bayes classification is implemented in Project_Naive_bayes.R file.
The path to the text files containig data has to be set as to provide access to the files before running this program.
The program can be run in RStudio or via server ( Rscript filename ).
The program takes few seconds to a minute or two to complete and give the output.
The program prints the error rate and confusion matrix into the console.

K Nearest Neighbour classification is implemented in KNN.R file.
The path to the text files containig data has to be set as to provide access to the files before running this program.
The program can be run in RStudio or via server ( Rscript filename ).
The program takes 17 minutes or more depending on the k value to complete and give the output.
The program prints the error rate and confusion matrix into the console.

Classification by bagging is implemented in Bagging.R file.
The path to the text files containig data has to be set as to provide access to the files before running this program.
The program can be run in RStudio or via server ( Rscript filename ).
The program takes 2 minutes or more depending on the M value(No of calssifiers) to complete and give the output.
The program prints the error rate and confusion matrix into the console.

Classification by adaboost is implemented in Ada_boost.R file.
The path to the text files containig data has to be set as to provide access to the files before running this program.
Package for implementing Adaboost: adabag which has dependencies(mlbench, rpart, caret, lattice, ggplot2) which as to be installed. 
The program can be run in RStudio or via server ( Rscript filename ).
The program takes 1 or 2 minutes or more and give the output.
The program prints the error rate and confusion matrix into the console.

 