click <- read.table("product_click.log")
names(click) <- c("date", "ID")
head(click)

clicktime <- strptime(click$date,format = '%Y%m%d%H%M')
hour <- format(clicktime,'%H')
ht <- table(hour)
lb <- sort(unique(hour))
pie(ht,labels = paste(lb,lb+1,sep = "~"), main = "파이그래프 실습", col = rainbow(16))


plot(click$ID, ylim = c(0,100), main = '세로바 그래프 실습', xlab = "상품ID", ylab = '클릭 수', col = terrain.colors(10))
barplot(table(click$ID), ylim = c(0,100), main = '세로바 그래프 실습', xlab = "상품ID", ylab = '클릭 수', col = terrain.colors(10))

png(filename = 'bar.png', width = 700, height = 400, bg='white')
barplot(table(click$ID), ylim = c(0,100), main = '세로바 그래프 실습', xlab = "상품ID", ylab = '클릭 수', col = terrain.colors(10))
dev.off()



