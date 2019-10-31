

# 이용주


#####################################################
#                Open API excercise                 #
#####################################################


# rm(list = ls())
library(httr)
library(XML)
library(rvest)


#OPEN API 실습1

searchUrl<- "https://openapi.naver.com/v1/search/blog.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"
query <- URLencode(iconv("단풍","euc-kr","UTF-8"))
query
url<- paste(searchUrl, "?query=", query, "&display=100", sep="")
doc<-GET(url, add_headers('Content-Type' = "application/xml",
                          'X-Naver-Client-Id' = Client_ID,'X-Naver-Client-Secret' = Client_Secret))

doc <- html_nodes(content(doc, encoding="UTF-8"), xpath='//item/description')
text <- html_text(doc)
text <- gsub("[</b>&quot;]","",text)
write(text, "./data/naverblog.txt")





#OPEN API 실습2

searchUrl_1<- "https://openapi.naver.com/v1/search/news.xml"
query <- URLencode(iconv("빅데이터","euc-kr","UTF-8"))
url<- paste(searchUrl_1, "?query=", query, "&display=100", sep="")
doc<-GET(url, add_headers('Content-Type' = "application/xml",
                          'X-Naver-Client-Id' = Client_ID,
                          'X-Naver-Client-Secret' = Client_Secret))

paringData <- htmlParse(doc, encoding="UTF-8")
title<- xpathSApply(paringData, "//item/title", xmlValue)
title <- gsub("[</b>&quot;]", "", title)
write(title, "./data/navernews.txt")




#OPEN API 실습3

# install.packages("twitteR")
library(twitteR)
api_key <- "gjUkHgO8bFmNobRk4g0Jas8xb"
api_secret <- "loF0mtnzLhtQDFjahdRHox6wcR1fiD6Fw95DP5QCSy3rLTTP1K"
access_token <- "607145164-8L5HtzopZzhjuBCgusUGKE3MHOa9P4RbmhUrM0E1"
access_token_secret <- "2wn2bsCA7JIH5DZ5Ss1deS5BNLabzaX2xSpM2ZLMIqwQf"
setup_twitter_oauth(api_key,api_secret, access_token,access_token_secret)

key <- "취업"
key <- enc2utf8(key)

result <- searchTwitter(key, n=100)
DF <- twListToDF(result)
str(DF)
content <- DF$text
content <- gsub("[[:lower:][:upper:][:digit:][:punct:][:cntrl:]]", "", content)   
content
write(content, "./data/twitter.txt")





#OPEN API 실습4

library(XML)
API_key  <- "%2BjzsSyNtwmcqxUsGnflvs3rW2oceFvhHR8AFkM3ao%2Fw50hwHXgGyPVutXw04uAXvrkoWgkoScvvhlH7jgD4%2FRQ%3D%3D"
bus_No <- "360"
url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", bus_No, sep="")
doc <- xmlParse(url, encoding="UTF-8")
top <- xmlRoot(doc)
top
df <- xmlToDataFrame(getNodeSet(doc, "//itemList"))

노선ID <- as.character(df$busRouteId[1])
노선길이 <- as.character(df$length[1])
기점 <- as.character(df$stStationNm[1])
종점 <- as.character(df$edStationNm[1])
배차간격 <- as.character(df$term[1])
cat("[360번 버스정보]\n노선ID : ", 노선ID,"\n노선길이 : ",노선길이, "\n기점 : ",기점, "\n종점 : ",종점,"\n배차간격 : ",배차간격 )
