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






