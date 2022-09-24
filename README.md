# RStudio_20220924
RStudio_Memo_20220924

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





