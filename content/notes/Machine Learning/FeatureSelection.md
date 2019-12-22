---
title: Feature Selection
date: 2019-04-14
tags: [ml, math, notes]
weight: 8
---

* 特征选择方法
    * 子集搜索
        * 前向
        * 后向
    * 子集评价

## 过滤式选择：先过滤，再训练

### Relief

* near-hit: 同类样本中最近
* near-miss: 异类样本中最近
* 相关统计量（属性$j$）: $\delta^j=\sum_i-\text{diff}(x_i^j,x_{i,nh}^j)^2+\text{diff}(x_i^j,x_{i,nm}^j)^2$
    * 若 $x_i$ 与其猜中邻近在属性上的距离小于猜错邻近，增大相关统计量

### Relief-F

* $\delta^j=\sum_i-\text{diff}(x_i^j,x_{i,nh}^j)^2+\sum_{l\not=k}(p_l*\text{diff}(x_i^j,x_{i,l,nm}^j)^2)$
    * $p_l$ 为所占比例

### 包裹式选择：先训练，再选择

* LVW(Las Vegas Wrapper)

### 嵌入式选择

* L1 正则化， 岭回归
    * PGD 近端梯度下降
        * L-Lipschitz条件 + 二阶泰勒在 $x_k$ 展开：$\hat f(x)\simeq \frac{L}{2}||x-(x_k-\frac{1}{L}\nabla f(x_k)||^2_2+C$，最小值取在 $x_{k+1}=x_k-\frac{1}{L}\nabla f(x_k)$
* L2 正则化， LASSO
