

# 이용주

#######################################################
#                    Chart exercise                   #
#######################################################


#문제1
library(ggplot2)
mpg <- (ggplot2::mpg)

par(mar=c(5,7,5,7), mfrow=c(1,1))
plot(mpg$cty, mpg$hwy, type="p", xlab="도시연비", ylab="고속도로연비", pch=3) 

#문제2
drv_data <- table(mpg$drv)
barplot(drv_data, col=rainbow(3))

#문제3
par(mar=c(10,5,10,5), mfrow=c(1,1))
boxplot(mpg$hwy~mpg$manufacturer, xlab="", ylab="고속도로연비", las=2, main="*제조사별 고속도로 연비*", col.main="violet", ylim=c(5,40), col=heat.colors(15), yaxs="i")
