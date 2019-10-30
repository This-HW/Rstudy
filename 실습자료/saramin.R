

#이용주

####################################
#     wepsite crowing excercise    #
####################################

library(rvest)
rm(list=ls())

site <- read_html("http://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=n&searchType=default_mysearch&searchword=DATA%20SCIENTIST")
sel_box <- site %>% html_nodes(".swiper-wrapper.list_sfilter")
tech_name <- sel_box %>% html_nodes(".txt") %>% html_text()
tech_name <- gsub("#","",tech_name)
tech_name <- tech_name[-length(tech_name)]
info_count <- sel_box %>% html_nodes(".count") %>% html_text()
info_count <- gsub("[()]","",info_count)

data <- data.frame(tech_name,info_count)
# View(data)
write.csv(data,"../data/saramin.csv")
