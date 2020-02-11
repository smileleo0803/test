pip install pandas  

import pandas as pd # 引用套件並縮寫為 pd  
df1 = pd.read_csv('/Users/karen/Downloads/201912.csv')  
print(df1) 

df2 = df1[['','']]


＃讀入csv文字
file ="/Users/karen/Downloads/201912.csv"
gapminder = pd.read_csv（file）
print（type（gapminder））
gapminder.head（）



import csv

# 二維表格

with open('/Users/karen/Downloads/output.csv', 'w', newline='') as csvfile:
  writer = csv.writer(csvfile)

  # 寫入二維表格
  writer.writerows(df2)


print(select_df.shape) # 回傳列數與欄數  
print("---")  
print(select_df.describe()) # 回傳描述性統計  
print("---")  
print(select_df.head(3)) # 回傳前三筆觀測值  
print("---")  
print(select_df.tail(3)) # 回傳後三筆觀測值  
print("---")  
print(select_df.columns) # 回傳欄位名稱  
