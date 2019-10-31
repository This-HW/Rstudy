

#########################################
# naver MAP keword scrapping .By YongJu #
#########################################


library(RSelenium)
library(rvest)

rm(list=ls())

# 경남전지역, 울산광역시, 부산광역시
# -구글맵, 네이버맵, 카카오맵(다음맵)
# -이름,주소,전화번호,로드뷰링크
# (키워드:푸드,유통,에프에스(fs))

remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()

remDr$navigate("https://v4.map.naver.com/?query=울산광역시+푸드")
webElem <- remDr$findElement(using = "css", "#dday_popup > div.popup_content.popup_link > button > span.img")
webElem$clickElement()

target_list <- ""

site_view <- remDr$findElement(using = "css", "#panel > div.panel_content.nano.has-scrollbar > div.scroll_pane.content > div.panel_content_flexible > div.search_result > ul")
# help("sapply")


parsed_site <- site_view$getPageSource()[[1]]
parsed_site <- read_html(parsed_site)

search_lst <- parsed_site %>% html_nodes("dl.lsnx_det")
name <- search_lst %>% html_nodes("dt > a") %>% html_text(); name
address <- search_lst %>% html_nodes("dd.addr") %>% html_text(); address
address <- gsub("지번", "", address)
address <- gsub("  ","", address); address
phone <- search_lst %>% html_nodes("dd.tel") %>% html_text();
phone <- gsub("  ", "", phone); phone
category <- search_lst %>% html_nodes("dd.cate") %>% html_text(); category
# view_url <- search_lst %>% html_nodes("dt > span > span > a") %>% html_attr("href"); view_url

page_list <- data.frame(name, address, category)
page_list
View(page_list)
# taget_list <- rbind()






