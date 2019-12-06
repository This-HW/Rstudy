data(cars)
head(cars)
m <- lm(dist~speed, data=cars)
m

# ?lm
# 분석 결과에서 Coefficient를 보자
# intercept는 y 절편이다.
# speed 아래에 있는 숫자는 기울기이다.
# 이 식의 회계식은 " dist = 3.932 * speed - 17.579 " 가 된다.


############################################
fitted(m)[1:4] # 예측치이다. 만들어진 모형으로 1~4를 넣었을 때 나오는 수.
residuals(m)[1:4] # 잔차(오차)를 의미한다. (실측치와 예측치의 차이)
# 빼면 ?? 가 나온다고 하셨는데 못 들음...


predict(m, newdata = data.frame(speed=3)) # speed가 3일때 예측치가 몇으로 나오는지 알 수 있다. / fitted(m)[3]과 같다.

summary(m)
#
# R 스퀘어 값 : 결정계수, 설명계수 얼마나 오차를 줄였는가. R값에서 제곱한것.
#               0 ~ 1 까지 설명 가능하다. 0.65는 전체 데이터에서 65%를 설명하고 35%를 설명하지 못했다는 뜻이다.
#               변량이 많아지면 R 스퀘어값 이 높아지기 떄문에 수정된 R스퀘어드 값으로 결정계수를 설명해야 한다.


install.packages("mlbench")
library(mlbench)
data(BostonHousing)
head(BostonHousing)
summary(BostonHousing)

m2 <- lm(medv~., data=BostonHousing)
m2
summary(m2)

m3 <- step(m2, direction = "both") # both는 forward (전진선택법)과 후진소거법() 둘다 한다는 것
# 이 때 AIC는 선택 기준이 되는 수치를 나타낸다. 넣었다 뺐다 하면서 AIC값이 큰 그룹을 찾아낸다.
# AIC (Information criterion, 정보지수)
# AIC 를 구하는 공식을 뜨ㄸ오보면 알겠지만, AIC값은 확률이 낮을수록, 변수 개수가 많을수록 수치가 크게 나온다.
# 즉 AIC 수치가 낮을수록 좋다! (AIC는 페널티 수치이다.)
# 이 예시에서는 1589.64 -> 1587.65 (age 제거) -> 1585.76 (age, indus 제거) 로 AIC가 점점 낮아졌다. (좋아졌다)
########### 여기서는 후진제거법만 사용됨? ㄴㄴ 내부적으로 여러가지 변수를 추가하고 제거했는데 좋은 결과만 보여준 것임


