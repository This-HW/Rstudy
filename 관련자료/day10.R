# 동적 스크래핑(1101)

install.packages("RSelenium")
library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()
remDr$navigate("http://www.google.com/ncr")

webElem <- remDr$findElement(using = "css", "[name = 'q']")
webElem$sendKeysToElement(list("JAVA", key = "enter"))


remDr$navigate("http://www.naver.com/")

webElem <- remDr$findElement(using = "css", "#query")
webElem$sendKeysToElement(list("JAVA", key = "enter"))


# [ 네이버 웹툰 댓글 읽기 ]
url<-'http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135'
remDr$navigate(url)
#복수형으로 노드 추출
more<-remDr$findElements(using='css','span.u_cbox_in_view_comment')
sapply(more,function(x){x$clickElement()})
#단수형으로 노드 추출
more<-remDr$findElement(using='css','span.u_cbox_in_view_comment')
more$clickElement()
more$getElementTagName()

# 2페이지부터 10페이지까지 링크 클릭하여 페이지 이동하기 
for (i in 4:12) {
  nextCss <- paste0("#cbox_module>div>div.u_cbox_paginate>div> a:nth-child(",i,") > span")
  nextPage<-remDr$findElement(using='css',nextCss)
  nextPage$clickElement()
  Sys.sleep(3)
}

url<-'http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135'
remDr$navigate(url)
#베스트 댓글 내용 읽어오기
bestReviewNodes<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
sapply(bestReviewNodes,function(x){x$getElementText()})

#전체 댓글 링크 클릭후에 첫 페이지 내용 읽어오기
totalReview <- remDr$findElement(using='css','span.u_cbox_in_view_comment')
totalReview$clickElement()
totalReviewNodes<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
sapply(totalReviewNodes,function(x){x$getElementText()})


# 네이버 웹툰 댓글에서 베스트댓글, 전체댓글 10페이지를 
# 읽어서 webtoon1.txt 파일에 저장하는 코드 작성하기 
# 네이버 웹툰 페이지 네비게이팅
# 베스트댓글을 읽어서 변수 저장
# 전체댓글 보기 링크 클릭
# 첫페이지 댓글내용 읽어서 변수에 추가
# 2,3,4~10 페이지까지 이동하여 댓글내용 읽어서 변수에 추가
# 변수의 내용을 webtoon1.txt 저장해서
# webtoon1.txt, webtoon1.R



# 링크 클릭으로 AJAX 로 처리되는 네이버 웹툰 댓글 읽어 오기
repl_v = NULL;
url<-'http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135'
remDr$navigate(url)
#베스트 댓글 내용 읽어오기
doms1<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
vest_repl <- sapply(doms1,function(x){x$getElementText()})
repl_v <- c(repl_v, unlist(vest_repl))

toralReview <- remDr$findElement(using='css','span.u_cbox_in_view_comment')
toralReview$clickElement()
#전체 댓글의 첫 페이지 내용 읽어오기
doms2<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
repl <-sapply(doms2,function(x){x$getElementText()})
repl_v <- c(repl_v, unlist(repl))

repeat {
  for (i in 4:12) {               
    nextCss <- paste("#cbox_module>div>div.u_cbox_paginate>div> a:nth-child(",i,") > span", sep="")                
    try(nextListLink<-remDr$findElement(using='css',nextCss))
    if(length(nextListLink) == 0)   break;
    nextListLink$clickElement()
    Sys.sleep(1)
    #전체 댓글의 해당 페이지 내용 읽어오기
    doms3<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
    repl <-sapply(doms3,function(x){x$getElementText()})
    repl_v <- c(repl_v, unlist(repl))                
  }
  
  try(nextPage<-remDr$findElement(using='css',
                                  "#cbox_module > div > div.u_cbox_paginate > div > a:nth-child(13) > span.u_cbox_cnt_page"))
  if(length(nextPage) == 0)  break;
  nextPage$clickElement()
  Sys.sleep(1)
  doms2<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
  repl <-sapply(doms2,function(x){x$getElementText()})
  repl_v <- c(repl_v, unlist(repl))        
}
print(repl_v)
write(repl_v, "webtoon2.txt")

# [ 신라스테이 호텔에 대한 첫 페이지 댓글 읽기 ]
remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()
url<-'https://www.agoda.com/ko-kr/shilla-stay-seocho/hotel/seoul-kr.html?cid=-204'
remDr$navigate(url)

#나중에 하기 클릭하여 팝업메뉴 없애기
laterAction<-remDr$findElement(using='css',
 '#SearchBoxContainer > div > div > div.Popup__container.Popup__container--garage-door > div > div > div.AlertMessage.CalendarAlertMessage > a')
if(length(laterAction) != 0){
  laterAction$clickElement()
} 
# 페이지 화면의 스크롤다운이 필요한 상황을 채크하기 위한 코드
test<-NULL
test<-remDr$findElement(using='css',
           '#customer-reviews-panel > span')
test

# [ 신라스테이 호텔에 대한 전체 페이지 댓글 읽기 ]
remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()
url<-'https://www.agoda.com/ko-kr/shilla-stay-seocho/hotel/seoul-kr.html?cid=-204'
remDr$navigate(url)

#나중에 하기 클릭하여 팝업메뉴 없애기
laterAction<-remDr$findElement(using='css',
                               '#SearchBoxContainer > div > div > div.Popup__container.Popup__container--garage-door > div > div > div.AlertMessage.CalendarAlertMessage > a')
if(length(laterAction) != 0){
  laterAction$clickElement()
} 

remDr$executeScript("scrollBy(0, 8400)")
pageLink <- NULL
pageLink <- remDr$findElement(using='css',"#customer-reviews-panel > button > div > span")
if(length(pageLink) != 0){
  cat("클릭함\n")
  pageLink$clickElement()
}

remDr$executeScript("scrollBy(0, 50)")
reple <- NULL
end <- NULL
repeat{
  doms <- remDr$findElements(using = "css selector", ".Review-comment-bodyText")
  Sys.sleep(1)
  reple_v <- sapply(doms, function (x) {x$getElementText()})
  print(reple_v)
  reple <- append(reple, unlist(reple_v))
  cat(length(reple), "\n")
  pageLink <- NULL
  pageLink <- remDr$findElement(using='css',"#reviewSection > div:nth-child(4) > div > span:nth-child(3) > i")
  Sys.sleep(1)
  try(end<-remDr$findElement(using='css', ".Review-paginator-arrow--inactive > .ficon-carrouselarrow-right"))
  if(length(end) != 0)  {
    cat("종료\n")
    break; 
  }
  pageLink$clickElement()
  Sys.sleep(1)
}
cat(length(reple), "개의 댓글 추출\n")
write(reple,"hotel.txt")


# 아고다 홈페이지 접속해서 전체 리뷰 창 띄우기
driver <- remoteDriver(port=4445, browserName="chrome")
driver$open()
driver$navigate("https://www.agoda.com/ko-kr/shilla-stay-seocho/hotel/seoul-kr.html?cid=-204")

later_btn <- driver$findElement(using = "xpath", value = '//*[@id="SearchBoxContainer"]/div/div/div[5]/div/div/div[1]/a')
later_btn$clickElement()

driver$executeScript("scrollBy(0, 8400)")
try( {revies_btn <- driver$findElement("css", "#customer-reviews-panel > button > div > span");
revies_btn$clickElement() })

# 페이지 넘어가며 리뷰 크롤링
driver$executeScript("scrollBy(0, 50)")
result_text <- NULL
page_num <- 1
while (TRUE) {
  tmp_review_nodes <- driver$findElements(using = "css",value = "#reviewSectionComments > div > div.Review-comment-right > div.Review-comment-bubble > div.Review-comment-body > p.Review-comment-bodyText")
  tmp_review_list <- sapply(tmp_review_nodes, function(x) {x$getElementText()} )
  tmp_review_vec <- unlist(tmp_review_list)
  
  if (page_num%%5==0) {
    cat(page_num, "페이지에서 댓글", length(tmp_review_vec), "개를 가져옴\n")
  }
  result_text <- c(result_text, tmp_review_vec)
  
  next_btn <- driver$findElement("css", "#reviewSection > div:nth-child(4) > div > span:nth-child(3) > i")
  Sys.sleep(1)
  result <-tryCatch({next_btn$clickElement()}, 
           error = function( e ) {
             cat(page_num, "페이지에서 (마지막으로) 댓글", length(tmp_review_vec), "개를 가져옴\n");
             return("END")
           } )
  if(result == "END")
    break
  page_num <- page_num + 1
  Sys.sleep(1)
}

cat("총", length(result_text), "개의 댓글 추출\n")
write(result_text, "hotel.txt")



# [ YES24의 명견만리 댓글 읽어오기 ]

library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4445, browserName = "chrome")
remDr$open()
remDr$navigate("http://www.yes24.com/24/goods/40936880")


webElem <- remDr$findElement("css", "body")
remDr$executeScript("scrollTo(0, 0)", args = list(webElem))
Sys.sleep(1)
remDr$executeScript("scrollBy(0, 2500)", args = list(webElem))
Sys.sleep(1)
remDr$executeScript("scrollBy(0, 2500)", args = list(webElem))
Sys.sleep(1)
remDr$executeScript("scrollBy(0, 1000)", args = list(webElem))
Sys.sleep(3)
repl_v = NULL
endFlag <- FALSE
page <- 3

repeat {
  for(index in 3:7) {
    fullContentLinkCSS <- paste("#infoset_reviewContentList > div:nth-child(",index,") > div.btn_halfMore > a", sep='')
    fullContentLink<-remDr$findElements(using='css selector',  fullContentLinkCSS)
    if (length(fullContentLink) == 0) {
      endFlag <- TRUE
      break
    }
    sapply(fullContentLink,function(x){x$clickElement()})      
    Sys.sleep(1)
    fullContentCSS <- paste("div:nth-child(",index,") > div.reviewInfoBot.origin > div.review_cont > p", sep='')
    fullContent<-remDr$findElements(using='css selector', fullContentCSS)
    print(fullContent)
    repl <-sapply(fullContent,function(x){x$getElementText()})    
    print(repl)
    repl_v <- c(repl_v, unlist(repl))
  }
  if(endFlag)
    break;  
  
  if(page == 10){
    page <- 3
    nextPageCSS <- "#infoset_reviewContentList > div.review_sort.sortTop > div.review_sortLft > div > a.bgYUI.next"
  }
  else{
    page <- page+1;
    nextPageCSS <- paste("#infoset_reviewContentList > div.review_sort.sortTop > div.review_sortLft > div > a:nth-child(",page,")",sep="")
  }
  remDr$executeScript("scrollTo(0, 0)", args = list(webElem))
  nextPageLink<-remDr$findElements(using='css selector',nextPageCSS)  
  sapply(nextPageLink,function(x){x$clickElement()})  
  Sys.sleep(5)
  print(page)
}
write(repl_v, "yes24.txt")


