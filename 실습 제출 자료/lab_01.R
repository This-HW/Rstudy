##############################
##이용주/2019/10/21
##############################

##############################
#문제1

v1 <- 1:10
v2 <- v1*2
max_v <- max(v2)
min_v <- min(v2)
avg_v <- mean(v2)
sum_v <- sum(v2)

v3 <- v2[1:4]
cat(v3,v2[6:10])

print(v1)
print(v2)
print(v3)
print(max_v)
print(min_v)
print(avg_v)
print(sum_v)


##############################
#문제3

seq(1,10, by=2 )
rep(1, length.out=5)
rep(1:3, 3 )
rep(1:4, each=2 )


##############################
#문제4
print(1:10)
a <- seq(1,10, by=3)
names(a)<-LETTERS[1:4]

##############################
#문제5
week.korname <- c("일요일", "월요일", "화요일", "수요일",
                  "목요일", "금요일", "토요일")
count <- sample(1:100,7)
names(count) <- week.korname

max_count <- which.max(count)
min_count <- which.min(count)
count_count<-which(count>50)

paste(week.korname, count, sep=" : ")

names(count[max_count])
names(count[min_count])
names(count[count_count])


