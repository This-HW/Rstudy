

#이용주

################################
#      crawling excersise      #
################################



library(httr)
library(rvest)

url <- "http://unico2013.dothome.co.kr/crawling/post.php"
content <- POST(url,
                encode='form', body=list(name='R', age='27'))
text <- html_nodes(read_html(content), 'h1')
text <- html_text(text); text

