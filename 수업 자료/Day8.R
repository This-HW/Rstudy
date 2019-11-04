

#이용주

#################################
#    2019. 10. 30 class study   #
#################################

word <- "JAVA javascript Aa 가나다 AAaAaA1223 %^&*"
gsub("A","",word)
gsub("a","",word)
gsub("Aa","",word)
gsub("(Aa)","",word)
gsub("(Aa){2}","",word)
gsub("[Aa]","",word) #gsub("[[A-Z][a-z]]","",word)
gsub("[가-힣]","",word)
gsub("[^가-힣]", "", word) #정규식에서 ^는 두가지 의미로 쓰인다. -> 여기에서 ^는 not의 의미가 된다.
                           #    ->not의 의미가 되려면 대괄호 안에 문자 앞에 나와야 한다.
gsub("[&^%*]","",word)
gsub("[[:punct:]]","",word)
gsub("[[:alnum:]]","",word)
gsub("[0-9]", "", word)

gsub("\\d","",word)

gsub("[[:space:]]","",word) # :space는:빈칸을 의미한다.
gsub("A","",word)
gsub("A","",word)

# ###############################
# install.packages("XML")
# library(XML)

imsi  <- read_html("http://hankookilbo.com") # XML 라이브러리는 HTML문서를 읽어오진 못하기에 read_html로 html문서를 읽어오고
t <- htmlParse(imsi) # read_html 명령어로 읽어온 문서들을 XML형식으로 저장하면 된다.

# (Xpath식)  //p[@class='title']           ->   (CSS selector) p.title
# / -> 부모가 최상위(body)
# // -> 부모가 몇개가 되었던 p 태그 찾아라.
# //p[@class='title'] 부모가 누가 되었던 class이름이 title인 p 태그를 찾아라
# ex>  //table/tbody/tr/th    -> tabe이라는 tag를 찾고 그 아래에 tbody-tr-th인 태그들을 찾아 내려가라.
# ex>  //ol/li   -> 부모가 누가 되었던 ol을 찾고 그 아래 li들을 찾아라
# ex>  //ol/li  -> '' , 두번째 li를 찾아라

content <- xpathSApply(t,"//p[@class='title']",xmlValue); content
content <- gsub("[[:punct:][:cntrl:]]","",content); content
content <- trimws(content); content
content <- unique(content); content



########################################
library(httr)

# rvest는 get방식만 지원하지만 httr은 post방식도 지원한다.
http.standard <- GET('http://www.w3.org/Protocols/rfc2616/rfc2616.html')  #이거는 rvest도 가능한 get방식이다.
str(http.standard)
title2 = html_nodes(read_html(http.standard), 'div.toc h2')
title2 = html_text(title2)
title2 

library(httr)
# POST 함수를 이용해 모바일 게임 랭킹 10월 29일 주 모바일 게임 랭킹을 찾는다 
#(http://www.gevolution.co.kr/score/gamescore.asp?t=3&m=0&d=week)
game = POST('http://www.gevolution.co.kr/score/gamescore.asp?t=3&m=0&d=week', 
            encode = 'form', body=list(txtPeriodW = '2019-10-30'))
title2 = html_nodes(read_html(game), 'a.tracktitle')
title2 = html_text(title2)
title2[1:100]

## 텍스트 뿐만 아니라 파일 크롤링하기
# pdf
res = GET('http://cran.r-project.org/web/packages/httr/httr.pdf')
writeBin(content(res, 'raw'), './data/httr.pdf') 

## 이미지 크롤링하기
# jpg
h = read_html('http://unico2013.dothome.co.kr/productlog.html')
imgs = html_nodes(h, 'img')
img.src = html_attr(imgs, 'src')
img.src
for(i in 1:length(img.src)){
  res = GET(paste('http://unico2013.dothome.co.kr/',img.src[i], sep=""))
  writeBin(content(res, 'raw'), paste('./data/img/', img.src[i], sep=""))
} 
