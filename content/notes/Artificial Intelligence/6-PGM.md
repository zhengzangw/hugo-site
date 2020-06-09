---
title: 6-概率图
date: 2019-09-10
weight: 6
---

## 马尔科夫网

* 离散时间序列 $\{t_1,\cdots,t_n\}$，在时间 $t$ 的状态为 $X_t$
* Markov 链：系统 $\{s_1,\cdots,s_n\},P(X_t=s_k|X_1,\cdots,X_{t-1})=P(X_t=s_k|X_{t-1})$
* 马尔科夫网：无向图+概率分布 $G=(V,E)$
  * $V$: 随机变量
  * $E$: 变量间的依赖关系
  * $x_{\{k\}}$: 第$k$个团的赋值
  * 特征函数：$\phi_k(x_{\{k\}})$
    * 第$k$个团的势函数
  * 势函数：$f_k(x_{\{k\}})=e^{\omega_k^T\phi_k(x_{\{k\}})}$
  * 吉布斯测度：$P(X=x)=\frac{1}{Z}\prod_kf_k(x_{\{k\}})$
    * 配分函数：所有分配方案的测度综合 $Z=\sum_{\mathbf{x}}\prod_kf_k(x_{\{k\}})$
  * 对数线性模型：$P(X=x)=\frac{1}{Z}e^{\sum_kw_k^T\phi_k(x_{\{k\}}))}$
    * $Z=\sum_{\mathbf{x}}e^{\sum_kw_k^T\phi_k(x_{\{k\}})}$
* 无向图为马尔科夫网络 $\iff$ 满足以下三条性质（独立性）
  * Pairwise Markov Property: $X_u\perp X_v|X_{V\backslash\{u,v\}},\{u,v\}\not\in E$
  * Local Markov Property: $X_v\perp X_{V\backslash\text{ne}(v)}|X_{\text{ne}(v)}$
    * $\text{ne}(v)$: 邻居，马尔科夫毯
  * Global Markov Property: $X_A \perp X_B|X_S$，$A,B$ 两个子集间任何一条路径都经过子集$S$，则给定 $S$ 后，$A,B$ 两个子集相互条件独立
* 构造
  * 如果满足 $P\not\vDash(X\perp Y|V-\{X,Y\})$，则 $X,Y$ 加边
  * 给定 $X$ 的马尔可夫毯，$X$ 独立于余下的变量

## 马尔科夫逻辑网 (MLN)

* 判断一个知识库中是否包含公式 $F$，$F$ 在所有满足知识库的世界中恒真
* MLN = Markov Net + 一阶逻辑
  * 公式附加权值的一阶逻辑知识库
  * 基本思想：将一阶逻辑的限制放松，即一个可能世界违反公式越多，其发生的概率越小
* $L$：$\{(F_i,w_i)\}$
  * $F_i$: 一阶逻辑闭规则（无变元）
  * $w_i$: 实数表示权重
  * $C$: 有限常数集
* 马尔科夫逻辑网 $M_{L,C}$
  * $L$ 中的任意闭原子对应一个二值结点，真为 $1$，假为 $0$
  * $L$ 任意闭规则对应一个特征值，若规则为真，特征值为 $1$ 否则为 $0$。权重为 $\omega_i$
  * $P(X=x)=\frac{1}{Z}\text{exp}(\sum_{i=1}^F\omega_in_i(x))$
    * $n_i$: $F_i$ 在 $X$ 中所有取真值的公式的数量

## 马尔科夫网推理

* 条件概率查询
  * 证据：$E=e$
  * 查询： $Y$ 的子集
  * 计算：$P(Y|E=e)$
* 最大化后验(MAP)
  * 证据：$E=e$
  * 查询：所有其它变量 $Y$
  * 计算：$\text{MAP}(Y|E=e)=\arg\max_y P(Y=y|E=e)$
* 和积：$P(D)=\frac{1}{Z}\sum_{A,B,C}\phi_1(A,B)\phi_2(B,C)\phi_3(C,D)\phi_4(A,D)$
* 变量消除算法：BN,MN （复杂性：NP-hard）
  * 根据给定的证据，得出需要约简的因子集
  * 对于每一个非查询的变量 $X$，将其从 $\Phi$ 中消除
  * 连乘余下因子
* 信念传播
* 随机采样
  * Markov chain
  * Gibbs sampling
