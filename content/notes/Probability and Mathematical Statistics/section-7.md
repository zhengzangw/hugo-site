---
title: 7-参数估计 
date: 2019-03-21
tags: [math, notes]
weight: 7
---

### 点估计

* 总体分布 $F(x;\theta)$, $\theta=(\theta_1,\theta_2,\cdots,\theta_k)'$, 根据 $X_1,X_2,\cdots,X_n$ 构造一个统计量 $\hat\theta(X_1,X_2,\cdots,X_n)$ 作为 $\theta$ 的点估计

#### 矩估计

* 求总体的各阶原点矩 $\mu_i=g_i(\theta_1,\theta_2,\cdots,\theta_k)$
* 解得 $\theta_i=h_i(\mu_1,\mu_2,\cdots,\mu_k)$
* 用样本矩代替总体矩的矩估计 $\hat\theta_i=h_i(A_1,A_2,\cdots,A_k)$
* 相合性：$h$ 为已知的连续函数，$h(A_1,A_2,\cdots,A_k)\overset{P}{\rightarrow}h(\mu_1,\mu_2,\cdots,\mu_k)$

#### 极大似然估计

* $X$ 为连续性随机不变量，密度函数为 $p(x;\theta),\theta\in\Theta$, 样本 $(X_1,X_2,\cdots,X_n)$ 落在点 $(x_1,x_2,\cdots,x_n)$ 的领域的概率近似为 $\prod_{i=1}^np(x_i;\theta)dx_i$
* 似然函数 $L(\theta)=L(x_1,\cdots,x_n;\theta)=\prod_{i=1}^np(x_i;\theta)$
* 极大似然估计值$\hat\theta(x_1,x_2,\cdots,x_n)$：$L(x_1,x_2,\cdots,x_n;\hat\theta)=\max_{\theta\in\Theta}L(x_1,x_2,\cdots,x_n;\theta)$
* 极大似然估计量$\hat\theta(X_1,X_2,\cdots,X_n)$
* 对数似然函数 $\ln L(\theta)$
* 不变性原则：$\hat\theta$ 为 $\theta$ 的极大似然估计，$\phi(\theta)$ 有单值反函数，则$\hat{\phi(\theta)}=\phi(\hat\theta)$
* $X_{(1)}=\min(X_i),X_{(n)}=\max(X_i)$
  * $F_{(n)}(X)=F^{n}(X)$

#### 估计量的评价标准

* 无偏性
  * $\hat\theta(X_1,X_2,\cdots,X_n)$ 为 $\theta$ 的估计量，$\Theta$ 为 $\theta$ 的取值范围，若$E(\hat\theta)=\theta,\theta\in\Theta$, 则 $\hat\theta$ 为 $\theta$ 的无偏估计
  * $E(A_k)=\mu_k$
  * $E(S^2)=\sigma^2$
  * 渐进无偏估计：$n\rightarrow\infty$ 时无偏
  * 正态分布的矩估计和极大似然估计：
    * $\hat\mu = \overline{X}$
    * $\hat\sigma^2 = S$
* 均方误差准则
  * $M(\hat\theta,\theta)=E(\hat\theta-\theta)^2$ 值越小越好
  * $M(\hat\theta,\theta)=D(\hat\theta)+(E\hat\theta-\theta)^2$
    * 偏差：$E\hat\theta-\theta$
* 一致性(相合性)
  * $\hat\theta_n\overset{P}{\rightarrow}\theta$

### 区间估计

* $(\hat\theta_1,\hat\theta_2)$ 是 $\theta$ 的置信度为 $1-\alpha$ 的置信区间：$P(\hat\theta_1<\theta<\hat\theta_2)=1-\alpha$
  * 置信下限 $\hat\theta_1$
  * 置信上限 $\hat\theta_2$
  * 置信度 $1-\alpha$
* $(\hat\theta_1,+\infty)$ 为 $\theta$ 的置信度为 $1-\alpha$ 的单侧置信区间：$P(\hat\theta_1<\theta)=1-\alpha$
* 枢轴变量法
  1. 枢轴变量：$U(X_1,X_2,\cdots,X_n;\theta)$ 分布已知
  2. 根据分布找到两个常数 $a,b$ 使得 $P(a<U<b)=1-\alpha$
  3. 利用 $a<U<b$ 求解 $\hat\theta_1<\theta<\hat\theta_2$
* 正态分布 （置信度$1-\alpha$）
  * $\mu$
    * $\sigma^2$ 已知：枢轴变量 $U=\frac{\overline{X}-\mu}{\sigma/\sqrt{n}}\sim N(0,1)$
      * $[\overline{X}-u_{\alpha/2}\frac{\sigma_0}{\sqrt{n}}, \overline{X}+u_{\alpha/2}\frac{\sigma_0}{\sqrt{n}}]$
    * $\sigma^2$ 未知：枢轴变量 $T=\frac{\sqrt{n}(\overline{X}-\mu)}{S}\sim t(n-1)$
      * $[\overline{X}-t_{\alpha/2}(n-1)\frac{S}{\sqrt{n}},\overline{X}+t_{\alpha/2}(n-1)\frac{S}{\sqrt{n}}]$
  * $\sigma^2$
    * $\mu$ 未知：$(n-1)S^2/\sigma^2\sim\chi^2(n-1)$
      * $[\frac{(n-1)S^2}{\chi^2_{\alpha/2}(n-1)},\frac{(n-1)S^2}{\chi^2_{1-\alpha/2}(n-1)}]$
    * $\mu$ 已知
      * $[\frac{\sum_{i=1}^n(X_i-\mu)^2}{\chi^2_{1-\alpha/2}(n)},\frac{\sum_{i=1}^n(X_i-\mu)^2}{\chi^2_{\alpha/2}(n)}]$
  * $\mu_1-\mu_2$
    * $\sigma_1^2,\sigma^2$ 已知：$U=\frac{\overline{X}-\overline{Y}-(\mu_1-\mu_2)}{\sqrt{\frac{\sigma_1^2}{n_1}+\frac{\sigma_2^2}{n_2}}}\sim N(0,1)$
      * $[(\overline{X}-\overline{Y})-u_{\alpha/2}\sqrt{\frac{\sigma_1^2}{n_1}+\frac{\sigma_2^2}{n_2}}, (\overline{X}-\overline{Y})+u_{\alpha/2}\sqrt{\frac{\sigma_1^2}{n_1}+\frac{\sigma_2^2}{n_2}}]$
    * $\sigma_1^2=\sigma_2^2=\sigma^2$ 未知：$T=\sqrt{\frac{n_1n_2(n_1+n_2-2)}{n_1+n_2}}\frac{(\overline{X}-\overline{Y})-(\mu_1-\mu_2)}{(n_1-1)S_1^2+(n_2-1)S_2^2}\sim t(n_1+n_2-2)$
  * $\sigma_1^2/\sigma_2^2$
    * $\mu_1,\mu_2$ 未知：$F=\frac{S_1^2\sigma_2^2}{S_2^2\sigma_1^2}\sim F(n_1-1,n_2-1)$
      * $[\frac{S_1^2}{S_2^2}\frac{1}{F_{\alpha/2}(n_1-1,n_2-1)}, \frac{S_1^2}{S_2^2}\frac{1}{F_{1-\alpha/2}(n_1-1,n_2-1)}]$
* 非正态总体均值 大样本法
  * $\frac{\overline{X}-\mu}{\sigma/\sqrt{n}}\approx N(0,1)$
  * $\sigma$ 未知：用 $S$ 代替
