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


#2.9.1.3 separate(): 하나의 열을 여러 열로 나누기
table3

table3 %>% 
  separate(rate, into = c("cases", "population"))


#2.9.1.4 unite(): 여러 열을 하나로 합치기
table5

table5 %>% 
  unite(new, century, year, sep = "_")

#2.9.1.5 tidyr 패키지의 기타 함수
score = tribble(
  ~ person, ~ Math, ~ Computer,
  "Henry",  1,         7,
  NA,       2,         10,
  NA,       NA,        9,
  "David",  1,         4
)
score
#score의 2번째와 3번째 행에 NA 데이터가 있어 이를 채워줄 필요가 있습니다.
score %>% 
  fill(person, Math)

score %>% replace_na(replace = list(person = "unknown", Math = 0))



##★2.9.2 dplyr 패키지를 이용한 데이터 변형하기
library(dplyr)
#
library(nycflights13)
#
flights





#3 ggplot을 이용한 데이터 시각화
#그래픽 문법
library(tidyr)
library(dplyr)

#3.2 데이터셋: 다이아몬드
library(ggplot2)
data(diamonds)
head(diamonds)

library(ggplot2)
data(diamonds)
head(diamonds)
# 
# R에서 Time Series Analysis를 할 수 있게 해주는 TSA package를 설치해보도록 하겠습니다. 
# 
# (a) R Console 창에 install.packages("TSA") 함수 입력
# > install.packages("TSA") 
# 출처: https://rfriend.tistory.com/7 [R, Python 분석과 프로그래밍의 친구 (by R Friend):티스토리]
# 


diamonds %>%
  ggplot(aes(x = carat, y = price)) +
  geom_point() +
  facet_grid(. ~ cut)S


flights %>% filter(month == 3, day == 1) %>% head()



flights2 = flights %>% 
  select(year:day, hour, tailnum, carrier)
flights2 %>% head()

#install.packages("dplyr")
library(dplyr)

#install.packages("nycflights13")
library(nycflights13)

flights

#2.9.2.1 select(): 원하는 열 선택하기
flights %>% select(year, month, day) %>% head()

#콜론(:)을 이용해 year부터 day 까지의 열을 한번에 선택할 수도 있습니다.
flights %>% select(-(year:day)) %>% head()

#2.9.2.3 filter(): 필터링
flights %>% filter(month == 3, day == 3) %>% head()



flights

flights %>% summarize(max_dep = max(dep_time, na.rm = TRUE),
                      min_dep = min(dep_time, na.rm = TRUE))

#2.9.2.5 group_by(): 원하는 조건으로 그룹화
by_day = flights %>% group_by(year, month, day)
by_day %>% head()
  
#summarize() 함수를 통해 max_dep에는 dep_time의 최대값을, min_dep에는 dep_time의 최소값을 구해줍니다. na.rm 인자를 TRUE로 설정하여 NA 데이터는 제거해 줍니다.
by_day %>%
  summarise(delay = mean(dep_delay, na.rm = TRUE)) %>%
  head()

#해당 데이터는 그룹별로 묶여 있으므로, summarise() 함수를 적용하면 각 그룹(year, month, day) 별로 dep_delay의 평균을 구합니다.
flights %>% group_by(dest) %>%
  summarise(
    count = n(),
    dist = mean(distance, na.rm = TRUE),
    delay = mean(arr_delay, na.rm = TRUE)
  )

#2.9.2.6 arrange(): 데이터 정렬하기
#arrange() 함수를 통해 원하는 열을 기준으로 데이터를 순서대로 정렬할 수 있으며, 오름차순을 기본으로 합니다.

flights %>% arrange(year, month, day, dep_time, sched_dep_time) %>% head() 

flights
flights2

#2.9.2.7 *_join(): 데이터 합치기
flights2 = flights %>%
  select(year:day, hour, tailnum, carrier)
flights2 %>% head()


#3 ggplot을 이용한 데이터 시각화

library(ggplot2)
data(diamonds)
head(diamonds)


data()
ggplot(data = diamonds, aes(x = carat, y = price))
#x축과 y축에 우리가 매핑한 carat과 price가 표현되었지만, 어떠한 모양(Geometrics)으로 시각화를 할지 정의하지 않았으므로 빈 그림이 생성됩니다. 다음으로 Geometrics을 통해 데이터를 그림으로 표현해주도록 하겠습니다.

#geom_point() 
ggplot(data = diamonds, aes(x = carat, y = price)) +
  geom_point()

#일반적으로 Data는 ggplot() 함수 내에서 정의하기 보다는, dplyr 패키지의 함수들을 이용하여 데이터를 가공한 후 파이프 오퍼레이터(%>%)를 통해 연결합니다.
library(magrittr)
diamonds %>%
  ggplot(aes(x = carat, y = price)) +
  geom_point(aes(color = cut, shape = cut))


#3.4 Facets
#Facets은 여러 집합을 하나의 그림에 표현하기 보다 하위 집합으로 나누어 시각화하는 요소입니다.


diamonds %>%
  ggplot(aes(x = carat, y = price)) +
  geom_point() +
  facet_grid(. ~ cut)



#★3.5 Statistics★
#Statistics는 통계값을 나타내는 요소입니다.

diamonds %>%
  ggplot(aes(x = color  , y = carat)) +
  stat_summary_bin(fun = "mean", geom = "bar")


library(dplyr)
diamonds %>%
  group_by(color) %>%
  summarize(carat = mean(carat)) %>%
  ggplot(aes(x = color, y = carat)) +
  geom_col()

#3.7 Theme
#Theme은 그림의 제목, 축 제목, 축 단위, 범례, 디자인 등 그림을 꾸며주는 역할을 담당합니다.

diamonds %>%
  ggplot(aes(x = carat, y = price)) +
  geom_point(aes(color = cut)) +
  theme_bw() +
  labs(title = 'Relation between Carat & Price',
       x = 'Carat', y = 'Price') +
  theme(legend.position = 'bottom',
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank()
  ) +
  scale_y_continuous(
    labels = function(x) {
      paste0('$', 
             format(x, big.mark = ','))
    })



#4 데이터분석 실습하기
library(dplyr)
library(tidyr)
library(magrittr)
library(ggplot2)
library(readxl)
library(haven)
library(stringr)

raw = read_spss('Koweps_hpc16_2021_beta1.sav')
#Koweps_hpc16_2021_beta1.sav
#https://github.com/hyunyulhenry/r_basic/blob/master/data/Koweps_hpc16_2021_beta1.sav

welfare = raw %>% select('h16_g3',   # 성별
                         'h16_g4',   # 태어난 연도
                         'h16_g6',   # 교육 수준
                         'h16_eco9', # 직종 코드
                         'h16_reg7', # 지역 코드
                         'p1602_8aq1' # 월급
) %>%
  set_colnames(c('성별', '연도', '교육', '직종', '지역', '월급'))

#

#4.1 성별에 따른 월급 차이
welfare %>%
  select(성별) %>%
  table()

#
welfare = welfare %>%
  mutate(성별 = if_else(성별 == 1, '남', '여'))

#
welfare %>%
  select(성별) %>%
  ggplot(aes(x = 성별)) +
  geom_bar()
#4.2 나이에 따른 월급의 관계
#이제 나이에 따른 월급을 살펴봅시다.
welfare = welfare %>%
  mutate(나이 = 2021 - 연도 + 1) 
#
welfare %>%
  filter(!is.na(월급)) %>%
  group_by(나이) %>%
  summarise(평균월급 = median(월급)) %>%
  ggplot(aes(x = 나이, y = 평균월급)) +
  geom_line()
  geom_vline(xintercept = 45, color ='red', linetype = 2) +
  geom_vline(xintercept = 60, color = 'red')

#45세 가량 피크를 찍은 후, 점차 감소하는 모습을 보입니다. 70세부터는 실질적으로 수입이 없는 모습입니다. 이번에는 연령대를 나눠보도록 하겠습니다. 30세 미만은 초년, 50세 이하는 중년, 그 이상은 노년으로 구분합니다.
  welfare = welfare %>%
    mutate(연령대 = if_else(나이 < 30, '초년', if_else(나이 <= 50, "중년", "노년"))) 

#이번에는 연령대 별 월급의 차이를 살펴보겠습니다.
  welfare %>%
    filter(!is.na(월급)) %>% 
    group_by(연령대) %>%
    summarize(평균월급 = median(월급)) %>%
    ggplot(aes(x = 연령대, y = 평균월급)) +
    geom_col() +
    scale_x_discrete(limits = c('초년', '중년', '노년'))
    
  
