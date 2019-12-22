---
title: String Algorithm
date: 2019-05-23
tags: [ps]
---

# 字符串匹配

* $w\sqsubset x$：w 为 x 前缀
* $w\sqsupset x$: w 为 x 后缀
* 后缀重叠引理：$x\sqsupset z,y\sqsupset z,|x|\leq|y|\Rightarrow x\sqsupset y$
* $P_k=P[1..k]$

## 朴素方法

$O((n-m+1)m)$

## Rabin-Karp 算法

* 预处理 $O(m)$
  * 编码，利用对素数取模，减少计算量
  * 相等则逐字编码
* 最坏情况 $O((n-m+1)m)$

<!--more-->

## 有限自动机

* 有限自动机 $M=\{Q,q_0,A,\Sigma,\delta\}$
  * 终态函数：$\phi:\Sigma^*\rightarrow Q$
* 后缀函数：$\sigma(x)=\max\{k:P_k\sqsupset x\}$
* 字符串匹配自动机
  * $Q=\mathbb{Z}_m$, $q_0=0$, $A=\{m\}$
  * $\sigma(q,a)=\sigma(P_q a)$
  * 不变量：$\phi(T_i)=\sigma(T_i)$

## Knuth-Morris-Pratt Algorithm

* $\Theta(n+m)$

```c
void kmp(char* pattern, char* text){
    
    int j = 0;
    for (int i=2;i<=n;++i){
        while (j&&pattern[j+1]!=pattern[i]) j = nxt[j];
        if (pattern[j+1]==pattern[i]) j++;
        nxt[i] = j;
    }
    
    
    for (int i = 1, j = 0; i <= m; ++i){
        while (j&&pattern[j+1]!=text[i]) j = nxt[j];
        if (pattern[j+1]==text[i]) j++;
        if (j==n) {
            printf("%d\n", i-n+1);
            j = nxt[j];
        }
    }
}
```