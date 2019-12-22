---
title: 域
date: 2019-02-09
tags: [math, notes]
---

* 域： $F$ 为环, $F^\star $ 按乘法构成 Abel 群

## 域的特征和扩张

* 加法阶
  * $F$ 加法群的阶为最小的 $n$, $na=0$
  * $na=a+a+\cdots+a=0$, 最小的 $n$ 为 $a$ 的加法阶
  * $F$ 中非零元的加法阶就是单位元的加法阶
  * 若 $e,2e,3e,\dots\not=0$, 则称 $F$ 的特征为 $0$. $ch(F)=0$
  * 域 $F$ 单位元 $e$ 的加法阶 $p<\infty$, 则 $p$ 为素数。$ch(F)=p$
* $ch(F)=p$, 则 $\sigma:m\rightarrow me$ 是 $Z$ 到 $F$ 的环同态，$ker\sigma=pZ$，$Z/pZ=\{me:m\in Z\}$ 为 $F$ 的最小子域
* $F$ 为特征为 $p$ 的域，则 $a_1,\cdots,a_m\in F$ 时 $(a_1+\cdots+a_m)^{p^n}=a_1^{p^n}+\cdots+a_m^{p_n}$
* 有限域(Galois 域)：$F$ 中只有有限个元素
  * $GF(p)$ 模 p 加乘
  * $GF(p^w)$ 为含 $p^w$ 个元素的有限域，多项式系数只能取 p
    * 由本原多项式在乘法下生成
* $q$ 元域：恰有 $q$ 个元素的域
  * $q$ 元域 $F$ 中有 $x^q-x=\prod_{a\in F}(x-a)$
* 域的扩张：$K$ 为 $L$ 子域，$L$ 为 $K$ 扩域， 记为 $L/K$, 即 $L$ 为 $K$ 的扩张
* 线性空间：$V$ 是域 $F$ 上向量空间
  * $V$ 按加法构成 Abel 群
  * 数乘运算
    * $a(x+y)=ax+ay$
    * $(a+b)x=ax+bx$
    * $1x=x$
    * $(ab)x=a(bx)$
* 扩张次数 $[L:K]$：$L$ 是数域 $K$ 上的向量空间，$L/K$的维数
  * $[L:k]=n$：$L$ 为 $K$ 的 $n$ 次扩域
  * $[L:K]<\infty$：$L$ 为 $K$ 的有限扩域
* $F$ 为 $q$ 元有限域，则 $q$ 必为素数幂次；$q=p^n$ 为素数幂时，必有 $q$ 元域且任意两个 $q$ 元域同构，记为 $F_q$ 或 $GF(q)$

## 代数扩张

* $X$ 生成的 $K$ 的扩环（在 $K$ 上添加 $X$ 生成的环）： $L/K$ 为域扩张，$X\subset L$, 令 $K[X]=\bigcap_{R为 L 子环，R\subset K\cup X} R$ 是 $L$ 包含 $K$ 与 $X$ 的最小子环
* $X$ 生成的 $K$ 上扩域：$K(X)=\bigcap_{K\leq L,F\subset K\cup X}$ 为 $L$ 包含 $K$ 与 $X$ 的最小子域
  * $X$ 有限时，$K[X]=K[\alpha_1,\cdots,\alpha_n],K(X)=K(\alpha_1,\cdots, \alpha_n)$
  * $K[\alpha_1,\cdots,\alpha_n]=\{P(\alpha_1,\cdots,\alpha_n)\}$
  * $K(\alpha_1,\cdots,\alpha_n)=\{\frac{P(\alpha_1,\cdots,\alpha_n)}{Q(\alpha_1,\cdots,\alpha_n)}\}$
  * 单扩张： $K(\alpha)/K$
* 代数元：$L/K$, $\alpha\in L$, 存在 $K[x]$ 中非零多项式 $f(x)$, $f(\alpha)=0$
* 超越元：非代数元
  * $e,\pi$
* $L/K$, $\alpha$ 为 $K$ 上代数元，则 $I=\{g(x)\in K[x]:g(\alpha)=0\}$ 为 $K[x]$ 的理想。 又 $K[x]$ 为 PID, 故 $I$ 有唯一的首一多项式 $f\in K[x]$ 使得 $I=(f)$。 该首一多项式为 $\alpha$ 在 $K$ 上的极小多项式。 极小多项式为 $n$ 次，则称 $\alpha$ 为 $n$ 次代数元。
* $L/K$, $\{\alpha\in L:\alpha 为K上代数元\}$ 为 $L$ 的子域
* $L/K$, $\alpha\in L$ 为 $K$ 上 $n$ 次代数元，则
  * $K(\alpha)=K[\alpha],[K(\alpha):K]=n$，且 $K$ 上向量空间 $K(\alpha)$ 有基底 $1,\alpha,\alpha^2,\cdots,\alpha^{n-1}$
  * $K[x]/(f)\cong K(\alpha)$
* $K$ 为域， 若 $K[x]$ 中次数大于$1$的多项式均可约，即 $n$ 次 $f(x)\in K[x]$ 可写成 $c(x-\alpha_1)\cdots(x-\alpha_n)$ 则称 $K$ 为代数闭域
  * 任何域 $K$ 可扩张称一个代数闭域
* 代数基本定理（Gauss 博士论文证明）：$\mathbb{C}$ 为代数闭域（或可正所有代数数构成代数闭域）
* $L/K$, $L$ 中元都是 $K$ 中代数元，则称 $L/K$ 为代数扩张。否则称为超越扩张
* $L/K$为代数扩张, 则 $[L:K]<\infty \iff$ 有有限个 $K$ 上代数元 $\alpha_1,\cdots,\alpha_n$ 使 $L=K(\alpha_1,\cdots,\alpha_n)$
* $L/M$ 与 $M/K$ 都为代数扩张，则 $L/K$ 为代数扩张

## 域的例子

* $\mathbb{Q},\mathbb{R},\mathbb{C}$
  * $\mathbb{C}=\mathbb{R}(i)\cong R[x]/(x^2+1)$(Cauchy)$=\{a+bx \bmod (x^+1),a,b\in \mathbb{R}\}$， $i=x \bmod x^2+1$, $\mathbb{C}$ 为 $\mathbb{R}$ 上的二维线性空间，$1,i$ 为一组基底
  * $\mathbb{Q}$ 上的代数元为 代数数
  * $\alpha\in \mathbb{C}$ 为 代数整数 指有首一的正系数多项式使得 $f(x)=0$
* $p$ 为素数， $\mathbb{F}=\mathbb{Z}/p\mathbb{Z}$
  * $Z/pZ[x]$ 上必有 $n$ 次不可约多项式，域 $F_p[x]/(f)$ 中有 $p^n$ 个元素
