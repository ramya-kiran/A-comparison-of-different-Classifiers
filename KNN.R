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

# KNN 
pred = rep(-1, nrow(input_data))
# setting the k value
k = 100
for(test in 1:nrow(input_data)){
  distance = rep(0, nrow(test_data)) 
  # calculating the distance of a new data point with all the data points which exist
  for(train in 1: nrow(test_data)){
    distance[train] = sum(abs(input_data[test,] - test_data[train, ]))
  }
  # Sorting the distance and getting the k - Nearest Neighbours with respect 
  # to the new data point
  indexes = sort(distance, index.return=T) 
  indexes = indexes$ix[1:k]
  class_vals = class.test[indexes]
  class = rep(0,7)
  class[1] = sum(class_vals == 1)
  class[2] = sum(class_vals == 2)
  class[3] = sum(class_vals == 3)
  class[4] = sum(class_vals == 4)
  class[5] = sum(class_vals == 5)
  class[6] = sum(class_vals == 6)
  class[7] = sum(class_vals == 7)
  # taking the class with the maximum number of votes 
  pred[test] = which.max(class)
}

print("The error rate is as follows")
print(sum(pred != class.train)/nrow(input_data))
print("The confusion matrix is as follows")
print(table(pred, class.train))




