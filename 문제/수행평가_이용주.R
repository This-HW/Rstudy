

df <- read.table("exam_product_click.log") #1번 df변수에 저장
names(df) <- c("date", "ID")

library(dplyr)
pd_click <- df %>% count(ID)
pd_click #2번 상품별 클릭 수 출력

pd_click %>% arrange(desc(n)) %>% select(ID) %>% head(1) #3번 가장많은 클릭 상품ID

clicktime <- strptime(df$date,format = '%Y%m%d%H%M')
hour <- format(clicktime,'%H')
hour <- as.data.frame(hour)
hour <- hour %>% count(hour)
names(hour) <- c("hour", "click")
hour #4 시간대별 클릭수 출력

hour %>% arrange(desc(click)) %>% head(1) #5번 가장 많은 시간대 출력력

df2 <- df
df2$month <- substr(df2$date,5,6 )
m_12 <- df2 %>% filter(month == 12)
m_12 <- m_12 %>% count(ID) 
m_12 %>% arrange(desc(n))
m_12_2 <- m_12 %>% filter(ID != "p001") 
m_12_2 <- m_12_2 %>% filter(ID != "p013")
m_12_2$ID <- as.character(m_12_2$ID)
m_12_2

#문제6 그래프 파일로 저장
library(ggplot2)
png(filename = 'exam1.png', width = 700, height = 400, bg='white')
ggplot(data=m_12_2, aes(x=ID, y=n), main = 'graph', xlab = "상품ID", ylab = '클릭 수') + geom_point()
dev.off()

png(filename = 'exam2.png', width = 700, height = 400, bg='white')
barplot(m_12_2$n, ylim = c(0,60), main = 'barplot', xlab = "상품ID", ylab = '클릭 수', col = terrain.colors(10))
dev.off()
#문제 6 끝


library(KoNLP)
useSejongDic()

getwd()
hotel <- readLines("exam_hotel.txt", encoding="UTF-8")
head(hotel)
hotel <- extractNoun(hotel)
hotel <- unlist(hotel)
hotel <- gsub("[^가-힣]","",hotel)
hotel <- Filter(function(x) {nchar(x)>=2},hotel)
hotel_1 <- head(sort(table(hotel),decreasing = T),10)
hotel_1 <- as.data.frame(hotel_1)
names(hotel_1) <- c("noun", "freq")
hotel_1  #문제 7



