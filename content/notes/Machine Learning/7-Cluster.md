---
title: Cluster
date: 2019-04-14
weight: 7
---

## 性能度量

- 性能度量，有效性指标 validity index
- 外部指标：与某个参考模型比较
  - 簇划分：$\mathcal{C}=\{C_1,C_2,\cdots,C_k\}$, 参考模型簇划分 $\mathcal{C}^*=\{C_1^*,C_2^*,\cdots,C_s^*\}$,$\lambda,\lambda^*$ 为分别为两者簇标记向量，定义
    - $a=|\text{SS}|,\text{SS}=\{(x_i,x_j)|\lambda_i=\lambda_j,\lambda_i^*=\lambda_j^*,i<j\}$
    - $b=|\text{SD}|,\text{SD}=\{(x_i,x_j)|\lambda_i=\lambda_j,\lambda_i^*\not=\lambda_j^*,i<j\}$
    - $c=|\text{DS}|,\text{DS}=\{(x_i,x_j)|\lambda_i\not=\lambda_j,\lambda_i^*=\lambda_j^*,i<j\}$
    - $d=|\text{DD}|,\text{DD}=\{(x_i,x_j)|\lambda_i\not=\lambda_j,\lambda_i^*\not=\lambda_j^*,i<j\}$
    - $a+b+c+d=\frac{m(m-1)}{2}$
  - JC (Jaccard Coefficent)
    - $\text{JC}=\frac{a}{a+b+c}$
  - FMI (Fowlkes and Mallows Index)
    - $\text{FMI}=\sqrt{\frac{a}{a+b}\frac{a}{a+c}}$
  - RI (Rand Index)
    - $\text{RI}=\frac{2(a+d)}{m(m-1)}$
- 内部指标
  - 簇划分：$\mathcal{C}=\{C_1,C_2,\cdots,C_k\}$
    - $\text{avg}(C)=\frac{2}{|C|(|C|-1)}\sum_{1\leq i<j\leq|C|}\text{dist}(x_i,x_j)$ 簇内样本平均距离
    - $\text{diam}(C)=\max_{1\leq i<j\leq|C|}\text{dist}(x_i,x_j)$ 簇内样本间最远距离
    - $d_{\min}(C_i,C_j)=\min_{x_i\in C_i,x_j\in C_j}\text{dist}(x_i,x_j)$
    - $d_{\text{cen}}(C_i,C_j)=\text{dist}(\mu_i,\mu_j)$
  - DBI (Davies-Bouldin Index)
    - $\text{DBI}=\frac{1}{k}\sum_{i=1}^k\max_{j\not=i}(\frac{\text{avg}(C_i)+\text{avg}(C_j)}{d_{\text{cen}}(C_i,C_j)})$ 越小越好
  - DI (Dunn Index)
    - $\text{DI}=\min_{1\leq i\leq k}(\min_{j\not=i}(\frac{d_{\min}(C_i,C_j)}{\max_{1\leq l\leq k}\text{diam}(C_l)}))$ 越大越好

## 原型聚类

- SOM: self-organizing maps

### k-means

- 最小化平均误差 $E=\sum_{i=1}^k\sum_{x\in C_i}||x-\mu_i||_2^2$ ($\text{NP}$-hard)
- 贪心策略：迭代优化
- k-medoids: represented by objects near center

### LVQ

Learning Vector Quantization 学习向量量化

- 利用样本监督信息
- 每次迭代，每个样本对其最近的原型向量根据标记一致性做推动/吸引
- 每个原型向量 $p_i$ 定义了与之相关的一个区域 $R_i$，形成了对样本空间的 Voronoi tessellation

### 高斯混合聚类

- 高斯混合分布：$p_M(x)=\sum_{i=1}^k\alpha_ip(x|\mu_i,\Sigma_i),\sum_{i=1}^k\alpha_i=1$
- EM 算法求解
  - $\text{LL}(D)=\ln(\prod p_M)=\sum_{j=1}^m\ln(\sum_{j=1}^k\alpha_i p(x_j|\mu_i,\Sigma_i))$
  - E: $\gamma_{ji}=p_M(z_j=i|x_j)$
  - M
    - $\mu_i'=\frac{\sum{\gamma_{ji}x_j}}{\sum_{j=1}^m\gamma_{ji}}$
    - $\Sigma_i'=\frac{\sum\gamma_{ji}(x_j-\mu_i')(x_j-\mu_i)^T}{\sum\gamma_{ji}}$
    - $\alpha_i'=\frac{\sum\gamma_{ji}}{m}$

## 密度聚类

假设聚类结构能通过样本分布的紧密程度确定

### DBSCAN

- $\epsilon$-邻域：$N_\epsilon(x_i)=\{x_i\in D|\text{dist}(x_i,x_j)\leq\epsilon\}$
- 核心对象: $x_j,|N_\epsilon(x_j)|\geq\text{MinPts}$
- directly denisty-reachable: $x_j\in N_\epsilon(x_i)$ 且 $x_i$ 为核心对象，则 $x_j$ 由 $x_i$ 密度可达（无对称性）
- density-reachable
- density-connected: $\exists x_k$, $x_i,x_j$ 均由 $x_k$ 密度可达
- 簇 为满足下列性质最大集合
  - connectivity: $x_i\in C, x_j\in C$ 则 $x_i,x_j$ 密度相连
  - maximality: $x_i\in C$, $x_j$ 由 $x_i$ 密度可达则 $x_j\in C$
- 算法:
  1. 找出所有核心对象
  2. 对每个核心对象求 $X=\{x'\in D|x'$由$x$密度可达$\}$

### DIANA

top down

## 层次聚类

自底向上或自顶向下

### AGNES

agglomerative nesting

- 自底向上
- 起初每个样本点为一个簇
- 不断合并最近两个簇

| name             | d   |
| ---------------- | --- |
| single-linkage   | min |
| complete-linkage | max |
| average-linkage  | avg |
