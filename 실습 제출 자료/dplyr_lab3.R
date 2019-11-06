

# 이용주

###############################################
#               dplyr exercise                #
###############################################

library(dplyr)
library(ggplot2)
#7-1
mpg<-as.data.frame(ggplot2::mpg)
mpg2 <- mpg
mpg2$fe_sum <- mpg2$cty + mpg2$hwy

#7-2
mpg2$fe_avg <- mpg2$fe_sum /2

#7-3
mpg2 %>% arrange(desc(fe_avg)) %>%
  head(3)

#7-4
mpg %>% mutate(fe_sum = (mpg2$cty + mpg2$hwy)) %>%
  mutate(fe_avg = ((mpg2$cty + mpg2$hwy)/2)) %>%
  arrange(desc(fe_avg)) %>%
  head(3)

#8-1
mpg %>% group_by(class) %>%
  summarise(class_cty=mean(cty))

#8-2
mpg %>% group_by(class) %>%
  summarise(class_cty=mean(cty)) %>%
  arrange(desc(class_cty))

#8-3
mpg %>% group_by(manufacturer) %>%
  arrange(desc(hwy)) %>%
  head(3)

#8-4
mpg %>% group_by(manufacturer) %>%
  count(class="compact") %>%
  arrange(desc(n)) %>%
  head(3)

#9-1
mpg[1,]
fuel <- data.frame(fl = c("c", "d", "e", "p", "r"),
                   price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22),
                   stringsAsFactors = F)
fuel
mpg <- ggplot2::mpg
mpg <- left_join(mpg, fuel,by="fl")

#9-2
mpg %>% select(model, fl, price_fl) %>% head(5)

#10-1
midwest <- as.data.frame(ggplot2::midwest)
midwest$ty_rate <- ((midwest$poptotal - midwest$popadults) / (midwest$poptotal) * 100)
midwest %>% head(3)

#10-2
midwest %>% group_by(county) %>%
  summarise(mean=mean(ty_rate)) %>%
  arrange(desc(mean)) %>%
  head(5)

#10-3
midwest$grade <- ifelse(midwest$ty_rate>40, "large", ifelse(midwest$ty_rate>30, "middle", "samll"))
midwest %>% group_by(grade) %>%
  summarise(n=n())
View(midwest)

#10-4
midwest$ta_rate <- midwest$popasian / midwest$poptotal * 100
midwest %>% select(state, county, ta_rate) %>%
  arrange(ta_rate) %>% tail (10)

#11-1
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65, 124, 131, 153,212), "hwy"] <- NA
a <- mpg %>% filter(is.na(drv)) %>% count()
cat("drv변수 결측치 : ",as.numeric(a),"\n")
b<- mpg %>% filter(is.na(hwy)) %>% count()
cat("hwy변수 결측치 : ",as.numeric(b),"\n")

#11-2
mpg %>% filter(!is.na(hwy)) %>%
  group_by(trans)%>%
  summarise(hwy_mean=mean(hwy))%>%
  arrange(desc(hwy_mean))

#12-1
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(10, 14, 58, 93), "drv"] <- "k"
mpg[c(29, 43, 129, 203), "cty"] <- c(3,4,39,42)
table(mpg$drv)
mpg$drv <- ifelse(mpg$drv %in% "k", NA, mpg$drv)
table(mpg$drv)

#12-2
boxplot(mpg$cty)
boxplot(mpg$cty)$stat
mpg$cty <- ifelse(mpg$cty < 9 | mpg$cty >26 , NA, mpg$cty)

#12-3
mpg %>% filter(!is.na(drv) & !is.na(cty)) %>%
  group_by(drv) %>%
  summarise(cty_mean = mean(cty))