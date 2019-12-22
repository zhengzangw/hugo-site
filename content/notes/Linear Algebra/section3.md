---
title: 3-抽象空间
date: 2018-11-25
tags: [math, notes]
weight: 3
---

## 线性空间

* 线性空间
  * 加法
    * 交换律
    * 结合律
    * 零元素
    * 负元素
  * 乘法
    * 单位元素
    * 结合律
    * 分配率1
    * 分配率2
  * 注：
    * 检验加法、数乘是否封闭
    * 检验0元素存在
    * 检验负元素存在
* 极大线性无关组
  * 线性无关
  * 加入任意其余向量，均线性相关
  * 求极大线性无关组
    * $[a_i]->[b_i]$
    * $[b_j]$线性无关$\Rightarrow [a_j]$线性无关
    * $b_t=\sum{k_jb_j}\Rightarrow a_t=\sum{k_ja_j}$
  * 两个线性无关组$\alpha,\beta$正交($\alpha^T\beta=0$)则$\alpha,\beta$为线性无关组。
* 坐标：
  * $\alpha = \sum_{i=1}^nx_ie_i$记为$\alpha=(e_1,\cdots,e_n)(x_1,\cdots,x_n)^T$
* 过渡矩阵
  * 从$\beta_1,\cdots,\beta_m$到$\alpha_1,\cdots,\alpha_m$的过渡矩阵A: $(\alpha_1,\cdots,\alpha_m) =(\beta_1,\cdots,\beta_m)A$
  * 坐标变换: $X=A^{-1}Y$
  * **求过渡矩阵**
    * $[B|C]\rightarrow[I|A]$

## 子空间

* 判别条件
  * 非空
  * 加法封闭
  * 数乘封闭
* 子空间交$W_1\cap W_2$也是子空间
* 子空间并不一定是子空间
* 子空间和$W_1+W_2=\{\alpha_1+\alpha_2|\alpha_1\in W_1,\alpha_2 \in W_2\}$也是子空间
* 直和：$V=W_1+W_2$,若$\forall \alpha\in V$有唯一分解$\alpha=\beta_1+\beta_2$, 则$V=W_1\oplus W_2$
  * 以下三命题等价：
    * $V=W_1\oplus W_2$
    * $W_1\cap W_2=\{0\}$
    * $0\in V$ 有唯一分解
    * $\dim(V) = \dim(W_1) + \dim(W_2)$
  * $V=W_1\oplus W_2$ 则$W_1$的基和$W_2$的基合并为$V$的基
* 维数公式：$\dim(W_1\cap W_2)+\dim(W_1+W_2)=\dim(W_1)+\dim(W_2)$

## 线性映射

* 线性映射$\mathbb{A}:V_1\rightarrow V_2$:
  * $\mathbb{A}(\alpha+\beta)=\mathbb{A}(\alpha)+\mathbb{A}(\beta)$
  * $\mathbb{A}(k\alpha) = k\mathbb{A}(\alpha)$
* $\mathbb{A}\circ\mathbb{B}$ 亦为线性映射
* 线性映射$\mathbb{A}$关于基$e_1,\dots,e_n$与$\epsilon_1,\dots,\epsilon_n$的表示矩阵A: $\epsilon_1,\dots,\epsilon_n$ 到$\mathbb{A}(e_1,\dots,e_n)$ 的过渡矩阵
* 线性算子在$\epsilon_1,\dots,\epsilon_n$下的表示矩阵为$\epsilon_1,\dots,\epsilon_n$到$\mathbb{A}(\epsilon_1,\dots,\epsilon_n)$下的表示矩阵
* $\alpha\in V_1$ 关于$e_1,\dots,e_n$的坐标为$X$,则$\mathbb{A}(\alpha)$关于$\epsilon_1,\dots,\epsilon_n$的坐标为$AX$
