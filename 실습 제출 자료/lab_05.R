##이용주
rm(list=ls())

#문제1
grade = sample(1:6,1); grade
if(grade<4) {cat(grade,"학년은 저학년입니다.","\n")
  }  else {cat(grade,"학년은 고학년입니다.","\n")}


#문제2
choice = sample(1:5,1)
cat("결과값 : ", switch(choice,
        300+50, 300-50, 300*50, 300/50, 300%%50
        )
)


#문제3
count = sample(3:10,1)
deco = sample(1:3, 1)
switch(deco,
       for(i in 1:count) cat("*"),
       for(i in 1:count) cat("$"),
       for(i in 1:count) cat("#")
       )


#문제4
# score = sample(0:100,1)
# ifelse(score>=90, level<-"A등급",
#        ifelse(score>=80, level<-"B등급",
#               ifelse(score>=70, level<-"C등급",
#                      ifelse(score>=60, level<-"D등급",
#                             level<-"F등급"))))
# cat(score,"점은 ", level,"등급입니다.\n")

score = sample(0:100, 1)
score_lank = score%/%10
score_lank = as.character(score_lank)
lank <-switch(score_lank,
       "9"="A등급",
       "8"="B등급",
       "7"="C등급",
       "6"="D등급",
       "F"
       )
cat(score,"점은 ", lank,"등급입니다.\n")



#문제5
for(i in 1:26 ){
  cat("\"",LETTERS[i],letters[i],"\" ")
}
