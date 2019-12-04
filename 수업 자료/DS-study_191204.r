
getwd()
data <- read.csv("data\\Part-III\\one_sample.csv", header = TRUE)
head(data)

x <- data$survey
summary(x)
table(x)

data2 <- data
data2$survey <- as.factor(data2$survey)
summary(data2)
summary(data)

install.packages("prettyR")
library(prettyR)

freq(x)

#양측검정 H0:만족비율이 80%이다. H1: 만족비율이 80%가 아니다.
binom.test(c(136,14), p=0.8)

#단측검정(크다 작다) H0: 만족비율이 80%이다. H1: 만족비율이 80% 이상(이하)이다.

?binom.test
binom.test(c(136,14), p=0.8, alternative = "greater", conf.level = 0.95) #대립가설(136이 80%보다 크다)이 맞다. 귀무가설이 틀리다.
binom.test(c(14,136), p=0.2, alternative = "less", conf.level = 0.95) #대립가설(14가 20%보다 작다)이 맞다. 귀무가설이 틀리다.
binom.test(c(14,136), p=0.2, alternative = "greater", conf.level = 0.95) #대립가설(14가 20%보다 크다)이 맞지 않다. 귀무가설이 맞다.
