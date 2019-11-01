

# 이용주

#########################################
#     Hotel review parsing exercise     #
#########################################

library(rvest)
library(RSelenium)


remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()

remDr$navigate("https://www.agoda.com/ko-kr/shilla-stay-seocho/hotel/seoul-kr.html?cid=-204# ")
click <- remDr$findElement(using="css", "#SearchBoxContainer > div > div > div.IconBox.IconBox--checkIn.IconBox--focused > div > i")
click$clickElement()

remDr$executeScript("scrollBy(0, 100)")
review_page <- remDr$findElement(using = "css", "#navbar > div > ul > li:nth-child(3) > span")
review_page$clickElement()

reviews <- NULL

while(1){

  # review_t <- remDr$findElements(using="css selector", "div.Review-comment  div.Review-comment-right > div.Review-comment-bubble > div.Review-comment-body > p.Review-comment-bodyTitle")
  # review_t <- sapply(review_t, function(x){x$getElementText()[[1]]})
  # review_t <- gsub("\"", "", review_t)
  # review_t <- as.character(review_t)
  review_c <- remDr$findElements(using="css selector", "div.Review-comment  div.Review-comment-right > div.Review-comment-bubble > div.Review-comment-body > p.Review-comment-bodyText")
  review_c <- sapply(review_c, function(x){x$getElementText()[[1]]})
  # review_c <- as.character(review_c)
  # review_p <- data.frame(review_t, review_c, stringsAsFactors=F)
  # reviews <- rbind(reviews, review_p)
  reviews <- c(reviews, review_c)

  lst_b <- remDr$findElement(using="css", "#reviewSection > div:nth-child(4) > div > span.Review-paginator-numbers > span:nth-child(5)")
  lst_b <- lst_b$getElementText()
  cur_p <- remDr$findElement(using="css", "#reviewSection > div:nth-child(4) > div > span.Review-paginator-numbers > span.Review-paginator-number.Review-paginator-number--current")
  cur_p <- cur_p $getElementText()
  lst_b <- unlist(lst_b); cur_p <- unlist(cur_p)
  
  if(lst_b == cur_p){
    break;
  }
  
  next_b <- remDr$findElement(using="css", '#reviewSection > div:nth-child(4) > div > span:nth-child(3) > i')
  next_b$clickElement()
  
  Sys.sleep(1)
}
cat(length(reviews),"개의 댓글 추출",sep="")
# write.table(reviews, "./data/hotel.txt")
write(reviews, "./data/hotel.txt")
