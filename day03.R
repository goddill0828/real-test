# 벡터 

# 1) 벡터의 생성 
# - c(값1, 값2, 값3)

v1 <- c(1, 2, 3) # 숫자형(실수형) 벡터 
v1
print(class(v1)) #숫자형(numeric)
print(typeof(v1)) #실수형(double)

v2 <- c(1L, 2L, 3L) #숫자형(정수형)
v2
print(class(v2)) # 정수형(integer)
print(typeof(v2)) # 정수형(integer)

v3 <- c(TRUE, FALSE, T) # 논리형 벡터 
v3
print(class(v3)) # 논리형(logical)

v4 <- c("a", "b", "c") # 문자형 벡터
v4
print(class(v4)) # 문자형(character)

v5 <- c(1, "abc", TRUE) # 벡터의 요소는 1개의 자료형을 가진다 
# 벡터의 요소 중 문자형이 있으면 해당 벡터의 요소는 모두 문자형이 된다 
v5
print(class(v5)) #  문자형 벡터 

v6 <- c(1, 2, FALSE) # 논리형과 숫자형이 벡터의 요소에 같이 있으면 벡터의 요소는 숫자형 값이 된다 
v6

print(class(v6))


# 연속적인 숫자로 구성된 벡터 생성 
# (1) 벡터명 <- 시작값 : 종료값 

v1 <- 1 : 10
v1 # 1 ~ 10으로 구성된 벡터 생성 

v2 <- c(1, 3, 5, 10 : 20)
v2

# 일정한 간격의 숫자로 구성된 벡터 생성 
# seq(시작값, 종료값, 간격)

v3 <- seq(1, 10, 2)
v3

v4 <- seq(5, 15, 3)
v4

v5 <- seq(0.2, 1.0, 0.3)
v5

# 반복되는 숫자로 구성된 벡터 생성 
# rep(값, times = 반복횟수 )

v6 <- rep(1, times = 5) # 1을 5번 반복 
v6

v7 <- rep(1:5, times = 3)
v7

v8 <- rep(c(1, 5, 10), times = 2) # 1, 5, 10을 2번 반복한다
v8

v9 <- rep(c(1, 5, 10), each = 2)
v9 # 1  1  5  5 10 10 , 각각 반복 


# 벡터의 특정 요소 접근(인덱싱)
# 벡터명[인덱스 번호]

# idx  1   2   3   4   5
v <- c(10, 20, 30, 40, 50)
v
print(v[1]) # v벡터의 1번째 요소 
print(v[4]) # v벡터의 4번째 요소 

# 벡터의 여러 요소에 접근
# 벡터명[시작 : 종료]


# idx   1    2    3    4    5
v <- c("a", "b", "c", "d", "e")
v
print(v[1:3]) # idx 1번부터 3번까지 
print(v[2:5]) # idx 2번부터 5번까지
print(v[seq(1,5,2)]) # idx 1, 3, 5에 위치한 값


print(v[4:7]) # 인덱스 범위를 벗어난 값은 NA(결측치)로 나옴 


# +) 특정 값 제외 
v <- 1 : 10
v
print(v[-2]) # 1 ~ 10 중 idx 2번만 제외
print(v[-c(3:5)])
print(v[-1:-3])

# 벡터의 원소 값에 이름 지정 
# names(벡터명) <- c(이름1, 이름2,...)

score <- c(70, 80, 90)
score
print(names(score)) # NULL : 비어있음

names(score) <- c("짱구", "유리", "철수")
print(names(score))

# 이름이 정해진 벡터 요소 접근 
# 벡터명[이름]
score 
print(score[1])
print(score["짱구"])

print(score[c(1,2)])
print(score[c("짱구", "유리")])

# 벡터에 저장된 값 수정 
v <- seq(10, 50, 10)
v

print(v[1]) # 10 

v[1] <- 100 # idx 1번째 값 10 -> 100
v

print(v[2:4])
v[2:4] <- c(200, 300, 400) # idx 2, 3, 4번째 값 수정 
v 

print(v[seq(1,5,2)]) # 홀수번째 위치 값 
v[seq(1,5,2)] <- 1 : 3 #홀수번째 위치 값 수정 
v
 








# 벡터의 연산 

# 1) 벡터와 산술 연산 
v1 <- c(1, 3, 5, 7, 9)

print(v1 + 10) # 벡터의 요소마다 +10이 된다
print(v1 * 2) # 벡터의 요소마다 곱하기 2가 된다 

# 벡터끼리의 산술 연산 
v2 <- c(2, 4, 6, 8, 10)

print(v1 + v2) # 벡터 간 대응되는 위치에 있는 요소기리 연산 
print(v1 * v2)

#  벡터끼리의 길이(요소의 개수)가 같지 않은 벡터끼리 연산 
v3 <- c(3,4,5) # 요소의 개수 3개 

print(v1 + v3) # 오류 발생

# 길이가 같지 않은 경우, 서로 배수 관계여야한다
v4 <- 1:6
print(length(v3)) # 요소의 길이는 3 
print(length(v4)) # 요소의 길이는 6

# v3와 v4의 길이는 서로 배수 관계 
# => 연산 가능 
print(v3 + v4)


# 2) 벡터와 관계 연산자(비교 연산자), 논리 연산자 
# 관계 연산자 : <, >, <=, >=, ==, !=
# 논리 연산자 : &(and), |(or), !(not, 단항)

v <- 1 : 9

print(v > 5) # 벡터 요소 중 5보다 큰 값은 TRUE, 아니면 FALSE
print(v[v > 5]) # 벡터의 요소 중 5보다 큰 값 출력 
# 벡터명[조건식] : 벡터에서 해당 조건식의 결과가 TRUE인 요소들만 가져오기 

print(v[v > 5 & v < 8]) # v요소중 5 ~ 8사이의 값 

print(v[v <= 3 | v >= 8]) # v 요소 중 3 이상 혹은 8이하인 값 
print(v[!(v <= 3 | v >= 8)])
# => v요소 중 3이상 혹은 8이하가 아닌(!) 값 

# 데이터 구조에서 사용 가능한 함수 
v <- c(1, 3, 5, 7, 9)
print(sum(v)) # 합계
print(max(v)) # 최대값
print(min(v)) # 최소값
print(length(v)) # 길이 
print(mean(v)) # 평균
print(median(v)) # 중앙값
print(range(v)) # 최소값, 최대값 

# <벡터 실습> 
# 1) 10, 11, 13, 15, 16 5개의 값을 가진 벡터 생성 
# 2) 15 ~ 25까지의 값을 가지는 벡터 생성 
# 3) 20 ~ 30까지의 숫자 중 짝수만을 가지는 벡터 생성 
# 4) 20개의 TRUE값을 가지는 벡터 생성 

# 1번 문제 
v1 <- c(10, 11, 13, 15, 16)

# 2번 문제 
v2 <- c(15:25)
v2

# 3번 문제 
v3 <- seq(20, 30, 2)
v3

# 4번 문제 
v4 <- rep(TRUE, times = 20)
v4

# <벡터 실습2>

# 1) 100 ~ 150까지 저장된 벡터 생성 
# 2) 위의 벡터에서 10번째 값 출력 
# 3) 위의 벡터에서 3번째 ~ 10번째 값 출력 
# 4) 위의 벡터에서 끝에서 10개의 값들만 제외하고 출력 
# 5) 위의 벡터에서 홀수값들만 출력 
# 6) 앞에서부터 20개의 값을 1 ~ 20으로 수정하고 출력 

# 1번 문제 
v <- c(100:150)

# 2번 문제 
v1 <- v[10]

# 3번 문제 
v2 <- v[3:10]

# 4번 문제 
v3 <- v[-41 : -51]
v3

# 4번 다른예시 
print(v[-c(42 : 51)])
print(v[1 : (length(v) - 10)])

# 5번 문제 
# 홀수, 짝수 구분 
print(10 %% 2) # 짝수 %% 2 = 0
print(9 %% 2) # 홀수 %% 2 = 1

print(v[v %% 2] == 1)

# 6번 문제 




# 행렬(matrix)

# 1) 행렬의 생성 
ma1 <- matrix(c(1,2,3,4,5,6), nrow = 2, ncol = 3)
ma1 # 2행 3열의 행렬 
print(dim(ma1)) # dim() : 행렬의 구조 확인 2(행) 3(열)

ma2 <- matrix(1:9, nrow = 3, ncol = 3)
ma2 # 1 ~ 9로 구성된 3행 3열의 행렬 
print(dim(ma2))

# 2) 행렬의 속성 
dim(ma1)
print(nrow(ma1)) #2,  행의 개수 
print(ncol(ma1)) #3,  열의 개수 

# 3) 행렬의 요소 접근 
# => 행렬명[행의 번호, 열의 번호 ]
ma <- matrix(1:9, nrow= 3, ncol = 3)
ma
print(ma[1, 3]) # 7, 1행 3열의 값 

# 행/열에 접근 
print(ma[1,]) # 1번째 행 
print(ma[,2]) # 2번째 열 

# +) 
print(ma[1, 2:3]) # 1번행의 2열 ~ 3열 
print(ma[2:3, 1:2])

# +) 특정 데이터 제외 
print(ma[-2,]) # 2행 제외 
print(ma[,-1]) # 1열 제외 
print(ma[1:2, -c(1, 3)]) # 1행 ~ 2행, 1열, 3열은 제외 


# 4) 행렬의 요소 수정 
ma 


ma[3, 3] <- 10 # 3행 3열의 값인 9를 10으로 바꿈 
ma


ma[2,] <- rep(11, times = 3) # 2행의 값 변경 
ma

ma[, 1] <- seq(21, 25, 2) # 1열의 값 변경 
ma


# 행렬의 조작 함수 
# t() : 행렬 전치 함수 
ma <- matrix(1:6, nrow = 2, ncol = 3)

ma # 2행 3열의 행렬 
print(dim(ma))

t_ma <- t(ma)
t_ma # 3행 2열 
print(dim(t_ma)) # 말 그대로 행과 열의 위치를 바꿈

# rbind(헹렬, 벡터) : 행 추가
ma
ma1 <- rbind(ma, c(10, 20, 30))
ma1 # 3번째 행 추가 

# cbind(행렬, 벡터) : 열 추가 
ma2 <- cbind(ma, c(10, 20))
ma2

# apply(행렬, 1 or 2, 함수) : 행렬의 행 또는 열에 함수를 적용 
ma

apply(ma, 1, sum) # ma라는 행렬의 행마다의 합계
apply(ma, 1, median) # ma라는 행렬의 행마다의 중앙값

apply(ma, 2, mean) # 행렬의 열마다의 평균
apply(ma, 2, max) # 행렬의 열마다의 최대값 

# 행렬 특수 함수
ma
rowSums(ma) # 행마다의  합 
rowMeans(ma) # 행마다의 평균 

colSums(ma)  # 열마다의 합 
colMeans(ma) # 열마다의 평균 


# 행렬의 연산 
ma1 <- matrix(c(rep(10, times = 2), rep(20, times = 2)), nrow = 2, ncol = 2)

ma1


ma2 <- matrix(seq(50, 80, 10), nrow = 2, ncol = 2)
ma2


# 1) 크기가 서로 같은 행렬끼리 연산 
print(ma1 + ma2) # 같은 자리의 요소끼리 연산 

# 2) 크기가 서로 다른 행렬끼리 연산 
ma3 <- matrix(c(1, 2, 3), nrow = 1, ncol =3)
ma4 <- matrix(1:6, nrow = 2, ncol = 3)

ma3
ma4

print(ma3 + ma4) # 오류 발생()

# 단, 행렬과 벡터는 연산이 가능하다 
ma2
print(c(1, 2) + ma2) # 컬럼 방향으로 연산됨 
print(c(1, 2, 3) + ma2)


# <행렬 실습> 
# 1) 11 ~ 30 중 홀수로 구성된 5행 2열의 행렬 생성 
ma <- matrix(seq(11, 30, 2), nrow = 5, ncol= 2)
ma

# 2) 위에서 만든 행렬의 행과 열을 전치한 새로운 행렬 생성 
t_ma <- t(ma)
t_ma

# 3) 2번까지 만든 행렬에서 31 ~ 35로 구성된 새로운 행 추가
ma2 <- rbind(t_ma, c(31:35))
ma2

# 4) 3번까지 만든 행렬에서 41 ~ 43으로 구성된 새로운 열 추가

ma3 <- cbind(ma2, c(41:43))
ma3

# 5) 열마다의 평균 출력 
apply(ma3, 2, mean)




















