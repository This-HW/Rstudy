

#이용주

#######################################
#             dplyr exercise          # 
#######################################

library(dplyr)
library(ggplot2)

#문제1
mpg <- as.data.frame(ggplot2::mpg)

#1-1
length(mpg[1,])
length(mpg[,1])

#1-2
mpg %>% head(10)

#1-3
mpg %>% tail(10)

#1-4
View(mpg)

#1-5
summary(mpg)

#1-6
str(mpg)


#문제2
#2-1
cpy_mpg <- mpg %>% rename("city"="cty", "highway"="hwy")

#2-2
cpy_mpg %>% head()


#문제3
#3-1
midwest <- as.data.frame(ggplot2::midwest)

#3-2
midwest <- midwest %>% rename("total" = "poptotal", "asian"="popasian")

#3-3
midwest$asian_perc <- (midwest$asian / midwest$total) *100

#3-4
asian_avg <- mean(midwest$asian_perc)
midwest$a_grade <- ifelse(midwest$asian_perc > asian_avg, "large", "samll")


#문제4
#4-1
mpg %>%   filter(displ<= 4) %>% summarise(mean_displ=mean(displ))
mpg %>%   filter(displ> 4) %>% summarise(mean_displ=mean(displ))
print("배기량이 높은 자동차가 hwy가 더 높다.")

#4-2
mpg %>% filter(manufacturer=="audi") %>% summarise(mean_cty = mean(cty))
mpg %>% filter(manufacturer=="toyota") %>% summarise(mean_cty = mean(cty))
print("도요타 자동차가  cty가 더 높다.")

#4-3
mpg %>% filter(manufacturer==c("chevrolet", "ford", "honda")) %>% summarise(mean_hwy = mean(hwy))


#문제5
#5-1
new_mpg <- mpg %>% select("class", "cty")
new_mpg %>% head()

#5-2
new_mpg %>% filter(class=="suv") %>% summarise(mean_cty = mean(cty))
new_mpg %>% filter(class=="compact") %>% summarise(mean_cty = mean(cty))
print("compact 자동차의 cty가 더 높다.")


#문제6
#6-1
mpg %>% filter(manufacturer=="audi") %>%
  arrange(desc(hwy)) %>%
  head(5)