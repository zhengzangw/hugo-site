---
title: Pandas
date: 2018-02-02
tags: [python]
---

# Pandas Code Example

## Preface

In this arcticle, I will give examples to illustrate and remind me the usage of some pandas funtion. Just a reminder.

## 数据读写

### read_csv

```pandas
data = pd.read_csv('test.csv')
data = pd.read_csv('test.csv',header = 0/[0,1,2]列名,  index_col = 0/[0,1], nrows = 100)
data = pd.read_csv('test_one.csv', squeeze = True, encoding = 'utf-8') 一列返回Series
data = pd.read_csv('test.csv', prefix = 'X'列前缀, skiprows = 3, skipfooter = 3, na_values = 'NAN')
data = pd.read_csv('test_no_NAN.csv', na_filter = 'False', parse_dates=True/{'foo':[1,3]},infer_datatime_format = True, data_parser = function)
```

<!--more-->

### to_csv

```python
df.to_csv('test.csv',encoding='utf-8')
```

### HDF5

```python
pd.read_hdf('foo.h5','df')
df.to_hdf('foo.h5','df')
```

### Excel

```python
df.to_excel('foo.xlsx',sheet_name='Sheet1')
pd.read_excel('foo.xlsx','Sheet1',index_col=None,na_values=['NA'])
```

## Dataframe

### Creation

```python
pd.DataFrame(
    {'AAA' : [4,5,6,7], 'BBB' [10,20,30,40],
    'CCC' : [100,50,-30,-50]})
pd.DataFrame(list/array/etc.)
```

### Status

```python
df.shape
df.dtypes
df.describe
df.index
df.columns
df.head(3)
df.tail(5)
df.values
```

### Reshaping

```python
df.stack()
df.unstack()
df.T
```

### Other Method

```python
df['a'] = newseries
df.at[2,'a'] = 0
df.iat[0,1] = 0
```

## Data Selection

### df.loc

```python
data.loc[行标签，列标签]
data.loc['a':'b']
data.loc[:,'one'] #如果两个参数都为列表则返回的是DataFrame，否则，则为Series
data.loc[df.AAA >=5,'b'] = -1
data.loc[['a','c'],df['BBB']<5] = -1
data.loc[data.Cabin.notnull()),'Cabin'] = 'Yes' #选取Cabin列中不为空的位置替换为“Yes”
data.iloc[0:3]
data[data.index[0]] 即 data.iloc[0]
```

### where

```python
df.where(df_mask,-1) #False 则赋-1
#增加一没有的列
df['logic'] = np.where(df_mask/df['a']>5,'high','low') #？判断赋值
```

### spliting

```python
data_new = data[data.A<=5]/data.loc(data.A<=5,:)
#Using inverse operator (~) to take the complement of a mask
data_new = data[~(data.A<=5)]
```

### criteria

```python
Crit1 = df.a <=5
Crit2 = df.b =5
AllCrit = Crit1 & Crit2
df[AllCrit]
```

### example

```python
newseries = df.loc[(df['BBB'] < 25) &或| (df['CCC'] >= -40), 'AAA'];
#argsort()函数是将x中的元素从小到大排列，提取其对应的index(索引)，然后输出到y 
df.loc[(df.a-3.14).abs().argsort()]
```

## Columns Modification

### add new columns

```python
new_cols = [str(x) + '_cat' for x in data.columns]
categories = {1 : 'Alpha', 2 : 'Beta', 3 : 'Charlie' }
# df.applymap(dictionary.收到！)
date[new_cols] = date[df.columns].applymap(categeries.收到！)
```

### MultiIndexing

```python
df.columns = pd.MultiIndex.from_tuples([tuple(c.split('_')) for c in df.columns])
```

## Missing Data

```python
data.dropna(axis=1)
data.dropna(how='all')
data.fillna(0)
data.fillna({'a':0,'b':1,'c':'NAN'})
data.isnull(df1)
```

## Index related

```python
data.set_index('row')
data.reset_index()
```

## Sort

```python
data.sort_values(by=('a','b'),ascending = False)
data.sort_index(axis=1,ascending=False)
```

## Grouping

### Basic Kownledge

```python
se.values
se.index
se.idxmax() 最大值索引值 se[se.dixmin()]
df.apply(lambda x:x.max() - x.min()] #传入为每列 
sum() mean() max() min() cumsum()
count()
```

### Basic Usage

```python
df.groupby('a').apply(
    lambda f: f['size'][f['weight'].idxmax()]) 
#传给lambda的是df['a']中相同值的Series。 传出的是值

gb = df.groupby(['a']) #groupby object
gb.收到！_group('one') #dataframe 值为one

# A complicated example
def GrowUp(x):
avg_weight =  sum(x[x['size'] == 'S'].weight * 1.5)
avg_weight += sum(x[x['size'] == 'M'].weight * 1.25)
avg_weight += sum(x[x['size'] == 'L'].weight)
avg_weight /= len(x)
return pd.Series(['L',avg_weight,True], index=['size', 'weight','adult'])
expected_df = gb.apply(GrowUp)

# An example
def replace(g):
    mask = g<0
    g.loc[mask] = g[~mask].mean()
    return g

gb = df.groupby('A')
gb.transform(replace) 传一列

# An easy example
df.loc[df.groupby("AAA")["BBB"].idxmin()]
df.sort_values(by="BBB").groupby("AAA", as_index=False).first()
```

## Panel

```python
pf = pd.Panel({'df1':df1,'df2':df2,'df3':df3})
```

## Generation

```python
rng = pd.date_range('1/1/2013',periods=100,freq='D')
data = np.random.randn(100,4)
```

## Combine

### Concat

```python
pd.concat([df[:3],df[3:7],df[7:]])
```

### Append

```python
df1.append(df2,ignore_index=True)
```

### Merge

```python
df.merge(df2,left_on=['a','b'],right_on=[1,2],how = 'outer/inner')
```

## Time Series

### General

```python
rng = pd.data_range('1/1/2018',periods=100, freq='S')
ts = pd.Series(np.random.randint(0,500,len(rng)), index = rng)
ts.resample('5Min',how='sum')
```

### 常见时间频率

```python
# A year M month W week D day H hour T minute S second
ts_utc = ts.tz_localize('UTC')
ts_utc.tz_convert('US/Eastern')
```

### string to datetime

```python
s1 = '201801-01'
a = time.strptime(s1,'%Y%m-%d')
a.strfttime('%Y-%m-%d’)
dates.astype(str)
```

### to_datetime

```python
arg : integer, float, string, datetime, list, tuple, 1-d array, Series pd.todatetime(df) 
#df中有year,month,day生成df pd.todatetime('20180101',format='%Y%m%d',errors='ignore') dt.strftime("%Y-%m-%d)
```