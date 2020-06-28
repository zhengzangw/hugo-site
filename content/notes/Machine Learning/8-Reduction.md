---
title: Dimension Reduction
date: 2019-04-14
weight: 8
---

## 线性降维

- 维数灾难 curse of dimensionality
  - 高维空间样本稀疏
  - 计算内积难

### MDS

Multiple Dimensional Scaling, 多维放缩

- 样本间距离在低维空间保持
- 算法
  1. 由距离矩阵 $D$ 求内积矩阵：$b_{ij}=-\frac{1}{2}(D_{ij}^2-D_{i*}^2-D_{*j}^2+D_{**}^2)$
  2. 特征值分解：$B=V\Lambda V^T$，非零特征值构成 $\Lambda_*=diag\{\lambda_1,\lambda_2,\cdots,\lambda_{d^*}\}$
  3. 坐标 $Z=\Lambda_*^{\frac{1}{2}}V_*^T$，可取前 $d'$ 个最大特征值

### PCA (Principal Component Analysis)

- 最近重构性：样本点到这个超平面距离足够近
- 最大可分性：样本点在这个超平面上的投影尽可能的分开

$$
\begin{aligned}
\max &\ \text{tr}(W^TXX^TW)\\
s.t &\ W^TW=1
\end{aligned}
$$

- 算法
  1. 中心化
  2. 计算协方差矩阵 $XX^T$ 并特征值分解
  3. 取最大 $d'$ 个特征向量为投影矩阵
- PCA: 最佳描述特征
- LDA: 最佳分类特征

## 非线性降维

### 核化线性降维

- KPCA
- KLDA

### 流形学习

#### Isomap

- 只考虑局部距离
- 算法
  1. 最短路径算法求出任意两点距离
  2. 代入 MDS

#### LLE(Locally Linear Embedding 局部线性嵌入)

- 只考虑邻域内样本间的线性关系，在低维空间重构权值
- 算法

  1. 确定每个点的 $k$ 近邻 $Q_i$
  2. 根据下式求出 $w_{ij},j\in Q_i$，且 $w_{ij}=0$ if $j\not\in Q_i$

  $$
  \begin{aligned}
  \min_{\omega_1,\omega_2,\cdots,\omega_m} & \sum_{i=1}^m\Vert x_i-\sum_{j\in Q_i}\omega_{ij}x_j\Vert^2_2 \\
  s.t. & \sum_{j\in Q_i}\omega_{ij}=1
  \end{aligned}
  $$

  3. 对 $M=(I-W)^T(I-W)$ 特征值分解，最小的 $d'$ 个特征值为投影 $Z$
