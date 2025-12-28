# 파일 입출력 

# 1) text파일 작성 

# write.table(데이터, file = '파일명')

# 데이터프레임 생성 
stu.info <- data.frame(
  ID = 1 : 3,
  NAME = c('둘리', '도우너', '또치'),
  AGE = c(10, 9, 11)
)

stu.info

# 데이터프레임을 텍스트 파일로 저장 
write.table(stu.info, file = 'stu.txt', quote = FALSE)
# quote = FALSE : 따옴표 제거 옵션 

# 파일명과 경로
# : 상대경로와 절대경로를 사용하여 memo파일에 text파일 저장 

# 1) 절대 경로 
# 현재 경로 확인 
getwd()

# 절대 경로로 memo폴더에 파일 저장 
write.table(stu.info, file = 'D:/R_0930_jyw/memo/absolute.txt', quote = FALSE, row.names = FALSE)

# row.names = FALSE : 행이름(번호) 작성하지 않음

# 2) 상대 경로로 memo 폴더에 파일 저장 
# * 상대 경로 : 현재 내 위치를 기반으로 움직이는 경로 

# ./ : 현재 내 위치 => getwd()의 경로와 동일 
write.table(stu.info, file = './../memo/relative.txt', quote = FALSE, row.names = FALSE)

# ../ : 상위 디렉터리로 이동, 파일 탐색기의 상위폴더로 이동과 동일 

# 2. text파일 읽기 

read_data <- read.table("./stu.txt")

# fileEncoding = 'utf-8' : 한글 깨짐 방지
# 위에 인코딩이 되지 않는다면 fileEncoding = 'EUC-KR' ㄱㄱ 
read_data

# 1) csv파일 작성(파일 출력)
write.csv(stu.info, './day07/stu.csv')

# 2) csv파일 읽기 
csv_data <- read.csv('./day07/stu.csv', row.names = 1, row.names = FALSE)
# row.names = 1 : 첫번째 열을 행 제목(혹은 번호)으로 설정 

csv_data

# 4. 엑셀 파일 입출력 

# 1) 엑셀 파일 작성 

# 패키지 설치 및 로드 

install.packages('writexl') # 패키지 설치 
library(writexl) # 패키지 로드 

# 엑셀 파일 day07폴더에 저장 
write_xlsx(stu.info, path = './day07/stu.xlsx')


# 만약 이걸 메모장에서 읽거나 excel파일에서 읽을때 그거해야하는지 

# 2) 엑셀 파일 읽기

# 패키지 설치 및 로드
install.packages('readxl')
library(readxl)

xl_data <- read_excel('./day07/stu.xlsx')

xl_data

# dplyr 패키지 

# 패키지 설치 
install.packages('dplyr')
# 패키지 로드
library(dplyr)

# R의 내장 데이터 셋 불러오기 
mtcars # R의 내장 데이터 셋
mc <- mtcars # 데이터셋 변수에 저장 

# filter(데이터, 조건식) : 조건에 맞는 행 추출 

# 1) 실린더(cyl)의 개수가 4기통인 자동차만 추출
filter(mc, cyl == 4)

# 2) 실린더가 6기통 이상이고 연비(mpg)가 20보다 큰 자동차만 추출
filter(mc, cyl >= 6 & mpg > 20)

# select(데이터, 열1, 열2,...) : 지정한 열만 추출

select(mc, am, gear) # am, gear 열 추출 
head(select(mc, am, gear))
# head(데이터) : 상위 6개만 확인 
head(select(mc, am, gear), 3) # <= 콤마하고 볼 데이터 개수 지정 
  
# arrange() : 데이터를 오름차순 정렬 

# (1) wt(무게)열 순으로 오름차순 정렬
arrange(mc, wt)

# (2) mpg(연비)열 순으로 내림차순 정렬 
arrange(mc, desc(mpg))

# (3) 내림차순과 오름차순 혼용 
arrange(mc, mpg, wt)
# 먼저 mpg로 오름차순 정렬 후, 
# mpg가 같은 행은 wt열 기준으로 다시 오름차순 정렬

arrange(mc, mpg, desc(wt))
# 먼저 mpg로 오름차순 정렬 후, 
# mpg가 같은 행은 wt열 기준으로 다시 내림차순 정렬


# 데이터 추가 및 중복 데이터 삭제 함수 

# mutate(데이터셋, 추가할 열 = 데이터)

# 1) years열 추가 
mutate(mc, years = '1974')
mc_years = mutate(mc, years = '1974')
# => years 열이 추가된 데이터 셋 새로 생성

# 2) mpg 순위 열 추가
# ** rank() 함수 : R의 내장 함수, 순위를 구할 때 사용 
rank(c(10, 11, 12, 13)) # 오름차순 순으로 순위
rank(c(10, 11, 12, 12)) # 같은 값(2개)이 있을 경우 3위는 3.5

mutate(mc, mpg_rank = rank(mpg))

# distinct(데이터, 열1, 열2, ...) : 열의 중복 데이터 제거
# => 특정 열의 데이터 종류 확인 

# 1) cyl(실린더 개수)열의 중복 데이터 제거 후 확인 
distinct(mc, cyl)

# 2) 여러 열의 중복 데이터 제거 
distinct(mc, cyl, gear)
# 한번에 열을 여러개 지정하면 cyl, gear의 모든 값이 동일한 행을 제거


# 데이터 요약 및 샘플 추출함수 

# summarise(데이터, 열이름1 = 통계함수)

# 1) cyl열의 평균, 최대, 최소 값 확인

# 열 이름 지정 안해도 사용 가능
summarise(mc, cyl_mean = mean(cyl), cyl_min = min(cyl), cyl_max = max(cyl))


# group_by(데이터, 열) : 해당 열 데이터 기준 데이터를 그룹화
# 주로 다른 함수와 사용

# 1) cyl 데이터로 그룹화 
gr_cyl <- group_by(mc, cyl)
gr_cyl

summarise(gr_cyl, n())
# n() : 데이터의 종류와 개수 확인
# cyl의 데이터는 총 3가지(4, 6, 8)가 있음
# 이에 따른 데이터 개수는 각각 11, 7, 14개이다 

# 2) cyl열 그룹마다 gear값이 중복된 데이터를 제외한 개수 
summarise(gr_cyl, n_distinct(gear))

# ** 주의 : n()과 n_distinct()는 단독으로 사용 불가 
# summarise(), filter(), mutate() 함수와 같이 사용

# 샘플 데이터 추출 
sample_n(mc, 10) # mtcars에서 10개만 추출 
sample_frac(mc, 0.2) # mtcars에서 20% 추출 

# %>%  파이프 연산자 : 데이터에 여러 함수를 한번에 적용 

# 1) cyl별 그룹화 후
gr_cyl <- group_by(mc, cyl)
summarise(gr_cyl, n())

# 파이프 연산자 사용 
group_by(mc, cyl) %>%  summarise(n())

# 2) mutate()로 mpg 순위 추가 후 순위를 기준으로 정렬
mp_rank <- mutate(mc, mpg_rank = rank(mpg))
mp_rank

arrange(mp_rank, mpg_rank)

# 파이프 연산자 사용 
mutate(mc, mpg_rank = rank(mpg)) %>% arrange(mpg_rank)


# <dplyr 패키지 실습>

# 1) mtcars 데이터에서 mpg가 20 이상이고 gear가 3인 데이터만 추출
# 데이터 출력(filter() 함수 사용)
filter(mc, mpg >= 20 & gear == 3)


# 2) mtcars 데이터에서 hp(마력) 순위를 저장하는 hp_rank열 추가 후 
# hp_rank열 기준으로 오름차순 정렬( %>%  연산자 사용)
mutate(mc, hp_rank = rank(hp)) %>% arrange(hp_rank)


# 3) mtcars데이터에서 hp열의 평균과 mpg의 중앙값 확인 
# (summarise() 사용)
summarise(mc, hp_mean = mean(hp), mpg_median = median(hp))


# stringr 패키지 
install.packages('stringr') # 패키지 설치
library(stringr) # 패키지 로드 

# 1) str_count() 
str_count("aabbcc", 'a') # a는 2번 나옴 

# 문자열 벡터로 사용 가능
str_v <- c("apple", 'banana', 'melon')
str_count(str_v, 'a') # 문자열 벡터 요소마다 a가 포함된 개수 count 

# 2) str_c() : 여러 문자열을 하나로 연결 
str_c("cute", 'dog')

v <- c('one', 'two', 'three')
str_c('Vector', v) # 벡터의 요소들마다 연결
str_c(v, 1 : 3)

# str_c 옵션 
str_c('a', 'b', 'c', sep = ',') # 문자열의 사이마다 ,추가 
str_c(v, collapse = ',') # 벡터 요소마다 ,추가

# 3) str_dup() : 문자열 반복
str_dup('dog', 2)

# 4) str_length() : 문자열의 길이 
str_length("python")
str_length(v) # 요소마다의 길이






























