---
title: 1-随机事件与运算
date: 2019-03-21
tags: [math, notes]
weight: 1
---

* 随机试验 $E$
* 样本空间 $\Omega=\{E的所有可能结果\}$
* 样本点 $e$（基本事件）：$E$的每个结果
* 随机事件：$A,B,C$ 为 $\Omega$ 的子集
  * $B\subset A$：$A$ 发生必然导致 $A$ 发生
  * 必然事件：$\Omega$
  * 不可能事件：$\emptyset$
* $A\cup B/A+B$： $A,B$ 至少发生一个
* $A\cap B/AB$： $A,B$ 同时发生
* $A - B$：$A$ 发生， $B$ 不发生
  * $P(A-B)=P(A\overline{B})$
* $\overline{A}$： 对立事件
* De Morgan: $\overline{\bigcup A_i}=\bigcap \overline{A_i},\overline{\bigcap A_i}=\bigcup \overline{A_i}$
* Union Bound: $P(\cup A_i)\leq\sum P(A_i)$
* 概率定义：
  * $0\leq P(A)$
  * $P(\Omega)=1$
  * （可列可加性）若 $A_1,\cdots$ 两两互不相容，则 $P(A_1\cup\cdots)=P(A_1)\cup\cdots$
* 概率性质
  * $P(A-B)=A(A)-P(AB)$
    * $A=(A-B)\cup AB$
  * $P(A\cup B)=P(A)+P(B)-P(AB)$
* 古典概型
  * $P(A)=\frac{m}{n}$
* 几何概型
* $P(A|B)=\frac{P(AB)}{P(B)}$
* 乘法公式：$P(AB)=P(B)P(A|B)$
* 全概率公式：对于划分 $A_1,\cdots,A_n, P(B)=\sum_{k=1}^nP(A_k)P(B|A_k)$
* 贝叶斯公式：对于划分 $A_1,\cdots,A_n$, $P(A_i|B)=\frac{P(A_i)P(B|A_i)}{\sum_{k=1}^nP(A_k)P(B|A_k)}$
* 互不相容：$P(A+B)=P(A)+P(B)$
  * 对立事件：$P(A)+P(B)=1$
* 独立性：$P(AB)=P(A)P(B)$
  * 多事件互相独立
  * $P(\bigcup_iA_i)=1-\prod_i P(\overline{A_i})$
* k-wise independent
  * pairwise independent
* pairwise independent bits
  * $X_1,\cdots,X_m$ is mutually independent, then $n=2m-1$ pairwise indenpent bits can be generated: $Y_j=(\sum_{i\in S_j}X_i)\mod 2$
* 可靠性分析（独立工作系统）
  * 可靠性：正常工作的概率
  * 串联方式：$P(B)=P(A_1\cdots A_n)$
  * 并联方式：$P(B)=1-\prod_i P(\overline{A_i})$
* 独立重复试验概型：$n$ 重伯努利试验
  * 两个结果 $A$ 与 $\overline{A}$
  * 试验进行 $n$ 次，每次结果
* $n$ 重伯努利试验中， $A$ 发生 $k$ 次的概率 $P_n(k)=C_n^kp^kq^{n-k}$
* 泊松定理：$\lim_{n\rightarrow\infty}C_n^kp_n^k(1-p_n)^{n-k}=\frac{\lambda^k}{k!}e^{-\lambda}, \lambda=np_n$