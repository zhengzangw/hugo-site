---
title: 2-一元微积分
date: 2019-09-19
tags: [math, notes]
weight: 2
---

## 积分

* Riemann 和
  * $P:a=x_0<\cdots<x_n=b$ 为 $[a,b]$ 的分隔
  * 特殊点选取 $\xi$： $\xi_i\in[x_{i-1},x_i]$，定义域$\{1,2,\cdots,n\}$，自变量 $i$，函数值 $\xi_i$
  * $\Delta x_i= x_i-x_{i-1}$
  * $S(f,P,\xi)=\sum_{i=1}^nf(\xi_i)\Delta x_i,\lVert P\rVert=\max\{|\Delta x_i||1\leq i\leq n\}$
* Riemann 可积：$\forall\epsilon>0,\exists\delta>0,\forall P,\lVert P\rVert<\delta,\forall\xi,|S(f,P,\xi)-I|<\epsilon$
  * $I=\int_a^b f(x)dx$
  * 有界性：$f$ Riemann 可积则 $f$ 在 $[a,b]$ 上有界
  * 唯一性
  * 线性
  * 单调性
  * 非负性
  * 三角不等式：$|\int_a^b fdx|\leq\int_a^b|f|dx$
  * $f$ 在 $[a,b]$ 上有界且至多有有限个间断点，则 $f$ 在 $[a,b]$ 上可积
* 积分计算
  * 换元积分法
    * $\int f(\varphi(x))\varphi'(x)dx=\int f(u)du$
    * $\int_a^b f(\varphi(x))\varphi'(x)dx=\int_a^bf(\varphi(x))d\varphi(x)=\int_{\varphi(a)}^{\varphi(b)}f(u)du$
      1. $f(u)$ 在 $I$ 上连续，$\varphi(x)$ 在 $[a,b]$ 上连续可微
      2. $f(u)$ 在 $I$ 上可积，$\varphi(x)$ 在 $[a,b]$ 上可微且单调，$\varphi'(x)$ 在 $[a,b]$ 上可积
    * 第二换元积分法：$u=\varphi(x),\alpha=\varphi(a),\beta=\varphi(b),\int_\alpha^\beta f(u)du=\int_a^bf(\varphi(x))\varphi'(x)dx$
  * 分布积分法
    * $\int f(x)dg(x)=f(x)g(x)-\int g(x)df(x)$
    * $\int_a^b f(x)g'(x)dx = f(x)g(x)|_a^b-\int_a^b f'(x)g(x)dx$
  * 公式
    * $\int x^{-1}=\ln |x|+C$
    * $\int a^x=\frac{a^x}{\ln a}+C$
    * $\int \frac{dx}{\sqrt{x^2+a}}=\ln|x+\sqrt{x^2+a}|+C$
  * 有理积分
    * 有理函数：$R(x)=\frac{P(x)}{Q(x)}$，$P,Q$ 为实系数多项式
    * 部分分式分解：待定系数法
    * 有理指数函数：$R(a^x)$
    * 有理三角积分：$R(\cos x,\sin x)$
* 无穷积分
  * $f$ 定义在 $[a,+\infty]$ 上，$\forall c\in[a,+\infty]$，$f$ 在 $[a,c]$ 上 Riemann 可积，若 $\lim_{c\rightarrow+\infty}\int_a^c f(x)dx=A$ 则 $\int_a^+\infty f(x)dx=A$
    * 收敛：$A\not=\pm\infty$
    * 发散：$A=\pm\infty$ 或极限不存在 
  * $\exists d\in\mathbb{R},\int_{-\infty}^df(x)dx,\int_d^{+\infty}f(x)dx$ 皆收敛，$\int_{-\infty}^{+\infty}f(x)dx = \int_{-\infty}^df(x)dx+\int_d^{+\infty}f(x)dx$
* 瑕积分
  * 瑕点：$\forall c\in (a,b),f$ 在 $[a,c]$ 上可积，在 $b$ 附近无界
  * $f$ 定义在 $[a,b)$ 上，$\lim_{c\rightarrow b^-}\int_a^cf(x)dx=A$ 则 $f$ 在 $[a,b]$ 上的瑕积分为 $A$, $\int_a^bf(x)dx=A$
* 非负的积分: $f$ 在 $[a,+\infty]$ 上非负，$\forall c>a,f$ 在 $[a,c]$ 上可积
  * $\int_a^{+\infty}f(x)dx$ 有值且非负
  * $\int_a^{+\infty}f(x)dx$ 收敛当且仅当 $\int_a^{+\infty}f(x)dx<+\infty$
  * 比较判别法 I：$f\geq g$
    * $\int_a^{+\infty}f(x)dx$ 收敛，则 $\infty_a^{+\infty}g(x)dx$ 收敛
    * $\int_a^{+\infty}g(x)dx$ 发散，则 $\infty_a^{+\infty}f(x)dx$ 发散
  * 比较判别法 II
    * $\lim_{x\rightarrow+\infty}\frac{f(x)}{g(x)}=c<+\infty,\int_a^{+\infty}g(x)dx$ 收敛，则 $\int_a^{+\infty}$ 收敛
    * $\lim_{x\rightarrow+\infty}\frac{f(x)}{g(x)}=c>0,\int_a^{+\infty}g(x)dx$ 发散，则 $\int_a^{+\infty}$ 发散
* 绝对收敛：$\int_a^{+\infty}|f(x)|dx$ 收敛
  * 绝对收敛则收敛

## 导数

* $f$ 在 $x=x_0$ 处可导（可微）：$\lim_{x\rightarrow x_0}\frac{f(x)-f(x_0)}{x-x_0}=A$
  * 唯一性，局部性
  * 可导$\Rightarrow$连续
  * 线性
  * Leibniz 法则：$(fg)'(x_0)=f'(x_0)g(x_0)+f(x_0)g'(x_0)$
  * 链法则：$(f\circ g)'(x_0)=f'(g(x_0))g'(x_0)$
  * 参数求导法：$\frac{dy}{dx}|_{x=x(t_0)}=\frac{\frac{dy}{dx}|_{t=t_0}}{\frac{dx}{dt}|_{t=t_0}}$
  * $(a^x)'=a^x\ln a$
  * $(\log_a|x|)'=(x\ln a)^{-1}$
  * 单侧导数
  * 初等函数导函数是初等函数
* $f^{(m)}(x_0)$：$m$阶导数
  * 光滑：任意阶可微
  * 任意阶 Leibniz 法则：$(fg)^{(m)}(x_0)=\sum_{i=0}^mC_m^if^{(m-i)}(x_0)g^{(i)}(x_0)$
* $f$ 在 $x=x_0$ 处可导 $\iff x\rightarrow x_0,f(x)-f(x_0)=A(x-x_0)+o(|x-x_0|)$
  * $A=f'(x_0)$
  * $R(x)$ 为余项

## 微分

* 线性函数 $f:\mathbb{R}\rightarrow\mathbb{R}$
  * $f(\omega_1+\omega_2)=f(\omega_1)+f(\omega_2)$
  * $\forall k\in\mathbb{R},f(k\omega)=kf(\omega)$
* $dx$: 恒等函数 $dx(\omega)=\omega$
* $df(x_0)$：$f(x)$ 在 $x=x_0$ 处可导，函数 $df(x_0):\mathbb{R}\rightarrow\mathbb{R}$
  * $df(x_0)=f'(x_0)dx$
  * $df(x,\omega)=df(x)(\omega)=f'(x)\omega$
  * 线性
  * Leibniz 法则
  * 链法则

## 微积分基本定理

* 微积分基本定理: 
  * $f$ 在 $[a,b]$ 上连续则 $F(x)=\int_a^xf(t)dt$ 在 $[a,b]$ 上可微，且$F'=f$
    * $\frac{d}{dx}\int_a^xf(t)dt=f(x)$
    * $F$ 为 $f$ 的原函数
    * $\int f(x)dx=F(x)+C$
  * $f$ 在 $[a,b]$ 上可积，则 $F$ 在 $[a,b]$ 上连续，且若 $f(x)$ 在 $x_0$ 处连续，$F'(x_0)=f(x_0)$
* Newton-Leibniz 公式：$F$ 在 $[a,b]$ 上连续可微，则 $\int_a^b\frac{d}{dx}F(x)dx=F(b)-F(a)=F|^b_a$
* Rolle 中值定理：$f$ 在 $[a,b]$ 上连续，在$(a,b)$上可导，$f(a)=f(b)$ 则 $\exists\xi\in[a,b],f'(\xi)=0$
* Lagrange 中值定理：$F$ 在 $[a,b]$ 上连续，在$(a,b)$上可微，则$\exists\xi\in(a,b),F(b)-F(a)=F'(\xi)(b-a)$
* L'Hospital 法则：
  * $\frac{0}{0}:\lim_{x\rightarrow a^+}f(x)=\lim_{x\rightarrow a^+}g(x)=0,\lim_{x\rightarrow a^+}\frac{f'(x)}{g'(x)}=A$ 则 $\lim_{x\rightarrow a^+}\frac{f(x)}{g(x)}=A$
  * $\frac{\infty}{\infty}:\lim_{x\rightarrow a^+}g(x)=\pm\infty,\lim_{x\rightarrow a^+}\frac{f'(x)}{g'(x)}=A$ 则 $\lim_{x\rightarrow a^+}\frac{f(x)}{g(x)}=A$
  * $0\cdot\infty=\frac{0}{\frac{1}{\infty}}$
  * $0^0=e^{0\ln 0}=e^{0\cdot\infty}$
  * $\infty^0=e^{0\ln \infty}=e^{0\cdot\infty}$
  * $1^\infty=e^{\infty\cdot0}$
  * $(+\infty)-(+\infty)=\ln\frac{0}{0}=\frac{1}{0}-\frac{1}{0}$
* Taylor 公式：$f$ 定义在 $(a,b)$ 上，$x_0\in(a,b),f$ 在 $x_0$ 处 $n$ 阶可导，则
  * $f(x)=\sum_{i=0}^n\frac{f^{(i)}(x_0)}{i!}(x-x_0)^i+R(x)$
  * $x\rightarrow x_0,R_n(x)=o(|x-x_n|^n)$

| $f(x)$        | $x=0$ 处 Taylor 展开                                         |
| ------------- | ------------------------------------------------------------ |
| $e^x$         | $\sum_{i=0}^n\frac{x^i}{i!}+o(x^n)$                          |
| $\ln(1+x)$    | $\sum_{i=1}^n\frac{(-1)^{i-1}}{i}x^i+o(x^n)$                 |
| $\sin x$      | $\sum_{i=1}^n\frac{(-1)^{i-1}}{(2i-1)!}x^{2i-1}+o(x^{2n-1})$ |
| $\cos x$      | $\sum_{i=1}^n\frac{(-1)^i}{(2i)!}x^{2i}+o(x^{2n})$           |
| $(x_0+x)^\mu$ | $x_0^\mu+\sum_{i=1}^\mu C_\mu^i x_0^{\mu-i}x^i$              |
