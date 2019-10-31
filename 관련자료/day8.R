# 정규표현식 사용
word <- "JAVA javascript Aa 가나다 AAaAaA123 %^&*"
gsub("", "", word)
gsub("A", "", word) 
gsub("a", "", word) 
gsub("Aa", "", word) 
gsub("(Aa)", "", word) 
gsub("(Aa){2}", "", word) 
gsub("[Aa]", "", word) 
gsub("[가-힣]", "", word) 
gsub("[^가-힣]", "", word) 
gsub("[&^%*]", "", word) 
gsub("[[:punct:]]", "", word) 
gsub("[[:alnum:]]", "", word) 
gsub("[1234567890]", "", word) 
gsub("[0-9]", "", word) 
gsub("\\d", "", word)
gsub("[[:digit:]]", "", word) 
gsub("[^[:alnum:]]", "", word) 
gsub("[[:space:]]", "", word) 


data <- readLines("data/memo.txt", encoding="UTF-8")
data
data <- data[nchar(data)>0]
data
gsub("[[:punct:]]","",data[1])
gsub("e","E",data[2])
gsub("[12]","",data[3])
gsub("[[:upper:][:lower:]]","",data[4])
gsub("[[:digit:]]","",data[5])
gsub("[[:blank:]]","",data[6])
gsub("YOU","you",data[7])
gsub("OK","ok",data[7])
tolower(data[7])

# 한국일보 페이지(XML 패키지 사용)
install.packages("XML")
library(XML)
imsi <- read_html("http://hankookilbo.com")
t <- htmlParse(imsi)
content<- xpathSApply(t,"//p[@class='title']", xmlValue); 
content
content <- gsub("[[:punct:][:cntrl:]]", "", content)
content
content <- trimws(content)
content
unique(content)
?htmlParse
# httr 패키지 사용 - GET 방식 요청
install.packages("httr")
library(httr)
http.standard <- GET('http://www.w3.org/Protocols/rfc2616/rfc2616.html')
str(http.standard)
title2 = html_nodes(read_html(http.standard), 'div.toc h2')
title2 = html_text(title2)
title2


# httr 패키지 사용 - POST 방식 요청
library(httr)
# POST 함수를 이용해 모바일 게임 랭킹 10월 29일 주  모바일 게임 랭킹을 찾는다
#(http://www.gevolution.co.kr/score/gamescore.asp?t=3&m=0&d=week) 
game = POST('http://www.gevolution.co.kr/score/gamescore.asp?t=3&m=0&d=week',
      encode='form', body=list(txtPeriodW = '2019-04-10'))
title2 = html_nodes(read_html(game), 'a.tracktitle')
title2 = html_text(title2)
title2[1:10]


# 뉴스, 게시판 등 글 목록에서 글의 URL만 뽑아내기 
res = GET('https://news.naver.com/main/list.nhn?mode=LSD&mid=sec&sid1=001')
htxt = read_html(res)
link = html_nodes(htxt, 'div.list_body a'); length(link)
article.href = unique(html_attr(link, 'href'))
article.href

# 이미지, 첨부파일 다운 받기 
# pdf
res = GET(
  'http://cran.r-project.org/web/packages/httr/httr.pdf')
writeBin(content(res, 'raw'), 'c:/Temp/httr.pdf')

# jpg
h = read_html('http://unico2013.dothome.co.kr/productlog.html')
imgs = html_nodes(h, 'img')
img.src = html_attr(imgs, 'src')
for(i in 1:length(img.src)){
  res = GET(paste('http://unico2013.dothome.co.kr/',img.src[i], sep=""))
  writeBin(content(res, 'raw'), paste('c:/Temp/', img.src[i], sep=""))
} 


library(rvest)
library(httr)
http.standard = GET('http://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=n&searchType=default_mysearch&searchword=DATA%20SCIENTIST')
tech_name = html_nodes(read_html(http.standard), 'li> label > span.txt')
tech_name = html_text(tech_name)
tech_name = gsub('#',"",tech_name)
tech_name = gsub('다른 필터항목 보기',"",tech_name)
tech_name = tech_name[nchar(tech_name)>0]
tech_name


info_count = html_nodes(read_html(http.standard), 'label > span.count')
info_count = html_text(info_count)
info_count = gsub('[()]',"",info_count)
info_count

result = data.frame(tech_name, info_count)

write.csv(result, 'saramin.csv')


