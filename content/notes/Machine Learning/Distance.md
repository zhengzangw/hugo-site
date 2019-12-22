---
title: Distance
date: 2019-04-29
tags: [math, notes]
weight: 9.2
---

## 定义

* 正定性
* 对称性
* 三角不等式

## 有序距离

* 闵可夫斯基距离：$l=(\sum_{i=1}^n|x_i-y_i|^p)^{\frac{1}{p}}$
  * 切比雪夫距离：$l_\infty=\max_{i=1}^n|x_i-y_i|$
  * 欧几里得距离：$l_2=\sqrt{\sum_{i=1}^n(x_i-y_i)^2}$
  * 曼哈顿距离：$l_1=\sum_{i=1}^n|x_i-y_i|$
  * 加权闵可夫斯基距离：$l=(\sum_{i=1}^nw_i|x_i-y_i|^p)^{\frac{1}{p}}$
* 马氏距离：$d(\vec x,\vec y)=\sqrt{(\vec x-\vec y)^TS^{-1}(\vec x-\vec y)}$
  * $S$: 协方差矩阵
  * $dist^2_{mah}(x_i,x_j)=(x_i-x_j)^TM(x_i-x_j)=||x_i-x_j||^2_M$，度量矩阵 $M$ 为半正定矩阵
* 余弦距离：$d(x,y)=\frac{<x,y>}{|x||y|}$

<!--more-->

## 离散距离

### 簇

* VDM(Value Difference Metric)
  * $m_{u,a}$: 在属性 $u$ 上取值为 $a$ 的样本数
  * $m_{u,a,i}$: 第$i$个样本簇在属性为 $a$ 的样本数
  * $\text{VDM}_p(a,b)=\sum_{i=1}^k|\frac{m_{u,a,i}}{m_{u,a}}-\frac{m_{u,b,i}}{m_{u,b}}|$
* $\text{MinkovDM}_p=(\sum|x_{iu}-x_{ju}|^p+\sum\text{VDM}_p(x_{iu},x_{ju}))^{\frac{1}{p}}$

### 字符串

* 海明距离
* Lee 距离
* Levenshtein (编辑距离)

$$
\text{lev}_{a,b}=\begin{cases}
\max(i,j) & \min(i,j)=0\\
\min(\text{lev}_{a,b}(i-1,j)+1,\text{lev}_{a,b}(i,j-1)+1,\text{lev}_{a,b}(i-1,j-1)+[a_i\not=b_i])
\end{cases}
$$

## 非度量距离

不满足三角不等式（相似度度量无需满足三角不等式）

## 两组点集的相似程度

* Hausdorff距离
  * $\text{dist}_H(X,Z)=\max(\text{dist}_h(X,Z),\text{dist}_h(Z,X))$
  * $\text{dist}_h(X,Z)=\max_{x\in X}\min_{z\in Z}||x-z||_2$