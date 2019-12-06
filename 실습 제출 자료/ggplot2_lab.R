

# 이용주

#############################################################
#                       ggplot exercise                     #    
#############################################################


library(ggplot2)
library(dply)

#문제1
mpg <- as.data.frame(ggplot2::mpg)
ggplot(mpg, aes(x=cty, y=hwy)) + geom_point(size=2, colour="blue")
ggsave("./data/result1.png")


#문제2
ggplot(mpg, aes(x=class)) + geom_bar(aes(fill=drv))
ggsave("./data/result2.png")


#문제3
midwest <- as.data.frame(ggplot2::midwest)
ggplot(midwest, aes(x=poptotal, y=popasian,  options(scipen = 99))) + geom_point(size=1) + coord_cartesian(ylim=c(0, 10000), xlim=c(0, 500000))
ggsave("./data/result3.png")


#문제4
mpg2<- mpg %>% filter(class==c("compact", "subcompact", "suv")); mpg2
mpg3<- mpg %>% filter(class=="compact" | class=="subcompact" | class== "suv"); mpg3
View(mpg)
write.csv(mpg)
left_join(mpg, mpg2, by="id")
View(mpg%>%filter(class==c("compact", "subcompact", "suv")))
mpg %>% filter(class==c("compact", "subcompact", "suv")) %>% ggplot(aes(x=class, y=cty)) + geom_boxplot() + coord_cartesian(ylim=c(10, 35))
ggplot(mpg2, aes(x=class, y=cty)) + geom_boxplot()
ggplot(mpg, aes(x=class, y=cty)) + geom_boxplot() + coord_cartesian(ylim=c(10, 35)) + scale_x_discrete(limits=c("compact","subcompact","suv"))
ggsave("./data/result4.png")


#문제5
product_click <- read.table("./data/product_click.log")
ggplot(product_click, aes(x=V2)) + geom_bar(aes(fill=V2))
# ggsave("./data/result5.png")


#문제6
day <- as.Date(substr(product_click$V1,1,8),"%Y%m%d")
day <- weekdays(day)
weeks <- as.data.frame(day)
ggplot(weeks, aes(x=day)) + geom_bar(aes(fill=day))+ labs(x="요일", y="클릭수") + theme_bw()
# ggsave("./data/result6.png")
