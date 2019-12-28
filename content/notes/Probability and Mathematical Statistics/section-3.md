---
title: 3-随机向量及其分布 
date: 2019-03-21
tags: [math, notes]
weight: 3
---

* 离散型
  * 多项分布 $(X_1,X_2)\sim M(n;p_1,p_2,p_3)$: $P(X_1=k_1, X_2=k_2)=\frac{n!}{k_1!k_2!(n-k_1-k_2)!}p_1^{k_1}p_2^{k_2}(1-p_1-p_2)^{n-k_1-k_2}$
    * $X|_{Y=k_2}\sim B(n-k_2,\frac{p_1}{1-p_2})$
  * 多元超几何分布：$P(X_1=n_1,X_2=n_2)=\frac{C_{N_1}^{n_1}C_{N_2}^{n_2}C_{N_3}^{n_3}}{C_N^n}$
  * 联合分布函数：$F(x,y)=P(X\leq x,Y\leq y)$
    * $p_{ij}=F(x_i,y_j)-F(x_i,y_{j-1})-F(x_{i-1},y_j)+F(x_{i-1},y_{j-1}))$
    * 边缘分布函数：$F_X(x)=F(x,+\infty)$
    * （离散型向量）边缘分布率
  * 概率分布表/列联表
  * 条件概率: $P(Y=y_j|X=x_i)=\frac{p_{ij}}{p_i}$
* 连续性随机变量
  * $(X,Y)$, $F(x,y)=\int^x_{-\infty}\int^y_{-\infty}p(u,v)dudv$ 为分布函数，$p(x,y)$ 为联合概率密度函数
  * $p(x,y)$ 为概率密度函数的充要条件
    * $p(x,y)\geq0$
    * $\int_{-\infty}^{\infty}p(x,y)d xdy=1$
  * $F(x,y)$ 为分布函数的充要条件
    * $0\leq F(x,y)\leq 1$
    * $F(-\infty,y)=\lim_{x\rightarrow\infty}F(x,y)=F(x,-\infty)=\lim_{y\rightarrow\infty}=F(-\infty,-\infty)=0,F(\infty,\infty)=1$
    * 右连续：$F(x,y)=\lim_{z\rightarrow x^+}F(z,y)=\lim_{z\rightarrow y+}F(x,y)$
    * $x_1\leq x_2,y_1\leq y_2,F(x_2,y_2)-F(x_1,y_2)-F(x_2,y_1)+F(x_1,y_1)\geq0$
  * $P(x_1<X\leq x_2,y_1<Y\leq y_2)=\int_{x_1}^{x_2}\int_{y_1}^{y_2}p(u,v)dudv$
  * $P((X,Y)\in G)=\iint_Gp(x,y)dxdy$
  * $\frac{\partial^2F(x,y)}{\partial x\partial y}|_{(x_0,y_0)}=p(x_0,y_0)$
  * $X$ 的边缘分布 $F_X(x)=\int_{-\infty}^x\int_{-\infty}^{\infty}p(u,v)dudv$
    * 边缘密度函数 $p_X(x)=\int_{-\infty}^{\infty}p(x,v)dv$
  * 特殊分布
    * （平面）均匀分布 $p(x,y)=\frac{1}{S},(x,y)\in G$
    * 二维正态分布 $(X,Y)\sim N(\mu_1,\mu_2,\sigma_1^2,\sigma_2^2,\rho)$: $p(x,y)=\frac{1}{2\pi\sigma_1\sigma_2\sqrt{1-\rho^2}}e^{-\frac{1}{2(1-\rho^2)}((\frac{x-\mu_1}{\sigma_1})^2-2\rho(\frac{x-\mu_1}{\sigma_1})(\frac{x-\mu_2}{\sigma_2})+(\frac{y-\mu_2}{\sigma_2})^2)}$
      * $\text{cov}(X,Y)=\sigma_1\sigma_2\rho$
      * N维正态分布：$p(x)=\frac{1}{(2\pi)^\frac{n}{2}(\det B)^\frac{1}{2}}e^{-\frac{1}{2}(x-\mu)B^{-1}(x-\mu)^T}$
      * $Y|_{X=x}\sim N(\mu_2+\rho\frac{\sigma_2}{\sigma_1}(x-\mu_1), \sigma_2^2(1-\rho^2))$
      * 独立性与不相关等价
  * 条件分布函数 $F_{Y|X=x}(y)=P(Y\leq y|X=x)=\int^y_{-\infty}\frac{p(x,v)}{p_X(x)}dv$
    * $p_{X|Y=y}(x)=\frac{p(x,y)}{p_Y(y)}$
    * $p(x,y)=p_{Y|X=x}(y)p_X(x)$
* 随机变量相互独立：
  * $P(X=x_i,Y=y_j)=P(X=x_i)P(Y=y_j)$
  * $X_1,\cdots,X_n$ 相互独立，则 $Y_1=g_1(X_1,\cdots,X_m)$ 和 $Y_2=g_2(X_{m+1},\cdots,X_n)$ 相互独立
  * $p(x_1,\cdots,x_n)=p_1(x_1)p_2(x_2)\cdots p_n(x_n)$
  * $F(x,y)=F_X(x)F_Y(y)$
  * 独立性：存在 $g_1(x),g_2(y)$ 使得 $p(x,y)=g_1(x)g_2(y)$
* 二维随机向量函数分布
  * 离散型
    * $P(Z=z_k)=P(g(X,Y)=z_k)=\sum_{g(x_i,y_j)=z_k}p_{ij}$
    * 随机变量和 $Z=X+Y$ $P(Z=z_k)=\sum_{x_i}P(X=x_i,Y=z_k-x_i)$
    * 随机变量商 $Z=X/Y$ $P(Z=z_k)=\sum_{y_j}P(X=z_k*y_j,Y=y_j)$
  * 连续型
    * $F_Z(z)=P(Z\leq z)=P(g(X,Y)\leq z)=\iint_{g(x,y)\leq z}p(x,y)dxdy$
      * 瑞利分布：$X,Y\sim N(0,1), Z=\sqrt{X^2+Y^2}$, $p(z)=ze^{-\frac{z^2}{2}},z\geq0$
    * 卷积公式：$p_Z(z)=\int^{+\infty}_{-\infty}p(x,z-x)dx$
    * 商的分布：$p_Z(z)=\int^{+\infty}_{-\infty}|y|p(zy,y)dy$
    * 最大值：$p_M(z)=p_X(z)F_Y(z)+F_X(z)p_Y(z)$
      * 独立：$F_M(z)=F_X(z)F_Y(z)$
    * 最小值：$p_N(z)=p_X(z)(1-F_Y(z))+p_Y(z)(1-F_X(z))$
      * 独立：$F_N(z)=1-(1-F_X(z))(1-F_Y(z))$
  * (U,V) 满足存在唯一逆变换且 $J(u,v)\not=0$，则 $p'(u,v)=p(x(u,v),y(u,v))|J(u,v)|$