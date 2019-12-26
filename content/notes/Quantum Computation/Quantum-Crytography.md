---
title: Quantum Error Correction
date: 2019-12-26
weight: 11
---

* Vernam cipher/ One-time pad: 绝对安全（信息论安全），Eve 做任何计算
  * 加密前后概率分布需一样
  * Theorem: the secret key has to be as long as the message
* 密码学安全：Eve 在多项式时间内无法得到任何有效信息
* DH Key Exchange: 离散对数问题，量子计算机下不安全
* Information reconciliation
  * Condition: flipped bits $\leq\delta$ fraction of bits
  * Goal: Alice and Bob
  * Error encoding code
* BB84 QKD protocol
  * $a,b\in_R\{0,1\}^{(4+\delta)n}$
  * $|\psi\rangle=\otimes_{k=1}^{(4+\delta)n}|\psi_{a_k,b_k}\rangle$
    * $|\psi_{0,0}\rangle=|0\rangle,|\psi_{1,0}\rangle=|1\rangle,|\psi_{0,1}\rangle=|+\rangle,|\psi_{1,1}\rangle=|-\rangle$
  * Bob announce achievement
  * Bob $b'\in_R\{0,1\}^{(4+\delta)n}$
    * $b'_i=0$ measure $i$-th bit at $\{|0\rangle,|1\rangle\}$
    * $b'_i=1$ measure $i$-th bit at $\{|+\rangle,|-\rangle\}$
  * Alice announce $b$
  * Discard the bits where $b$ and $b'$ differ
  * Together select a subset of $n$ bits
  * Announce these $n$ bits and compare
  * Information reconciliation
  * privacy amplification
    * Collision entrop: $H_c(X)=-\log(\sum_xp(x)^2)$
* QKD 应用
  * 京沪干线
  * 墨子号卫星
* Q Monkey
  * 基于长时间保存量子态
* Post-Quantum Cryptography
  * 经典密码学
  * 单向函数设计时对付量子计算机
  * 替换大数分解
    * Lattice-based: 理论完善（量子计算难）
    * Multivariate
    * Hash-based
    * Code-based
    * Supersingular elliptic curve isogeney
  * NIST: Post-Quantum Cryptography Standardization
* Delegated Q. Computation
  * 验证对方是量子计算机
    * Factor $\in$ BQP$\backslash$P
    * only 1000 quib
    * Factor 上万比特
  * 协议要求
    * honest: complete
    * dishonest: user is able to detect
    * (Bonus) does not learn anything
  * 08: 2台
  * 18: 1台

## Quantum Simulation

近 5-10 年可用，解薛定谔方程

需要懂物理，理解 $H$

## Quantum Distribution Computation

量子分布计算，混合计算