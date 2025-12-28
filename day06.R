# 사용자 정의 함수 

# 함수명 <- function(매개변수,...){실행할 기능}

# 1) 함수 정의 
# 인사말을 출력하는 welcome()함수 정의

welcome <- function(){
  print("안녕~!")
  print("hi!!")
}

# 함수 호출 : 정의한 함수를 사용하는 것
#             함수명()

welcome()
welcome() # 코드의 재사용성이 높음

# 2) 인수와 매개변수 
# 숫자를 전달받아, 전달받은 숫자에 + 10을 한 결과를 출력하는 
# add_ten() 함수 정의 
add_ten <- function(num){
  # num : 매개변수, 전달받을 숫자(인수)를 저장할 변수 
  print(num + 10)
}

# 매개변수가 포함된 함수 호출 : 함수명(인수, ...)
add_ten(5)
# add_ten() 함수를 호출하면서 5(인수)를 전달하고 
# 함수에서는 전달받은 인수(5)를 매개변수(num)에 저장하고 
# 함수의 기능이 실행된다 

# 이름, 나이를 전달받아 전달받은 이름과 나이를 출력하는 
# introduce() 함수 정의

introduce <- function(name, age){
  # name : 전달받은 이름을 저장할 매개변수 
  # age : 전달받을 나이를 저장할 매개변수
  print(sprintf("이름 : %s", name))
  print(sprintf("나이 : %d살", age))
}

# 함수 호출 
introduce("짱구", 5)
# introduce(5, "철수") # 매개변수와 인수의 개수와 순서는 일치해야한다
# introduce("철수")
introduce(age = 6, name= '유리')
# 함수를 호출할 때, 매개변수에 전달할 인수를 직접 설정하면 
# 순서가 일치하지 않아도 된다.

# +) 디폴트 매개변수 
# 4개의 숫자를 전달받아, 전달받은 숫자들의 합을 출력하는 함수
# add_num() 정의 

add_num <- function(num1, num2, num3 = 4, num4){
  print(num1 + num2 + num3 + num4)
}

# 함수 호출
add_num(1, 2, 3, 4)
add_num(1, 2, 3)
# add_num(num1 = 1, num2 = 2, num4 = 4)


# 반환(return)할 값이 있는 함수 정의 
# 1) 2개의 숫자를 전달받아, 전달받은 숫자들의 합을 반환하는 
# add() 함수 정의 

add <- function(num1, num2){
  result <- num1 + num2
  return(result)
}

# 함수 호출(return이 있는 함수)
add(10, 20) 
# add() 함수를 호출할 때, 10과 20(인수)를 함수의 매개변수에 전달하고 
# 함수는 전달받은 인수 10 + 20을 한 다음 함수를 호출한 곳에 반환한다

# ** 반환받은 값은 값처럼 사용할 수 있다
# 변수 <- 값, 값을 변수에 저장할 수 있다 
result <- add(10, 20) # 반환 받은 값을 변수에 저장
print(result)
# 값 + 값, 값은 연산 가능
print(add(30, 40) + add(10, 20)) # 70 + 30과 똑같은 것 

# +) return이 있는 함수만 반환받은 값처럼 사용할 수 있다

# 데이터 구조와 함수 사용

# 1) 숫자들이 저장된 벡터를 전달받아, 전달받은 벡터의 요소들의 합과 중앙값을 출력하는 함수 정의 

get_nums <- function(vec){
  cat("합 : ", sum(vec), "\n")
  cat("중앙값 : ", median(vec), "\n")
}

# 벡터 생성 
v <- c(1, 3, 5, 7, 9)

# 함수 호출
get_nums(v)


# 2) 이름과 나이를 전달받아 전달받은 이름과 나이가 저장된 list를 반환하는 함수 정의 
get_info <- function(name, age){
  return(list(name = name, age = age))
}

# 함수 호출
stu.info <- get_info('철수', 5)

print(stu.info)
print(stu.info$name)
print(stu.info$age)

# <함수 실습>
# 1) 2개의 정수를 전달받아, 두 수의 합을 반환하는 get_sum()이라는 함수 정의 및 호출 
get_sum <- function(num1, num2){
  return(num1 + num2)
}

get_sum(2, 3)


# 2) 양의 정수를 전달받아, 그 수의 팩토리얼을 계산하는 fac_cal() 함수 정의 및 호출
# 팩토리얼 : 3! = 1 X 2 X 3 = 6
fac_cal <- function(num){
  # num : 팩토리얼을 계산할 숫자 
  
  # 팩토리얼 계산의 결과를 저장할 변수
  result <- 1 
  # 반복문으로 팩토리얼 계산
  for(i in 1 : num){
    # i : 1 ~ num까지 반복할 때 마다 저장함
    result <- result * i
  }
  # 반복문 종료 후 팩토리얼 계산 값 반환
  return(result)
}

# 함수 호출
fac_cal(5)

# 3) 숫자형 벡터를 전달받아, 벡터에 있는 요소들 중 짝수와 홀수 각각 분리하여 
# 저장된 리스트를 반환하는 even_odd() 함수를 정의 및 호출
# ex) 반환하는 리스트 list(even = 짝수값들, odd = 홀수값들)

# 함수 정의
even_odd <- function(vec){
  # vec : 숫자형 벡터
  
  # (1) 벡터 안에 저장된 짝수와 홀수를 분할 
  # 벡터의 요소 중 조건에 맞는 데이터 찾기(필터링)
  # 벡터명[조건식]
  even_nums <- vec[vec %% 2 == 0] # 짝수만 새로운 벡터에 저장
  odd_nums <- vec[vec %% 2 == 1] # 홀수만 새로운 벡터에 저장 
  
  # (2) 결과가 저장된 리스트 생성 
  result <- list(even = even_nums, odd = odd_nums)
  
  # (3) 결과 반환 
  return(result)
}

# 함수 호출
v <- 1: 10 # 1 ~ 10까지 저장된 벡터  
result_list <- even_odd(v)

print(result_list)
print(result_list$even)
print(result_list$odd)


# apply() 함수 

# 1) 행렬과 apply()
ma <- matrix(seq(10, 100, 10), nrow = 2, ncol = 5)

ma # 1 ~ 10까지 저장된 2행 5열의 행렬 

apply(ma, 1, sum) # ma의 행마다의 합
apply(ma, 2, mean) # ma의 행마다의 평균

# 함수 정의 
add_ten <- function(vec){
  return(vec + 10)
}

apply(ma, 1, add_ten) # 행마다 10을 더함 
apply(ma, 2, add_ten)

# => 행 또는 열마다 함수에 적용되는 결과가 
# 열방향으로 연결된 행렬로 결과가 나옴 


# 2) 데이터 프레임과 apply()

# 데이터 프레임 
person_df <- data.frame(
  name = c('짱구', '철수', '유리'),
  score = c(70, 90, 80),
  age = c(5, 6, 7)
)

person_df

# 데이터 프레임의 score, age열의 평균 계산 
apply(person_df[,c('score', 'age')], 2, mean)

# sapply() : 하나의 행 또는 열에 함수 적용 
# 데이터 프레임의 age열의 평균
# sapply(데이터셋, 함수)
# => 데이터셋에는 하나의 행 또는 열 
result <- sapply(person_df['age'], mean)
result

# <실습 문제>

user_df <- data.frame(
  id = 1 : 4, # 회원 번호 
  name = c("해리포터" , "론 위즐리" , "헤르미온느", "덤블도어"),
  age = c(17, 16, 17, 60)
)

user_df


# 1) 나이를 인수로 전달받아, 나이가 20살 이상이면 "성인"
# 그게 아니라면 "미성년자"문자열을 반환하는 함수 정의
# 함수명 : is_adult()
is_adult <- function(age){
  if(age >= 20){
    return("성인")
  } else{
    return("미성년자")
  }
}

is_adult(21)
is_adult(17)


# 2) user_df에서 age열의 데이터 is_adult() 함수 적용 후 
# user_df에 is_adult라는 새로운 열 추가
# 추가한 열에는 is_adult()함수의 반환값이 들어감 


# 1) age열에 is_adult() 적용
user_df[, 'age'] # age열이 저장된 벡터 
sapply(user_df[, 'age'], is_adult)

# => 나이에 따른 성인여부가 들어간 벡터 생성 

# 2) user_df에 is_adult()열 추가 
# 데이터프레임$추가할 열이름 <- 데이터
user_df$is_adult <- sapply(user_df[, 'age'], is_adult)

user_df













