

#이용주

##########################################
#            datae exercise              #
##########################################


#1
weekdays(as.Date('1993/05/31'))

#2
# today <- Sys.time()
# today-birth_d #9654일
difftime(Sys.Date(),'1993-05-31')

#3
x_day <- as.Date("2019-12-25")
x_day <- as.POSIXlt(x_day)
x_day$wday
weekdays(as.Date('2019/12/25'))

#4
weekdays(as.Date('2020/01/01'))

#5
today <- Sys.Date()
today <- as.POSIXlt(today)
format(today,'%Y년 %m월 %d일')

#6
emp <- read.csv("./data/emp.csv")
format(as.Date(emp$hiredate),'%Y')
