##이용주


#문제1
m1<-seq(from=10, to =38, by=2)
m1 <- matrix(m1, nrow=5, ncol=3, byrow=F)

m2 <- m1+100

m_max_v = max(m1)
m_min_v = min(m1)
row_max=apply(m1,1,max)
col_max=apply(m1,2,max)

m1
m2
m_max_v
m_min_v
row_max
col_max


##문제2

n1 = 1:3
n2 = 4:6
n3 = 7:9
m2<- cbind(n1,n2,n3)


#문제3
m3 <- m2
colnames(m3) <- c("col1", "col2", "col3")
rownames(m3) <- c("row1", "row2", "row3")
m3

rm(alpha); rm(alpha2)

alpha <- matrix(letters[1:6], 2, 3)
alpha
alpha2 <- rbind(alpha, c('x', 'y', 'z'))
alpha2
alpha3 <- cbind(alpha, c('s,p'))




