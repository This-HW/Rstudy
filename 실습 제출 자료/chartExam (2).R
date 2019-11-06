#문제 1
product <- readLines("data/product_click.log")
n_product <- table(substr(product,14,17))

png(filename="clicklog1.png", height=400, width=700, bg="white") # 출력을 png파일로 설정
barplot(n_product, main="세로바 그래프 실습", xlab="상품ID", ylab="클릭수", col=terrain.colors(10))
dev.off()

#문제 2
time <- as.numeric(substr(product,9,10))
t_product <- table(paste0(time,"~",time+1))
t_product <- t_product[c(1,2,12,13,14,15,16,17,3,4,5,6,7,8,9,10,11)]

png(filename="clicklog2.png", height=400, width=700, bg="white") # 출력을 png파일로 설정
pie(t_product, col = rainbow(17), radius = 1, main= "파이그래프 실습")
dev.off()
