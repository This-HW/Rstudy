# leaflet과 우리나라 행정구역 지도 활용
# # RStudio 를 재기동한다.
# install.packages("devtools") 
# devtools::install_github("cardiomoon/Kormaps")
library(Kormaps)
library(dplyr)

names(korpopmap1)
names(korpopmap2)
names(korpopmap3)
Encoding(names(korpopmap1))<-'UTF-8'
Encoding(names(korpopmap2))<-'UTF-8'
Encoding(names(korpopmap3))<-'UTF-8'
names(korpopmap1)
names(korpopmap2)
names(korpopmap3)

head(korpopmap1,1)
head(korpopmap2,1)
head(korpopmap3,1)

Encoding(korpopmap2@data$name)<-'UTF-8'
Encoding(korpopmap2@data$행정구역별_읍면동)<-'UTF-8'

korpopmap2@data <- korpopmap2@data[-26:-251,]
korpopmap2@polygons<-korpopmap2@polygons[-26:-251]
mymap <- korpopmap2@data
head(mymap)
View(korpopmap2)

crime <- read.csv('2017crime.csv')
head(crime)
palette1<-colorNumeric(palette = 'Oranges', domain = crime$살인_발생)
popup1 <- paste0(mymap$name,'<br> 살인 : ',crime$살인_발생, '건')
map4<-leaflet(korpopmap2) %>% addTiles() %>% setView(lat=37.559957 ,lng=126.975302 , zoom=11)%>%
  addPolygons(stroke=FALSE,smoothFactor=0.2,fillOpacity=.5, popup=popup1, color=~palette1(crime$살인_발생), group='살인')
map4


palette2<-colorNumeric(palette = 'Blues', domain = crime$폭력_발생)
popup2 <- paste0(mymap$name,'<br> 폭력 : ',crime$폭력_발생, '건')
map5<-leaflet(korpopmap2) %>% addTiles() %>% setView(lat=37.559957 ,lng=126.975302 , zoom=11)%>%
  addPolygons(stroke=FALSE,smoothFactor=0.2,fillOpacity=.5, popup=popup2, color=~palette2(crime$폭력_발생), group='폭력')
map5


palette3<-colorNumeric(palette = 'Reds', domain = crime$범죄_발생_총합)
popup3 <- paste0(mymap$name,'<br> 범죄_발생_총합 : ',crime$범죄_발생_총합, '건')
map6<-leaflet(korpopmap2) %>% addTiles() %>% setView(lat=37.559957 ,lng=126.975302 , zoom=11)%>%
  addPolygons(stroke=FALSE,smoothFactor=0.2,fillOpacity=.5, popup=popup3, color=~palette3(crime$범죄_발생_총합),group='총 범죄')

map6

palette2<-colorNumeric(palette = 'Blues', domain = crime$폭력_발생)
popup2 <- paste0(mymap$name,'<br> 폭력 : ',crime$폭력_발생, '건')
map8<-leaflet(korpopmap2) %>% addTiles() %>% setView(lat=37.559957 ,lng=126.975302 , zoom=11)%>%
  addPolygons(stroke=FALSE,smoothFactor=0.2,fillOpacity=.5, popup=popup2, color=~palette2(crime$폭력_발생), group='폭력') %>%
  addPolygons(stroke=FALSE,smoothFactor=0.2,fillOpacity=.5, popup=popup3, color=~palette3(crime$범죄_발생_총합),group='총 범죄')
map8

DONG<-read.csv('./data/one.csv')
head(DONG)
data(korpopmap3)
Encoding(names(korpopmap3))<-'UTF-8'
Encoding(korpopmap3@data$name_eng)<-'UTF-8'
Encoding(korpopmap3@data$name)<-'UTF-8'
Encoding(korpopmap3@data$행정구역별_읍면동)<-'UTF-8'

korpopmap3@data<-korpopmap3@data[c(67:81),] 
korpopmap3@polygons<-korpopmap3@polygons[c(67:81)] 

korpopmap3@data$name<-gsub('·','',korpopmap3@data$name) 
colnames(DONG)<-c('district','name','일인가구')
DONG$district <- as.character(DONG$district)
dong<- DONG %>% filter( district =='광진구')

korpopmap3@data<-merge(korpopmap3@data,dong,by.x='name',sort=FALSE)
mymap <- korpopmap3@data
mypalette <- colorNumeric(palette ='RdYlBu' , domain = mymap$'일인가구')
mypopup <- paste0(mymap$name,'<br> 1인가구: ',mymap$'일인가구')

map7 <- NULL
map7<-leaflet(korpopmap3) %>% 
  addTiles() %>% 
  setView(lat=37.52711, lng=126.987517, zoom=12) %>%
  addPolygons(stroke =FALSE,
              smoothFactor = 0.2,
              fillOpacity = .9,
              popup = mypopup,
              color = ~mypalette(mymap$일인가구)) %>% 
  addLegend( values = ~mymap$일인가구,
             pal =mypalette ,
             title = '인구수',
             opacity = 1)
map7	

#install.packages("htmlwidgets")
#library(htmlwidgets)
saveWidget(map7, file="m.html")


library(ggplot2)
ggplot(data = iris, aes(x = Petal.Width, y= Petal.Length, col=Species)) + geom_point() 
ggsave("ggtest.png")


# install.packages("leaflet")
library(leaflet)

View(quakes)
str(quakes)

data = quakes[1:20,]
leaflet() %>% addTiles() %>%
  addMarkers(data$long, data$lat, popup = paste("지진 강도 : ",as.character(data$mag)), label = as.character(data$mag))


getColor <- function(quakes) {
  result <- sapply(quakes$mag, function(mag) {
    if(mag <= 4) {
      "green"
    } else if(mag <= 5) {
      "orange"
    } else {
      "red"
    } })
  return(result)
}

icons <- awesomeIcons(
  icon = 'ios-close',
  iconColor = 'black',
  library = 'ion',
  markerColor = getColor(data)
)

leaflet() %>% addTiles() %>%
  addAwesomeMarkers(data$long, data$lat, icon=icons, label = as.character(data$mag))


#install.packages("RColorBrewer")
library(RColorBrewer)

for(col_i in c('YlGn','RdPu', 'PuRd', 'BrBG', 'RdBu', 'RdYlBu', 'Set3', 'Set1')){
  print(col_i)
  print(brewer.pal(n = 5, name = col_i))
}





library(ggplot2)
ggplot(data = iris, aes(x = Petal.Width, y= Petal.Length, col=Species)) + geom_point() 
ggsave("ggtest.png")

icon.glyphicon <- makeAwesomeIcon(icon = "flag", markerColor = "blue",
                                  iconColor = "yellow",
                                  squareMarker =  TRUE)
icon.fa <- makeAwesomeIcon(icon = "flag", markerColor = "red",
                           iconColor = "black")
icon.ion <- makeAwesomeIcon(icon = "home", markerColor = "green")


# Marker + Label
leaflet() %>% addTiles() %>%
  addAwesomeMarkers(
    lng = -118.456554, lat = 34.078039,
    label = "This is a label",
    icon = icon.glyphicon)

leaflet() %>% addTiles() %>%
  addAwesomeMarkers(
    lng = -118.456554, lat = 34.078039,
    label = "This is a label",
    icon = icon.fa)

leaflet() %>% addTiles() %>%
  addAwesomeMarkers(
    lng = -118.456554, lat = 34.078039,
    label = "This is a label",
    icon = icon.ion)

leaflet() %>% addTiles() %>%
  addAwesomeMarkers(
    lng = -118.456554, lat = 34.078039,
    label = "This is a static label",
    labelOptions = labelOptions(noHide = T),
    icon = icon.fa)

View(quakes)
str(quakes)

data = quakes[1:20,]
leaflet() %>% addTiles() %>%
  addMarkers(data$long, data$lat, popup = paste("지진 강도 : ",as.character(data$mag)), label = as.character(data$mag))


getColor <- function(quakes) {
  result <- sapply(quakes$mag, function(mag) {
    if(mag <= 4) {
      "green"
    } else if(mag <= 5) {
      "orange"
    } else {
      "red"
    } })
  return(result)
}

icons <- awesomeIcons(
  icon = 'ios-close',
  iconColor = 'black',
  library = 'ion',
  markerColor = getColor(data)
)

leaflet() %>% addTiles() %>%
  addAwesomeMarkers(data$long, data$lat, icon=icons, label = as.character(data$mag))


#install.packages("RColorBrewer")
library(RColorBrewer)

for(col_i in c('YlGn','RdPu', 'PuRd', 'BrBG', 'RdBu', 'RdYlBu', 'Set3', 'Set1')){
  print(col_i)
  print(brewer.pal(n = 5, name = col_i))
}



# install.packages("KoNLP")
library(KoNLP)

useSystemDic()
useSejongDic()
useNIADic()

word_data <- readLines("./data/book/애국가(가사).txt")
word_data

useSejongDic()
word_data2 <- sapply(word_data, extractNoun, USE.NAMES = F)
word_data2
word_data3 <- extractNoun(word_data)
word_data3

add_words <- c("백두산", "남산", "철갑", "가을", "달")
buildDictionary(user_dic=data.frame(add_words, rep("ncn", length(add_words))), replace_usr_dic=T)

word_data3 <- extractNoun(word_data)
word_data3

undata <- unlist(word_data2)
undata

word_table <- table(undata)
word_table

undata2 <- Filter(function(x) {nchar(x) >= 2}, undata)
word_table2 <- table(undata2)
word_table2

final <- sort(word_table2, decreasing = T)

head(final, 10)

extractNoun("대한민국의 영토는 한반도와 그 부속도서로 한다")
SimplePos22("대한민국의 영토는 한반도와 그 부속도서로 한다")
SimplePos09("대한민국의 영토는 한반도와 그 부속도서로 한다")


# install.packages("wordcloud2")
library(wordcloud2)

(words <- read.csv("./data/wc.csv",stringsAsFactors = F))
head(words)
# install.packages("wordcloud")
library(wordcloud)
windowsFonts(lett=windowsFont("휴먼옛체"))
wordcloud(words$keyword, words$freq,family="lett")
wordcloud(words$keyword, words$freq, 
          min.freq = 2, 
          random.order = FALSE, 
          rot.per = 0.1, scale = c(4, 1), 
          colors = rainbow(7))
wordcloud2(words)
wordcloud2(words,rotateRatio = 1)
wordcloud2(words,rotateRatio = 0.5)
wordcloud2(words,rotateRatio = 0)
wordcloud2(words, size=0.5,col="random-dark")
wordcloud2(words,size=0.5,col="random-dark", figPath="./data/book/peace.png")
wordcloud2(words,size=0.7,col="random-light",backgroundColor = "black")
wordcloud2(data = demoFreq)

#install.packages("twitteR")
library(twitteR) 
api_key <- "gjUkHgO8bFmNobRk4g0Jas8xb"
api_secret <- "loF0mtnzLhtQDFjahdRHox6wcR1fiD6Fw95DP5QCSy3rLTTP1K"
access_token <- "607145164-8L5HtzopZzhjuBCgusUGKE3MHOa9P4RbmhUrM0E1"
access_token_secret <- "2wn2bsCA7JIH5DZ5Ss1deS5BNLabzaX2xSpM2ZLMIqwQf"
setup_twitter_oauth(api_key,api_secret, access_token,access_token_secret)
# oauth 정보 저장 확인
key <- "수능"
key <- enc2utf8(key)
result <- searchTwitter(key, n=100)
DF <- twListToDF(result)
str(DF)
content <- DF$text
content <- gsub("[[:lower:][:upper:][:digit:][:punct:][:cntrl:]]", "", content) 
content <- gsub("수능", "", content) 
content
word <- extractNoun(content)
cdata <- unlist(word)
cdata
cdata <- Filter(function(x) {nchar(x) < 6 & nchar(x) >= 2} ,cdata)
wordcount <- table(cdata) 
wordcount <- head(sort(wordcount, decreasing=T),30)

par(mar=c(1,1,1,1))
wordcloud(names(wordcount),freq=wordcount,scale=c(3,0.5),rot.per=0.35,min.freq=1,
          random.order=F,random.color=T,colors=rainbow(20))

