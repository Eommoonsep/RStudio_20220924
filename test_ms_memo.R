dbl_var = c(1, 2.5, 4.5)
print(dbl_var)

l = list(1:3, 'a', c(TRUE, FALSE, TRUE), c(2.5, 4.2))
str(l)

str(l2)

# 데이터프레임 다루기
df = data.frame(col1 = 1:3,
                col2 = c ("this","is","text"),
                col3 = c (TRUE, FALSE, TRUE),
                col4 = c (2.5, 4.2, pi))

str(df)

#v1, v2, v3

v1 = 1:3
v2 = c ("this", "is", "text")
v3 = c (TRUE, FALSE, TRUE)
#출력
data.frame(col1 = v1, col2 = v2, col3 = v3)

getwd()
#"C:/Users/801-16/Documents/test_ms"


download.file('https://github.com/hyunyulhenry/r_basic/raw/master/kospi.xlsx', 'kospi.xlsx', mode = 'wb')
download.file('https://raw.githubusercontent.com/hyunyulhenry/r_basic/master/kospi.csv', 'kospi.csv')


#
#library(lubridate)
#x = c('2021-07-01', '2021-08-01', '2021-09-01')
#y = c('07/01/2015', '08/01/2015', '09/01/2015')
#ymd(x)
#


vec_integer = 8:17
vec_integer


#
v1 = 8:17
c(v1, 18:22)
#특정값 find (vector )
v1[c(2, 4, 6)]
#특정값 조건 find (vector )
v1[v1 < 12 | v1 > 15]

l2$item5 = 'new list item'
print(l2)

str(df)


rbind(df)

v4 = c ("A", "B", "C")
cbind(df, v4)


#2.6.4 결측치 처리하기
x = c(1:4, NA, 6:7, NA)

x
is.na(x)



#2.7.3 엑셀 파일 불러오기 및 저장하기
library(readxl)
kospi_excel = read_excel('kospi.xlsx', sheet = 'kospi')
head(kospi_excel)


#2.8 효율성과 가독성 높이기
#금융 자산의 현재 가치는 다음과 같이 계산됩니다.
#PV=FV/(1+r)n
#즉, 1년 뒤에 110만원을 받는 돈의 현재가치는 110만원/(1+0.1)1=100만원 이라 볼 수 있습니다. 이러한 값을 구하기 위해 매번 계산기를 사용하기 보다는 함수를 이용하면, 훨씬 효율적인 작업이 가능합니다. 위의 수식을 함수로 나타내면 다음과 같습니다.

PV = function(FV, r, n) {
  PV = FV / (1+r)^n
  return(round(PV, 2))
}

#
body(PV)
{
  PV = FV/(1 + r)^n
  return(round(PV, 2))
}

formals(PV)

environment(PV)

## <environment: R_GlobalEnv>

PV(FV = 1000, r = 0.08, n =5)



#if구문 및 for 반복문 1 
for (i in 1:100) {
  #<code: do stuff here with i>
}
#if구문 및 for 반복문 2
for (i in 2016:2020) {
  output = paste("The year is", i)
  print(output)
}


#2.8.2.3 apply 계열 함수
apply(x, MARGIN, FUN, ...)
#
head(mtcars)
# 열의 평균
apply(mtcars, 2, mean)

# 함수사용 예제 1
data = list(item1 = 1:4,
            item2 = rnorm(10),
            item3 = rnorm(20, 1),
            item4 = rnorm(100, 5))
data

lapply(data, mean)


#2.8.3 파이프 오퍼레이터 
#파이프 오퍼레이터는 R에서 동일한 데이터를 대상으로 연속으로 작업하게 해주는 오퍼레이터(연산자)입니다.
#그러나 파이프 오퍼레이터인 %>%를 사용하면 함수 간의 관계를 매우 직관적으로 표현하고 이해할 수 있습니다. 이를 정리하면 아래 표와 같습니다.
#F(x)	x %>% F
#G(F(x))	x %>% F %>% G

x = c(0.3078, 0.2577, 0.5523, 0.0564, 0.4685,
      0.4838, 0.8124, 0.3703, 0.5466, 0.1703)
#우리가 원하는 과정은 다음과 같습니다.
# 1.각 값들의 로그값을 구할 것
# 2.로그값들의 계차를 구할 것
# 3.구해진 계차의 지수값을 구할 것
# 4.소수 둘째 자리까지 반올림할 것
# 입니다. 즉 log(), diff(), exp(), round()에 대한 값을 순차적으로 구하고자 합니다.

x1 = log(x)
x2 = diff(x1)
x3 = exp(x2)
round(x3, 2)

# 괄호, 함수 사용
round(exp(diff(log(x))), 2)
# 파이브 오퍼레이터 사용 
library(magrittr)
x %>% log() %>% diff() %>% exp() %>% round(., 2)


#2.9 데이터 구조 변형하기
# 해당 작업은 tidyr 패키지와 dplyr 패키지를 이용해 매우 효율적으로 수행할 수 있으며, dplyr 패키지의 함수 중 일부는 SQL 구문과 매우 유사합니다.
#2.9.1 tidyr 패키지를 이용한 데이터 모양 바꾸기
#깔끔한 데이터(tidy data)는 다음과 같이 구성되어 있습니다.

# 각 변수(variable)는 열로 구성됩니다.
# 각 관측값(observation)은 행으로 구성됩니다.
# 각 타입의 관측치는 테이블을 구성합니다.

#2.9.1.1 pivot_longer(): 세로로 긴 데이터 만들기
library(tidyr)
table4a


##Stackoverflow
df <- data.frame(x = c(1,2,NA,43,54,NA),
                 y= c("a",NA,"b",30,30,NA))

df %>% 
  mutate(across(everything(),
                ~ replace(.x,
                          .x == 43,
                          "UNKNOWN")))

#
#Analysis
#

library(dplyr)
library(tidyr)
library(magrittr)
library(ggplot2)
library(readxl)
library(haven)
library(stringr)

raw = read_spss('Koweps_hpc16_2021_beta1.sav')
;


welfare %>%
  filter(소분류명 %in% income_bottom30) %>%
  filter(!is.na(월급)) %>% 
  group_by(소분류명, 성별) %>%
  summarize(평균월급 = median(월급)) %>%
  arrange(성별, desc(평균월급)) %>%
  mutate(소분류명 = fct_reorder(소분류명, 성별)) %>%
  ggplot(aes(x = 소분류명, y = 평균월급, fill = 성별)) +
  geom_col(position = 'dodge') +
  coord_flip() +
  xlab('')

#
x = c(8, 3, -2, 5)
if (any(x < 0)) {
  print('x contains negative number')
}

#*2.9.1.1 세로로 긴 데이터 만들기
library(tidyr)
table4a
long = table4a %>% pivot_longer(names_to = 'years', values_to = 'cases', -country)
print(long)


#2.9.1.2 pivot_wider(): 가로로 긴 데이터 만들기
back2wide = long %>% pivot_wider(names_from = 'years', values_from = 'cases')
print(back2wide)


