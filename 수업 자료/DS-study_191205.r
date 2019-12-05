getwd()

data <- read.csv("data/Part-III/one_sample.csv", header = TRUE)
head(data)

x <- data$time
summary(x)
mean(x, na.rm = T)

x1 <- na.omit(x)
summary(x1)

shapiro.test(x1)
hist(x1)
qqnorm(x1)


data2 <- read.csv("data/Part-III/two_sample.csv", header = TRUE)
head(data2)

x <- data2$method
y <- data2$survey

table(x)
table(y)
table(x,y, useNA ='ifany')

prop.test(c(110, 135), c(150,150))  #같은 기준 중심으로 비율값 비교 (150명중에 110명 만족 / 150명 중에 135명 만족)


result <- subset(data2, !is.na(score), c(method, score))
length(result$score)

a<- subset(result,method==1)
b <- subset(result, method==2)
a1 <- a$score
b1 <- b$score

var.test(a1, b1)
t.test(a1, b1)


data3 <- read.csv("data/Part-III/paired_sample.csv")
head(data3)
summary(data3)
result <- subset(data3, !is.na(after), c(before, after))
?subset
head(result)

x <- result$before
y <- result$after

length(x)
length(y)
mean(x)
mean(y)

var.test(x,y,pared=T)
t.test(x,y,pared=T)
t.test(x,y,pared=T, alter="less")
t.test(x,y,pared=T, alter="greater")
# ?var.test

data4 <- read.csv("data/Part-III/cleanDescriptive.csv", header = T)
head(data4)
summary(data4) 
x <- data4$level2 #부모의 학력수준
y <- data4$pass2 #자녀의 대학진학여부부

table(x,y)

# install.packages("ggplot2") #crossTable
# install.packages("gmodels")
library(gmodels)
library(ggplot2)

data("diamonds")
summary(diamonds)
head(diamonds)
CrossTable(diamonds$color,diamonds$cut)
CrossTable(diamonds$color,diamonds$cut, chisq=T)
