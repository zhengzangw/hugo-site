---
title: 2-随机变量及其概率分布 
date: 2019-03-21
tags: [math, notes]
weight: 2
---

* 随机变量：定义在样本空间上的函数 $X=X(e),e\in\Omega$
* 分布函数：$F(x)=P(X\leq x) (-\infty<x<\infty)$
  * 单调不减
  * $F(x)=F(x+0)$
  * $0\leq F(x)\leq 1$
  * $F(-\infty)=0$
  * $F(\infty)=1$
  * $P(a<X\leq b)=F(b)-F(a)$
* 离散随机变量
  * 0-1分布
  * 二项分布：$X\sim B(n,p)$
    * $P(X=k)=C_n^kp^kq^{n-k}$
    * 最大值
      * $(n+1)p\in \mathbb{Z}$ 则 $k=(n+1)p-1/(n+1)p$
      * $(n+1)p\not\in\mathbb{Z}$ 则 $k=[(n+1)p]$
    * $E(X)=np$
    * $D(X)=np(1-p)$
  * 泊松分布 $X\sim P(\lambda)$
    * $P(X=k)=\frac{\lambda^k}{k!}e^{-\lambda}$
    * $E(X)=\lambda$
    * $D(X)=\lambda$
    * 泊松分布可加性 $X\sim P(a),Y\sim P(b),X+Y\sim P(a+b)$
  * 几何分布 $X\sim g(p)$
    * $p_k=P(X=k)=(1-p)^{k-1}p$
    * $E(X)=\frac{1}{p}$
    * $D(X)=\frac{1-p}{p^2}$
  * 超几何分布 $X\sim H(n,M,N)$
    * 合格率：$p=\frac{M}{N}$
    * $P(X=k)=\frac{C_M^kC_{N-M}^{n-k}}{C_N^n}$
    * $\lim_{N\rightarrow\infty}\frac{M}{N}=p$, $\lim_{N\rightarrow\infty}\frac{C^k_MC^{n-k}_{N-M}}{C^n_N}=C_n^kp^k(1-p)^{n-k}$
* 连续性随机变量
  * $F(x)=\int_{-\infty}^xp(x)dt$
    * $p(x)\geq0$
    * $\int_{-\infty}^\infty=1$
  * 均匀分布： $p(x)=\frac{1}{b-a} (a<x<b)$, $X\sim U[a,b]$
    * $D(X)=\frac{(b-a)^2}{12}$
  * 指数分布： $p(x)=\lambda e^{-\lambda x} (x\geq0)$, $X\sim E(\lambda)$
    * $E(X)=\frac{1}{\lambda}$
    * $D(X)=\lambda^{-2}$
  * $\Gamma$ 分布 $X\sim G(\lambda,r)$
    * $p(x)=\frac{\lambda^{r}}{\Gamma(r)}x^{r-1}e^{-\lambda x}$
    * $E(X)=\frac{r}{\lambda}$
    * $D(X)=r\lambda^{-2}$
  * 正态分布： $p(x)=\frac{1}{\sqrt{2\pi}\sigma}e^{-\frac{(x-\mu)^2}{2\sigma^2}}$, $X\sim N(\mu,\sigma^2)$
    * $x=\mu,p(x)=\frac{1}{\sqrt{2\pi}\sigma}$
    * 拐点 $x=\mu\pm\sigma$
    * 标准正态分布密度函数 $\phi(x)$, 分布函数 $\Phi(x)$
      * $\Phi(-x)=1-\Phi(x)$
      * $\alpha$ 分位点 $u_{\alpha}$: $P(X>u_\alpha)=\alpha$ 即 $\Phi(u_\alpha)=1-\alpha$
    * $Z=\frac{X-\mu}{\sigma}\sim N(0,1)$
      * $P(a\leq X\leq b)=\Phi(\frac{b-\mu}{\sigma})-\Phi(\frac{a-\mu}{\sigma})$
    * $3\sigma$ 原理：超出这个范围的可能性小于 $0.3\%$
    * $E(X)=\mu$
    * $D(X)=\sigma^2$
    * $X\sim N(\mu,\sigma^2),Y=aX+b\sim N(a\mu+b,(\sigma a)^2)$
    * $X\sim N(\mu_1, \sigma_1^2), Y\sim N(\mu_2,\sigma_2^2),X+Y\sim(\mu_1+\mu_2,\sigma_1^2+\sigma_2^2)$
  * 卡方分布：$p(x)=\frac{1}{\sqrt{2\pi}}y^{-\frac{1}{2}}e^{-\frac{y}{2}},y>0$, $X\sim\chi^2(1)$
    * $X\sim N(0,1),Y=X^2,Y\sim\chi^2(1)$
    * $E(\chi^2)=n,D(\chi^2)=2n$
  * 连续型随机变量的函数
    * 分布函数法：$F_Y(y)=P(Y\leq y)=P(g(X)\leq y)$
      * 若$X$的分布函数$F(x)$严格单调递增，则随机变量$Y=F(x)$服从[0,1]上的均匀分布 
    * $p_y(y)=F'_y(y)$
      * $F(x)=\int^{\phi(x)}_{\psi(x)}f(t)dt$ 则 $F'(x)=f(\phi(x))\phi'(x)-f(\psi(x))\psi'(x)$
    * $X\in(a,b),y=g(x)$ 处处可导且**严格**单调，则 $Y=g(X)$ 有 $p_Y(y)=p_x(g^{-1}(y))*|g^{-1}(y)'|$ $\alpha<y<\beta$
    * $Y=g(x)$ 离散，则 $Y$ 概率分布离散