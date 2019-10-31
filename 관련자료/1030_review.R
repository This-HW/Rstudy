site <- "https://comic.naver.com/genre/bestChallenge.nhn?&page="

#마지막페이지 알아내기 : 현재페이지 < 카운팅페이지 
countPage = 0
pageNum = 0
i = 1
while (pageNum>=countPage) {
  url<-paste(site,i,sep="")
  text <- read_html(url)
  nodes<-html_nodes(text, "#content > div.paginate > div > strong.page > em")
  pageNum<-as.numeric(html_text(nodes, trim=T))
  cat(pageNum, ":", countPage, "\n")
  countPage<-countPage+1
  i = i + 1;
}

bestpage <- NULL
#크롤링
for(i in 1:countPage){
  url<-paste(site,i,sep="")
  text <- read_html(url)
  text
  nodes<-html_nodes(text, ".challengeInfo > h6 > a")
  comicName<-html_text(nodes, trim=T)
  comicName<-gsub("\t", "" ,comicName)
  comicName<-gsub("[\r\n]", "" ,comicName)
  comicName<-gsub("\n", "" ,comicName)
  
  nodes<-html_nodes(text, ".summary")
  comicSummary<-html_text(nodes)
  comicSummary<-html_text(nodes, trim=T)
  comicSummary<-gsub("\t", "" ,comicSummary)
  comicSummary<-gsub("[\r\n]", "" ,comicSummary)
  comicSummary<-gsub("\n", "" ,comicSummary)
  
  nodes<-html_nodes(text, ".rating_type")
  comicGrade<-html_text(nodes, trim=T)
  comicGrade<-gsub("평점", "" ,comicGrade)
  comicGrade<-gsub(" ", "" ,comicGrade)
  comicGrade<-gsub("\t", "" ,comicGrade)
  comicGrade<-gsub("[\r\n]", "" ,comicGrade)
  comicGrade<-gsub("\n", "" ,comicGrade)
  comicpage  <- data.frame(comicName,comicSummary,comicGrade)
  bestpage <-rbind(bestpage,comicpage)
}

write.csv(bestpage, "navercomic.csv")






#방법2
site = "https://comic.naver.com/genre/bestChallenge.nhn?page="
result = NULL
i = 0
repeat{
  i = i + 1
  
  url = paste(site,i,sep="")
  text = read_html(url)
  
  nodes = html_nodes(text, 'div.challengeInfo > h6 > a')
  comicName = html_text(nodes, trim = TRUE)
  
  nodes = html_nodes(text, 'div.challengeInfo > div.summary')
  comicSummary = html_text(nodes, trim = TRUE)
  
  nodes = html_nodes(text, 'div.challengeInfo > div.rating_type > strong')
  comicGrade = html_text(nodes, trim = TRUE)
  
  nodes = html_nodes(text, 'div.paginate > div > strong.page > em')
  endpage = html_text(nodes, trim = TRUE)
  cat(i, ":", endpage, "\n")
  
  page = data.frame(comicName, comicSummary, comicGrade)
  result = rbind(result, page)
  if(i > as.numeric(endpage))
    break()
}   

site <- "https://comic.naver.com/genre/bestChallenge.nhn?&page="
page_num <- 0
pre_summary_first <- ""
result_df <- data.frame()

while (TRUE) {
  page_num <- page_num + 1
  cat(page_num, "\n")
  url <- paste0(site, page_num)
  text <- read_html(url)
  
  # 첫 번째 summary를 비교해서 마지막 페이지인지 확인하기
  summary_first <- html_text(html_node(text, "div.summary"), trim = T)
  if (summary_first == pre_summary_first) {
    break
  }
  pre_summary_first <- summary_first  # 다음 번 비교를 위해 summary 복사
  
  # 각 변수 생성
  nodes <- html_nodes(text, "div.challengeInfo > h6 > a")
  comicName <- html_text(nodes, trim = T)
  nodes <- html_nodes(text, "div.summary")
  comicSummary <- html_text(nodes)
  nodes <- html_nodes(text, "div.rating_type > strong")
  comicGrade <- html_text(nodes)
  
  tmp_df <- data.frame(comicName, comicSummary, comicGrade)
  result_df <- rbind(result_df, tmp_df)
  
  # 비교를 위해 텍스트 카피
  pre_text <- text
}


base_url = "https://comic.naver.com/genre/bestChallenge.nhn?&page="
results = NULL
i = 1
while (i) {
  if (i %% 10 == 0){
    cat("Now Crawling on Page Number:", i, "\n")
  }else if (i == 1){
    cat("Now Crawling on Page Number:", i, "\n")
  }
  
  url = paste0(base_url, i)
  html = read_html(url, encoding = "UTF-8")
  
  title_nodes = html_nodes(html, 'h6 > a')
  title = html_text(title_nodes, trim = T)
  title = gsub("\r\n", "", title)
  
  summary_nodes = html_nodes(html, ".summary")
  summary = html_text(summary_nodes, trim = T)
  
  star_nodes = html_nodes(html, ".rating_type > strong")
  star = html_text(star_nodes)
  
  page = data.frame(comicName = title, comicSummary = summary, comicGrade = star)
  results = rbind(results, page)
  
  page_num_nodes = html_nodes(html, ".page")
  page_num = html_text(page_num_nodes)
  page_num = gsub(" 현재 페이지", "", page_num)
  
  if (i < as.numeric(tail(page_num,1))){
    i = i + 1
  }else{
    break
  }
  cat(page_num, ":", i, "\n")
}


url = "https://comic.naver.com/genre/bestChallenge.nhn"
site = "https://comic.naver.com"

navercomic = NULL

while (1) {
  text = read_html(url)
  
  comicName = html_text(html_nodes(text, '#content h6 > a'), trim=T)
  comicSummary = html_text(html_nodes(text, '#content div.challengeInfo > div.summary'), trim=T)
  comicGrade = html_text(html_nodes(text, '#content div.challengeInfo > div.rating_type > strong'), trim=T)
  
  df = data.frame(comicName, comicSummary, comicGrade)
  navercomic = rbind(navercomic, df)
  
  nex = html_nodes(text, '#content > div.paginate > div > a.next')
  print(nex)
  if (length(nex) == 0) {
    break;
  }
  url = paste(site, html_attr(nex, 'href'), sep='')
}