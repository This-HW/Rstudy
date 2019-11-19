
library(readxl)
library(dplyr)
library(psych)

fine_dust <- read_excel("./data/Seoul_fine-dust.xlsx")
# View(fine_dust)
# str(fine_dust)
fine_dust <- as.data.frame(fine_dust)

dustdata_anal <- fine_dust %>% filter( area %in% c("성북구", "중구"))
# View(dustdata_anal)

# dustdata_anal %>% select(yyyymmdd) %% arrange(desc(n))
count(dustdata_anal, yyyymmdd) %>% arrange(desc(n))
count(dustdata_anal, area) %>% arrange(desc(n))

dust_anal_area_sb <- subset(dustdata_anal, area=="성북구")
dust_anal_area_jg <- subset(dustdata_anal, area="중구")

describe(dust_anal_area_sb$finedust)
describe(dust_anal_area_jg$finedust)

boxplot(dust_anal_area_sb$finedust, dust_anal_area_jg$finedust,
        main="finedust_compare", xlab="AREA", names=c("성북구", "중구"),
        ylab="FINEDUST_PM", col=c("blue", "green"))
t.test(data=dustdata_anal, finedust ~ area, var.equal=T) # 성북구와 중구의 미세먼지 농도의 평균은 같지 않다.

#####################################
survey = read.csv("./data/survey.csv")
# head(survey)
# View(survey)
names(survey) = c('position', 'ans6', 'ans7')
t1 <- table(survey$position, survey$ans6)
# table(survey$position, survey$ans7)
t2 <- as.data.frame(t1)

chisq.test(t1)

##########################################################
rm(list=ls())

library(ggplot2)

mtcars <- data.frame(mtcars)
mean(mtcars$mpg)

t.test(mtcars$mpg, mu=18.0)
t.test(mtcars$mpg, mu=15.0)



