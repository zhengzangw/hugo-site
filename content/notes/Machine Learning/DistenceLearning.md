---
title: Distance Learning
date: 2019-04-14
tags: [ml, math, notes]
weight: 9.3
---

* Mahalanobis distance: $dist^2_{mah}(x_i,x_j)=(x_i-x_j)^TM(x_i-x_j)=||x_i-x_j||^2_M$，度量矩阵 $M$ 为半正定矩阵
* $M=PP^T$
    * $\Vert x_i-x_j\Vert_M=\Vert P^Tx_i-P^Tx_j\Vert$
* 领域知识: 必连约束$\mathcal{M}$,勿连约束$\mathcal{C}$

$$\begin{aligned}
\min_{M} & \sum_{(x_i,x_j)\in\mathcal{M}}\Vert x_i-x_j\Vert^2_M \\
s.t. & \sum_{(x_i,x_k)\in\mathcal{C}}\Vert x_i-x_k\Vert_M\geq 1 \\
  & M \succeq 0
\end{aligned}$$

## NCA(Neighbourhood Component Analysis 近邻成分分析)

* 近邻分类器中 $x_j$ 对 $x_i$ 分类结果影响概率为：$p_{ij}=\frac{e^{-\Vert x_i-x_j\Vert^2_M}}{\sum_l e^{-\Vert x_i-x_j\Vert^2_M}}$
* $x_i$ LOO 正确率：$p_i=\sum_{j\in\Omega_i}p_{ij}$, $\Omega_i$ 为相同类别下标
* 训练集 LOO 正确率：$\sum_{i=1}^mp_i=\sum_{i=1}^m\sum_{j\in\Omega_i}p_{ij}$
* $\min_P 1-\sum_{i=1}^m\sum_{j\in\Omega_i}\frac{\exp(-||P^Tx_i-P^Tx_j||^2_2)}{\sum_l\exp(-||P^Tx_i-P^Tx_l||_2^2)}$

## LMNN(Large Margin Nearest Neighbors)

* $k$ 个目标邻居相近，入侵样本远离
    * 目标邻居：最近的同类别样本
    * 入侵样本：最近中的非同类别样本

$$\begin{aligned}
\min_{M} & \sum_{i,j\in N_i}d(x_i,x_j)+\sum_{i,j,l}\xi_{ijl} \\
s.t. & \forall_{i,j\in N_k,l,y_l\not=y_i} d(x_i,d_j)+1\leq d(x_i,x_l)+\xi_{ijl}\\
 & \xi_{ijl}\geq 0 \\
 & M\succeq0
\end{aligned}$$
