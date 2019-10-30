
#이용주


###############################
rm(list=ls())

site <- "https://movie.daum.net/moviedb/grade?movieId=121137&type=netizen&page="
movie_review <- NULL

for(i in  1:100){

  url <- paste(site, i, sep="")
  page <- read_html(url)
  
  score <- page %>% html_nodes('.emph_grade') %>% html_text(); score
  review <- page %>% html_nodes('.desc_review') %>% html_text(); review
  
  review <- gsub("\n", "", review);review;
  review <- gsub("  ", "", review);review;
  
  
  page <- data.frame(score, review); page
  movie_review <- rbind(movie_review, page);
}

write.csv(movie_review,"./data/daummovie2.csv")

