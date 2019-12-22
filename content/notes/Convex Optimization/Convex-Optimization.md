---
title: Convex Optimization
date: 2019-01-24
tags: [math, notes]
---

<!--more-->

## 凸优化

* 拉格朗日乘子法
    * 约束曲面上任意点 $x$, $\nabla g(x)$ 正交于约束曲面
    * 最优点 $x^*$, $\nabla f(x^*)$ 正交与约束曲面
    * 拉格朗日乘子 $\lambda\not=0$
    * 拉格朗日函数 $L(x,\lambda) = f(x)+\lambda g(x)$
        * 优化 $f(x)$ -> 优化 $L(x,\lambda)$
* 主问题，最优解 $p^*$

$$\begin{aligned}
\min_x & f(x) \\
s.t. & h_i(x)=0 & (i=1,...,m) \\
     & g_j(x)\leq 0 & (j=1,...,n)
\end{aligned}$$

* 引入拉格朗日乘子和 KKT 条件 (Karush-Kuhn-Tucker)

$$\begin{aligned}
L(x,\lambda,\mu)=f(x)+\sum_{i=1}^m\lambda_ih_i(x)+\sum_{j=1}^n\mu_jg_j(x)\\
g_j(x)\leq 0\\
\mu_j\geq0\\
\mu_jg_j(x)=0
\end{aligned}$$

* $\sup$ 上限函数， $\inf$ 下限函数
* 拉格朗日对偶函数：$\Gamma(\lambda,\mu)=\inf_{x\in D}L(x,\lambda,\mu)$
    * $\Gamma(\lambda,\mu)\leq L(x,\lambda,mu)\leq f(x)\leq p^*,x\in D$
    * $L$ 对 $x$ 求导后令之为0，带入得对偶问题
* 对偶问题 （凸优化问题），最优解 $d^*$

$$\begin{aligned}
& \max_{\lambda,\mu}\Gamma(\lambda,\mu)\\
s.t. & \mu \succeq 0
\end{aligned}$$

* 弱对偶性成立：$d^*\leq p^*$
* 强对偶性：$d^*=p^*$
    * 主问题为凸优化问题，则其可行域中至少有一点使不等式约束严格成立
    * 强对偶性成立时，将 $L$ 对原变量和对偶变量求导并另其为零，即得到原变量和对偶变量的数值关系

## 牛顿法

* 求函数 $f(x)$ 零点：$x_{n+1}=x_n-\frac{f(x)}{f'(x)}$
* 最小化：$\beta^{t+1}=\beta^t-(\frac{\partial^2 l(\beta)}{\partial\beta\partial\beta^T})^{-1}\frac{\partial l(\beta)}{\partial\beta}$
* 缺点
    * 每一步开销大
    * 依赖初始值

## 梯度下降

* $f(x+\Delta x)\simeq f(x)+\Delta x^T\nabla f(x)$
* $\Delta x=-\gamma\nabla f(x)$

## 其它

* $\lim_{x\rightarrow\infty}(1+\frac{1}{x})^x=e$
