

#이용주


#################################
# naver webtoon scrap excersise #
#################################

rm(list=ls())
library(rvest)

site <- "https://comic.naver.com/genre/bestChallenge.nhn?&page="

comic_list <- NULL
i<-1
url <- paste(site, i, sep="")

while(1){
  page <- read_html(url)
  comics <- page %>% html_nodes('.challengeInfo')
  
  comicName <- comics %>%  html_nodes('.challengeTitle') %>% html_text()
  comicName <- gsub("  ","",comicName)
  comicName <- gsub("\r","",comicName)
  comicName <- gsub("\n","",comicName)
  
  comicSum <- comics %>%  html_nodes('.summary') %>% html_text()
  
  comicGrade <- comics %>%  html_nodes('.rating_type') %>% html_text()
  comicGrade <- gsub("  ","",comicGrade)
  comicGrade <- gsub("\r","",comicGrade)
  comicGrade <- gsub("\n","",comicGrade)
  comicGrade <- gsub("평점","",comicGrade)
  
  comic_info <- data.frame(comicName,comicSum,comicGrade);
  comic_list <- rbind(comic_info, comic_list)
  
  page_count <- page %>% html_nodes('.cnt_page')
  if(i!=1 && length(page_count)==1){break}
  else {
    i <- i+1
    url<-paste(site, i, sep="")
  }
}
write.csv(comic_list,"./data/navercomic.csv")



