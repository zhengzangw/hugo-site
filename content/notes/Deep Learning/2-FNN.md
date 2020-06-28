---
title: 2-FNN
date: 2020-06-14
weight: 2
---

## FNN

- 前向神经网络/全连接神经网络/多层感知机
- 前向传播
  - $z^{(l)}=W^{(l)}a^{(l-1)}+b^{(l)}$
  - $a^{(l)}=f_l(z^{(l)})$
- 通用近似定理（Universal Approximation Theorem,1989)
  - $\phi(\cdot)$ 是一个非常数、有界、单调递增的连续函数，$J_D$ 是一个 $D$ 维的单位超立方体 $[0,1]^D$，$C(J_D)$ 是定义在 $J_D$ 上的连续函数集合
  - $\forall f\in C(J_D),\exists M\in\mathbb{Z},v_m,b_m\in\mathbb{R},\omega_m\in\mathbb{R}^D$, 有函数 $F(x)=\sum_{m=1}^Mv_m\phi(\omega_m^\top x+b_m)$
  - $|F(x)-f(x)|<\epsilon,\forall x\in J_D,\epsilon$ 为很小正数
  - 在 $\mathbb{R}^D$ 有界闭集上依然成立
- $𝕀_i(t)$: 第 $i$ 个元素为 $t$ 其余为 $0$ 的行向量
- 反向传播算法
  - $\delta_i^{(l)}=\frac{\partial L}{\partial z^{(l)}}=\frac{\partial L}{\partial z^{(l+1)}}\frac{\partial z^{(l+1)}}{\partial a^{(l)}}\frac{\partial a^{(l)}}{\partial z^{(l)}}=\delta_{i+1}(W^{l+1})^\top\text{diag}(f'(z^{(l)}))\in\mathbb{R}^{M_l}$
  - $dL=\text{tr}(\frac{\partial L}{\partial z^{(l)}}dz^{(l)})=\text{tr}((a^{(l-1)})^\top\delta^{(l)}dW)\Rightarrow\frac{L(y,\hat y)}{\partial W^{(l)}}=\delta^{(l)}(a^{(l-1)})^\top$
- 自动梯度计算
  - 数值微分
  - 符号微分
  - 自动微分：$f:\mathbb{R}^N\rightarrow\mathbb{R}^M$
    - 前向模式：$N$
    - 反向模式：$M$
- 优化
  - 非凸优化问题
  - 梯度消失问题
  - 梯度弥散问题
