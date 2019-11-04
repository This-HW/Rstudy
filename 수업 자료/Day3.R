install.packages("readxl")

nums <- scan("data/sample_num.txt")
word_ansi <- scan("data/sample_ansi.txt", what="")
word_ansi <- scan("data/sample_ansi.txt", what="")


#if else

randomNum = sample(1:10, 1)
if(randomNum > 5){
  cat(randomNum, " : 5보다 크군요", "\n")
} else{
  cat(randomNum, ":5보다 작거나 같군요", "\n")
}

if(randomNum%%2){
  cat(randomNum, ":홀수\n")
} else{
  cat(randomNum,":짝수", "\n")
}

score = sample(1:100,1); score
if(score >= 90){
  cat(score, "는 A등급입니다.\n")
}else if(score >= 80){
  cat(score, "는 B등급입니다.\n")
}else if(score >= 70){
  cat(score, "는 C등급입니다.\n")
}else if(score >= 60){
  cat(score, "는 D등급입니다.\n")
}else {
  cat(score, "는 F등급입니다.\n")
}

#for실습
for(data in month.name)
  print(data)
for(data in month.name) print(data); print("ㅋㅋ")
for(data in month.name) {print(data); print("ㅋㅋ")}
for(data in month.name) cat(data,"  " )


for(i in 1:5)
  for(j in 1:5){
    cat("i=", i, "j=", j,"\n")
  }


#구구단
for(dan in 1:9){
  for(num in 1:9)
    cat(dan,"x",num,"=",dan*num, "\t")
  cat("\n")
}



#switch문을 대신하는 함수
month = sample(1:12, 1)
month = paste(month, "월", sep="")
result = switch(month, 
                "12월"=,"1월"=,"2월"="겨울",
                "3월"=,"4월"=,"5월"="봄",
                "6월"=,"7월"=,"8월"="여름",
                "가을"
                )
cat(month,"은", result,"입니다.\n", sep="")


num <- sample(1:10,1)
num
switch(num, "A", "B", "C", "D")

for(num in 1:10){
  cat(num, ":", switch(num, "A", "B", "C", "D"))
}

for(num in 1:10){
  num = as.character(num)
  cat(num,":", switch(num,
                      "7"="A", "8"="B",  "9"="C", "10"="D", "ㅋ"), "\n")
}
