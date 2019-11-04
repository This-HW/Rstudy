

#이용주

######################################
#       Text mining exercise         #
######################################

# rm(list=ls())
text <- readLines(file("./data/memo.txt", encoding="UTF-8"))

text[1] <- gsub("&","",text[1]) 
text[1] <- gsub("\\$","",text[1]) 
text[1] <- gsub("!","",text[1]) 
text[1] <- gsub("#","",text[1]) 
text[1] <- gsub("@","",text[1]) 
text[1] <- gsub("%","",text[1]) 
text[1]

text[2] <- toupper(text[2])
text[2]

text[3] <- gsub("1", "", text[3])
text[3] <- gsub("2", "", text[3])
text[3]

text[4] <- gsub("R", "", text[4])
text[4] <- gsub("Analysis", "", text[4])
text[4] <- gsub("Big", "", text[4])
text[4] <- gsub("Data", "", text[4])
text[4]

text[5] <- gsub("!", "", text[5])
text[5] <- gsub("12", "", text[5])
text[5] <- gsub("34", "", text[5])
text[5] <- gsub("56", "", text[5])
text[5] <- gsub("78", "", text[5])
text[5] <- gsub("<일어>", "일어", text[5])
text[5]

text[6] <- gsub(" ", "", text[6])
text[6]

text[7] <- tolower(text[7])
text[7]

writeLines(text,"./data/memo_new.txt")


############################################################
#                      normalize                           # 
############################################################
text <- readLines(file("./data/memo.txt", encoding="UTF-8"))
gsub("[[:punct]]","",text[1]) 

