

#이용주

####################################################
#         Starbucks store location parsing         #     
####################################################
# install.packages("tidyr")

library(RSelenium)
library(tidyr)

remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445 , browserName = "chrome")
remDr$open()
remDr$navigate("https://www.istarbucks.co.kr/store/store_map.do?disp=locale"); Sys.sleep(1)

button <- remDr$findElement("css", "#container > div > form > fieldset > div > section > article.find_store_cont > article > article:nth-child(4) > div.loca_step1 > div.loca_step1_cont > ul > li:nth-child(1) > a")
button$clickElement(); Sys.sleep(1)

button <- remDr$findElement("css", "#mCSB_2_container > ul > li:nth-child(1) > a")
button$clickElement(); Sys.sleep(1)

shopname<-NULL; details <- NULL; lat <- NULL; lng <- NULL

for(i in 1:503){
  
  path <- paste0("#mCSB_3_container > ul > li:nth-child(",i,") > strong")
  name <- remDr$findElement("css", path)
  shopname <- c(shopname,name$getElementText()[[1]])
  
  path <- paste0("#mCSB_3_container > ul > li:nth-child(",i,") > p")
  detail <- remDr$findElement("css", path)
  details <- c(details,detail$getElementText()[[1]])

  path <- paste0("#mCSB_3_container > ul > li:nth-child(",i,")")
  position <- remDr$findElement("css", path)
  lat <- c(lat,position$getElementAttribute("data-lat")[[1]])
  lng <- c(lng,position$getElementAttribute("data-long")[[1]])
  
  if(i%%3==0){
  remDr$executeScript(
  "var su=arguments[0]; var dom=document.querySelectorAll(
          '#mCSB_3_container > ul > li')[su]; dom.scrollIntoView();",list(i))
  }
}
View(lat)

result <- data.frame(shopname, lat, lng, details)
result<-result %>% separate(details, c("addr","telephone"), sep="\n")

write.csv(result, "./data/starbucks.csv")
