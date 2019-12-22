---
title: Neural Network
date: 2019-04-14
tags: [ml, math, notes]
weight: 4
---

* 网络模型
    * M-P 神经元模型： $y=f(\sum_{i=1}^m\omega_i-\theta)$
    * Perceptron： 两层神经网络
    * 多层前馈网络：全连接且无跨层连接
* **误差逆传播算法**(Back Propagation)
    * 前向计算
        * Layer1: $b_h=f(\beta_h-\gamma_h),\beta_h=\sum_{i=1}^dv_{ih}x_i$
        * Layer2: $\hat y_j=f(\alpha_j-\theta_j),\alpha_h=\sum_{i=1}^qw_{ih}b_i$
        * Loss: $E_k=\frac{1}{2}\sum_{j=1}^l(\hat y_j^k-y_j^k)^2$
    * 参数数⽬
        * 权重 $v_{ih},w_{hj}$
        * 阈值 $\theta_j,\gamma_h(i=1\cdots d,h=1\cdots q,j=1\cdots l)$
        * 共需要 $(d+l+1)q+1$ 个参数
    * 标准BP算法
        * 每次针对单个训练样例更新权值与阈值
        * 参数更新频繁，不同样例可能抵消，需要多次迭代
    * 累计BP算法
        * 其优化的⽬标是最⼩化 $E=\frac{1}{m}\sum_{k=1}^mE_k$
        * 读取整个训练集一遍才对参数进行更新
* 缓解过拟合
    * 早停
    * 正则化
* 跳出局部最小的策略
    * 多组不同的初始参数优化神经网络, 选取误差最小的解作为最终参数
    * 模拟退火技术
    * 随机梯度下降
    * 遗传算法

## 常见神经网络

* RBF 网络（Radial Basis Function）
    * 径向基函数
        * 高斯径向基函数：$e^{-\frac{(x-c)^2}{r^2}}$
    * 三层神经网络
        * 隐层激活函数为径向基函数
* 竞争性网络
    * 稳定性/可塑性二难问题
* ART 网络（Adaptive Resonance Theory）
    * 内星：可以被训练来识别矢量
    * 外星：可以被训练来产生矢量
    * ART I型网络
* SOM 网络（Self-Organizing Map）
* 级联相关网络
* Elman 网络
* Boltzmann 机
* 深度学习
