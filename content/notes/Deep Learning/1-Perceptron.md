---
title: 1-Perceptron
date: 2019-04-14
weight: 1
---

## Perceptron

1957

- 模型：$\hat y=\text{sgn}(\omega^\top x)$
- 参数学习：错误驱动在线学习算法
  - $\omega\leftarrow 0$
  - 对于 $y\omega^\top x<0,\omega\leftarrow \omega+yx$
  - $L(\omega;x,y)=\max(0,-y\omega^\top x)$
- 感知机收敛性：$\mathcal{D}=\{(\mathbf{x}^{(n)},y^{(n)})\}_{n=1}^N,R=\max_n\|x^{(n)}\|$，若 $\mathcal{D}$ 可分，则两类感知机权重更新不超过 $\frac{R^2}{\gamma^2}$

## 神经元

- 神经元
  - 净输入：$z=\omega^\top x+b$
  - 活性值：$a=f(z)$
  - 激活函数：$f$

## 激活函数

- Sigmoid 型函数：两端饱和函数
  - Logistic: $\sigma(x)=\frac{1}{1+\exp(-x)}$
  - Tanh: $\tanh(x)=2\sigma(2x)-1=\frac{\exp(x)-\exp(-x)}{\exp(x)+\exp(-x)}$
  - 计算开销较大
- hard-logistic$(x)=\max(\min(0.25x+0.5,1),0)$
- hard-Tanh$(x)=\max(\min(x,1),-1)$
- ReLU$(x)=\max(0,x)$
  - 计算高效
  - 生物学合理性：单侧抑制、宽兴奋边界
  - 非零中心化：偏置偏移
  - 死亡 ReLU 问题
- LeakyReLU$(x)=\max(x,\gamma x)$
- 带参数 ReLU，对于第 $i$ 个神经元：PReLU$_i(x)=\max(0,x)+\gamma_i\min(0,x)$
- Exponential Linear Unit: ELU$(x)=\max(0,x)+\min(0,\gamma(\exp(x)-1))$
  - 近似零中心化
- Softplus$(x)=\log(1+\exp(x))$
- Swish$(x)=x\sigma(\beta x)$
- GELU$(x)=xP(X\leq x),P(X\leq x)$ 为高斯累积分布函数
- Maxout$(x)=\max_{k\in[1,K]}(z_k),z_k=\omega_k^\top x+b_k$
  - 输入为向量
