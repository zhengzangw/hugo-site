---
title: 7-常微分方程
date: 2019-09-19
tags: [math, notes]
weight: 7
---

## 变量可分方程

$$
p(y)dy=q(x)dx
$$

* 通解 $\int p(y)dy=\int q(x)dx$
* 初值问题：有初始条件，解为特解
* 解的存在于唯一性定理
* 解的延伸定理

## 一阶线性方程

$$\frac{dy}{dt}+p(t)y=q(t)$$

* 通解：$y=e^{-\int p(t)}\int e^{\int p(t)}q(t)dt$

## 常系数齐次方程

$$\sum_{j=0}^na_j\frac{d^jy}dt^j=0$$

* 解的线性组合仍为解
* 特征多项式：$P(\lambda)=\sum_{j=0}^na_j\lambda^j=\prod_{j=1}^k(\lambda-r_j)^{m_j}$
* 特征根：$P(\lambda)$ 的根
   * $e^{rt}$ 为解 $\iff P(r)=0$
* $y(t)=\sum_{i=1}^{k}\sum_{j=0}^{m_k-1}t^je^{r_it}$

## 常系数非齐次方程

$$\sum_{j=0}^na_j\frac{d^jy}dt^j=q(t)$$

* Lagrange 常数变易法
