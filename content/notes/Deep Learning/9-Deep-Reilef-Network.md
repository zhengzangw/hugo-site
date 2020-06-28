---
title: 9-Deep-Relief-Network
date: 2020-06-22
---

## 玻尔兹曼机

- 动力系统：描述一个空间中所有点随时间变化情况
- Boltzmann Machine: a Stochastic Dynamical System
  - 每个随机变量二值：$X\in\{0,1\}^K$，可观察变量 $V$，隐变量 $H$
  - 所有结点全连接
  - 每两个变量间影响对称
- 玻尔兹曼分布：$p(x)=\frac{1}{Z}\exp(\frac{-E(x)}{T})$
  - $E(x)=E(X=x)=-(\sum_{i<j}\omega_{ij}x_ix_j+\sum_ib_ix_i)$
  - $\frac{p_\alpha}{p_\beta}=\exp(\frac{E_\beta-E_\alpha}{kT})$
- 全条件概率：$p(x_i=1|x_{\backslash i})=\sigma(\frac{\sum_j\omega_{ij}x_j+b_i}{T})$
- 生成模型：吉布斯采样生成服从 $p(x)$ 的函数
  - 随机选择变量 $X_i$，根据 $p(x_i|x_{\backslash i})$ 设置状态，运行到热平衡
  - $T$ 越高越容易达到热平衡
  - $T\rightarrow+\infty$: 每个状态一样
  - $T\rightarrow 0$：退化为 Hopfield 网络
- 模拟退火寻找全局最优解：以概率 $\sigma(\frac{\Delta E_i(x_{\backslash i})}{T})$ 将变量设置为 1
- 参数学习
  - 可观测变量 $v\in\{0,1\}^{K_v}$
  - 隐变量：$h\in\{0,1\}^{K_h}$
  - 对数似然：$L(D;W,b)=\frac{1}{N}\sum_{n=1}^N\log p(\hat v^{(n)};W,b)$

## 受限玻尔兹曼机

- 隐变量与可观察变量全连接
- $E(v,h)=-a^\top v-b^\top h-v^\top Wh$
- $p(v,h)=\frac{1}{Z}\exp(-E(v,h))$
- 生成模型
  - $p(v_i|v_{\backslash i,h})=p(v_i|h)$
  - $p(v_i=1|h)=\sigma(a_i+\sum_j\omega_{ij}h_j)$
  - 吉布斯采样：并行对所有隐变量/可观测变量采样，快速达到热平衡
- 参数学习
- 对比散度算法
- 受限玻尔兹曼机类型
  - 伯努利-伯努利 BB-RBM
  - 高斯-伯努利 GB-RBM
  - 伯努利-高斯 BG-RBM

## 深度信念网络

- 每层变量依赖于上一层变量，最底层为可观测变量
- 逐层训练：每层看做玻尔兹曼机
