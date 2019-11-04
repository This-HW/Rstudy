##이용주

#문제1
exam5 <- function(x, y="#"){
  if(x<0) {break;}
  else{
    cat(rep(y,x),"\n",sep="")
  }
}
exam5(9,"aaaa")


#문제2
exam6 <- function(score=NA){
  if(is.na(score)) {
    print("NA는 처리불가")
  }else{
    
    ifelse(score>=85, grade<-"상",
           ifelse(score>=70, grade<-"중",grade<-"하"))
    print(grade)
  }
}
exam6(80); exam6(); exam6(100); exam6(60)


#문제3
countEvenOdd <- function(n_list){
  if(is.vector(n_list) & is.numeric(n_list[1])){
    even <-0
    odd <-0
    for(i in 1:length(n_list)){
      if((n_list[i]%%2)==0){
        even <- even + 1
      }else{
        odd <- odd + 1
      }
    }
    result<-c(even,odd)
    names(result)<-c("even","odd")
    return(result)
  }else return(NULL)
}
countEvenOdd(c(1,3,5,6,3,3,3,3,3,10,0))


#문제4
vmSum <- function(x="a"){
  result<-0
  if(!is.vector(x)){
    return<-"벡터만 전달해라!"
    return()
  }else if(!is.numeric(x)){
    print("숫자 벡터를 전달해라!")
    return(result)
  }else{
    for(i in 1:length(x)){
      result <- result+x[i]
    }
    return(result)
  }
}
vmSum(1); vmSum(c(1,3,5)); vmSum(c(1111,3333,5555)); vmSum(c(1,3,5,"a")); vmSum(); vmSum(data.frame())

vmSum2 <- function(x="a"){
  result<-0
  if(!is.vector(x)){
    stop("벡터를 전달해라!")
    return()
  }else if(!is.numeric(x)){
    warning("숫자 벡터를 전달해라!")
    return(result)
  }else{
    for(i in 1:length(x)){
      result <- result+x[i]
    }
    return(result)
  }
}
vmSum2(1); vmSum2(c(1,3,5)); vmSum2(c(1111,3333,5555)); vmSum2(c(1,3,5,"a")); vmSum2(); vmSum2(data.frame())

