---
title: 7-Unsupervised Learning
date: 2020-06-18
---

## Unsupervised Feature Learning

- PCA
- Sparse Coding（字典学习）
- 自编码器

  - 编码器：$f:\mathbb{R}^D\rightarrow\mathbb{R}^M$
  - 解码器：$g:\mathbb{R}^M\rightarrow\mathbb{R}^D$
  - 优化目标：最小化重构错误

    $$L=\sum_{n=1}^N\|x^{(n)}-g(f(x^{(n)}))\|+\lambda\|W\|^2$$

  - 捆绑权重：$W^{(2)}=W^{(1)\top}$

- 稀疏自编码器

  - $M>D$ 且 $z$ 稀疏

    $$L=\sum_{n=1}^N\|x^{(n)}-g(f(x^{(n)}))\|+\eta\rho(Z)+\lambda\|W\|^2$$

  - 稀疏性度量函数：$\rho$

    - $l_1$ 范数：$\rho(z)=\sum_{m=1}^M|z_m|$
    - 对数函数：$\rho(z)=\sum_{m=1}^M\log(1+z_m^2)$
    - 指数函数：$\rho(z)=\sum_{m=1}^M-\exp(-z_m^2)$
    - $\rho(z)=\sum_{j=1}^p\text{KL}(\rho^*\|\hat\rho_j)$

      第 $j$ 个神经元激活概率近似（平均活性值）：$\hat\rho_j=\frac{1}{N}\sum_{n=1}^Nz_j^{(n)}$

- 堆叠自编码器
- 降噪自编码器：先根据一 个比例 $𝜇$ 随机将 $𝒙$ 的一些维度的值设置为 $0$，得到一个被损坏的向量 $𝒙̃$，然后将被损坏的向量 $𝒙̃$ 输入给自编码器得到编码 $𝒛$，并重构出无损的原始输入 $𝒙$。

## Probabilistic Density Estimation

- 参数估计
  - 最大似然估计
- 非参数密度估计
  - 直方图方法
  - 核方法估计（Parzen 窗方法）
  - $K$ 近邻方法

## Clustering

- See Machine Learning Clustering
