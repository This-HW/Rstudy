##이용주


#문제1
exam1 <- function(){
  x<-""
  for(i in 1:26 ){
    x[i]<- paste("\"",LETTERS[i],letters[i],"\" ",sep="")
    # x[i]<- paste(LETTERS[i],letters[i],sep="")
  }
  return(x)
}
cat(exam1(), sep="")
# print(exam1())


#문제2
exam2 <- function(x){
  y <- 0
  for(i in 1:x){
    y <- y + i
  }
  return(y)
}
print(exam2(6))



#문제3
exam3 <- function(x, y){
  if(x>=y){
    return(x-y)
  }
  else if(y>x){
    return(y-x)
  }
}
print(exam3(6,3))


#문제4
exam4 <- function(x, y, z){
  
  if((y == "%/%") |( y == "%%")){
    if(x==0) return("오류1")
    if(z==0) return("오류2")
  }
  
  switch(y,
         "+"=return(x+z),
         "-"=return(x-z),
         "*"=return(x*z),
         "%/%"=return(x %/% z),
         "%%"=return(x %% z),
         "규격의 연산자만 전달하세요"
  )
}
print(exam4(1,"%%",0))


#문제5
exam5 <- function(x, y="#"){
  if(x<0) {break;}
  else{
    cat(rep(y,x),"\n",sep="")
  }
}
exam5(9,"aaaa")


