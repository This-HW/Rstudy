

#이용주


################################################
#             2019. 11. 01 R- study            #
################################################

remDr$navigate("http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135")

more1 <- remDr$findElement(using = "css", "span.u_cbox_in_view_comment")
more1$clickElement()


# for(i in 4:12){
#   # nextCss <- paste0("#cbox_module > div > div.u_cbox_paginate > div > a:nth-child(",i,") > span")
#   nextCss <- paste0("#cbox_module  a:nth-child(",i,") > span")
#   nextPage <- remDr$findElement(using='css', nextCss)
#   nextPage$clickElement()
#   Sys.sleep(1)
# }
# 
# while(1){
#   nextPage <- remDr$findElement(using='css', "#cbox_module > div > div.u_cbox_paginate > div > a:nth-child(13) > span.u_cbox_cnt_page")
#   nextPage$clickElement()
#   Sys.sleep(1)
# }

bestReviewNodes <- remDr$findElements(using = "css selector", "#cbox_module > div > div.u_cbox_content_wrap > ul > li div.u_cbox_comment_box > div > div.u_cbox_text_wrap > span")
sapply(bestReviewNodes, function(x){x$getElementText()})

##############
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

test<-NULL
test<-remDr$findElement(using='css',
                        '#customer-reviews-panel > span')
test

remDr$executeScript("scrollBy(0, 8400)")
remDr$executeScript("scrollBy(0, -4200)")

