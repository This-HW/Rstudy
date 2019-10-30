# 제어문 - 조건문과 반복문

# <실습> 산술연산자 
num1 <- 100 # 피연산자1
num2 <- 20  # 피연산자2
result <- num1 + num2 # 덧셈
result # 120
result <- num1 - num2 # 뺄셈
result # 80
result <- num1 * num2 # 곱셈
result # 2000
result <- num1 / num2 # 나눗셈
result # 5

result <- num1 %% num2 # 나머지 계산
result # 0

result <- num1^2 # 제곱 계산(num1 ** 2)
result # 10000
result <- num1^num2 # 100의 20승
result # 1e+40 -> 1 * 10의 40승과 동일한 결과


# <실습> 관계연산자 
# (1) 동등비교 
boolean <- num1 == num2 # 두 변수의 값이 같은지 비교
boolean # FALSE
boolean <- num1 != num2 # 두 변수의 값이 다른지 비교
boolean # TRUE

# (2) 크기비교 
boolean <- num1 > num2 # num1값이 큰지 비교
boolean # TRUE
boolean <- num1 >= num2 # num1값이 크거나 같은지 비교 
boolean # TRUE
boolean <- num1 < num2 # num2 이 큰지 비교
boolean # FALSE
boolean <- num1 <= num2 # num2 이 크거나 같은지 비교
boolean # FALSE

# <실습> 논리연산자
logical <- num1 >= 50 & num2 <=10 # 두 관계식이 같은지 판단 
logical # FALSE
logical <- num1 >= 50 | num2 <=10 # 두 관계식 중 하나라도 같은지 판단
logical # TRUE

logical <- num1 >= 50 # 관계식 판단
logical # TRUE
logical <- !(num1 >= 50) # 괄호 안의 관계식 판단 결과에 대한 부정
logical # FALSE

x <- TRUE; y <- FALSE
xor(x,y) # [1] TRUE
x <- TRUE; y <- TRUE
xor(x,y) # FALSE


###############################
## 1. 조건문
###############################

# 1) if()함수
x <- 10
y <- 5
z <- x * y
z

#if(조건식){ # 산술,관계,논리연산자
#   실행문1  <- 참
#}else{
#   실행문2  <- 거짓 
#}


if(x*y > 40){ # 산술 > 관계 > 논리 
  cat("x*y의 결과는 40 이상입니다.\n")  # \n 줄바꿈
  cat("x*y =", z, '\n')
  print(z)
}else{
  cat("x*y의 결과는 40 미만입니다. x*y =", z,"\n")
}


# 학점 구하기
score <- scan()
score # 85

if(score >= 90){  # 조건식1
  result="A학점"  # 조건식1 참
}else if(score >=80){ # 조건식2
  result="B학점"  # 조건식1 거짓, 조건식2 참 
}else if(score >=70){
  result="C학점"
}else if(score >=60){
  result="D학점"
}else{
  result="F학점"
}  
cat("당신의 학점은 ",result)  # 당신의 학점은  B학점
print(result) 

# [실습] 2의 배수 연산 
10 / 2 # 5
10 %% 2 # 0


# 2) ifelse(조건, 참, 거짓) - 3항 연산자 기능
# vector 입력 -> vector 출력 

score <- c(78, 95, 85, 65)
score
ifelse(score>=80, "우수","노력") #우수
# [1] "노력" "우수" "우수" "노력"


#ifelse() 응용
excel <- read.csv("data/excel.csv", header = T)
q1 <- excel$q1             # q1 변수값 추출
q1
ifelse(q1>=3, sqrt(q1), q1)  # 3보다 큰 경우 sqrt() 함수 적용

excel <- read.csv("data/excel.csv", header = T)
q1 <- excel$q1             # q1 변수값 추출
q1
ifelse(q1>=2 & q1<=4, q1^2, q1)   #1과 5만 출력, 나머지(2~4) 지수승

# 3) switch 문
# 형식) switch(비교구문, 실행구문1, 실행구문2, 실행구문3)
switch("name", id="hong", pwd="1234",age=105, name="홍길동")    

# 4) which 문
# which()의 괄호내의 조건에 해당하는 위치(인덱스)를 출력한다.
# 벡터에서 사용-> index값 리턴
name <- c("kim","lee","choi","park")
which(name=="choi") # 3

# 데이터프레임에서 사용
no <- c(1:5)
name <-c("홍길동","이순신","강감찬","유관순","김유신")
score <- c(85,78,89,90,74)

exam <- data.frame(학번=no,이름=name,성적=score)
exam
which(exam$이름=="유관순") 


###############################
## 2. 반복문
###############################

# 1) 반복문 - for(변수 in 값) {표현식} 
i <- c(1:10)
i #  1  2  3  4  5  6  7  8  9 10
d <- numeric() # 빈 vector(숫자)
for(n in i){ # 10회 반복
  print(n * 10) # 계산식(numeric만 가능) 출력
  print(n)
  d[n] <- n * 2 # d[1] = 2, ..... d[10]=20
}
d # 2  4  6  8 10 12 14 16 18 20


for(n in i){
  if(n%%2 != 0) 
    print(n) # %% : 나머지값 - 짝수만 출력
} 

for(n in i){  # 10 
  if(n%%2==0){
    next # 짝수면 skip
  }else{
    print(n) # 홀수만 출력
  }    
} 

# <실습> 벡터 데이터 사용 예
score = c(85, 95, 98)
name = c('홍길동', '이순신', '강감찬')
 
i <- 1         # 첨자로 사용되는 변수
for (s in score) {
  cat(name[i], " -> ", s, "\n")
   i <- i + 1   
} 


# 2) 반복문 - while(조건){표현식}
i = 0
while(i < 10){
  i <- i + 1  # 카운터 변수 
  print(i) # 1~10까지 출력됨
}

