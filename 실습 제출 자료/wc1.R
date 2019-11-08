

# 이용주

##################################################
#              Word cloud exercise               #
##################################################

word <- readLines("./data/공구.txt", encoding = "UTF-8")
word
word2 <- sapply(word, extractNoun, USE.NAMES = F)

word3 <- unlist(word2)
word3 <- Filter(function(x) {nchar(x) >=2}, word3)
word3

word3 <- gsub("\\d+","",word3)
word3 <- gsub("[[:punct:]]","", word3)
word3 <- gsub("[A-Za-z]","",word3)
word3 <- gsub("공구","",word3)
word3 <- gsub("해주","",word3)

write(unlist(word3),"temp.txt")
word4<- read.table("temp.txt")

wordcount <- table(word4)
final <- sort(wordcount, decreasing = T)

png(filename="./data/wc.png", height=400, width=700, bg="white")
wordcloud(names(wordcount),freq=wordcount,scale=c(4,1),rot.per=0.35,min.freq=2,
          random.order=F,random.color=T,colors=rainbow(20))
dev.off()

