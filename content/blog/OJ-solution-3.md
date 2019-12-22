---
title: 问题求解四 OJ 题解
date: 2019-03-12 
tags: [oj]
---

# Linear-Programming 专题编程总结

## [这不是线性规划](http://114.212.10.47:8084/problem.php?cid=1057&pid=0)

穷举所有可能点，二分查找对应区间，斜率判断是否在直线下

## [ylsnb](http://114.212.10.47:8084/problem.php?cid=1057&pid=1)

多商品流

<!--more-->

## [rings](http://114.212.10.47:8084/problem.php?cid=1057&pid=2)

出度等于入度

## [定个小目标](http://114.212.10.47:8084/problem.php?cid=1057&pid=3)

取对偶后初始解可行

## Simplex 模板

```C++
void pivot(int l, int e) {
    b[l] /= a[l][e];
    for (int j = 1; j <= n; j++)
        if (j != e) a[l][j] /= a[l][e];
    a[l][e] = 1 / a[l][e];

    for (int i = 1; i <= m; i++)
        if (i != l && fabs(a[i][e]) > 0) {
            b[i] -= a[i][e] * b[l];
            for (int j = 1; j <= n; j++)
                if (j != e) a[i][j] -= a[i][e] * a[l][j];
            a[i][e] = -a[i][e] * a[l][e];
        }

    ans += c[e] * b[l];
    for (int j = 1; j <= n; j++)
        if (j != e) c[j] -= c[e] * a[l][j];
    c[e] = -c[e] * a[l][e];
}

double simplex() {
    while (true) {
        int enter = 0, leave = 0;
        // Select enter variable
        for (enter = 1; enter <= n; ++enter)
            if (c[enter] > eps) break;
        if (enter == n + 1) return ans;
        // Select leave variable
        double mn = INF;
        for (int i = 1; i <= m; ++i)
            if (a[i][enter] > eps && mn > b[i] / a[i][enter]) {
                mn = b[i] / a[i][enter];
                leave = i;
            }
        if (mn == INF) return INF;
        pivot(leave, enter);
    }
}
```

# DP-1 编程总结

## 数学差劲的小猪佩奇

$f[i][j][k]$ 表示 $i$ 位数，每位从 0-9 任取，已经有和为 $j$ 平方和为 $k$ 时的方案数

利用记忆化搜索，没有限制的才加入 $f[i][j][k]$ 中

## 开灯问题

做差分，将区间翻转变为单点反转。利用 bfs 求最短路，状压 DP

## chain

按 topo 排序后动归

## 爱打麻将的彬彬

最多留四个听吃

```C++
f(i, j, k) = max(f(i, j, k),
    f(i - 1, s, t) + min(a[i]-j ,min(s - k, t)) +
    max(0, a[i]-j - min(s - k, t)) / 3
```

<!--more-->

# DP-2 编程总结

## 杰哥的玉米地

裸状压 DP

## 爱玩祖玛的彬彬

区间 DP

```C++
f[i][j] = min(f[i][j], (a[i] != a[k]) +
            f[i + 1][k - 1] + f[k][j]);
```

## 杰哥送游戏币

区间 DP，考虑一个区间第一个放的是什么

## 杰哥的选择

我出的