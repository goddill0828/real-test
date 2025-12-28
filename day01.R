print("안녕하세요")
print(10 + 20)
10 + 20 
# 코드실행키 : 실행할 코드 드래그 후 ctrl + enter 
# 주석 : 코드 X , 메모처럼 사용 
# 주석 단축키 : ctrl + shift + C 

print(1231231231)
print(1231231231 + 1)


# 변수 
# 변수의 생성 : 변수명 <- 저장할 값 
a <- 10 # a라는 변수에 10이라는 숫자 저장 
b <- 20 # b라는 변수에 20이라는 숫자 저장 
# <- : 대입연산자, 단축키 alt + - 

# 저장한 값 사용 
# -> 저장할 값을 사용할 곳에 변수명을 작성 
print(a) # a라는 변수에 저장한 값을 출력 
a # print() 생략 가능 

# 변수는 여러 타입의 데이터 저장 가능 
# - 오늘 날짜를 저장하는 변수 생성 
c <- 20251206 # 숫자형(정수)
d <-2025.1206 # 숫자형(실수)
e <- "20251206" # 문자형 

c
print(d)
e

# 변수명 작성시 주의사항 
# 1) 띄어쓰기 사용 불가 
# my age <- 20

my_age <- 20 # 스네이크 표기법  
myAge <- 20 # 카멜 표기법
MyAge <- 20 # 파스칼 표기법 

# 2) 특수문자 사용 불가 
#' @!% <- 10
num_two <-  2 # _언더바 사용가능 
num.ten <-  10 # .피리오드 사용 가능 

# 3) 숫자로 시작 불가능 
# 1num <- 10 
n1um <- 10
num1 <- 10

# 4) 키워드 사용 불가능 
# if <-  10 

# 변수에 저장된 값 수정 : 변수명 <- 수정할 값 
age <- 20 
age # age에 저장된 값 20을 출력
age <- 21

# +) 변수 존재 확인 여부 
# exists("변수명")
exists("age") # TRUE, age라는 변수가 있음 
exists("none") # FALSE, none이라는 변수는 없음 



# 자료형 
# 기본 자료형 

# 1) 숫자형 
num1 <- 10 # 정수 
num2 <- 3.14 # 실수 
num3 <- 2.5e2 # 지수표현(250) => 2.5 X 10^2  

class(num1) # numeric, num1에 저장된 값은 숫자형 
is.numeric(num2) # TRUE, num2에 저장된 값은 숫자형이 맞음 
# is.numeric() : 값이 숫자형인지 확인하는 함수 

# 2) 문자형 
ch1 <-  "hello" # 큰따옴표 
ch2 <- 'R' # 작은따옴표 
ch3 <-  "123" # 따옴표 안에 있는 값은 무조건 문자 

typeof(ch1) # character, ch1에 저장된 값은 문자형 
is.character(ch2) # TRUE, ch2에 저장된 값은 문자형이 맞다 

# 3) 논리형 
log1 <- TRUE # 참 
log2 <- FALSE # 거짓 
log3 <- T # TRUE, 첫글자만 사용할 수 있다 
log4 <- F # FALSE

typeof(log1) # logical, log1에 저장된 값은 논리형 
is.logical(log2) # TRUE, log2에 저장된 값은 논리형이 맞다 


# <실습>
# 이름(문자)을 저장하는 변수 name, 
# 나이(숫자) 를 저장하는 변수 age, 
# 취미(문자)를 저장하는 변수 hobby
# 를 생성 후, 변수에 저장된 값 출력 

name <- "정영우"
age <- 23
hobby <- "게임"

name
age
hobby
# 자동완성 단축키 = ctrl + space 


# 특수 자료형 
# 1) NULL 
x <- NULL # 정의되지 않은 값 , 비어있는 값 
is.null(x) # TRUE, x에는 NULL이 들어있음 
typeof(x)

# 변수를 생성할 때, 저장할 값이 명확하지 않은 경우 
# 임시로 변수에 NULL을 저장 
name <- NULL
name <- "짱구"

# 2) NA(결측값)
vec <- c(90, NA, 85, 78) # 벡터 
is.na(vec) # 벡터 안에 결측값인 것은 TRUE, 아니면 FALSE 
mean(vec) # vec 벡터 안에 있는 값의 평균
# => NA가 포함되어 있으면 정상적인 연산 불가 -> NA 
mean(vec, na.rm = TRUE) # NA를 제외하고 평균 계산 

# 3) NaN (Not a Number)
num <- 0 / 0
is.nan(num) # TRUE, num은 NaN

# 4) Inf
num2 <- 10 / 0
is.infinite(num2) # TRUE, num2에 저장된 값은 Inf 


# 형변환 


# 1) 숫자형으로 변환 
char_num <- "123.45" # 문자 

# 문자형 -> 숫자형 
num1 <- as.numeric(char_num)
num1
class(num1)
as.numeric("가") # NA, 변환할 수 있는 문자를 넣어야함 

# 논리형 -> 숫자형 (TRUE -> 1, FALSE -> 0)
logi1 <- T # TRUE 
logi2 <- F # FALSE 
num2 <- as.numeric(logi1) # TRUE => 1 
num3 <- as.numeric(logi2) # FALSE => 0 

# 2) 문자형으로 변환 
num_val <- 123.45 # 숫자형 
log_val <- TRUE # 논리형 

text1 <- as.character(num_val)
text2 <- as.character(log_val)

# 3) 논리형 변환 
# 숫자형 -> 논리형 (0 -> FALSE, 0을 제외한 나머지 -> TRUE)
log1 <- as.logical(0) # FALSE
log2 <- as.logical(123) # TRUE 

# 문자형 -> 논리형 
log3 <- as.logical("TRUE") # "TRUE" -> TRUE 
log4 <- as.logical("F") # "F" => FALSE

 















