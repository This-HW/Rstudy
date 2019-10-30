#############################################
## 사용자 정의함수와 내장함수 
#############################################

## 1. 사용자 정의함수

# 함수 정의 형식 
#변수 <- function([매개변수]){
#        함수의 실행문
#      }

# 함수 호출
# 변수([매개변수])


# 매개변수가 없는 함수 예
f1 <- function(){
  cat("매개변수가 없는 함수")
}

f1() # 함수 호출 

# 매개변수가 있는 함수 예
f2 <- function(x){ # 가인수 
  cat("x의 값 = ",x, "\n") # \n 줄바꿈
  print(x) # 변수만 사용
}

f2(10) # 실인수 


# 리턴값이 있는 함수 예
f3 <- function(x, y){
  add <- x + y # 덧셈 
  return(add) # 결과 반환 
}

add <- f3(10, 20)
add


#파일 불러오기
test <- read.csv("data/test.csv", header=TRUE)
head(test)

# A 칼럼 요약통계량, 빈도수 구하기 
summary(test) # 요약통계량
table(test$A) # A변수 대상 빈도수 
max(test$A) # 최고 빈도수 
min(test$A) # 최소 빈도수 

# 각 칼럼 단위 요약통계량과 빈도수 구하기
data_pro <- function(x){
  
  for (idx in 1 : length(x)){
    cat(idx,'번째 칼럼의 빈도분석 결과')
    print(table(x[idx]))
    cat('\n')
  }
  for (idx in 1 : length(x)){
    f <- table(x[idx])
    cat(idx,'번째 칼럼의 최댓값/최솟값\n')
    cat("max =", max(f), "min =", min(f), '\n')
  }
}

data_pro(test) #함수 호출

# 분산과 표준편차를 구하는 함수 정의
x <- c(7, 5, 12, 9, 15, 6) # x 변량 생성 
var_sd <- function(x) {
   var <-  sum( (x-mean(x))^2 ) / (length(x) - 1) # 표본분산 
   sd <- sqrt(var)  # 표본 표준편차 
   cat('표본분산 : ', var, '\n')
   cat('표본 표준편차 :', sd)
}

var_sd(x) 

#파타고라스 정의 증명- 식 : a^2+b^2=c^2
pytha <- function(s,t){
  a <- s^2 - t^2
  b <- 2*s*t
  c <- s^2 + t^2
  cat("피타고라스의 정리 : 3개의 변수 : ",a,b,c)
}

pytha(2,1) # s,t는 양의 정수 -> 3 4 5

#결측치(NA) 데이터 처리
data<- c(10,20,5,4,40,7,NA,6,3,NA,2,NA) # 97
data
mean(data, na.rm = T) # NA

# 구구단 출력 함수 
gugu <- function(i, j) {
   for(x in i) {
     cat("**", x , "단 **\n")
     for(y in j){
        cat(x, "*", y, "=", x*y, "\n")
    }
     cat("\n")
   }
 }
i <- c(2:9)   # 단 수 지정
j <- c(1:9)   # 단 수와 곱해지는 수 지정
 
# 구구단 함수 호출 
gugu(i,j)    # 구구단 보기


#결측치 데이터 처리 함수
na <- function(x){
  #1차 : NA 제거 
  print(x)
  print( mean(x, na.rm = T) )
  
  #2차 : NA를 0으로 대체  
  data = ifelse(!is.na(x), x, 0) # NA이면 0으로 대체
  print(data)
  print(mean(data))
  
  # 3차 : NA를 평균으로 대체 
  data2 = ifelse(!is.na(x), x, round(mean(x, na.rm=TRUE), 2) ) # 평균으로 대체 
  print(data2)
  print(mean(data2))
}
na(data) #함수 호출
# 결측치를 무조건 제거하면 정확한 통계량을 얻을 수 없으며, 데이터가 손실될 수 있다. 

################################
### 몬테카를로 시뮬레이션 
################################
# 현실적으로 불가능한 문제의 해답을 얻기 위해서 난수의 확률분포를 이용하여 
# 모의시험으로 근사적 해를 구하는 기법

# 동전 앞/뒤 난수 확률분포 함수 
coin <- function(n){
  r <- runif(n, min=0, max=1)
  #print(r) # n번 시행 
  
  result <- numeric()
  for (i in 1:n){
    if (r[i] <= 0.5)
      result[i] <- 0 # 앞면 
    else 
      result[i] <- 1 # 뒷면
  }
  return(result)
}
coin(10) # 시행 횟수 : 10회  

# 몬테카를로 시뮬레이션 
montaCoin <- function(n){
  cnt <- 0
  for(i in 1:n){
    cnt <- cnt + coin(1) # 동전 함수 호출 
  }
  result <- cnt / n
  return(result)
}

montaCoin(10) # 0.3

montaCoin(30) # 0.5666667

montaCoin(100) # 0.53

montaCoin(1000) #  0.51

montaCoin(10000) # 0.5033



## 2. 주요 내장함수 


# [실습] 행 단위, 칼럼 단위 합계와 평균 구하기 

# 단계 1 : 데이터 셋 불러오기
library(RSADBE) 
data(Bug_Metrics_Software)
Bug_Metrics_Software[,,1]

# 단계 2 : 소프트웨어 발표 전 행 단위 합계와 평균 구하기 
rowSums(Bug_Metrics_Software[,,1])
rowMeans(Bug_Metrics_Software[,,1])

# 단계 3 : 소프트웨어 발표 전의 열 단위 합계와 평균 구하기 
colSums(Bug_Metrics_Software[,,1])
colMeans(Bug_Metrics_Software[,,1])


# [실습] 기술 통계량 관련 내장함수 사용 예 
seq(-2, 2, by=.2) # 0.2씩 증가
vec<-1:10
min(vec)
max(vec)
range(vec)
mean(vec) # 평균
median(vec) # 중위수
sum(vec) 
sd(rnorm(10)) # 표준편차 구하기
table(vec) # 빈도수


# [실습] 난수와 확률분포 관계 

# 단계 1 : 정규분포(연속형)의 난수 생성 
n <- 1000
r <- rnorm(n, mean = 0, sd = 1) 
hist(r) # 대칭성

# 단계 2 : 균등분포(연속형)의 난수 생성 
n <- 1000
r2 <- runif(n, min=0, max=1) # 0 < r2 < 1
hist(r2)

# 단계 3 : 이항분포(이산형) 난수 생성  
n <- 20
rbinom(n, 1, prob = 1/2) 
rbinom(n, 2, 0.5)  
rbinom(n, 10, 0.5) 
n <- 1000
rbinom(n, 5, prob = 1/6)

# 단계 4 : 종자값으로 동일한 난수 생성
rnorm(5, mean = 0, sd = 1)
set.seed(123)
rnorm(5, mean = 0, sd = 1)

set.seed(345)
rnorm(5, mean = 0, sd = 1)
 

# [실습] 수학 관련 내장함수 사용 예 
vec<-1:10
prod(vec)
factorial(5)
abs(-5)
sqrt(16) # 4 
cumsum(vec)

log(10) # 10의 자연로그(밑수가 e)
log10(10) # 10의 일반로그(밑수 10) 


# [실습] 집합연산 관련 내장함수 사용 예   
x <- c(1, 3, 5, 7, 9)
y <- c(3, 7)

union(x, y)
setequal(x, y)
intersect(x, y)
setdiff(x, y)
