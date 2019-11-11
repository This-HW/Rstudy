
# 2019. 11. 11
# R study .YongJu


library(Kormaps)
data(korpopmap2)
data(korpopmap3)
Encoding(korpopmap2@data$name)<-'UTF-8'
korpopmap2@data$code.data
korpopmap2@data$name
gucodename <- korpopmap2@data[,c("name", "code.data")]

names(gucodename)
Encoding(korpopmap3@data$name)<-'UTF-8'
korpopmap3@data$code.data
korpopmap3@data$name

guname <- '강남구'
gucode <- gucodename[gucodename$name == guname, "code.data"]
pattern <- paste0('^', gucode)
test <- korpopmap3@data[grep(pattern, korpopmap3@data$code.data), 
                c("code.data", "name")]
View(test)


# 정규식 이해하기기
gsub("ABC", "***", "ABCabcABC")  #ABC를 **로 변환
gsub("ABC", "***", "ABCabcABC", ignore.case=T)
x<-c("ABCabcABC", "abcABCabc")
gsub("ABC", "***", x) 
gsub("b.n", "***", "i love banana") # a . a ->  첫 문자와 뒷 문자 사이 문자 하나.
gsub("b.*n", "***", "i love banana")  # a .* a -> 첫 문자와 뒷 문자 사이에 무엇이 있던 다 포함
gsub("[bn]a", "***", "i love banana") # [a]a -> 대괄호 사이의 문자 뒤에 마지막 숫자까지 포함해서 없앰
gsub("010-[0-9]{4}-[0-9]{4}", "010-****-****", "내 폰번호는 010-1234-6789") # 중간에 {4}를 {3,4}로 하면 최소 3 최대 4가 된다.
gsub("010-\\d{4}-\\d{4}", "010-****-****", "내 폰번호는 010-1234-6789") # 백슬래시 두번 써야 gsub이 일반문자로 인식되게 한다.
gsub(" +", " ", "i   love    banana") # " +" -> 블랭크가 하나 이상을 의미한다. -> 블랭크 하나 이상을 하나로 바꾸는 식


weight <- c(65.4, 55, 380, 72.2, 51, NA)
height <- c(170, 155, NA, 173, 161, 166)
gender <- c("M", "F", "M", "M", "F", "F")

df <- data.frame(w=weight, h=height)
df

apply(df, 1, sum, na.rm=TRUE)
apply(df, 2, sum, na.rm=TRUE)
lapply(df, sum, na.rm=TRUE)
sapply(df, sum, na.rm=TRUE)
tapply(df$w, gender, mean, na.rm=TRUE)
tapply(1:6, gender, sum, na.rm=TRUE)
mapply(paste, 1:5, LETTERS[1:5], month.abb[1:5])
count <- 1
myf <- function(x, wt=T){
  print(paste(x,"(",count,")"))
  Sys.sleep(1)
  if(wt) 
    r <- paste("*", x, "*")
  else
    r <- paste("#", x, "#")
  count <<- count + 1;
  return(r)
}
sapply(df$w, myf)
sapply(df$w, myf, F) # my function에 대한 매개변수를 myf 안에 넣는 게 아니라, 좌우에 배치한다. (변수는 왼쪽)
sapply(df$w, myf, wt=F)
rr1 <- sapply(df$w, myf, wt=F)
str(rr1)
count <- 1
sapply(df, myf) # 각각의 호출에 대한 리턴값을 벡터해 보관 했다가 마지막 리턴값에 반환한다.
rr2 <- sapply(df, myf)
str(rr2)
rr2[1,1]
rr2[1,"w"]


r <- sapply(df, myf)
str(r)



library(KoNLP)
library(wordcloud)
library(RColorBrewer)
library(stringr)
useSejongDic()
# install.packages("tm")
library(tm)

lunch <- c("커피 파스타 치킨 샐러드 아이스크림",
           "커피 우동 소고기김밥 귤",
           "참치김밥 커피 오뎅",
           "샐러드 피자 파스타 콜라",
           "티라무슈 햄버거 콜라",
           "파스타 샐러드 커피"
)

cps <- VCorpus(VectorSource(lunch))
tdm <- TermDocumentMatrix(cps) # 워드렝스를 설정하지 않으면 3글자 이상만 적용된다.
tdm
as.matrix(tdm)

cps <- VCorpus(VectorSource(lunch))
tdm <- TermDocumentMatrix(cps, 
                          control=list(wordLengths = c(1, Inf))) #워드렝스를 1~무한대 까지 설정해서 모든단어 나온다.
tdm
(m <- as.matrix(tdm))

colnames(m) <- c("doc1", "doc2", "doc3", "doc4", "doc5", "doc6")
rowSums(m)
colSums(m)


com <- m %*% t(m) #행렬 곱 _ 각 텀의 상관관계를 분석 할 수 있는 테이블을 만든다. _ 어떤음식과 같이 먹었는지 파악 가능
com

# install.packages("qgraph")
library(qgraph)

qgraph(com, labels=rownames(com), diag=F, 
       layout='spring',  edge.color='blue', 
       vsize=log(diag(com)*800))

a<-1:10
dim(a) <- c(2,5)
a
dim(a) <- c(5,2)
a
a[1,,]
a[,1,]

# install.packages("proxy")
library(proxy)
dd <- NULL
d1 <- c("aaa bbb ccc")
d2 <- c("aaa bbb ddd")
d3 <- c("aaa bbb ccc")
d4 <- c("xxx yyy zzz")
dd <- c(d1, d2, d3, d4)
cps <- Corpus(VectorSource(dd))
dtm <- DocumentTermMatrix(cps)
as.matrix(dtm)
inspect(dtm)
m <- as.matrix(dtm)
com <- m %*% t(m)
com
dist(com, method = "cosine")
dist(com, method = "Euclidean")
# install.packages("lsa")
library(lsa)
cosine(com)



# Install
# install.packages("tm")  # 텍스트 마이닝을 위한 패키지
# install.packages("SnowballC") # 어간추출을 위한 패키지
# install.packages("wordcloud") # word-cloud generator 
# install.packages("RColorBrewer") # color palettes

# Load
library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")


filePath <- "http://www.sthda.com/sthda/RDoc/example-files/martin-luther-king-i-have-a-dream-speech.txt"
text <- readLines(filePath)

# VectorSource () 함수는 문자형 벡터 모음을 만듭니다.
docs <- Corpus(VectorSource(text))
# 텍스트의 특수 문자 등을 대체하기 위해 tm_map () 함수를 사용하여 변환이 수행됩니다.
# “/”,“@”및“|”을 공백으로 바꿉니다.
toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "/")
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, "\\|")


# 소문자로 변환
docs <- tm_map(docs, content_transformer(tolower))
# 수치 데이터 제거
docs <- tm_map(docs, removeNumbers)
# 영어 불용어 제거
docs <- tm_map(docs, removeWords, stopwords("english"))

# 벡터 구조로 사용자가 직접 불용어  설정 , 제거
docs <- tm_map(docs, removeWords, c("blabla1", "blabla2")) 

# 문장 부호 punctuations
docs <- tm_map(docs, removePunctuation)

# 공백 제거
docs <- tm_map(docs, stripWhitespace)

# 텍스트 형태소 분석
# docs <- tm_map(docs, stemDocument)

dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 10)

wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=200, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))



# install.pacakes("reshape2")
library(reshape2)

head(french_fries)
# time : 몇 주차 실험인가
# treatment : 사용한 식용유의 종류
# subject : 실험 대상자
# rep : 이 측정이 몇 번째 반복인가
# potato : 감자 맛
# buttery : 버터 맛
# grassy : 풀맛
# rancid : 신맛
# painty : 안 좋은 냄새

# 문제 : potato의 평균, butter 열의 평균, grassy 열의 평균, rancid 의 평균, painty 의 평균을 구하시오.
summary(french_fries)
french_fries[4:9] %>% summarise()
head(french_fries)

m <- melt(french_fries, id.vars=1:4, na.rm=T)
head(m)
m %>% group_by(variable) %>% summarise(mean= mean(value))

library(dplyr)
m %>% group_by(variable) %>% summarize(평균=mean(value, na.rm=T))
m2 <- melt(french_fries, id.vars=1:4, na.rm=T)
dim(m2)
dim(m)
m2 %>% group_by(variable) %>% summarize(평균=mean(value))

r <- dcast(m, time+treatment+subject + rep ~ ...)
head(r)

rownames(r) <- NULL
rownames(french_fries) <- NULL

identical(r, french_fries)

# 책에 있는 예제들

str(airquality)
dim(airquality)
View(airquality)
names(airquality)

names(airquality) <- tolower(names(airquality))
head(airquality)
names(airquality)

melt_test <- melt(airquality)
dim(melt_test)
melt_test2 <- melt(airquality, id.vars=c("month", "wind"), measure.vars="ozone")
head(melt_test2)
dim(melt_test2)

melt_test3 <- melt(airquality, id.vars=c("month", "wind"))
head(melt_test3)
dim(melt_test3)

aq_melt <- melt(airquality, id.vars=c("month", "day"), na.rm=T)
dim(aq_melt)
aq_dcast <- dcast(aq_melt, month+day ~ variable)
View(airquality); 
View(aq_melt); 
View(aq_dcast); dcast(aq_melt, month~variable, mean)