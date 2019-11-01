

#이용주

####################################################
#         Starbucks store location parsing         #     
####################################################
install.packages("tidyr")

library(RSelenium)
library(tidyr)

remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445 , browserName = "chrome")
remDr$open()
remDr$navigate("https://www.istarbucks.co.kr/store/store_map.do?disp=locale")
Sys.sleep(1)

button <- remDr$findElement("css", "#container > div > form > fieldset > div > section > article.find_store_cont > article > article:nth-child(4) > div.loca_step1 > div.loca_step1_cont > ul > li:nth-child(1) > a")
button$clickElement()
Sys.sleep(1)

button <- remDr$findElement("css", "#mCSB_2_container > ul > li:nth-child(1) > a")
button$clickElement()
Sys.sleep(1)

shopname<-NULL
details <- NULL
for(i in 1:503){
    if(i%%3==0){
      remDr$executeScript(
        "var su=arguments[0]; var dom=document.querySelectorAll(
                '#mCSB_3_container > ul > li')[su]; dom.scrollIntoView();",list(i))
    }
  path <- paste0("#mCSB_3_container > ul > li:nth-child(",i,") > strong")
  name <- remDr$findElement("css", path)
  name <- name$getElementText()
  shopname <- c(shopname,name)

  path <- paste0("#mCSB_3_container > ul > li:nth-child(",i,") > p")
  detail <- remDr$findElement("css", path)
  detail <- detail$getElementText()
  details <- c(details, detail)
}
# shopname
list <- data.frame(shopname,details)
seperate(data=list, col=details, sep="\n", into=c("addr","telephone"))


