---
title: EM Algorithm
date: 2019-04-14
tags: [ml, math, notes]
weight: 10.1
---

* $\text{LL}(\Theta|X,Z)=\ln P(X,Z|\Theta)$
* 原型
    * E: 基于 $\Theta^t$ 推断隐变量 $Z^t$ 的期望
    * M: 基于 $X$ 和 $Z^t$ 对 $\Theta^{t+1}$ 做极大似然估计
* 计算 $P(Z|X,\Theta^t)$
    * E: 以 $\Theta^t$ 推断 $P(Z|X,\Theta^t)$
    * M: $\Theta^{t+1}=\arg\max_{\Theta}E_{Z|X,\Theta^t}\text{LL}(\Theta|X,Z)$
