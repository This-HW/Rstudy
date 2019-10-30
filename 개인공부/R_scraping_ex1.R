# vex <- c(1,2,3, NA,NA)
# j <- 0
# k <- 0
# for(i in vex){
#   if(is.na(i)){j <- j+1}
#   else{k <- k+1 }
# }
# cat("NA 개수는 ", j,"개이다", sep="")
# cat("NA가 아닌 개수는", k,"개이다", sep="")
# 
# 
# 
# fib <- c(0,1,1,2,3,5,8,13,21,34)
# fib[(fib%%2)==0]
# fib[fib>=3 & fib<=20]
# 
# years <- c(1960,1964,1976,1994)
# names(years) <- c("Kenndey","Johnson","Carter","Clinton")
# years[c("Kenndey", "Clinton")]
# 
# "1276" %in% years


###############################################################################
############################크롤링 예제########################################

# install.packages('rvest')
# library(rvest)
# rm(list=ls())

url <- "http://www.bobaedream.co.kr/cyber/CyberCar.php?gubun=K&page=1"
usedCar <- read_html(url)
usedCar

carInfos <- html_nodes(usedCar, css='.product-item')
head(carInfos)


# carInfos[1] %>% html_nodes('.tit.ellipsis') %>% html_text()
titles <- carInfos %>%  html_nodes('.tit.ellipsis') %>% html_text();
# head(titles)
carfuelInfo <- carInfos %>%  html_nodes('.list-inner') %>%  html_nodes('.mode-cell fuel') %>% html_text()
carfuelInfo



