myfunction <- function(){
  print(LETTERS[1])
  print(LETTERS[2])
  today<-weekdays(Sys.Date())
  if(today=="금요일")
    return()
  print(LETTERS[3])
  print(LETTERS[4])
  return("END")
}
myfunction()


testError <- function(x){
  if(x<=0){
    print("22222222222222222222")
    stop("양의 값만 전달하라. 더 이상 수행하지 않음")}
    return(rep("테스트",x))
}

testError(5)
testError(0)



test1 <- function(p){
  cat("난 수행함\n")
  testError(-1)
  cat("수행할까요?\n")
}
test1()


#try()
test2 <- function(p) {
  cat("난 수행함\n")
  try(testError(-1))
  cat("나 수행할까요? \n")
}
test2()

testWarn <- function(x){
  if(x<=0)
  stop("양의 값만 전달")
  if(x>5){
    x<--5
    warning("5보다 작아야함. 5로 처리함")
  }
  return(rep("테스트",x))
}

testAll <-function(p){
  tryCatch({
    if(p=="오류테스트"){
      print("111111111111111111111")
      testError(-1)
    }else if (p =="경고테스트"){
      testWarn(6)
    }else{
      cat("정상 수행..\n")
      print(testError(2))
      print(testWarn(3))
    }
  },warning = function(w){
    print("333333333333333333333333")
    print(w)
    cat("-.-;;\n")
  }, error = function(e){
    print("44444444444444444444444444")
    # print(e)
    cat("ㅠㅠ \n")
  },finally ={
    cat("오류, 경고 발생 여부를 따라서 반드시 수행되는 부분입니다요..\n")
  })
}

testAll("오류테스트")
testAll("경고테스트")
testAll("아무거나")



f.case1 <- function(x){
  if(is.na(x))
    return("NA가 있다.")
  else
    return("NA가 없다.")
}

f.case1(100)
f.case1(NA)
f.case1(c(10,20,39))

testSleep <- function(x){
  for(data in 6:10){
    cat(data,"\n")
    if(x)
      Sys.sleep(1)
  }
  return()
}
testSleep(F)
testSleep(T)
