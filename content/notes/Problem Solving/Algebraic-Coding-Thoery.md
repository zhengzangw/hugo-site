---
title: Algebraic Coding Thoery
date: 2019-01-18
tags: [ps, notes]
---

# 代数编码

* maximum-likelihood decoding: $e$ has the least weight
* binary symmetric channel
  * $X\sim B(n,p)$
* Block codes
  * $(n,m)$-block code
    * $[n,m,d]$-code
    * encoding function: $E:\mathbb{Z}_2^m\rightarrow\mathbb{Z}_2^n$
    * decoding function: $D:\mathbb{Z}_2^n\rightarrow\mathbb{Z}_2^m$
    * codeword: element in image of $E$ ($n$)
  * Hamming distance: $d(x,y)$
  * weight: $w(x)=d(x,0)$
    * $w(x+y)=d(x,y)$
  * correcting: $t=[\frac{d_{\min}-1}{2}]$
  * detecting：$e=d_{\min}-1$
  * combined：$d_{\min}\geq t+e+1,(e>t)$
  * 冗余度：$\frac{n-m}{m}$
  * 编码率：$\frac{m}{n}$
* Group code: code that is also a subgroup of $\mathbb{Z}_2^n$
  * $d_{\min}=\min\{w(x):x\not=0\}$
* Linear code: A linear code $C$ of length n is a linear subspace of the vector space $\mathbb{Z}_2^n$
  * $\text{Null}(H), H \in\mathbb{M}_{m\times n}(\mathbb{Z}_2)$
    * $C=\text{Null}(H)$ is a group code
  * $\text{Col}(G_{n\times k})=\text{Null}(H_{(n-k)\times n})$
    * $Gx=y\iff Hy=0$
* 循环码：线性码满足任一码字左移或右移一位后，得到的仍然是该码的一个码字
  * 码多项式：把码组中各码元作为多项式系数 $T(x)=\sum_{i=0}^{n-1}a_{i}x^i$
  * (n,m) 循环码每个码字在以 $x^n+1$ 为模运算的剩余类中某一类
  * 生成多项式 $g(x)$
    * 常数项为 $1$ 的 $r=n-m$ 次多项式
    * $x^n+1$ 的因式
    * 其它码多项式为其倍式
    * 不唯一

## Parity-Check

* canonical parity check matrix: $H=(A|I_m),A_{m\times(n-m)}$
  * $H$ give rise to an $(n,n-m)$-block code
* standard generator matrix: $G_{n\times(n-m)}=(\frac{I_{n-m}}{A})$
  * $HG=0$
* $d(C)$ equals the minimum number of linearly dependent columns of $H$
  * $\text{Null}(H)$ is a single error-detecting code if and only if no column of $H$ consists entirely of zeros
  * $\text{Null}(H)$ is a single error-correcting code if and only if $H$ does not contain any zero columns and no two columns of $H$ are identical
* Syndrone Decoding
  * syndrone of $x$: $Hx$
  * $x=c+e,Hx=He$
  * if the syndrome of $r$ is equal to some column of $H$, say the ith column, then the error has occurred in the ith bit
* Coset Decoding (Standard Decoding)
  * $(n,m)$-linear code has $2^{n-m}$ cosets
  * coset leader: an n-tuple of least weight in a coset
  * $x$ and $y$ are in the same coset $\iff Hx=Hy$
* Correcting one error: $[2^r − 1, 2^r − r − 1, 3]_2$-code
* Detecting one error: $[r+1, r, 2]_2$-code

## 卷积码

* 卷积码 $(n,k,N)$
  * 将当前 $k$ 比特信息编码为 $n$ 个比特
  * 前 $m=(N-1)$ 信息段
* 解码
  * 代数解码：大数逻辑解码
  * 概率解码：维特比解码
    * 将接收到的信号序列和所有可能的发送信号序列比较，选择其中汉明距离最小的序列认为是当前发送信号序列
    * 最大似然
    * 动态规划
