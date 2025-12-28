# 배열(array)
# array(데이터, dim = 데이터 구조)

ar <- array(1:24, dim = c(3, 4, 2))
ar # 3행 4열의 평면 구조가 2개

# 1) 배열의 속성
print(dim(ar)) # 3 4 2, 3행 4열의 평면 구조가 2개 
print(length(ar)) # 24, 배열의 데이터 개수 24개 

# 2) 배열의 요소 접근 
# => 인덱스 번호 사용 
# => 배열명[행idx, 열idx, 축idx]

print(ar[3, 2, 2]) # 3행 2열의 2번째 평면에 있는 데이터 


# 3) 배열의 연산 
# => 배열 + 값 : 배열의 요소마다 연산됨
# => 배열 + 배열 : 크기가 같은 배열끼리 연산됨 

ar_a <- array(1 : 8, dim = c(2, 2, 2))
ar_b <- array(9 : 16, dim = c(2, 2, 2))
ar_a
ar_b

# 배열끼리 연산 
print(ar_a + ar_b) # 같은 위치의 요소끼리 연산됨 

# 리스트(list)

# 1) 리스트의 생성 
# list(속성명 = 값,...)

score_vec <- c(60, 80, 70)
names(score_vec) <- c("python", "java", "C")
score_vec

my.info <- list(name = '짱구', age = 5, gender = 'male', score = score_vec)

my.info

# 2) 리스트 요소 접근 
print(my.info[[1]]) # 1번째 속성
print(my.info$name) # name의 속성

# 리스트 요소 중 데이터 구조 접근 
print(my.info[[4]]) # score벡터
print(my.info[[4]][1])
print(my.info$score[1])
print(my.info$score['python'])



# 3) 리스트 요소 값 수정 
my.info$name <- '맹구'

print(my.info$name)
my.info

# 4) 리스트 요소 추가 
# 리스트명$추가할 속성명 <- 속성값
my.info$class <- '해바라기반'

my.info

# 5) 리스트의 속성확인 함수 
# length() : 리스트의 길이(속성의 개수) 
print(length(my.info))
# names() : 리스트 속성명 확인 
print(names(my.info))


# <리스트 실습>
# 1) 아래의 정보가 들어간 리스트 생성 
#    학생의 이름(name) : "둘리" 
#    학생의 나이(age) : 10
#    학생의 점수(scores) : 
#           국어 점수 : 80
#           수학 점수 : 90
#           영어 점수 : 75

test.info <- list(name = '둘리', age = 10, scores = c(80, 90, 75))
test.info

# 2) 위의 리스트에서 학생의 수학점수를 85점으로 수정 
test.info$scores[2] <- 85
test.info

# 3) 학생의 평균 점수, 총합 점수를 각각 출력 
print(mean(test.info$scores))
print(sum(test.info$scores))


# 4) 학생 리스트에서 주소(address) : '서울' 속성 추가 
test.info$address <- '서울'

test.info


# +) 리스트 활용 : 행렬과 배열의 이름 

# 1) 행렬 
ma <- matrix(1:6, nrow = 2, ncol = 3)
ma

# 행렬의 행과 열에 이름 부여 
# dimnames(행렬 or 배열)

dimnames(ma) <- list(c("row1", "row2"), c("col1", "col2", "col3"))
ma

# 2) 배열 

ar <- array(1:12, dim = c(2, 3, 2))
ar

dimnames(ar) <- list(c("row1", "row2"), c("col1", "col2", "col3"),
                     c('slice1', 'slice2'))
ar


# 팩터(factor)

# 1) 사람의 혈액형을 저장하는 벡터 생성 
bt <- c('A', 'B', 'B', 'O', 'AB', 'A')
bt

bt.new <- factor(bt)
bt.new



# 2) 팩터의 숫자형 변환
print(as.integer(bt.new))
# 1 3 3 4 2 1
# Levels: A(1) AB(2) B(3) O(4)

# 4. 데이터 프레임 
# data.frame(벡터1, 벡터2,...)

# 1) 데이터 프레임 생성
names <- c('둘리', '도우너', '또치')
rank <- c(1, 2, 3)

stu.info <- data.frame(names, rank)
stu.info

View(stu.info)
# 문자형 벡터와  숫자형 벡터를 결합하여 데이터 프레임 생성 
# 벡터들이 열 방향으로 연결됨 
# => 하나의 벡터는 데이터 프레임에서 하나의 열이 됨 

stu.df <- data.frame(
  # 열마다 넣을 데이터 입력 
  id = 1:5, name = c("짱구", '철수', '훈이', '맹구', '유리'),
  age = c(5, 6, 7, 8, 9), score = c(75, 92, 88, 79, 95)
)

stu.df


# 데이터 프레임 통계 요약 
summary(stu.df)
# 데이터 프레임의 각 열에 대한 요약 통계 정보 확인 

# +) 데이터 프레임 행 이름 지정 
rownames(stu.df) <- c("1번", '2번', '3번', '4번', '5번')
# rownames() : 데이터프레임, 행렬 행 이름 지정 
# colnames() : 데이터프레임, 행렬 열 이름 지정 

# 데이터 프레임 요소 접근 

stu.df

# 1) 행과 열 인덱싱 : 데이터프레임[행, 열]
print(stu.df[1,2]) # 1번째 행, 2번째 열 값 
print(stu.df[1,]) # 1번째 행 
print(stu.df[,2]) # 2번째 열 

# 2) 열 이름으로 접근 
print(stu.df$name) # name열의 값 
print(stu.df$name[2])

# 3) 행 이름으로 접근 
print(stu.df[3,])
print(stu.df['3번',])


# 데이터 프레임 수정 
# 1) 특정 값 수정 
stu.df
print(stu.df$score[1]) # 75

stu.df$score[1] <- 70 

stu.df

print(stu.df[2, 3]) # 6, 철수의 나이 

stu.df[2,3] <- 8

stu.df

# 2) 열 추가 : 열에 들어갈 값을 벡터로 추가 
# df$추가할 열 이름 <- 데이터 

stu.df$gender <- c('남', '남', '남','남', '여')
stu.df


# 3) 열 수정 
stu.df$age <- stu.df$age + 1 # age열의 데이터에 +1
stu.df

# 4) 행 추가 
# : 추가할 행의 개수만큼 데이터 프레임 생성 후 추가
# rbind(기존 df, 추가할 df)

# (1) 추가할 행 데이터 프레임 생성 
new.df <- data.frame(
  id = 6, name = '짱아', age= 2, score = 60, gender = '여'
)

new.df

# 데이터 프레임 연결 
stu.df <- rbind(stu.df, new.df)

stu.df

stu.df['7번',] <- data.frame(id = 6, name = '둘리', age = 2, score = 65, gender = '무')

stu.df

# 데이터 프레임 조작 함수 

# 1) subset() : 조건에 따른 데이터 확인  
# age가 6살 이상인 데이터 확인 
print(subset(stu.df, age >= 6))

# score가 80점 이상이면서 gender가 남자인 데이터 확인 
print(subset(stu.df, score >= 80 & gender == '남'))

# 2) t() : 데이터 프레임의 행과 열을 전치 
t_df <- t(stu.df)
t_df

# 3) apply() : 데이터 프레임의 행이나 열에 함수를 적용 
stu.df

# age, score의 평균 확인 
print(apply(stu.df[, c("age", "score")], 2, mean))
print(apply(stu.df[3,], stu.df[4,]), 2, mean)


# 각 행의 age와 score 합계 계산
print(apply(stu.df[, c("age", "score")], 1, sum))


# <데이터 프레임 실습>
# 1) 다음의 데이터를 저장할 데이터 프레임 생성(person.df)
# name      age     gender    height    is_student
# 둘리      10        "M"      150       TRUE
# 또치      12        "F"      155       TRUE 
# 도우너    11        "M"      145       TRUE
# 고길동    40        "M"      170       FALSE

test.df <- data.frame(name = c("둘리", '또치', '도우너', '고길동'),
                      age = c(10, 12, 11, 40),
                      gender = c('M', "F", 'M', 'M'),
                      height = c(150, 155, 145, 170),
                      is_student = c(TRUE, TRUE, TRUE,b FALSE))

test.df

# 2) 위의 데이터 프레임에서 행 추가
# name : 마이콜, age : 20, gender : "M", height : 180,  is_student : FALSE
new.df <- data.frame(name = '마이콜', age = 20, gender = 'M', height = 180, 
                     is_student = FALSE)

test.df <- rbind(test.df, new.df)

test.df

# 추가할 행이 1개인 경우, 리스트로 추가 가능 
# (1) 리스트 생성 
# new.row <- list(name = '마이콜', age = 20, gender = "M", height = 180, is_student = F)
# test.df <- rbind(test.df, new_row)






# 3) 데이터 프레임에서 학생인 사람들의 평균 나이와 평균 키 출력 
print(apply(test.df[, c('age', 'height')], 2, mean))

# 3번 다른 예시 
# (1) 학생인 사람들의 데이터 프레임 생성 
new.df <- subset(test.df, is_student)
new.df

# (2) 새로운 데이터 프레임의 평균 나이와 평균 키 
col_means <- apply(new.df[, c('age', 'height')], 2, mean)
col_means
col_means[1]
col_means['height']




# 4) 데이터 프레임에서 학생인 사람들의 나이 합계 출력
print(sum(test.df[2]))

# apply는 두 개 이상의 행과 열을 써줘야 하기 때문에 사용 불가능 

# +) 벡터에 특정 값 유무 확인 

vec <- seq(10, 50, 10)
vec

# 1) %in% 연산자
print(30 %in% vec) # vec 데이터 안에 30이 있으면 TRUE, 없으면 FALSE 
print(35 %in% vec)

# 2) any() 함수 사용 
print(any(vec >= 30))
# vec 데이터 안에 조건에 충족하는 데이터가 하나라도 있으면 TRUE, 아니라면 F 
print(any(vec < 10)) # F 

# 3) which(조건식)
#  => 조건에 부합하는 값의 위치 인덱스 번호
print(which(vec == 20)) # 2번째 데이터가 조건에 일치하는 것을 알려줌
print(which(vec == 25)) # integer(0)이라고 알려줌 
print(which(vec > 30)) # 4, 5번째 데이터가 조건에 일치
 


















