
#이용주


###############################
rm(list=ls())

url <- "https://movie.daum.net/moviedb/grade?movieId=121137&type=netizen"
page <- read_html(url)

score <- page %>% html_nodes('.emph_grade') %>% html_text(); score
review <- page %>% html_nodes('.desc_review') %>% html_text(); review

review <- gsub("\n", "", review);review;
review <- gsub("  ", "", review);review;

page <- data.frame(score, review); page
write.csv(page,"./data/daummovie1.csv")
