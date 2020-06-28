---
title: Bayesian Classifier
date: 2019-04-14
weight: 4
---

## Bayesian decision theory

|                          | 定义                                                  | 最小化分类错误率               |
| ------------------------ | ----------------------------------------------------- | ------------------------------ |
| loss                     | $\lambda_{ij}$                                        | $[i=j]$                        |
| Expected loss            | $R(c_i\vert x)=\sum_{j=1}^N\lambda_{ij}P(c_j\vert x)$ | $1-P(c\vert x)$                |
| Bayes optimal classifier | $h^*(x)=\arg\min_{c\in Y}R(c\vert x)$                 | $\arg\max_{c\in Y}P(c\vert x)$ |
| decison loss             | $R(h)=E_x(R(h(x)\vert x))$                            | $P(h^*(x)\vert x)$             |
| Bayes risk               | $1-R(h^*)$                                            | $1-P(h^*(x)\vert x)$           |

### 贝叶斯定理

$$ P(c|x)=\frac{P(x,c)}{P(x)}=\frac{P(c)P(x|c)}{\int p(c)P(x|c)dc}$$

- prior: $P(c)$
- evidence: $P(x)$
- class-conditional probability/likelihood: $P(x|c)$
  - class-conditional probability: $x$
  - likelihood: $\theta, P(x|c)(\theta)$
    - $P(D_c|\theta_c)=\prod_{x\in D_c}P(x|\theta_c)$
    - $\text{LL}(\theta_c)=\log P(D_c|\theta_c)=\sum_{x\in D_c}\log P(x|\theta_c)$

## k 近邻学习

- lazy learning
- 最邻近分离器的泛化错误率不会超过贝叶斯最优分类器错误率的两倍

## 朴素贝叶斯分类器

- 属性条件独立性假设: $P(x|c)=\prod_{i=1}^{d}P(x_i|c)$
- $h_{nb}=\arg\max_{c\in Y}P(c)\prod_{i=1}^dP(x_i|c)$
  - $P(c)=\frac{|D_c|}{|D|}$
  - $P(x_i|c)=\frac{|D_{c,x_i}|}{|D_c|}$
- 拉普拉斯修正
  - $\hat P(c)=\frac{|D_c|+1}{|D|+N}$
    - $N$ 为 $D$ 中可能的类别
  - $\hat P(x_i|c)=\frac{|D_{c,x_i}|+1}{|D_c|+N_i}$
    - $N_i$ 为第 $i$ 个属性可能取值数
- 连续属性
  - $p(x_i|c)\sim N(\mu_{c,i},\sigma_{c,i}^2)$

## 半朴素贝叶斯分类器

### 独依赖估计 (One-Dependent Estimator ODE)

- $P(c|x) \propto P(c)\prod_{i=1}^dP(x_i|c,p(a_i))$

#### SPODE (super-parent ODE)

- 假设所有属性都依赖于同一个属性: $p(a_i)=x_t$

#### AODE (Averaged One-Dependent Estimator)

- SPODE 的集成
- $P(c|x)\propto \sum_{i=1,|D_{x_i}|\geq m'}^dP(c,x_i)\prod_{j=1}^dP(x_j|c,x_i)$

#### TAN (Tree Augmented naive Bayes)

- 仅保留了强相关属性间的依赖性
- 基于最大带权生成树
- 算法
  - conditional mutual information: $I(x_i,x_j|y)=\sum_{x_i,x_j,c}P(x_i,x_j|c)\log\frac{P(x_i,x_j|c)}{P(x_i|c)P(x_j|c)}$
    - 在已知类别情况下的相关性
  - 在以属性为节点，互信息为边建完全图上构造最大带权生成树，挑选根节点，边置为有向
  - 加入类别节点 y，增加 y 到每个属性的边

### kDE (k-Dependent Estimator)

- 样本不足：高阶联合概率估计困难，需要的样本数指数级增加
