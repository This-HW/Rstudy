v1 <- c(4,1,8,6,10)
print(v1)


v1 <- c(4, 1, 8, 6, 10)

#v1변수에 저장된 데이터셋에서 최대값
v2 <- max(v1)

#v1 변수에 저장된 데이터셋에서 최소값
v3 <- max(v2)


print(c(10, 20, TRUE))
print(c(10, 20, "A"))

LETTERS
letters
month.name
month.abb
pi


x <- c(10, 2, 7, 4, 15)
x
print(x)
class(x)
rev(x)
range(x)
sort(x)
sort(x, decreasing =TRUE)
sort(x, decreasing = FALSE)
sort(x, decreasing=T)
order(x)
y <- x
y
y <- sort(y, decreasing=T)
#x <-order(x)
y
x
x[c(1,3)]
x
x[1]
x[c(T,F,T,F,T)]
x
cat(as.numeric(c(T, F, T, F, T)))
as.numeric(F)
as.numeric(T)


names(x)
y <-x
names(y)
names(y) <- LETTERS[1:5]
names(y)
sort(y, decreasing=T)

c(F, T, F, T) | c(F, F, T, F)  # 각 원소별로 계산한다.
c(F, T, F, T) || c(F, F, T, F) # 기호 하나면 첫번쨰 원소 값만 계산한다.
c(F, T, F, T) & c(F, F, T, F)  # 각 원소별로 계산한다.
c(T, T, F, T) && c(T, F, T, F) # 기호 하나면 첫번쨰 원ㄴㅁ소값만 계산한다.




sdprint(100)
print(pi)
data <- "가나다"
print(data)
print(data, quote=FALSE)
v1 <- c("사과", "바나나", "포도")
print(v1)
print(v1, print.gap=10)
print(v1, print.gap=5, quote=F)
cat(100)
cat(100)
cat(100,200)
cat(100,200)
cat(100,200,"\n")
cat("aaa", "bbb", "ccc", "ddd", "\n")
cat(v1, "\n")
cat(v1, sep="-")


summary(data)


#####################################
#책실습#

#seq 함수 -> 일정 간격을 두고 연속된 숫자 (default : 1)
t1 <- seq(0, 100, by = 15)
print(t1)

str(t1)
length(t1)

class(c(10, 20, "A"))
str(c(10, 20, "A"))
str(c(10, 20, A))
mode(c(10, 20, "A"))
mode(c(10, 20, 30))
typeof(c(10, 20, "A"))
typeof(c(10, 20, 30))

ls()

#########################실습###########

rainfall <- c(12.6, 23.6, 45.8, 77.0,
              102.2, 133.3, 327.9, 348.0,
              137.6, 49.3, 53.0, 24.9)
rainfall>100  ## 각 원소가조건을 만족하는지 위치별 T/F 반환
rainfall[rainfall>100] ## 조건에 응답하는 원소값 백터 형태로 반환
which(rainfall >100)  ## 조건에 응답하는 원소의 위치 반환
month.name[which(rainfall>100)]
month.abb[which(rainfall>100)]
month.korname <- c("1월", "2월", "3월", "4월",
                   "5월", "6월", "7월", "8월",
                   "9월", "10월", "11월", "12월")
month.korname[which(rainfall>100)]
which.max(rainfall)
month.korname[which.max(rainfall)]
month.korname[which.min(rainfall)]


paste("I'm", "Duli", "!!", sep="")


fruit <- c("Apple", "Banana", "Strawberry")
food <- c("Pie", "Juice", "Cake")
paste(fruit, food)
paste(fruit, food, sep=":::")
paste(fruit, food, sep="", collapse=" - ")
paste(fruit, food, sep="  ", collapse=" - ")
