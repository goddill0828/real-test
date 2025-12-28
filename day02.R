# 출력함수 

# 1) print()
x <- 123.456

print(x)

# 출력 자릿수 조절
print(x, digits = 3) # 앞에서 3자리만 출력 
print(pi, digits = 2) # 원주율 값, 앞엥서 2자리만 출력 

# 2) cat() 
name <- '정영우'
age <- 23

# 메시지 형태로 이름, 나이 출력 
cat("이름 : ", name,  "나이 : ", age)

# 제어문자(이스케이프 문자) 사용 가능
cat("첫번째줄\n두번째줄")
cat("탭\t탭\t탭\n")


# 3) sprintf()
num1 <- 123 # 정수 
sprintf("정수 : %d", num1)
num2 <- 123.456
sprintf("실수 : %f", num2)
sprintf("실수 : %.2f", num2) # .2f를 쓰게 되면은 반올림해서 소수점 2자리까지 출력 

# 문자열 포맷팅 
name <- '짱구'
age <- 5
sprintf("이름 : %s, 나이 : %d살", name, age)

# 폭 지정 
sprintf("%d", 123)
sprintf("%10d", 123) # 10자리 오른쪽 정렬 
sprintf("%-10d", 123)# 10자리 왼쪽 정렬 
sprintf("%010d",123) # 10자리 오른쪽 정렬, 빈 칸은 0으로 채움 

# <실습>
# 이름, 나이, 월, 일을 저장하는 변수를 각각 생성 후 
# cat(), sprint() 함수를 사용하여 출력 

# <출력 예시>
# 이름 : ???
# 나이 : ??세 
# 오늘날짜 : 12월 7일 

# 변수 생성 
name <- "정영우"
age <- 23
month <- 12
day <- 7

# cat()
cat("이름 : ", name, "\n나이 : ", age, "\n날짜 : ", month,"월", day,"일")

sprintf("이름 : %s, 나이 : %d, 날짜 : %d월 %d일", name, age, month, day)

# 연산자 

# 1) 최우선 연산자 
(5 + 3) * 4 

# 2) 단항 연산자 
# (1) 부호 연산자 : +, -
print(+10) # 양의 정수 
print(+3.14) # 양의 실수 
print(-19) # 음의 정수 
print(-3.15) # 음의 실수

# (2) not 연산자 : !
print(!TRUE)
print(!FALSE)

10 ^ 3 

# 3) 산술 연산자 

# 덧셈
print(10 + 3) # 정수 + 정수 => 정수
print(10 + 3.14) # 정수 + 실수 => 실수
print(10 + 3.0) # 13(.0이 나오지 않음 R에서는)

# 뺄셈 
print(10 - 3)
print(10 - 3.5)


#  곱셈 
print(10 * 3)
print(10 * 2.5)
print(10 * 0.5)

# 나눗셈 
print(10 / 3)
print(10 / 2.5)
# 나눗셈 주의사항 
# => 0으로 나누면 정상적으로 연산되지 않음
print(10 / 0) 

# 몫 연산자 : %/% 
print(10 %/% 3)

# 나머지 연산자 : %% 
print(10 %% 3)

# * 나머지 연산자 활용 
# (1) 짝수, 홀수 구분 
# 짝수 %% 2 => 0
# 홀수 %% 2 => 1 
print(12 %% 2)
print(9 %% 2)

# (2) 배수 관계 확인 
# 3의 배수 : 3, 6, 9, 12, ...
# 3의 배수 %% 3 => 나머지가 0 
print(15 %% 3) #0, 15는 3의 배수 

# 거듭제곱 연산자 : **, ^
print(10 ** 2) # 10 * 10
print(10 ^ 3)

# <산술 연산자 실습> 
# 코인 노래방에서 1곡당 가격이 500원이다. 
# 투입할 금액을 저장할 변수를 생성하고 
# 투입한 금액으로 부를 수 있는 최대 곡의 개수와 
# 거스름돈 금액 출력 

# <예시> 
# 2300원으로 부를 수 있는 최대 곡의 개수는 4곡, 거스름돈은 300원입니다. 


money <- 3300

a <- print(money %/% 500)
b <- print(money %% 500)

sprintf("3300원으로 부를 수 있는 최대 곡의 개수는 %d곡, 거스름돈은 %d원입니다.", a, b)

# <산술 연산자 실습2>
# 두 자리 정수를 저장하는 변수 생성 후 
# 십의 자리 숫자와 일의 자리 숫자를 출력 

# <출력예시>
# 15의 십의 자리 : 1, 일의 자리 : 5

c <- 15 

d <- print(c %/% 10)
e <- print(c %% 10) 

sprintf("15의 십의 자리 : %d, 일의 자리 : %d", d ,e)

# 4) 관계 연산자 

print(10 > 3) # 10은 3보다 크니? TRUE 
print(10 < 3) # 10은 3보나 작니? FALSE 
print(10 >= 3)# TRUE
print(10 <= 3)# FALSE
print(10 == 3)# FALSE
print(10 != 3)# TRUE

# 문자형도 사용 가능 
print('안녕' == '안녕')
print('안녕' != '안녕')

print(10 + 2 > 15 * 2)
# 산술 : 12 > 30 
# 관계 :  FALSE 

print(!(10 < 2))
# 최우선 연산자 : 10 < 2 
# 관계 연산자 : !(FALSE)
# 단항 연산자 : TRUE 


# 5) 논리 연산자 

# & : and 연산자, 둘 다 TRUE라면 TRUE
print(TRUE & TRUE) # T
print(TRUE & FALSE) # F


# | : or 연산자, 둘 중 하나라도 TRUE라면 TRUE 
print(TRUE | FALSE) # T 
print(FALSE | FALSE) # F


print(10 > 10 & 15 >= 0)
# 관계 : FALSE & TRUE 
# 논리 : FALSE 

print(10 > 10 | 15 >= 0)
# 관계 : FALSE & TRUE
# 논리 : TRUE 

# 6) 대입 연산자 
num1 <- 10 # 권장사항
20 -> num2 
num3 = 30 


# <연산자 실습> 
# 2개의 정수를 각각 변수에 저장 후 

# 1) 두 정수에서 하나라도 양수가 있다면 TRUE를 출력 
# 둘 다 양수가 아닐 경우에는 FALSE가 출력 

# 2) 두 정수가 모두 짝수라면 TRUE를 출력 
# 하나라도 짝수가 아닐 경우 FALSE를 출력 


num1 <- 10 
num2 <- -10 

# 1) 둘 중 하나라도 양수라면 TRUE, 그게 아니라면 FALSE
print(num1 > 0 | num2 > 0)

# 2) 모두 짝수라면 TRUE, 둘 중 하나라도 짝수가 아니라면 FALSE 
print(num1 %% 2 == 0 & num2 %% 2 == 0)


# 데이터 구조 

# 1) 벡터(vector)
num_vec <- c(1, 2, 3, 4, 5)
ch_vec <- c('A','B','C')

num_vec
ch_vec

# 2) 행렬(matrix)
ma <- matrix(1:9, nrow = 3 , ncol= 3)
# 1 ~ 9까지의 정수로 구성된 3행 3열의 행렬 

ma

# 3) 데이터 프레임(DataFrame)
df <- data.frame(
  name = c('짱구', '유리', '철수'), # name 열 
  age = c(5, 6, 7), # age열 
  score = c(65, 88, 92) # score열 
)

df

View(df)

# 4) 리스트(list) 
li <- list(
  numbers = num_vec, 
  names = ch_vec,
  scores = ma
)

li





















