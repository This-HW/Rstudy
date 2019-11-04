##이용주


#문제1
mySum <- function(list){
  if(is.null(list))
    return(NULL)
  else if(!is.vector(list))
    stop("벡터만 처리가능")
  else if(sum(is.na(list))>0){
    warning("NA를 0으로 변경하여 처리함!!")
    min<-min(list[!is.na(list)])
    list[is.na(list)]<-min
    new_list <- list
    return(mySum(new_list))
  }
  else{
    result<-c(0, 0)
    names(result) <- c("oddSum", "evenSum")
    length<-length(list)
    for(i in 1:length){
      if(i%%2){
        result[1] <- result[1] + list[i]
      } else{
        result[2] <- result[2] + list[i]
      }      
    }
    return(result)
  }
}
mySum(c(5,3,4,NA))


#문제2
myExpr <- function(f){
  result<-NULL
  if(!is.function(f)){
    # print("2")
    stop("수행 안함")
  }else {
    result <- f(sample(1:45,6))
  }
  return(result)
}


#문제3
createVector <- function(...){
  if(is.null(c(...)))
    return(NULL)
  else if(sum(is.na(c(...))>0))
    return(NA)
  else{
    return(c(...))
  }
}
myExpr(createVector)


#문제4
Q4 <- scan("data/iotest1.txt")
as.numeric(Q4)
cat("오름차순 : ",sort(Q4))
cat("내림차순 : ",sort(Q4, decreasing=T))
cat("합 : ", sum(Q4))
cat("평균 : ", mean(Q4))


#문제5
Q5 <- scan("data/iotest2.txt", what="")
Q5<-as.factor(Q5)
cat("가장 많이 등장한 단어는", names(which.max(table(Q5))),"입니다.")

