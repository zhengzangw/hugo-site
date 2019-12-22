---
title: 6-场论
date: 2019-09-19
tags: [math, notes]
weight: 6
---

* 场（向量场）：$\mathbf{X}:U\rightarrow\mathbb{R}^n$
* 梯度场：$\Delta f=\text{grad} f=(\frac{\partial f}{\partial x},\frac{\partial f}{\partial y},\frac{\partial f}{\partial z})^T$
  * $0$ 阶微分形式的外微分
* 旋度场：$\text{curl} \mathbf{X} = \text{rot} \mathbf{X} = (\frac{\partial R}{\partial y}-\frac{\partial Q}{\partial z},\frac{\partial P}{\partial z}-\frac{\partial R}{\partial x},\frac{\partial Q}{\partial x}-\frac{\partial P}{\partial y})$
  * $1$ 阶微分形式的外微分
* 散度：$\text{div} \mathbf{X}=\frac{\partial P}{\partial x}+\frac{\partial Q}{\partial z}+\frac{\partial R}{\partial z}$
  * $2$ 阶微分形式的外微分
* $\text{curl}({\nabla f})=0$
* $\text{div}({\text{curl} \mathbf{X}})=0$