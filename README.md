# RStudio_20220924
RStudio_Memo_20220924

https://hyunyulhenry.github.io/r_basic/

https://hyunyulhenry.github.io/r_basic/#r-%EA%B8%B0%EC%B4%88-%EB%B0%B0%EC%9A%B0%EA%B8%B0



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







