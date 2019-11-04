install.packages("rvest")
library(rvest)

url <- "http://unico2013.dothome.co.kr/crawling/tagstyle.html"
url <- "http://54.180.96.153"
text <- read_html(url)
text

nodes <- html_nodes(text,"div")
nodes

title <- html_nodes(text, "title")
title



node1 <- html_nodes(text, "div:nth-of-type(1)")
node1
html_text(node1)
html_attr(node1,"style")

# url_1 <- "https://movie.naver.com/movie/point/af/list.nhn?st=mcode&sword=179482&target=after"
url_1 <- "https://movie.naver.com/movie/point/af/list.nhn"
m_page <- read_html(url_1)

# m_page
# m_title <- m_page %>% html_nodes("[id *= current_movie]") %>% html_nodes("[value *= \"179482\"]") %>% html_text(); m_title
# m_title <- m_page %>% html_nodes("[id *= current_movie] > * ")%>% html_text(); m_title
# 
# m_title <- m_page %>% html_nodes("[id *= current_movie]") %>% html_nodes("[value *= \"179482\"]") %>% html_text(); m_title


#영화제목
m_title <- html_nodes(m_page, ".movie") %>% html_text(); m_title

#영화리뷰
m_review <- html_nodes(m_page,".title") %>% html_nodes("text") %>% html_text(trim=T); m_review

m_review <- gsub("\t", "", m_review); m_review
m_review <- gsub("\r\n", "", m_review); m_review
m_review <- gsub("\n", "", m_review); m_review

page <- data.frame(m_title, m_review); page
write.csv(page,"./data/moview_reviews.csv")



####################################### Ver. 2
rm(list=ls())

site <- "https://movie.naver.com/movie/point/af/list.nhn?page="

movie_review <- NULL

for(i in 1:100){

  url_2 <- paste(site, i, sep="")
  
  text <- read_html (url_2, encoding="CP949")
  
  #영화제목
  movie_t <- html_nodes(text, ".movie") %>% html_text(); movie_t
  
  #영화리뷰
  movie_r <- html_nodes(text,".title") %>% html_text(trim=T); movie_r
  
  movie_r <- gsub("\t", "", movie_r);
  movie_r <- gsub("\r\n", "", movie_r);
  movie_r <- gsub("\n", "", movie_r);
  movie_r <- gsub("신고", "", movie_r);
  
  page <- data.frame(movie_t, movie_r);
  movie_review <- rbind(movie_review, page);

}
write.csv(movie_review,"./data/moview_reviews_2.csv")


