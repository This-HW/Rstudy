

#이용주

##########################################################
#                     dplyr exercise                     #
##########################################################


emp <- read.csv("./data/emp.csv")

#문제2
emp %>% filter(job=="MANAGER")

#문제2
emp %>% select(empno, ename, sal)

#문제3
emp %>% select(-empno)

#문제4
emp %>% select(ename, sal)

#문제5
emp %>% group_by(job) %>% count()

#문제6
emp %>%
  select(ename, sal, deptno) %>%
  filter(1000<sal & sal<3000)

#문제7
emp %>% select(ename, job, sal) %>%
  filter(job!="ANALYST")

#문제8
emp %>% select(ename, job) %>%
  filter(job == "SALESMAN" | job== "ANALYST")

#문제9
emp %>% group_by(deptno) %>%
  summarise(sal_sum = sum(sal))
  
#문제10
emp %>% arrange(sal)
  
#문제11
emp %>% arrange(desc(sal)) %>%
  head(1)

#문제12
empnew <- emp %>% rename("salary"="sal", "commrate" = "comm")

#문제13
emp %>% group_by(deptno) %>%
  count() %>%
  arrange(desc(n)) %>%
  select(deptno) %>%
  head(1)

#문제14
emp %>% mutate(enamelength = nchar(as.character(ename))) %>%
  arrange(enamelength) %>%
  select(ename)
  
#문제15
emp %>% filter( comm != "NA") %>% count()

