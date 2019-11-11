

# 이용주
#########################################
#              tm exercise              #
#########################################

듀크 <- c("사과", "포도", "망고")
둘리 <- c("포도", "자몽", "자두")
또치 <- c("복숭아", "사과", "포도")
도우너 <- c("오렌지", "바나나", "복숭아")
길동 <- c("포도", "바나나", "망고")
희동 <- c("포도", "귤", "오렌지")


data<-data.frame(듀크, 둘리, 또치, 도우너, 길동, 희동)
data
cps <- VCorpus(VectorSource(data))
tdm <- TermDocumentMatrix(cps, 
                          control=list(wordLengths = c(1, Inf))) #워드렝스를 1~무한대 까지 설정해서 모든단어 나온다.
(m <- as.matrix(tdm))

colnames(m) <- c("듀크", "둘리", "또치", "도우너", "길동", "희동")


#문제 1
com <- t(m) %*% m
com
library(lsa)
cosine(com) # 수치가 높을수록 좋아하는 과일이 유사하다.
qgraph(com, labels=rownames(com), diag=F, 
       layout='spring',  edge.color='blue', 
       vsize=log(diag(com)*800))  #그래프를 통해 듀크가 길동, 또치와 비슷하다는 것을 직관적으로 알 수 있다.

#문제2
sums<- rowSums(m)
sums[sums == max(sums)]
#포도, 5번

#문제3
sums[sums == min(sums)]
# 귤 자두 자몽, 1번
