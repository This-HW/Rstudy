

# 이용주

#############################################
#       naver webtoon text scrapping        #
#############################################

library(rvest)
library(RSelenium)

remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()

remDr$navigate("http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135")

lst_review <- NULL

reviewNodes <- remDr$findElements(using = "css selector", "#cbox_module > div > div.u_cbox_content_wrap > ul > li div.u_cbox_comment_box > div > div.u_cbox_text_wrap > span.u_cbox_contents")
reviewNodes <- sapply(reviewNodes, function(x){x$getElementText()[[1]]})
lst_review <- c(lst_review, reviewNodes)


for(i in 3:12){
  if(i==3){
    more1 <- remDr$findElement(using = "css", "span.u_cbox_in_view_comment")
    more1$clickElement()
  }else {
  nextCss <- paste0("#cbox_module  a:nth-child(",i,") > span")
  nextPage <- remDr$findElement(using='css', nextCss)
  nextPage$clickElement()
  }
  reviewNodes <- remDr$findElements(using = "css selector", "#cbox_module > div > div.u_cbox_content_wrap > ul > li div.u_cbox_comment_box > div > div.u_cbox_text_wrap > span")
  reviewNodes <- sapply(reviewNodes, function(x){x$getElementText()[[1]]})
  lst_review <- c(lst_review, reviewNodes)
  
  Sys.sleep(1)
}
write(lst_review, "./data/webtoon1.txt")