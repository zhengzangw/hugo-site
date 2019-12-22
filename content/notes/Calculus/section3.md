---
title: 3-级数
date: 2019-09-19
tags: [math, notes]
weight: 3
---

* 级数：形式和：$\sum_{n=1}^{+\infty}a_n=a_1+a_2+\cdots$
* 部分和：$S_n=\sum_{k=1}^na_k$
* 收敛 $\sum_{n=1}^{+\infty}a_n=A$：$\lim_{n\rightarrow+\infty}S_n=A$
* 发散：不收敛
* Cauchy 准则：收敛 $\iff\forall\epsilon>0,\exists N\in\mathbb{R},\forall m>N,\forall n>N,m>n$ 有 $|\sum_{k=n+1}^ma_k|<\epsilon$
* 线性：收敛时满足
* 非负项级数：$a_n\geq 0$
  * $\sum_{n=1}^{+\infty}$ 有值非负，收敛 $\iff<+\infty$
  * 比较判别法 I： $a_n\geq b_n\geq 0$
    * $\sum_{n=1}^{+\infty}a_n$ 收敛，$\sum_{n=1}^{+\infty}b_n$ 收敛
    * $\sum_{n=1}^{+\infty}b_n$ 发散，$\sum_{n=1}^{+\infty}a_n$ 发散
  * 比较判别法 II
    * $\lim_{n\rightarrow+\infty}\frac{a_n}{b_n}=c<+\infty$，且 $\sum_{n=1}^{+\infty}b_n$ 收敛，$\sum_{n=1}^{+\infty}a_n$ 收敛
    * $\lim_{n\rightarrow+\infty}\frac{a_n}{b_n}=c>0$，且 $\sum_{n=1}^{+\infty}b_n$ 发散，$\sum_{n=1}^{+\infty}a_n$ 发散
  * 比值法（D'Alembert）
    * $\lim_{n\rightarrow+\infty}\frac{a_{n+1}}{a_n}=q<1$，则 $\sum_{n=1}^{+\infty}a_n$ 收敛
    * $\lim_{n\rightarrow+\infty}\frac{a_{n+1}}{a_n}=q>1$，则 $\sum_{n=1}^{+\infty}a_n$ 发散
  * 根式法（Cauchy）
    * $\lim_{n\rightarrow+\infty}\sqrt[n]{a_n}=q<1$, 收敛
    * $\lim_{n\rightarrow+\infty}\sqrt[n]{a_n}=q>1$, 发散
  * 积分法：$f$ 在 $[k,+\infty]$ 上可积，$f|_{(n,n+1)}\geq a_n$
    * $\sum_{n=k}^{+\infty}a_n\leq\int_k^\infty f(x)dx$
* 交错级数 Leibniz 判别法：$\{|a_n|\}$ 单调且极限为 $0$，则 $\sum_{n=1}^{+\infty}$ 收敛
* 绝对收敛：$\sum_{n=1}^{+\infty}|a_n|$ 收敛
  * 绝对收敛则收敛
  * 条件收敛：收敛但非绝对收敛
* 重排: $\sum_{n=1}^{+\infty}a_{\varphi(n)}$
  * Riemann 定理：$\forall A,\sum_{n=1}^{+\infty}a_n$ 为实级数且条件收敛，则存在重排 $\sum_{n=1}^{+\infty}b_n=A$
  * $\sum_{n=1}^{+\infty}a_n$ 收敛则可对相继项加括号
  * $\sum_{n=1}^{+\infty}a_n$ 绝对收敛则可重排
  * Cauchy 定理：$\sum_{n=1}^{+\infty}a_n,\sum_{n=1}^{+\infty}b_n$ 绝对收敛, 则 $a_mb_n$ 可任意方式排成级数皆绝对收敛于值 $(\sum_{n=1}^{+\infty}a_n)(\sum_{n=1}^{+\infty}b_n)$
* 幂级数：$\sum_{n=0}^{+\infty}a_n(z-z_0)^n$ 中心为 $z_0$
  * Abel 定理：$\exists0\leq\rho\leq+\infty,|z|<\rho,\sum_{n=0}^{+\infty}a_nz^n$ 绝对收敛，$|z|>\rho,\sum_{n=0}^{+\infty}a_nz^n$ 发散
    * 收敛半径：$\rho$
    * 收敛域：使 $\sum_{n=0}^{+\infty}a_n(x-x_0)^n$ 收敛的所有 $x\in\mathbb{R}$ 构成的集合
    * Cauchy-Hadmard 公式：若 $\lim_{n\rightarrow+\infty}|\frac{a_{n+1}{a_n}}|=L$ 或 $\lim_{n\rightarrow+\infty}\sqrt[n]{|a_n|}=L$，则$\rho=\frac{1}{L}$
  * 幂级数函数：$f(x)=\sum_{n=0}^{+\infty}a_n(x-x_0)^n$，定义域为收敛域
    * Abel: 幂级数函数在收敛域上连续
    * 逐项求导：$f(x)$ 在收敛域光滑，$f^{(m)}(x)=\sum_{n=0}^{+\infty}a_n\frac{d^m}{dx^m}(x-x_0)^n$
      * $a_n=\frac{f^{(n)}}{n!}$
      * $f^{(n)}(x)=\sum_{i=0}^\infty \frac{(n+i)!}{i!}a_{n+i}x^i$
      * $f^{(n)}(x)=\sum_{i=0}^\infty \frac{(n+i)!}{i!}x^i=\frac{n!}{(1-x)^n}$
    * 逐项积分：$\int_c^df(x)dx=\sum_{n=0}^{+\infty}a_n\int_c^d(x-x_0)^ndx$
  * Taylor 级数：$f$ 光滑，则可将泰勒多项式写为 Taylor 幂级数 $\sum_{n=0}^{+\infty}\frac{f^{(n)}(x_0)}{n!}(x-x_0)^n$
    * $f$ 为初等函数，则在级数的收敛域中有 $f(x)=\sum_{n=0}^{+\infty}\frac{f^{(n)}(x_0)}{n!}$
* Fourier 级数：$\sum_{n=-\infty}^{+\infty}c_ne^{i2n\pi x}$
  * 绝对收敛 $\iff\sum_{-\infty}^{+\infty}|c_n|<+\infty$
  * $f$ 的 Fourier 展开：$f(x)\sim\sum_{-\infty}^{+\infty}\langle f,e^{i2n\pi x}\rangle e^{i2n\pi x}$
    * 线性
    * 逐项求导：$f'(x)=\sum_{n=-\infty}^{+\infty}c_n(e^{i2n\pi x})'$
  * 均方收敛定理：$f$ 有周期 $1$ 且在 $[-\frac{1}{2},\frac{1}{2}]$ 上 Riemann 可积，则 $\lim_{n\rightarrow+\infty}\lVert f-\sum_{k=-n}^n\langle f,e^{ik\pi x}\langle\rVert=0$
  * Parseval 等式：$\lVert f\rVert^2=\sum_{n=-\infty}^{+\infty}|\langle f,e^{i2n\pi x}\rangle|$
  * $f(x)\sim a_0+\sum_{n=1}^{+\infty}(a_n\cos(2n\pi x)+b_n\sin(2n\pi x))$
    * $a_0=c_0=\langle f,1\rangle$
    * $a_n=c_n+c_{-n}=2\langle f,\cos(2n\pi x)\rangle$
    * $b_n=i(c_n-c_{-n})=2\langle f,\sin(2n\pi x)\rangle$
