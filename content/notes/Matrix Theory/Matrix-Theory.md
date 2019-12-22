---
title: 矩阵论
date: 2019-01-24
tags: [math, notes]
---

## 概念补充

* 同构算子：$\mathcal{A}:V\rightarrow V'$
  * 全映射
  * 可逆映射
* 同构：$V$与$V'$是同构的线性空间
* 数域$P$上两个有限线性空间同构$\iff$两空间维数相同
* 相似$A\sim B$:基1下矩阵为$A$，基2下矩阵为$B$，从基1到基2的过渡矩阵为$C$，则$B=C^{-1}AC$
* 相抵$A\simeq B$: A,B$为$m*n$阶矩阵，$m$阶方阵$D$和$n$阶方阵$C$满足$B=DAC$
  * 不同维线性空间$V^n$和$V^m$下，同一个线性变换在不同基偶下所对应的矩阵$A$和$B$之间的关系
* 非奇异$\iff$非退化$\iff$满秩$\iff$可逆
* 当$A$有n个线性无关特征向量时，$A$有完备的特征向量系；否则$A$为亏损矩阵

<!--more-->

## 内积空间上的等积变换

* 度量矩阵(Gram 矩阵)： 基的度量矩阵$A$,$A_{ij}=(\vec e_i,\vec e_j)$
  * 对称正定矩阵
  * 不同基的度量矩阵相合
* $(\vec x,\vec y)=X^TAY$
* $x\perp y$: $(x,y)=0$, x与y正交
* 施密特正交规范法
  * $\vec y_m'=\vec x_m + k_{m1}\vec y_{m-1}'+\cdots+k_{m,m-1}\vec y_1'$
  * $k_{mi}=-\frac{(\vec x_m,\vec y_{m-i}')}{(\vec y_{m-i}',y_{m-i}')}$
  * $\vec y_i=\frac{1}{|\vec y_i'|}\vec y_i'$
* 标准正交基$\iff$度量矩阵为单位矩阵
* 复数域内积
  * $(x,y)=\overline{(y,x)}$
  * $(x+y,z)=(x,z)+(y,z)$
  * $(kx,y)=k(x,y)$
  * $(x,x)\geq0$, $(x,x)=0\iff x=0$
* 酉空间：定义了内积的复数域上的线性空间
* 转置共轭：$y^H=\overline{y}^T$
  * $(\vec x,\vec y)=\vec y^H\vec x$
    * 夹角:$cos^2\langle\vec x,\vec y\rangle=\frac{(x,y)(y,x)}{(x,x)(y,y)}$
* 柯西施瓦兹不等式：$(x,y)(y,x)\leq(x,x)(y,y)$
* 单位向量: $x^Tx=1$
* 正交变换: $(\mathcal{A}(\vec x),\mathcal{A}(\vec y))=(\vec x,\vec y)$
* 正交变换的充要条件：
  * $\forall \vec x\in V,\ (\mathcal{A}(\vec x),\mathcal{A}(\vec x))=(\vec x,\vec x)$
  * 任一组标注正交基变换后仍是一组标准正交基
  * 任一组标准正交基下为正交矩阵 $A^T=A^{-1}$
* 正交矩阵$\iff$行（列）向量为标准正交向量
* 初等旋转变换（Givens变换）
  * 初等旋转矩阵$R_{ij}$:

    $$L^i=\left[\begin{matrix}
    1 & 0 &\cdots & 0 & \cdots & 0\\
    0 & 1 &\cdots & 0 & \cdots & 0\\
    \vdots & \vdots & c & \vdots & s & \vdots \\
    0 & 0 & \cdots & 1 & \cdots & 0 \\
    0 & 0 & -s & 0 & c & \vdots\\
    \vdots & \vdots & \ddots & \vdots & \ddots & \vdots\\
    0 & 0 & \cdots & 0 & \cdots & 1
    \end{matrix}\right],\ c^2+s^2=1$$

    * $\det R_{ij}=1$
    * $R_{ij}$正交
    * $Y=R_{ij}X$, 则仅两个分量变化
      * $y_i=cx_i+sx_j$
      * $y_j=-sx_i+cx_j$
    * 化第$j$个分量为0
      * $s=\frac{x_j}{\sqrt{x_i^2+x_j^2}}$
      * $c=\frac{x_i}{\sqrt{x_i^2+x_j^2}}$
      * $y_i=\sqrt{x_i^2+x_j^2}$
* 镜像变换（Householder变换）
  * 镜像变换：线性变换将向量$\xi$映射为与单位向量$\omega$正交的n-1维子空间的对称像$\eta$，且$\eta=(I-2\omega\omega^T)\xi = H\xi$
  * 初等反射矩阵：$H=I-2\omega\omega^T$
  * $H$对称正交
  * $Q$为初等旋转矩阵之积

    $$ H=Q^{-1} \left[\begin{matrix}
    -1 & 0 & \cdots & 0\\
    0 & 1 & \cdots & 1 \\
    \vdots & \vdots & \ddots & \vdots\\
    0 & 0 & \cdots & 1
    \end{matrix}\right] Q
    $$

## 埃尔米特矩阵

## kronecker product

$${\displaystyle (A\otimes B)_{p(r-1)+v,q(s-1)+w}=a_{rs}b_{vw}} {\displaystyle (A\otimes B)_{p(r-1)+v,q(s-1)+w}=a_{rs}b_{vw}}$$

## 求导

* $\frac{\partial x^Ta}{\partial x}=\frac{\partial a^Tx}{\partial x}=a$
* $\frac{\partial AB}{\partial x}=\frac{\partial A}{\partial x}B+A\frac{\partial B}{\partial A}$
* $\frac{\partial A^{-1}}{\partial x}=-A^{-1}\frac{\partial A}{\partial x}A^{-1}$
* $\frac{\partial b^TX^TXc}{\partial X}=X(bc^T+cb^T)$
* $\frac{(Bx+b)^TC(Dx+d)}{\partial x}=B^TC(Dx+d)+D^TC(Bx+b)$

## 奇异值分解

* $A=U\Sigma V^T$
* $U^TU=I$, $V^TV=I$

## 瑞利商

* $R(A,x)=\frac{x^HAx}{x^Hx}$, $A$ 为 Hermitan 矩阵
    * 最大值：$A$ 最大的特征值
    * 最小值：$A$ 最小的特征值
* 广义瑞利商：$R(A,B,x)=\frac{x^HAx}{x^HBx}=R(B^{-\frac{1}{2}}AB^{-\frac{1}{2}},B^{-\frac{1}{2}}x)$

# LU分解

* 消元矩阵: $L^{i}$ 为高斯消元第i次对应的矩阵，由倍加阵相乘得到

$$L^i=\left[\begin{matrix}
    1 & 0 &\cdots & 0 & \cdots & 0\\
    0 & 1 &\cdots & 0 & \cdots & 0\\
    \vdots & \vdots &\ddots & \vdots & \ddots & \vdots \\
    0 & 0 & \cdots & 1 & \cdots & 0 \\
    0 & 0 & \cdots & -\frac{a^i_{(i+1)i}}{a^{ii}} & \cdots & \vdots\\
    \vdots & \vdots & \ddots & \vdots & \ddots & \vdots\\
    0 & 0 & \cdots & -\frac{a^i_{ni}}{a^i_{ii}} & \cdots & 1
    \end{matrix}\right]$$
* 高斯消元过程： 上三角矩阵$U=A^n=L^{n-1}\cdots L^{2}L^{1}A^{1}$
* 高斯消元过程可以进行到底$\iff$ $A$的前$n-1$个顺序主子式都不为0
* $L=(L^1)^{-1}\cdots(L^{n-1})^{-1}$ 为单位下三角矩阵，$L_{ij}=-\frac{a^j_{ij}}{a^j_{jj}},i<j$
* 三角分解(LU分解)： 方阵$A=LU$
* 杜立特分解(Doolittle Decomposition)： $L$为单位下三角矩阵
* 克劳特分解(Crout Decomposition): $L$为单位上三角矩阵
* $LDU$基本定理：n阶方阵$A$可唯一分解为$A=LDU\iff$ $A$的前$n-1$个顺序主子式$A_k=\not0$, $L,U$为单位下、上三角矩阵，$D$为对角矩阵$diag(\frac{A_1}{A_0},\frac{A_2}{A_1},...,\frac{A_n}{A_{n-1}}),A_0=1$
  * 杜立特和克劳特分解存在则唯一
* **LDU分解**
  * 计算$L^1,\cdots,L^n,A^1,\cdots,A^n$
  * 令$L=(L^1)^{-1}\cdots(L^{n-1})^{-1}$
  * 令$A^n=DU$
  * $A=LA^n=LDU$
* **克劳德分解**
  * $l_{ij} = a_{ij}-\sum_{k=1}^{j-1}l_{ik}u_{kj}$
  * $u_{ij} = (a_{ij}-\sum_{k=1}^{i-1}l_{ik}u_{kj})/l_{ii}$
  * 从上至下，从左至右
* **杜立特分解**
  * $u_{ij}=a_{ij}-\sum_{k=1}^{i-1}l_{ik}u_{kj}$
  * $l_{ij}=(a_{ij}-\sum_{k=1}^{j-1}l_{ik}u_{kj})/u_{jj}$
* n阶对称正定矩阵$A$，唯一存在一个实的非奇异的下三角矩阵$L$，$A=LL^T$，称为乔累斯基分解（平方根分解）
* **乔累斯基分解**
  * $l_{ij}=(a_{ij}-\sum_{k=1}^{j-1})/l_{jj}$
* n阶对称正定矩阵$A$可唯一分解为$A=LDL^T$,其中，对角矩阵$D$元素为$L$对角线元素倒数
* **不带平方根的乔累斯基分解**
  * $l_{ij}=a_{ij}-\sum_{k=1}^{j-1}\frac{l_{ik}l_{jk}}{l_{kk}}$
* 置换矩阵$P=(e_{\pi(1)},\cdots,e_{\pi(n)})^T$
* 任意矩阵$A$可进行$PLU$分解，$A=PLU$，其中$P$为置换矩阵

# QR分解

* $QR$分解（正交三角分解）：实非奇异矩阵$A$能化成正交矩阵$Q$和实非奇异上三角矩阵$R$的乘积，$A=QR$
* 任意非奇异n阶矩阵，存在三角分解，$A=QR$且相差一个对角线元素之差绝对值全等于1的对角矩阵因子
  * 利用施密特正规化正交向量矩阵$A$和对应的上三角矩阵$B$
* **Givens方法**=-9
* **Householder方法**

## 最大秩分解

## 奇异值分解

## 谱分解