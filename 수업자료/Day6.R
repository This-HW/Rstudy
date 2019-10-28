help(read.csv)
search()
installed.packages()
?read_excel
??read_excel
install.packages("readxl")
# library(read)
# library(readxl)
rm(list=ls())

excel_data_ex <- read_excel("data/book/data_ex.xls")
getwd()
View(excel_data_ex)

data_ex <- read.table("data/book/data_ex.txt", header=T)
View(data_ex)

save(data_ex, file="data/class/data_ex.rda", header=T)
load("data/class/data_ex.rda")
data_ex<-read.table("data/class/data_ex.csv", header=TRUE, sep=",")
write.csv(data_ex, "data/class/data_ex.csv")
str(data_ex)
dim(data_ex)
View(data_ex)
ls(data_ex)
