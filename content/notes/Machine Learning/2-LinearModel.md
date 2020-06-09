---
title: Linear Model
date: 2019-04-14
tags: [ml, math, notes]
weight: 2
---

## **多元线性回归**

* $f(x)=\omega^Tx+b$
* 最小二乘法
    * $\hat\omega^*=\arg\min_{\hat\omega}(y-X\hat\omega)^T(y-X\hat\omega)=(X^TX)^{-1}X^Ty$
* 广义线性模型：$y=g^{-1}(w^Tx+b)$

## **对数几率回归**

* 单位跃阶函数（Heaviside function): 理想但不连续

$$y=\begin{cases}0,& z<0\\0.5,& z=0\\1,&z>0\end{cases}$$

* 对数几率函数 (logistic function/Sigmoid function)
    * $g=\ln\frac{y}{1-y}$
        * 几率：$\frac{y}{1-y}$，反映了 $x$ 作为正例的相对可能性
    * $g^{-1}=S(x)=\frac{1}{1+e^{-x}}$
        * $S(x)'=S(x)(1-S(x))$
* 对数几率回归：用线性模型逼近真实标记的几率
    * $\ln\frac{p_1}{p_0}=\hat x\beta=(x,1)(\omega; b)$
        * 二分类：$y_ia+(1-y_i)b=a^{y_i}b^{1-y_i}$
    * Maxmimum likelihood method
        * $l(\beta)=\sum_{i=1}^m\ln p(y_i|x_i;\beta_i)=\sum_{i=1}^my_i\ln (g(\hat x_i\beta)+(1-y_i)\ln (1-g(\hat x_i\beta)))$
        * $l'=\sum_{i=1}^m(y_i-g(\hat x_i\beta))\hat x_i^T=X^T(Y-g(\beta^TX))$
        * $l''=\sum_{i=1}^m\hat x_i\hat x_i^Tp_1(\hat x_i;\beta)(1-p_1(\hat x_i;\beta))$

## **LDA**

* 给定训练集数据，设法将样例投影到一条直线上，使得同类样例投影点尽可能接近，异类投影点尽可能远离
* 协方差矩阵：$\Sigma=\frac{1}{n-1}(X-\mu I)(X-\mu I)^T$
    * $\Sigma_{ij}=\sigma(x_i,x_j)$
    * 投影后：$\omega^T\Sigma\omega$

|                               | 两类                                                     | 一般                                            |
| ----------------------------- | -------------------------------------------------------- | ----------------------------------------------- |
| Within-class scatter matrix   | $S_\omega=\Sigma_0+\Sigma_1$                             | $S_w=\sum_{i=1}^N\Sigma_i$                      |
| Between-class scatter maxtrix | $S_b=(\mu_0-\mu_1)(\mu_0-\mu_1)^T$                       | $S_b=\sum_{i=1}^{N}m_i(\mu_i-\mu)(\mu_i-\mu)^Y$ |
| 全局散度矩阵                  | $S_t=S_b+S_w$                                            | $\sum_{i=1}^m(x_i-\mu)(x_i-\mu)^T$              |
| 优化目标                      | $\max_\omega\frac{\omega^TS_b\omega}{\omega^TS_w\omega}$ | $\max_W\frac{tr(W^TS_bW)}{tr(W^TS_wW)}$         |
| 闭式解                        | $w=S_w^{-1}(\mu_0-\mu_1)$                                | $S_w^{-1}S_b$ 前 $k$ 大广义特征向量             |
