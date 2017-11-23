
# Load data set
dataset_emp <- read.csv(file = '/Users/nisum/Nisum/Data_Science/Datasets/WA_Fn-UseC_-HR-Employee-Attrition-training-R-new.csv',
                        head = TRUE, sep = ",")
#dataset_test_emp <- read.csv(file = '/Users/nisum/Nisum/Data_Science/Datasets/WA_Fn-UseC_-HR-Employee-Attrition-testing-R.csv',
#                             head = TRUE, sep = ",")

# Encoding categorical data

dataset_emp$BusinessTravel = factor(dataset_emp$BusinessTravel,
                                    levels  = c('Travel_Rarely','Travel_Frequently','Non-Travel'),
                                    labels = c(1, 2, 3))

dataset_emp$Department = factor(dataset_emp$Department,
                                levels = c('Research & Development','Human Resources', 'Sales'),
                                labels = c(1, 2, 3))

dataset_emp$EducationField = factor(dataset_emp$EducationField,
                                    levels = c('Life Sciences','Medical', 'Marketing','Technical Degree',
                                               'Human Resources', 'Other'),
                                    labels = c(1, 2, 3, 4, 5, 6))

dataset_emp$JobRole = factor(dataset_emp$JobRole,
                             levels = c('Manufacturing Director','Manager', 'Sales Executive',
                                        'Healthcare Representative', 'Research Director',
                                        'Research Scientist', 'Laboratory Technician',
                                        'Human Resources', 'Sales Representative'),
                             labels = c(1, 2, 3, 4, 5, 6, 7, 8, 9))

dataset_emp$Gender = factor(dataset_emp$Gender,
                            levels = c('Male','Female'),
                            labels = c(1, 0))

dataset_emp$MaritalStatus = factor(dataset_emp$MaritalStatus,
                                   levels = c('Single','Married', 'Divorced'),
                                   labels = c(1, 2, 3))



dataset_emp$OverTime = factor(dataset_emp$OverTime,
                              levels = c('Yes','No'),
                              labels = c(1, 0))


dataset_emp$Attrition = factor(dataset_emp$Attrition,
                               levels = c('No','Yes'),
                               labels = c(0, 1))


# split data into training and test

library(caTools)
set.seed(123)
split  <- sample.split(dataset_emp, SplitRatio = 0.75)
training_emp  <- subset(dataset_emp, split == "TRUE")
testing_emp <- subset(dataset_emp, split == "FALSE")


# Feature scaling 
#training_emp = scale(training_emp)
#training_emp[, 8:31] = scale(training_emp[, 8:31])
#testing_emp[, 8:31] = scale(testing_emp[, 8:31])

# prepare model using logistic regression

model <-  glm(formula =  Attrition ~ . , data =  training_emp, family = binomial)
res <- predict(model, newdata =  testing_emp[-32],  type = "response")

res

attrition_pred = ifelse(res > 0.5, 1, 0)  

# Making Confustion Matrix

cm = table(testing_emp[, 32], attrition_pred)


# Visulizing the Training set results

#install.packages('ElemStatLearn')

#plot(testing_emp$MonthlyIncome, testing_emp$EnvironmentSatisfaction, pch = 16, xlab = "MonthlyIncome", ylab = "EnvironmentSatisfaction")

#curve(predict(model,data.frame(testing_emp$MonthlyIncome=x),type="resp"),add=TRUE)



