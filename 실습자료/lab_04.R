##이용주

#문제1
L1 = list(name="scott", sal=3000)
L1$result1 = L1$sal*2



#문제2
L2 = list("scott", c(100,200,300))


#문제3
L3 = list(c(3,5,7), c("A", "B", "C"))
L3[[2]][1] = "Alpha"


#문제4
L4 = list(alpha=0:4, beta=sqrt(1:5), gamma=log(1:5))
L4[[1]] + 10


#문제5
L5 = list(math=list(95,90), writhing=list(90, 85), reading=list(85,80)); L5
mean_L5 = mean(unlist(L5)); mean_L5


#문제6
time = 32150
time_hr = floor(time/(60*60))
time_min = ceiling (time/60) - (time_hr*60)
time_sec = time %% 60
paste(time_hr, "시간 ", time_min,"분 ", time_sec,"초")
