---
title: Pattern Recognition
date: 2019-09-02
weight: 8
---

## 基本概念

* 模式识别
  * feature: 描述符
  * pattern: 描述符的排列
  * pattern class：具有共同属性的模式 $\omega_1,\omega_2,\cdots,\omega_W$
* 常见的模式排列
  * vector
  * string: 结构描述
  * tree: 结构描述
* 决策论方法
  * $x\in\omega_i$: $d_i(x)>d_j(x),\forall j\neq i$
  * 决策边界：$d_ij(x)=d_i-d_j(x)=0$

## 匹配

每个类表示为原型模式向量，一个模式被分配给最近的类

* 最小距离分类器
  * $m_j=\frac{1}{N_j}\sum_{x_j\in\omega_j}x_j$
  * $D_j(x)=\|x-m_j\|$
  * 等价计算：$d_j(x)=x^Tm-\frac{1}{2}m_j^Tm_j$
* 基于相关的匹配
  * 相关定理：$f(x,y)\star w(x,y)\iff F^*(u,v)W(u,v)$
  * 归一化相关系数：$\gamma(x,y)=\frac{\sum_s\sum_t[w(s,t)-\overline{w}][f(x+s,y+t)-\overline{f}_{xy}]}{\{\sum_s\sum_t[w(s,t)-\overline{w}]^2\sum_s\sum_t[f(x+s,y+t)-\overline{f}_{xy}]^2\}^{\frac{1}{2}}}$

## 最佳统计分类器

* 条件平均风险：$r_j(x)=\sum_{k=1}^WL_{kj}p(w_k|x)\doteq\sum_{k=1}^WL_{kj}L_{kj}p(x|\omega_k)P(\omega_k)$
* 0-1损失：$L_{ij}=1-\delta_{ij}$
* 0-1损失贝叶斯分类器：$\arg\max_i p(x|\omega_i)P(\omega_i)$

## 神经网络