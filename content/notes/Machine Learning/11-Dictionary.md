---
title: Dictionary Learning
date: 2019-04-14
weight: 11
---

## 稀疏表达

稀疏表达（稀疏编码，字典学习）

- $x=Az$
  - 字典 $A$：过完备，一般不独立且不正交
- 优化目标：$\min_{B,\alpha_i}\sum_i^m||x_i-B\alpha_i||_2^2+\lambda\sum_{i=1}^m||\alpha_i||_1$
- 变量交替优化
  - 固定 $B$，LASSO 求解 $\alpha_i$
  - 固定 $\alpha$，求解 $B$
    - KSVD
- 稠密向量：分布式表达
- 稀疏编码
  - 减少计算量
  - 可解释性
  - 特征自动选择

## 压缩感知

- $y=\Phi x$
  - $x$: 长度为 $m$
  - $y$: 长度为 $n<<m$
  - 低于奈奎斯特采样频率采样，难以还原 $x$
- $y=\Phi\Psi s=As, s=\Psi x$
  - $\Psi=\mathbb{R}^{m\times m}$
  - $A$: 字典
  - 若 $s$ 具有稀疏性，则可以还原
- 感知测量：对原始信号处理得到稀疏样本表示
  - 傅里叶变换
  - 小波变换
  - 字典学习
- 重构恢复（压缩感知）：基于稀疏性从少量观测中恢复原信号
  - 限定等距性 RIP
    - k-RIP: $A$ 满足 $\exists\delta_k\in(0,1),\forall s,$ 子矩阵$A_k\in\mathbb{R}^{n\times k}$ 有 $(1-\delta_k)||s||_2^2\leq||A_ks||_2^2\leq(1+\delta_k)||s||^2_2$
    - 可通过 $\min ||s||_0, y=As$ 恢复出稀疏信号 $s$ ($\text{NP}$-hard)
- 矩阵补全
  - $\min_X \text{rank}(X),s.t. (X)_{ij}=(A)_{ij},(i,j)\in\Omega$
  - $\text{NP}$-hard
