---
title: Segment Tree
date: 2018-08-25
tags: [ds]
---

# Prepare

## 离散化

```C++
m = a.y
sort(m+1,m+n+1)
len = unique(m,m+n+1) - m
for (int i=1;i<=n;++i) a[i].y = lower_bound(m+1,m+len+1,a[i].y) - m;
```

<!--more-->

## C++技巧

```C++
std::copy(begin,end,des)
std::reverse(begin,end)
```


