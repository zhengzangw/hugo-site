---
title: 背包九讲
date: 2018-05-10
tags: [oj, ps, algorithm]
---

[dp 九讲](https://wenku.baidu.com/view/4d68b68fbceb19e8b8f6bacd.html)

## 01 背包

$$F[i,v] = \max\{F[i-1,v],F[i-1,v-Ci]+Wi\}$$

```c++
for i=1 to N
    for v = V to Ci
        F[v] = max{F[v],F[v-Ci]+Wi}
```

恰好装满：$F[1..V] = -\infty; F[0] = 0$  
无必要： $F[0..V] = 0$

## 完全背包

$$F[i,v] = \max\{F[i-1,v-kCi] + kWi | 0<=kCi<=v \&\& 0<=k<Mi\}$$
（利用$F[i,v-Ci]$代换）

- $O(n^2)$ 若两件物品 i、j 满足 Ci≤Cj 且 Wi≥Wj，则将可以将物品 j 直接去掉，不用考虑
- $O(V+N)$ 首先将费用大于 V 的物品去掉，然后使用类似计数排序的做法，计算出费用相同的物品中价值最高的是哪个
- 把第 i 种物品拆成费用为 Ci2k、价值为 Wi2k 的若干件物品，其中 k 取遍满足 Ci2k≤V 的非负整数

```C++
for i = 1 to N
    for v = Ci to v
        F[v] = max(F[v],F[v-Ci]+Wi)
```

## 多重背包

完全背包思路（可以看作是分组背包问题）

```C++
for i = 1 to N
    for v = V to Ci
        for k = 1 to Mi
```

01 背包思路
系数分别为$1,2,2^2...2^(k−1),Mi−2^(k+1)$

```C++
for i = 1 to N
    if Ci*Mi >= V
        for v = Ci to v
            F[v] = max(F[v],F[v-Ci]+Wi)
    else
        k = 1;
        while k <= M
            for v = Ci to v
                F[v] = max(F[v],F[v-k*Ci]+k*Wi)
            M = M - k;
            k = 2k;
        for v = Ci to v
                F[v] = max(F[v],F[v-M*Ci]+M*Wi)
```

## 单调队列（双端队列）

1. 每次遇到<=的元素就抛掉，是因为这些元素肯定不是这一段区间的最值，所以对求下一段区间最值无影响。
2. 新来的元素都是从队尾开始比较，保证了队列从队尾到队首的元素一定是从最新的到最老的，这样做就解决了问题 1 最值位置的不确定性。
3. 每次使用队首元素时先判断是否过时，过时就抛掉，这就解决了问题 2。

总的来说，单调队列的思想就是，利用队尾插入保证元素的新旧顺序，插入时只保存可能影响下一段区间的元素，使用队首元素时先判断是否过时，删掉对求下一段最值无影响的元素。

元素单调的队列。动态规划中，每个元素一般存两个值

1. 下标
2. 动态规划中的状态值

形如
$$dp[i] = opt(f[j]) + g[i] (i-k<=j<i)$$
维护$f[k]$的最大合法值进行转移

```C++
for i = 1 to n
    for j = i-k to i-1
        dp[i] = opt(dp[i],f[j]) + g[i]
```

利用单调队列：

```c++
for i = 1 to n
    eliminate(i-k); //舍弃不在选择范围内的数据
    dp[i] = que.top + g[i]; //选择当前最优f[j]
    que.insert(i,f[i]);
```

## 多重背包的单调队列优化

$$F[v] = \max\{F[v-kCi] + kWi | 0<=kCi<=v \&\& 0<=k<Mi\}$$
$$F[q*Ci+r] = \max\{F[q*Ci+r - k*Ci] + kWi\} = \max\{F[k*Ci+r] + (q-k)*W[i] (k>=0 \&\& q-M[i]<= k <=q)$$
令 $G[k] = F[k*Wi+r]$  
则 $G[q] = max{G[k] - k*Wi} + (q-k)*Wi (k>=0 且 q-Mi<=k<=q)$

对于如下形式的转移方程（其中 H、G 和 W 均为常量，B[i]为决策下标的下界，随 i 单调）：
$$F[i] = opt\{F[i-x*H+W]\}+G (B[i]<=i-x*H+W<i，x\in N）$$

## 混合背包

判断分三类即可。

## 二维费用

F[i,v,u] = max{F[i-1,v,u],F[i-1,v-Ci,u-Di]}
总个数限制也可看作一维

## 分组背包

```C++
for k= 1 to K
    for v = V to 0
        for i in group k
            F[v] = max{F[v],F[v-Ci]+Wi}
```

## 有依赖的背包

将主件与附件转化为$V-Ck+1$个物品的物品组  
树形依赖：树形动归

## 泛化物品

物品：V=h(W)

## 问法变化

## 输出方案

再用一个数组 G[i,v]，设 G[i,v]=0 表示推出 F[i,v]的值时是采用了方程的前一项（也即 F[i,v]=F[i−1,v]），G[i,v]=1 表示采用了方程的后一项。

## 方案总数

$$F[0,0]=1;$$
$$F[i,v]=\sum(F[i-1,v],F[i,v-Ci])$$

## 最优方案数

```c++
G[0,0]=1
    for i= 1 to N
        for v= 0 to V
            F[i,v]:=max{F[i−1,v],F[i−1,v−Ci]+Wi}G[i,v]:=0
            if F[i,v]=F[i−1,v]G[i,v]+=G[i−1][v]
            if F[i,v]=F[i−1,v−Ci]+WiG[i,v]+=G[i−1][v−Ci]
```

## 第 K 优解

对于求次优解、第 K 优解类的问题，如果相应的最优解问题能写出状态转移方程、用动态规划解决，那么求次优解往往可以相同的复杂度解决，第 K 优解则比求最优解的复杂度上多一个系数 K

其基本思想是，将每个状态都表示成有序队列，将状态转移方程中的 max/min 转化成有序队列的合并

F[i,v,k] 表示 前 i 个物品中，背包大小为 v 时，第 k 优解的值
F[i,v]这个有序队列是由 F[i−1,v]和 F[i−1,v−Ci]+Wi 这两个有序队列合并得到的。前者 F[i−1][v]即 F[i−1,v,1...K]，后者 F[i−1,v−Ci]+Wi 则理解为在 F[i−1,v−Ci,1...K]的每个数上加上 Wi 后得到的有序队列。合并这两个有序队列并将结果的前 K 项储存到 f[i,v,1...K]中的复杂度是 O(K)。最后的第 K 优解的答案是 F[N,V,K]。总的时间复杂度是 O(VNK)
