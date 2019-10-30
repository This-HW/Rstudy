##이용주
#scraping 실습

# library(rvest)
# rm(list=ls())


contents <- read_html("http://unico2013.dothome.co.kr/crawling/exercise_bs.html"); contents

html_nodes(contents,"h1") %>% html_text()

html_nodes(contents,"a") %>% html_text()
html_nodes(contents,"a") %>% html_attr("href")


html_nodes(contents,"img") %>% html_attr("src")


h2_cont <- html_nodes(contents,"h2")
h2_cont[1] %>% html_text()


ul_cont <- html_nodes(contents,"ul")
html_nodes(ul_cont,"li[style$=green]") %>% html_text()

h2_cont[2]%>% html_text()

html_nodes(contents, "ol > *") %>% html_text()


html_nodes(contents,"table *") %>% html_text()


html_nodes(contents,"[class=name]") %>% html_text()


html_nodes(contents,"[id=target]") %>% html_text()

