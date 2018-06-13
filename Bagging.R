# library(rpart)
# library("e1071")

# Reading training data
input_data = read.csv("/Users/ramyarao/Documents/Data Mining/Project/segmentation.data", header = F)
class.train = as.matrix(input_data$V1)

# pre-processing
index = which(class.train == "BRICKFACE")
class.train[index] = 1

index = which(class.train == "CEMENT")
class.train[index] = 2

index = which(class.train == "FOLIAGE")
class.train[index] = 3

index = which(class.train == "GRASS")
class.train[index] = 4

index = which(class.train == "PATH")
class.train[index] = 5

index = which(class.train == "SKY")
class.train[index] = 6

index = which(class.train == "WINDOW")
class.train[index] = 7

class.train = strtoi(class.train)

# The final train data is input_data
# The train clases are present in class.train
input_data = as.data.frame(lapply(input_data, as.numeric))
input_data = input_data[,-1]

# reading test data

test_data = read.csv("/Users/ramyarao/Documents/Data Mining/Project/segmentation.test", header = F)
class.test = as.matrix(test_data$V1)

# pre-processing
index = which(class.test == "BRICKFACE")
class.test[index] = 1

index = which(class.test == "CEMENT")
class.test[index] = 2

index = which(class.test == "FOLIAGE")
class.test[index] = 3

index = which(class.test == "GRASS")
class.test[index] = 4

index = which(class.test == "PATH")
class.test[index] = 5

index = which(class.test == "SKY")
class.test[index] = 6

index = which(class.test == "WINDOW")
class.test[index] = 7

class.test = strtoi(class.test)

# The final test data is test_data
# The test clases are present in class.test
test_data = as.data.frame(lapply(test_data, as.numeric))
test_data = test_data[,-1]

# Bagging
epsilon = 0.01
M = 1001;	  	# number of indepenent classifiers  (odd to avoid tie)
N = length(class.test);       # trials

pred = rep(0, nrow(test_data))
C = rep(0,M)
error1 = 0.001666667
val = 1/7
pred_bagging = rep(-1, N)
error = 0
for (n in 1:N) {
  trueclass = class.test[n]
  # assigning probability so that the true class is determined is preferred over other classes
  if (trueclass == 1) { p = c(val+epsilon,rep(val-error1,6)) }
  else if (trueclass == 2) { p = c(0.1411905, 0.1528571, 0.1411905, 0.1411905, 0.1411905, 0.1411905, 0.1411905)}
  else if (trueclass == 3) {  p = c(0.1411905, 0.1411905, 0.1528571, 0.1411905, 0.1411905, 0.1411905, 0.1411905) }
  else if (trueclass == 4)  { p = c(0.1411905, 0.1411905, 0.1411905, 0.1528571, 0.1411905, 0.1411905, 0.1411905) }
  else if (trueclass == 5)  { p = c(0.1411905, 0.1411905, 0.1411905, 0.1411905, 0.1528571, 0.1411905, 0.1411905) }
  else if (trueclass == 6)  { p = c(0.1411905, 0.1411905, 0.1411905, 0.1411905, 0.1411905, 0.1528571, 0.1411905) }
  else  { p = c(0.1411905, 0.1411905, 0.1411905, 0.1411905, 0.1411905, 0.1411905, 0.1528571) }
  C = sample(c(1,2,3,4,5,6,7),M,replace=T,prob=p);
  for(i in 1:M){
    if(sum(C == i) > M/7)
      est = i
  }
  # prediction result stored
  pred[n] = est
  if (est != trueclass) error = error+1
}
# printing result
print("error rate:")
print(error/N)
print("The confusion matris is as follows")
print(table(pred, class.test))
