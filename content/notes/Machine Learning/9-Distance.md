---
title: Distance Learning
date: 2019-04-14
weight: 9
---

## 距离

- 正定性
- 对称性
- 三角不等式

### 有序距离

- 闵可夫斯基距离：$l=(\sum_{i=1}^n|x_i-y_i|^p)^{\frac{1}{p}}$
  - 切比雪夫距离：$l_\infty=\max_{i=1}^n|x_i-y_i|$
  - 欧几里得距离：$l_2=\sqrt{\sum_{i=1}^n(x_i-y_i)^2}$
  - 曼哈顿距离：$l_1=\sum_{i=1}^n|x_i-y_i|$
  - 加权闵可夫斯基距离：$l=(\sum_{i=1}^nw_i|x_i-y_i|^p)^{\frac{1}{p}}$
- 马氏距离：$d(\vec x,\vec y)=\sqrt{(\vec x-\vec y)^TS^{-1}(\vec x-\vec y)}$
  - $S$: 协方差矩阵
  - $dist^2_{mah}(x_i,x_j)=(x_i-x_j)^TM(x_i-x_j)=||x_i-x_j||^2_M$，度量矩阵 $M$ 为半正定矩阵
  - $M=PP^T$
    - $\Vert x_i-x_j\Vert_M=\Vert P^Tx_i-P^Tx_j\Vert$
- 余弦距离：$d(x,y)=\frac{<x,y>}{|x||y|}$

### 离散距离

#### 簇

- VDM(Value Difference Metric)
  - $m_{u,a}$: 在属性 $u$ 上取值为 $a$ 的样本数
  - $m_{u,a,i}$: 第$i$个样本簇在属性为 $a$ 的样本数
  - $\text{VDM}_p(a,b)=\sum_{i=1}^k|\frac{m_{u,a,i}}{m_{u,a}}-\frac{m_{u,b,i}}{m_{u,b}}|$
- $\text{MinkovDM}_p=(\sum|x_{iu}-x_{ju}|^p+\sum\text{VDM}_p(x_{iu},x_{ju}))^{\frac{1}{p}}$

#### 字符串

- 海明距离
- Lee 距离
- Levenshtein (编辑距离)

$$
\text{lev}_{a,b}=\begin{cases}
\max(i,j); \min(i,j)=0\\
\min(\text{lev}_{a,b}(i-1,j)+1,\text{lev}_{a,b}(i,j-1)+1,\text{lev}_{a,b}(i-1,j-1)+[a_i\not=b_i])
\end{cases}
$$

### 非度量距离

不满足三角不等式（相似度度量无需满足三角不等式）

### 两组点集的相似程度

- Hausdorff 距离
  - $\text{dist}_H(X,Z)=\max(\text{dist}_h(X,Z),\text{dist}_h(Z,X))$
  - $\text{dist}_h(X,Z)=\max_{x\in X}\min_{z\in Z}||x-z||_2$

## NCA

Neighbourhood Component Analysis 近邻成分分析

- 近邻分类器中 $x_j$ 对 $x_i$ 分类结果影响概率为：$p_{ij}=\frac{e^{-\Vert x_i-x_j\Vert^2_M}}{\sum_l e^{-\Vert x_i-x_j\Vert^2_M}}$
- $x_i$ LOO 正确率：$p_i=\sum_{j\in\Omega_i}p_{ij}$, $\Omega_i$ 为相同类别下标
- 训练集 LOO 正确率：$\sum_{i=1}^mp_i=\sum_{i=1}^m\sum_{j\in\Omega_i}p_{ij}$
- $\min_P 1-\sum_{i=1}^m\sum_{j\in\Omega_i}\frac{\exp(-||P^Tx_i-P^Tx_j||^2_2)}{\sum_l\exp(-||P^Tx_i-P^Tx_l||_2^2)}$

## 领域知识

必连约束$\mathcal{M}$,勿连约束$\mathcal{C}$

$$
\begin{aligned}
\min_{M} & \sum_{(x_i,x_j)\in\mathcal{M}}\Vert x_i-x_j\Vert^2_M \\
s.t. & \sum_{(x_i,x_k)\in\mathcal{C}}\Vert x_i-x_k\Vert_M\geq 1 \\
  & M \succeq 0
\end{aligned}
$$

## LMNN

Large Margin Nearest Neighbors

- $k$ 个目标邻居相近，入侵样本远离
  - 目标邻居：最近的同类别样本
  - 入侵样本：最近中的非同类别样本

$$
\begin{aligned}
\min*{M} & \sum_{i,j\in N*i}d(x_i,x_j)+\sum_{i,j,l}\xi_{ijl} \\
s.t. & \forall_{i,j\in N_k,l,y_l\not=y_i} d(x_i,d_j)+1\leq d(x_i,x_l)+\xi_{ijl}\\
& \xi_{ijl}\geq 0 \\
& M\succeq0
\end{aligned}
$$
