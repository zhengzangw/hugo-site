---
title: Bayesian
date: 2019-04-14
tags: [ml, math, notes]
weight: 6
---

## Bayesian decision theory

|                          | 定义                                                  | 最小化分类错误率               |
| ------------------------ | ----------------------------------------------------- | ------------------------------ |
| loss                     | $\lambda_{ij}$                                        | 1 if $i=j$                     |
| Expected loss            | $R(c_i\vert x)=\sum_{j=1}^N\lambda_{ij}P(c_j\vert x)$ | $1-P(c\vert x)$                |
| Bayes optimal classifier | $h^*(x)=\arg\min_{c\in Y}R(c\vert x)$                 | $\arg\max_{c\in Y}P(c\vert x)$ |
| decison loss             | $R(h)=E_x(R(h(x)\vert x))$                            | $P(h^*(x)\vert x)$             |
| Bayes risk               | $1-R(h^*)$                                            | $1-P(h^*(x)\vert x)$           |

### k 近邻学习

* lazy learning
* 最邻近分离器的泛化错误率不会超过贝叶斯最优分类器错误率的两倍

## 贝叶斯定理

$$ P(c|x)=\frac{P(x,c)}{P(x)}=\frac{P(c)P(x|c)}{\int p(c)P(x|c)dc}$$

* prior: $P(c)$
* evidence: $P(x)$
* class-conditional probability/likelihood: $P(x|c)$
    * class-conditional probability: $x$
    * likelihood: $\theta, P(x|c)(\theta)$
        * $P(D_c|\theta_c)=\prod_{x\in D_c}P(x|\theta_c)$
        * $\text{LL}(\theta_c)=\log P(D_c|\theta_c)=\sum_{x\in D_c}\log P(x|\theta_c)$

## **朴素贝叶斯分类器**

* 属性条件独立性假设: $P(x|c)=\prod_{i=1}^{d}P(x_i|c)$
* $h_{nb}=\arg\max_{c\in Y}P(c)\prod_{i=1}^dP(x_i|c)$
    * $P(c)=\frac{|D_c|}{|D|}$
    * $P(x_i|c)=\frac{|D_{c,x_i}|}{|D_c|}$
* 拉普拉斯修正
    * $\hat P(c)=\frac{|D_c|+1}{|D|+N}$
        * $N$ 为 $D$ 中可能的类别
    * $\hat P(x_i|c)=\frac{|D_{c,x_i}|+1}{|D_c|+N_i}$
        * $N_i$ 为第 $i$ 个属性可能取值数
* 连续属性
    * $p(x_i|c)\sim N(\mu_{c,i},\sigma_{c,i}^2)$

## 半朴素贝叶斯分类器

### 独依赖估计 (One-Dependent Estimator ODE)

* $P(c|x) \propto P(c)\prod_{i=1}^dP(x_i|c,p(a_i))$

#### SPODE (super-parent ODE)

* 假设所有属性都依赖于同一个属性: $p(a_i)=x_t$

#### AODE (Averaged One-Dependent Estimator)

* SPODE 的集成
* $P(c|x)\propto \sum_{i=1,|D_{x_i}|\geq m'}^dP(c,x_i)\prod_{j=1}^dP(x_j|c,x_i)$

#### TAN (Tree Augmented naive Bayes)

* 仅保留了强相关属性间的依赖性
* 基于最大带权生成树
* 算法
    * conditional mutual information: $I(x_i,x_j|y)=\sum_{x_i,x_j,c}P(x_i,x_j|c)\log\frac{P(x_i,x_j|c)}{P(x_i|c)P(x_j|c)}$
        * 在已知类别情况下的相关性
    * 在以属性为节点，互信息为边建完全图上构造最大带权生成树，挑选根节点，边置为有向
    * 加入类别节点 y，增加 y 到每个属性的边

### kDE (k-Dependent Estimator)

* 样本不足：高阶联合概率估计困难，需要的样本数指数级增加

## 贝叶斯网

信念网 Judea Pearl

* 概率图模型
    * 有向图模型：贝叶斯网
    * 无向图模型：马尔可夫网
* $B=\langle G,\Theta\rangle$
    * $G$: 有向无环图 (DAG)
    * $\Theta$: 条件概率表 (CPT)
        * $\theta_{x_i|\pi_i}=P_B(x_i|\pi_i)$
* 联合分布：$P(x_1,\cdots,x_n)=\prod_{i=1}^nP(x_i|\text{Parent}(x_i))$

### 独立性判断

* 三变量间的典型依赖关系
    * 同父结构: $x_3\perp x_4|x_1$
    * 顺序结构：$y\perp z|x$
    * 冲撞结构(V-structure):
        * marginal independece: $x$&#10987;$y|z$
            * $z$ 完全未知则独立，给定 $z$ 则不独立
* 有向分离 (D-seperation，或道德化)
    * 转化为无向图 (moral graph)
        * 有向边改无向边
        * V 型结构两个父节点之间加边
    * $x$ 与 $y$ 有向分离：$\exists Z$, $x,y$ 在 $G\backslash Z$ 中分属两个连通分支则 $x\perp y|Z$
* 马尔科夫覆盖

### 结构学习

* 搜索最优贝叶斯网络结构: NP-hard
* 评分搜索：$G^*=\argmax_G g(G:D)$
    * MDL(最小描述长度)：综合编码长度最短的网络
        * $s(B|D)=f(\theta)|B|-\text{LL}(B|D)$
        * $\text{LL}(B|D)=\sum_{i=1}^m\log P_B(x_i)$
        * AIC 准则: $f(\theta)=1$
        * BIC 准则: $f(\theta)=\frac{\log m}{2}$
* 常用策略
    * 贪心法
    * 网络结构约束

### 精确推理（推断）

* 精确推断：NP-hard
* 因果推理
  * 已知网络中的祖先节点而计算后代节点的条件概率
* 诊断推理
  * 已知后代节点计算祖先节点，贝叶斯定理
* 支持推理
  * 原因间的相互影响

### 近似推断

求$P(Q=q|E=e)$

#### Gibbs sampling

* 先产生与证据 $E=e$ 一致的样本 $q^0$ 作为初始点
* 进行 $T$ 次采样，每次采样中逐个考察每个非证据变量：假定所有其他属性取当前值，推断出采样概率，根据该概率采样
* $T$ 次采样中与 $q$ 一致的样本共有 $n_q$ 个，则 $P(Q=q|E=e)\simeq\frac{n_1}{T}$

#### 变分推断

* 盘式记法
    * 相互独立且由同机制生成的多个变量放在一个方框里并标记 $N$
    * 用阴影标出已知变量
* $p(x|\Theta)=\prod_{i=1}^N\sum_zp(x_i,z|\Theta)$
    * EM 算法求解
