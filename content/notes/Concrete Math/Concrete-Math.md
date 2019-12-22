---
title: Concrete Math
date: 2018-08-10
tags: [math, notes]
draft: true
---

> *Concrete Math*

# Divisibility

## 因子求和恒等式

$\sum_{m/n}a_m = \sum_k\sum_{m>0}a_m[n=mk]$

# Prime

## 算数基本定理

正整数的数系表示$<n_2,n_3,n_5,...>$

<!--more-->

# Prime Examples

## 素数

6k+1/6k-1  
素数平方 8n+1

## Euclid number

$$e_n=e_1*e_2*...*e_{n-1}+1=e_{n-1}^2-e_{n-1}+1$$

## Mersenne number

$2^p-1$

## 素数分布

$P_n\sim nln(n)$  
$P_1P_2...P_n + 2$ 到 $P_1P_2...P_n+P_{n+1}-1$ 间都是合数 （可生成任意多合数）

# Factorial factor

## Stirling formula

$$n!\sim \sqrt{2\pi n}(\frac{n}{e})^n$$

相对误差约$\frac{1}{12n}$

## 整除阶乘的最大幂

$$\epsilon_p(n!)=\sum_{k>0}[\frac{n}{p^k}] < \frac{n}{p-1}$$
$$\epsilon_2(n!)=n-v_2(n)$$

# Relative Primality

## 记号

$gcd(a,b)=1 \overset{def}{=} a\perp b$  
$a\perp b, a\perp c\rightarrow a\perp bc$

## Stern-Brocot树

mediant of m/n and m'/n' is $\frac{m+m'}{n+n'}$  
从(0/1,1/0)构造可得此树;从(0/1,1/0,0/-1,-1/0,0/1)可得Stern-Brocot环  
性质：任何阶段两个相邻分数有$m'n-n'm=1$

### 表示有理数的数系

#### LR字符串->有理数

$$M(S) = (n,n';m,m')$$
$$M(I) = (1,0;0,1)$$
$$L = (1,1;0,1) R = (1,0;1,1)$$
$$L^k = (1,k;0,1) R^k = (1,0;k,1)$$

#### 有理数->LR字符串

二分搜索

## Farey serires

$F_n$是0与1间分母不超过N的所有最简分数的集合

# The Congruence relation

## 规定

$a \bmod 0 = a; a \bmod 1 = [a]$

## 平方剩余解的个数

$$x^2 = 1 \pmod p^k$$
$$p\not=2，x=1\backslash-1$$
$$p=2,k>=3，x=1\backslash-1\backslash2^{k-1}-1\backslash2^{k+1}+1$$
若m有r个不同素因子，个数为$2^{r+[8|m]+[4|m]-[2|m]}$

## Wilson 定理

(n-1)!=-1(mod n) 等价于 n>1,n是素数

# 欧拉函数与莫比乌斯函数

## 性质

$$\phi(x) = x*\prod(1-\frac{1}{p})$$
$$\sum_{d|m}\mu(d)=[m=1]$$

## 反演定理

$$g = f*I <-> f = \mu * g$$
$$g(x) = \sum_{d>=1}f(x/d) <-> \sum_{d>=1}\mu(d)g(x/d)$$