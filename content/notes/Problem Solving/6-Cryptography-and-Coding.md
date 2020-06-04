---
title: Cryptography
date: 2019-07-21
tags: [math, notes]
---

# 概论

* 密码系统：$(\mathcal{K}, \mathcal{M}, \mathcal{C})$
  * $\mathcal{K}$ 所有可能秘钥组成的集合
  * $\mathcal{M}$ 所有可能明文组成的集合
  * $\mathcal{C}$ 所有可能密文组成的集合
* 密码：$(E,D)$
  * $E$: 加密算法 $\mathcal{M}\times\mathcal{K}\rightarrow\mathcal{C}$
  * $D$: 解密算法 $\mathcal{D}\times\mathcal{K}\rightarrow\mathcal{M}$
* 一致性原则：$\forall m\in M,k\in K,D(k,E(k,m))=m$
  * 通常 $E$ 是一个随机化算法
  * $D$ 一定是一个确定化算法

## OTP (One Time Pad)

* $K=\{0,1\}^n$
* $M=\{0,1\}^n$
* $C=\{0,1\}^n=\mathcal{M}$
* $E(m,k)=k\oplus m$
* $D(c,k)=k\oplus c$

## PRG 伪随机数生成器

* 高效，确定，不可预测

# 流密码

A stream cipher is a symmetric key cipher where plaintext digits are combined with a pseudorandom cipher digit stream (keystream). In a stream cipher, each plaintext digit is encrypted one at a time with the corresponding digit of the keystream, to give a digit of the ciphertext stream.

## RC4

* 初始化
  * 秘钥参与S盒的生成
* 伪随机子密码生成算法
  * 按字节操作，每次通过一定算法定位S盒中一个元素，与输入异或得到密文

## ChaCha

# 分组密码

a block cipher is a deterministic algorithm operating on fixed-length groups of bits, called a block, with an unvarying transformation that is specified by a symmetric key

## DES

## RC5

## AES/Rijndael

Rijndael是一个分组密码算法族，其分组长度包括128比特、160比特、192比特、224比特、256比特，密钥长度也包括这五种长度，但是最终AES只选取了分组长度为128比特，密钥长度为128比特、192比特和256比特的三个版本

# 密码散列函数

单向函数，极其难以由散列函数输出的结果回推输入的数据是什么

## MD-5

输出128位

## SHA-1

1995,160位，已被攻破

## SHA-2

2001, SHA-224、SHA-256、SHA-384、SHA-512、SHA-512/224、SHA-512/256

## SHA-3

2015

# 非对称加密

## RSA

## ECC

圆锥曲线


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
