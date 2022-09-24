# RStudio_20220924
RStudio_Memo_20220924

https://hyunyulhenry.github.io/r_basic/

https://hyunyulhenry.github.io/r_basic/#r-%EA%B8%B0%EC%B4%88-%EB%B0%B0%EC%9A%B0%EA%B8%B0


>> ★최상위 패키지 통 다운로드 ★
>> install.packages("tidyverse") 



11:24
#dbl_var = c(1, 2.5, 4.5)
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


> v1 = 8:17
> c(v1, 18:22)
 [1]  8  9 10 11 12 13 14 15 16 17
[11] 18 19 20 21 22
> #특정값 find (vector )
> v1[c(2, 4, 6)]
[1]  9 11 13
> #특정값 조건 find (vector )
> v1[v1 < 12 | v1 > 15]
[1]  8  9 10 11 16 17



df = data.frame (col1 = 1:3,
                 col2 = c ("this", "is", "text"),
                 col3 = c (TRUE, FALSE, TRUE),
                 col4 = c (2.5, 4.2, pi))
str(df)

'data.frame':	3 obs. of  4 variables:
 $ col1: int  1 2 3
 $ col2: chr  "this" "is" "text"
 $ col3: logi  TRUE FALSE TRUE
 $ col4: num  2.5 4.2 3.14
 
 
 rbind(df)
 > rbind(df)
  col1 col2  col3     col4
1    1 this  TRUE 2.500000
2    2   is FALSE 4.200000
3    3 text  TRUE 3.141593
 
 


v4 = c ("A", "B", "C")
cbind(df, v4)

> cbind(df, v4)
  col1 col2  col3     col4 v4
1    1 this  TRUE 2.500000  A
2    2   is FALSE 4.200000  B
3    3 text  TRUE 3.141593  C




#2.6.4 결측치 처리하기
x = c(1:4, NA, 6:7, NA)

x
is.na(x)

> #2.6.4 결측치 처리하기
> x = c(1:4, NA, 6:7, NA)
> x
[1]  1  2  3  4 NA  6  7 NA
> is.na(x)
[1] FALSE FALSE FALSE FALSE  TRUE
[6] FALSE FALSE  TRUE

![image](https://user-images.githubusercontent.com/23132345/192077573-1a02f523-d7b3-4299-8d5b-0e5f20d1e4bb.png)

#2.7.3 엑셀 파일 불러오기 및 저장하기
library(readxl)
kospi_excel = read_excel('kospi.xlsx', sheet = 'kospi')
head(kospi_excel)

> #2.7.3 엑셀 파일 불러오기 및 저장하기
> library(readxl)
> kospi_excel = read_excel('kospi.xlsx', sheet = 'kospi')
> head(kospi_excel)
# A tibble: 6 × 3
  Date                Close   Ret
  <dttm>              <dbl> <dbl>
1 2020-01-02 00:00:00 2175. -1.02
2 2020-01-03 00:00:00 2176.  0.06
3 2020-01-06 00:00:00 2155. -0.98
4 2020-01-07 00:00:00 2176.  0.95
5 2020-01-08 00:00:00 2151. -1.11
6 2020-01-09 00:00:00 2186.  1.63




![image](https://user-images.githubusercontent.com/23132345/192077608-0e1b9d6a-748b-4711-a105-505c18b6fda0.png)



#2.8 효율성과 가독성 높이기
#금융 자산의 현재 가치는 다음과 같이 계산됩니다.
#PV=FV/(1+r)n
#즉, 1년 뒤에 110만원을 받는 돈의 현재가치는 110만원/(1+0.1)1=100만원 이라 볼 수 있습니다. 이러한 값을 구하기 위해 매번 계산기를 사용하기 보다는 함수를 이용하면, 훨씬 효율적인 작업이 가능합니다. 위의 수식을 함수로 나타내면 다음과 같습니다.
#1.
PV = function(FV, r, n) {
  PV = FV / (1+r)^n
  return(round(PV, 2))
}


#2.
body(PV)
{
  PV = FV/(1 + r)^n
  return(round(PV, 2))
}

#3.
formals(PV)

#4.
environment(PV)

#5.
## <environment: R_GlobalEnv>

PV(FV = 1000, r = 0.08, n =5)


> PV = function(FV, r, n) {
+   PV = FV / (1+r)^n
+   return(round(PV, 2))
+ }
> #
> body(PV)
{
    PV = FV/(1 + r)^n
    return(round(PV, 2))
}
> formals(PV)
$FV


$r


$n


> environment(PV)
<environment: R_GlobalEnv>
> PV(FV = 1000, r = 0.08, n =5)
[1] 680.58

![image](https://user-images.githubusercontent.com/23132345/192077846-41117728-7c02-4f26-9e3a-01e4bd4daba3.png)




#if구문 및 for 반복문 1 
for (i in 1:100) {
  #<code: do stuff here with i>
}
#if구문 및 for 반복문 2
for (i in 2016:2020) {
  output = paste("The year is", i)
  print(output)
}

> #if구문 및 for 반복문 2
> for (i in 2016:2020) {
+   output = paste("The year is", i)
+   print(output)
+ }
[1] "The year is 2016"
[1] "The year is 2017"
[1] "The year is 2018"
[1] "The year is 2019"
[1] "The year is 2020"




![image](https://user-images.githubusercontent.com/23132345/192077964-59316e24-57d8-4b32-b1ac-1e5a59ae3df5.png)
증적




#2.8.2.3 apply 계열 함수
apply(x, MARGIN, FUN, ...)
#
head(mtcars)
# 열의 평균
apply(mtcars, 2, mean)

> #
> head(mtcars)
                   mpg cyl disp  hp
Mazda RX4         21.0   6  160 110
Mazda RX4 Wag     21.0   6  160 110
Datsun 710        22.8   4  108  93
Hornet 4 Drive    21.4   6  258 110
Hornet Sportabout 18.7   8  360 175
Valiant           18.1   6  225 105
                  drat    wt  qsec
Mazda RX4         3.90 2.620 16.46
Mazda RX4 Wag     3.90 2.875 17.02
Datsun 710        3.85 2.320 18.61
Hornet 4 Drive    3.08 3.215 19.44
Hornet Sportabout 3.15 3.440 17.02
Valiant           2.76 3.460 20.22
                  vs am gear carb
Mazda RX4          0  1    4    4
Mazda RX4 Wag      0  1    4    4
Datsun 710         1  1    4    1
Hornet 4 Drive     1  0    3    1
Hornet Sportabout  0  0    3    2
Valiant            1  0    3    1
> # 열의 평균
> apply(mtcars, 2, mean)
       mpg        cyl       disp 
 20.090625   6.187500 230.721875 
        hp       drat         wt 
146.687500   3.596563   3.217250 
      qsec         vs         am 
 17.848750   0.437500   0.406250 
      gear       carb 
  3.687500   2.812500 

증적
![image](https://user-images.githubusercontent.com/23132345/192078085-a7d4796e-a8eb-41b5-baa1-2b4c2e9224a0.png)




# 함수사용 예제 1
data = list(item1 = 1:4,
            item2 = rnorm(10),
            item3 = rnorm(20, 1),
            item4 = rnorm(100, 5))
data

lapply(data, mean)



# 함수사용 예제 1
data = list(item1 = 1:4,
            item2 = rnorm(10),
            item3 = rnorm(20, 1),
            item4 = rnorm(100, 5))
data

lapply(data, mean)

증적

![image](https://user-images.githubusercontent.com/23132345/192078150-4b1b9773-288a-4368-ae0f-619b7e36b00e.png)





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


> x = c(0.3078, 0.2577, 0.5523, 0.0564, 0.4685,
+       0.4838, 0.8124, 0.3703, 0.5466, 0.1703)
> x1 = log(x)
> x2 = diff(x1)
> x3 = exp(x2)
> round(x3, 2)
[1] 0.84 2.14 0.10 8.31 1.03 1.68
[7] 0.46 1.48 0.31
> #
> round(exp(dif(log(x))), 2)
Error in dif(log(x)) : could not find function "dif"
> #
> round(exp(diff(log(x))), 2)
[1] 0.84 2.14 0.10 8.31 1.03 1.68
[7] 0.46 1.48 0.31
> # 파이브 오퍼레이터 사용 
> library(magrittr)
> # 파이브 오퍼레이터 사용 
> library(magrittr)
> x %>% log() %>% diff() %>% exp() %>% round(., 2)
[1] 0.84 2.14 0.10 8.31 1.03 1.68
[7] 0.46 1.48 0.31


증적:
![image](https://user-images.githubusercontent.com/23132345/192078372-da9135e2-2150-4b1c-b644-7a15e31d743b.png)






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

> #2.9.1.1 pivot_longer(): 세로로 긴 데이터 만들기
> library(tidyr)
Error in library(tidyr) : ‘tidyr’이라고 불리는 패키지가 없습니다
> #2.9.1.1 pivot_longer(): 세로로 긴 데이터 만들기
> library(tidyr)
Error in library(tidyr) : ‘tidyr’이라고 불리는 패키지가 없습니다
> table4a
Error: object 'table4a' not found
> #2.9.1.1 pivot_longer(): 세로로 긴 데이터 만들기
> library(tidyr)

다음의 패키지를 부착합니다: ‘tidyr’

The following object is masked from ‘package:magrittr’:

    extract

> table4a
# A tibble: 3 × 3
  country     `1999` `2000`
* <chr>        <int>  <int>
1 Afghanistan    745   2666
2 Brazil       37737  80488
3 China       212258 213766




증적:
![image](https://user-images.githubusercontent.com/23132345/192078475-2124548b-c58e-477a-84b6-c7809626a5d6.png)



R에서 Time Series Analysis를 할 수 있게 해주는 TSA package를 설치해보도록 하겠습니다. 
 
(a) R Console 창에 install.packages("TSA") 함수 입력
 



 > install.packages("TSA") 
출처: https://rfriend.tistory.com/7 [R, Python 분석과 프로그래밍의 친구 (by R Friend):티스토리]

>> ★패키지 통 다운로드 ★
>> install.packages("tidyverse") 

![image](https://user-images.githubusercontent.com/23132345/192083645-972e14dc-20f3-401e-91f1-bd5a592f07f4.png)



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
flights %>% filter(month == 3, day == 1) %>% head()
  
  
  ![image](https://user-images.githubusercontent.com/23132345/192083986-bb2001c7-3660-4a66-8cc5-71d2ea5b0830.png)

  
  
  
flights

flights %>% summarize(max_dep = max(dep_time, na.rm = TRUE),
                      min_dep = min(dep_time, na.rm = TRUE))

#2.9.2.5 group_by(): 원하는 조건으로 그룹화
by_day = flights %>% group_by(year, month, day)
by_day %>% head()
  
![image](https://user-images.githubusercontent.com/23132345/192084339-ba8c9385-4612-48b3-833f-02b0b20293ae.png)
  
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

  
![image](https://user-images.githubusercontent.com/23132345/192084822-f510e804-ee3c-4c2d-bd8a-e9ef6f54d447.png)

  
  
  
  
  ![image](https://user-images.githubusercontent.com/23132345/192084863-a1a6d035-c92c-486d-88e1-9ff08a4f607e.png)

  
  ![image](https://user-images.githubusercontent.com/23132345/192084901-c47d5ec0-26ac-4975-99df-f0854ed94537.png)

    
  
  
  
