
# 2019. 10. 31 수업 코드
# 이용주


#  Query 문자 열이나 Form 데이터가 서버로 전달될 때
#  name=value형식
#  여러개의 name-value는 &기호로 구분한다.
# 영문대소문자, 숫자, 일부 특수문자는 그대로 전달되고 그외의 문자는 %16진수(UTF-8) 코드값으로 전달도니다.
# 공백은 + 기호로 전달되거나 %`6진수코드값으로 전달된다.


###########################################################################################

library(httr)
library(XML)
library(rvest)
searchUrl<- "https://openapi.naver.com/v1/search/blog.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"
# URLencode("여름추천요리")
query <- URLencode(iconv("여름추천요리","euc-kr","UTF-8"))
query
url<- paste(searchUrl, "?query=", query, "&display=20", sep="")
doc<-GET(url, add_headers('Content-Type' = "application/xml",
                          'X-Naver-Client-Id' = Client_ID,'X-Naver-Client-Secret' = Client_Secret))

doc1 <- htmlParse(doc, encoding="UTF-8")
text1<- xpathSApply(doc1, "//item/description", xmlValue)
text1

doc2 <- html_nodes(read_html(doc, encoding="UTF-8"), xpath='//item/description')
text2 <- html_text(doc2)
text2

doc3 <- html_nodes(content(doc, encoding="UTF-8"), xpath='//item/description')
text3 <- html_text(doc3)
text3




searchUrl<- "https://openapi.naver.com/v1/search/news.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"
query <- URLencode(iconv("검찰","euc-kr","UTF-8"))
url<- paste(searchUrl, "?query=", query, "&display=20", sep="")
doc<-GET(url, add_headers('Content-Type' = "application/xml",
                          'X-Naver-Client-Id' = Client_ID,
                          'X-Naver-Client-Secret' = Client_Secret))

paringData <- htmlParse(doc, encoding="UTF-8")
text<- xpathSApply(paringData, "//item/description", xmlValue); 
text

xpathSApply(paringData, "//item/title", xmlValue)

# 트위터 글 읽어오기
# install.packages("twitteR")
library(twitteR) 
api_key <- "gjUkHgO8bFmNobRk4g0Jas8xb"
api_secret <- "loF0mtnzLhtQDFjahdRHox6wcR1fiD6Fw95DP5QCSy3rLTTP1K"
access_token <- "607145164-8L5HtzopZzhjuBCgusUGKE3MHOa9P4RbmhUrM0E1"
access_token_secret <- "2wn2bsCA7JIH5DZ5Ss1deS5BNLabzaX2xSpM2ZLMIqwQf"
setup_twitter_oauth(api_key,api_secret, access_token,access_token_secret)
# oauth 정보 저장 확인
key <- "단풍"
key <- enc2utf8(key)

result <- searchTwitter(key, n=100)
DF <- twListToDF(result)
str(DF)
content <- DF$text
content <- gsub("[[:lower:][:upper:][:digit:][:punct:][:cntrl:]]", "", content)   
content


library(XML)
API_key  <- "%2BjzsSyNtwmcqxUsGnflvs3rW2oceFvhHR8AFkM3ao%2Fw50hwHXgGyPVutXw04uAXvrkoWgkoScvvhlH7jgD4%2FRQ%3D%3D"
bus_No <- "402"
url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", bus_No, sep="")
doc <- xmlParse(url, encoding="UTF-8")
top <- xmlRoot(doc)
top
df <- xmlToDataFrame(getNodeSet(doc, "//itemList"))
df
str(df)

busRouteId <- df$busRouteId
busRouteId
url <- paste("http://ws.bus.go.kr/api/rest/buspos/getBusPosByRtid?ServiceKey=", API_key, "&busRouteId=", busRouteId, sep="")
doc <- xmlParse(url, encoding="UTF-8")
top <- xmlRoot(doc)
top
df <- xmlToDataFrame(getNodeSet(doc, "//itemList"))
df



######################################################################

rm(list=ls())
# ajacs -> 필요한 부분부분만 요청하는 기능이다.

library(RSelenium)

remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr
remDr$open()
remDr$navigate("http://www.google.com/")
webElem <- remDr$findElement(using = "css", "[name = 'q']")
webElem$sendKeysToElement(list("test", key = "enter"))

########################################################################################################

remDr$navigate("http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135")

# #복수형
# more <- remDr$findElements(using = "css", "span.u_cbox_sort_label")
# sapply(more, function(x){x$clickElement()})

#단수형
more1 <- remDr$findElement(using = "css", "span.u_cbox_in_view_comment")
more1$clickElement()


# next_p <- remDr$findElement(using = "css", "a.u_cbox_page")
# sapply(next_p, function(x){x$clickElement()})
# 
# more1 <- remDr$findElement(using = "css", "a.u_cbox_page")
# more1$clickElement()

for(i in 4:12){
  # nextCss <- paste0("#cbox_module > div > div.u_cbox_paginate > div > a:nth-child(",i,") > span")
  nextCss <- paste0("#cbox_module  a:nth-child(",i,") > span")
  nextPage <- remDr$findElement(using='css', nextCss)
  nextPage$clickElement()
  Sys.sleep(1)
}

while(1){
  nextPage <- remDr$findElement(using='css', "#cbox_module > div > div.u_cbox_paginate > div > a:nth-child(13) > span.u_cbox_cnt_page")
  nextPage$clickElement()
  Sys.sleep(1)
}


