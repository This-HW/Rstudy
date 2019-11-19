
library("dplyr")


df <-read.csv("./data/Abc1115.csv")
head(df)

names(df) <- c("std_no", "email", "kor", "eng", "math", "sci", "hist", "total", "mgr_code", "acc_code", "local_code")
df <- df[,-12]
head(df)


#문제1
df_b <- df %>% filter(local_code == "B")
df_b <- df %>% mutate(temp = kor+eng)
df_b <- df_b %>% arrange(desc(temp), std_no)
head(df_b)
df_b
df[5,]%>% select(std_no)

#문제2
df_b %>% arrange(desc(temp)) %>% head(1) %>% select(temp)

#문제3
df_c <- df %>% mutate(temp = eng + math)
score <- c(5, 15, 20)
mgr_code <- c("A", "B", "C")
temp1 <- data.frame(score,mgr_code)
df_c <- left_join(x = df_c,y = temp1, by="mgr_code")
df_c %>% filter(temp>=120) %>% select(total, score) %>% summarise(sum=sum(total)+sum(score))

#문제4
score <- c(5, 10, 15)
local_code <- c("A", "B", "C")
temp2 <- data.frame(score, local_code)
df_l <- left_join(df, temp2, "local_code")
df_l %>% filter(local_code=="A" | local_code== "B") %>% 
  mutate(temp=kor+score) %>% 
  filter(temp>=50) %>% count()


c(1,2,3)+c(3,4,5,6)
x<- c(1,2,3)
y<-c(3,4,5,6,7)
x+y

x <- c(1, 4, NA, 0, 5)
stdev(x, na.rm=TRUE, unbiased=TRUE)


