

#이용주

##############################
library('rvest')
rm(list=ls())

url <- "http://media.daum.net/ranking/popular"
page <- read_html(url)

newstitle <- read_html(url) %>% html_nodes("#mArticle  div.cont_thumb   a") %>% html_text(); newstitle
newstitle <- gsub("\"","",newstitle);newstitle

newspapername <- page %>% html_nodes('.list_news2') %>% html_nodes('.info_news') %>% html_text(); newspapername

page <- data.frame(newstitle, newspapername); page
write.csv(page,"./data/daumnews.csv")

