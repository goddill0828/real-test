# reshape2 패키지 

# 패키지 설치 및 로드 
install.packages('reshape2')
library(reshape2)


# 데이터 생성 
stu.df <- data.frame(
  name = c('짱구', '철수', '유리'),
  gender = c('남', '남', '여'),
  kor = c(70, 90, 100),
  math = c(50, 100, 80),
  eng = c(65, 85, 70)
)

stu.df


# 1) melt(데이터, 기준열, 변환열)

melt_test <- melt(stu.df, id.vars = 'name', measures.vars = c('kor', 'math'))

melt_test # 'name'열을 기준으로 국엉와 수학 점수가 세로로 배치 

melt_test <- melt(stu.df)
# 기준 열을 설정하지 않으면 자동으로 첫번째 열 데이터가 
# 기준이 되고 나머지 열이 변환열이 된다

# 2) dcast(데이터, 기준열 ~ 변환열)
dc_test <- dcast(melt_test, name ~ variable)
dc_test

# 기준열을 여러개로 사용할 때
dc_test <- dcast(melt_test, name + gender ~ variable)
dc_test


# 3) acast() 
# acast(데이터, 기준열 ~ 변환열 ~ 분리 기준열)

# 학생들의 이름을 기준으로 성별마다 각각 과목 점수 확인
ac_test <- acast(melt_test, name ~ gender ~ variable)

ac_test
# 이름을 기준으로 gender가 열로 변환된 데이터는 variable(과목)별로 데이터가  분리된다
# NA : 결측치(유효한 값이 아닌 것)

# +) cast() 함수 활용 
# : 데이터 통계 정보 요약 
melt_test

# 1) 성별을 기준으로 과목당 합계 점수 확인(dcast)
dcast(melt_test, gender ~ variable, sum)

# 2) 성별을 기준으로 과목당 평균 점수 확인(acast)
acast(melt_test, gender ~ variable, mean)

# 데이터 시각화 

# ggplot2 패키지 설치 및 로드 
install.packages('ggplot2')
library(ggplot2)

# R의 내장 데이터셋 불러오기(airquality)
data <- airquality

# 기본 틀 생성
str(data) #  요약 정보 확인 

ggplot(data, aes(x = Day, y = Temp))

# 산점도 그래프 
# - 일수에 따른 기온을 나타내는 산점도 그래프

ggplot(data, aes(x = Day, y = Temp)) + geom_point(size = 3, color = 'darkgreen')+ # 산점도 그래프
  labs(x = '일자', y = '온도', title = '산점도 그래프') # 그래프의 속성 설정(그래프 제목, 축 제목, ...)

# size : 관측점의 크기 
# color : 관측점의 색상


# 월별 일자와 온도의 산점도 그래프
ggplot(data, aes(x = Day, y = Temp, group = Month, colour = factor(Month))) + 
  geom_point() + labs(colour = "Month") # 범례 제목 설정

# colour = factor(Month) : 범례 설정
# factor(Month) : Month데이터를 범주형 데이터로 변환

# +) 변수들 간의 상관관계를 대략적으로 확인
pairs(data)

# 꺾은선 그래프 : geom_line()
ggplot(data, aes(x = Day, y = Temp)) + geom_line()


# 월별로 꺾은선 그래프 시각화
ggplot(data, aes(x = Day, y = Temp, group = Month, colour = factor(Month))) + 
  geom_line() + labs(colour = "Month")

# 막대 그래프 
mc <- mtcars  # mtcars 데이터 셋

# 1) 실린더(cyl) 종류 별 빈도수 확인 
ggplot(mc, aes(x = cyl)) + geom_bar(width = 0.5)
# width : 막대 너비 지정 

# 2) x축에 값이 없는 5와 7 삭제 
# cyl열 데이터를 범주형 데이터 구조로 변환 : factor()
ggplot(mc, aes(x = factor(cyl))) + geom_bar(width = 0.1, fill = c('blue', 'red', 'green'))
# fill : 그래프 색상 설정

# <막대별 색상 구별 및 범례 설정>
ggplot(mc, aes(x = factor(cyl), fill = factor(cyl))) + geom_bar(width = 0.3) + 
  labs(fill = 'cyl')

# +) 누적 막대 그래프
# 실린더 종류별 빈도를 파악하면서 실린더 종류별 gear의 빈도까지 파악 
ggplot(mc, aes(x = factor(cyl))) + geom_bar(aes(fill = factor(gear)))
# geom_bar() 함수 안에 aes() 함수를 이용하여 누적할 열 지정 

# +) 누적 막대그래프 선버스트 차트 시각화 
# 선버스트 차트 : 계층 구조의 데이터를 수준별로 비율을 표시하는 그래프
# 누적 막대 그래프 + coord_polar() 추가

ggplot(mc, aes(x = factor(cyl))) + geom_bar(aes(fill = factor(gear))) +
  coord_polar()

# 도넛형 선버스트 차트
ggplot(mc, aes(x = factor(cyl))) + geom_bar(aes(fill = factor(gear))) +
  coord_polar(theta = 'y')

# 박스 그래프 시각화 
# iarquality 데이터셋에서 월(Month)별로 기온(Temp)를 나타내는 박스 그래프 

ggplot(data, aes(x = Month, y = Temp, group = Month)) + geom_boxplot()

# 박스 안의 굵은 선 : 중앙값(2사분위값, 50% 위치 값)
# 박스의 위, 아래 선 : 각각 3사분위, 1사분위 값 
# 박스 기준 위, 아래 점 : 이상치 데이터


# 히스토그램 그래프
# airquality 데이터 셋에서 Temp(온도)의 분포를 나타내는 히스토그램 그래프 
ggplot(data, aes(x = Temp)) + geom_histogram(binwidth = 0.5)
# binwidth : 막대 너비 조정

# +) 그래프 여러 개 작성
# 그래프 함수 + 그래프 함수 + ...

# 일자별 기온을 나타내는 산점도 + 꺾은선 그래프
ggplot(data, aes(x = Day, y = Temp)) + geom_line(color = 'red') +  # 꺾은선 그래프
  geom_point(size = 3)


# +) 그래프 영역 여러개 생성 
# gridExtra 패키지 사용 
install.packages('gridExtra')
library(gridExtra)

g1 <- ggplot(data, aes(x = Day, y = Temp)) + geom_point()

g2 <- ggplot(data, aes(x = Day, y = Temp)) + geom_line()

grid.arrange(g1, g2, ncol = 2) # 열의 개수 지정 
grid.arrange(g1, g2, nrow = 2) # 행의 개수 지정


# <ggplot2 시각화 실습>
# diamonds 데이터셋 불러오기 

dia <- diamonds

# 1) cut 등급별 막대그래프 시각화
d1 <- ggplot(dia, aes(x = factor(cut), fill = factor(cut))) + 
  geom_bar(width = 0.5) +
  labs(x = 'cut등급',
       y = '개수',
       title = 'cut등급별 보석 개수',
       fill = 'cut')



# 2) carat과 price에 따른 산점도 그래프 시각화
d2 <- ggplot(dia, aes(x = carat, y = price, group = cut, colour = factor(cut))) + 
  geom_point() + labs(title = 'carat과 price의 산점도', colour = 'cut')

# x : carat, y = price
# 3) 위에서 만든 2개의 그래프로 같은 영역에 표시 
# (2열) 

grid.arrange(d1, d2, ncol = 2)


# 그래프 객체 추가 
# 1) 사선 그리기 

eco <- economics

# 1) 꺾은선 그래프 시각화 
# 날짜(date)별 개인 저축률(psavert)을 나타내는 꺾은선 그래프

ggplot(eco, aes(x = date, y = psavert)) + geom_line()


# (1) 날짜와 저축률이 상관관계가 있는지 확인 
# => 두 변수 간의 상관관계 확인 
# : cor.test()
cor.test(eco$date, eco$psavert)
# => 실행되지 않는다! 
# date는 날짜이므로 상관관계를 계산할 수 없다 
# => 따라서, date를 수치형 데이터로 변환을 해야한다

# 날짜 -> numeric
numeric_date <- as.numeric(eco$date)
# 1970년 1월 1일을 기준으로 한 "날짜" 차이(일수)로 변환

# 수치화된 날짜와 저축률의 상관관계 확인 
cor.test(numeric_date, eco$psavert)
# cor : -0.8386684 (강한 음의 상관관계를 가진다)
# p-value < 2.2e-16 => 0.05보다 작으므로 유의함.
# => 통계적으로 유의미한지 확인할 때 사용하는 통계 지표
# ** p-value < 0.05보다 작아야 통계적으로 유의하다.
#    p-value >= 0.05보다 크거나 같다면 통계적으로 유의하지 않다.


# cor : 상관관계 계수
# -1 ~ 1 
# - 양수가 1에 가까울수록 두 변수는 강한 양의 상관관계를 가진다  
# - 음수가 -1에 가까울수록 두 변수는 강한 음의 상관관계를 가진다 
# - 절대값이 0.7이상 정도면 상관관계가 있다라고 본다.

# (2) 절편과 기울기 계산 : lm(종속변수(y) ~ 독립변수(x))
rg_result <- lm(eco$psavert ~ numeric_date)
rg_result

# Intercept : 절편값 
# numeric_date : 기울기값(회귀계수)
# => 날짜가 1 증가할 때, 저축률은 0.0004925만큼 감소한다

# 절편과 기울기 추출
rg_coef <- coef(rg_result)

rg_coef
inter <- rg_coef[1] # 절편 
sl <- rg_coef[2] # 기울기 

# 3) 절편과 기울기를 활용하여 꺾은선 그래프에 사선 추가 
ggplot(eco, aes(x = date, y = psavert)) + geom_line() + 
  geom_abline(intercept = inter, slope = sl, color = 'red')


# 2) 평행선 그리기
# 개인 저축률 꺾은선 그래프에 평균값을 표시하는 평행선 추가 
ggplot(eco, aes(x = date, y = psavert)) + geom_line() + geom_hline(yintercept = mean(eco$psavert))

# 3) 수직선 그리기 
# 개인 저축률이 가장 낮은 시기를 바로 알 수 있는 수직선 추가

# (1) x축 데이터는 날짜이므로 저축률이 가장 낮은 날짜 구하기


# dplyr 패키지 로드 
library(dplyr)
# filter() 함수를 사용하여 조건에 맞는 데이터 가져오기
# filter(데이터셋, 조건) : 조건에 맞는 행 추출 
x_inter <- filter(eco, psavert == min(eco$psavert))
# 저축률이 가장 낮은 행 추출

# 날짜만 추출
x_inter <- x_inter$date

# 2) 그래프에 날짜에 따른 수직선 추가 
ggplot(eco, aes(x = date, y = psavert)) + geom_line() + geom_vline(xintercept = x_inter)










