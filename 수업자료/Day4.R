##이용주
##191024

getwd()
setwd("D:/Rstudy/수업자료")

sum <- 0
for(i in 5:15){
  if(i%%10==0)
    break;
  sum<-sum+i
  print(paste(i,":",sum))
}


sum <- 0
for(i in 5:15){
  if(i%%10==0)
    next;
  sum<-sum+i
  print(paste(i,":",sum))
}

sumNumber <- 0
while(sumNumber <= 20){
  i <- sample(1:5, 1)
  sumNumber <- sumNumber + i;
  cat(sumNumber, "\n")
}


repeat(
  cat("ㅋㅋㅋ1\n")
)

sumNumber=0;
repeat{
  i<-sample(1:5,1)
  sumNumber <- sumNumber+i;
  cat(sumNumber, "\n")
  if(sumNumber>20)
    break;
}

rm(list=ls())
f_01 <- function(i, j){
  k <- i+j
  return(k)
}

f_01(1,2)


f1 <- function()print("Test")
f1()
f2 <- function(num) {print("TEST"); print(num)}; f2(100);
f3 <- function(p="R")print(p);
cat("f3()",f3(),"\n", "f3(\"a\")",f3("a"),"\n", "f3(\"abc\")",f3("abc"))
f4 <- function (p1="ㅋㅋㅋ", p2)for(i in 1:p2)print(p1)
f4(p1="abc",p2=3)
f4("abc",3)
f4(,5)
f4(p2=5)

f5 <- function(...){print("TEST");data <- c(...);print(length(data))}
f5(10,20,30)
f5("abc",T,10,20)
f5()
f5("1")
F5("TEST")


func1 <- function(){
  xx <- 10
  yy <- 20
  return (xx*yy)
}
func1()

testParamType <- function(x){
  if(is.vector(x))print("벡터를 전달했군요!")
  if(is.data.frame(x))print("데이터프레임을 전달했군요!")
  if(is.list(x))print("리스트를 전달했군요!")
  if(is.matrix(x))print("매트릭스를 전달했군요!")
  if(is.array(x))print("배열을 전달했군요!")
  if(is.function(x))print("함수를 전달했군요!")
}

testParamType(testParamType)
testParamType(1)
testParamType(c(1,2,3))
testParamType(array())
testParamType(data.frame())
testParamType(vector())

              