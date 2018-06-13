library(rpart)
library(adabag)

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

class.test1 = strtoi(class.test)

# The final test data is test_data
# The test clases are present in class.test
test_data = as.data.frame(lapply(test_data, as.numeric))
test_data = test_data[,-1]

# Boosting
# Considering test as train and performing boosting
test_data = cbind(class.test,test_data)
test_data$class.test = factor(test_data$class.test)
data.adaboost = boosting(class.test ~., data=test_data, boos=TRUE, mfinal=1)
pred = predict(data.adaboost, input_data)
final_pred_class = strtoi(pred$class)
print("The error rate is as follows")
print(sum(final_pred_class != class.train)/nrow(input_data))
print("the confusion matrix is as follows")
print(table(final_pred_class, class.train))

train_data = cbind(class.train,input_data)
train_data$class.train = factor(train_data$class.train)
data.adaboost = boosting(class.train ~., data=train_data, boos=TRUE, mfinal=1)
pred = predict(data.adaboost, test_data)
final_pred_class = strtoi(pred$class)
print("The error rate is as follows")
print(sum(final_pred_class != class.test)/nrow(test_data))
print("the confusion matrix is as follows")
print(table(final_pred_class, class.test))
