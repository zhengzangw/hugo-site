---
title: 2-矩阵
date: 2018-11-25
tags: [math, notes]
weight: 2
---

## 矩阵运算

* 可逆：AB=BA=I
  * **求矩阵的逆**
    * $[A|I]\rightarrow[I|A^{-1}]$
    * 有零行，不可逆
* trace: $tr(A)=\sum_{i=1}^na_{ii}$

## 行列变换

* 分块矩阵
* 初等行列变换
  * 初等阵
    * P(i,j)
    * P(j,i(k))
    * P(i(k))
  * 对A作k个初等变换得到B
    * $B=AQ_1Q_2\cdots Q_k$

## 秩

* 行秩=列秩
* $rank(A_{m*n})\leq min(m,n)$
* $rank(PA)\leq rank(A)$ 取等if P可逆
* $rank(AQ)\leq rank(A)$ 取等if Q可逆
* **求秩**: 高斯消元
* 可逆$\Leftrightarrow$满秩
* 线性方程组可解$\Leftrightarrow$$rank(A)=rank([A|b])$
* $null(A) = dimH$
* $rank(A) + null(A) = n$
* 子阵：A的某$k$行与某$l$列的交点，得$k*l$子阵
  * 若$rank(A)\geq k$,则$\exist B$为$A$的k阶子方阵且$B$可逆
  * 若$rank(A)<l$,则$\forall B$为$A$的l阶子方阵且$B$不可逆

## 行列式

* 排列
  * 逆序数：$\tau(P)$
  * 排列的奇偶性与变为自然排列所需对换的奇偶性相同
* $det(A) = \sum_{(j_1,j_2,\cdots,j_n)}(-1)^{\tau(j_1,j_2,\cdots,j_n)}a_{1j_1}a_{1j_2}\cdots a_{nj_n}$
* 外积
  * 分配律
  * 数乘提取
  * 对换为负
    * 外积运算：结合律
  * $a_1\wedge\cdots\wedge a_m=0\Leftrightarrow$线性相关
* 方阵可逆$\Leftrightarrow|A|\not=0$
* 矩阵基础变化的影响
  * $r_i\leftrightarrow r_j$ : -1
  * $kr_i + r_j \rightarrow r_j$ : no change
  * $kr_i \rightarrow r_i$ : k
* 上三角矩阵： $|A| = \prod_{i=1}^na_{ii}$
* $det(B*C)=det(B)*det(C)$
* $|AB|=|BA|$
* $det(A^{-1})=\frac{1}{det(A)}$
* **行列式计算** 高斯消元化为上三角阵
* $$B=\left[
  \begin{matrix}
    B_{11} & B_{12} \\
    0 & B_{22}
  \end{matrix}
  \right]$$ 
  则$det(B)=det(B_{11})det(B_{22})$
* $$B=\left[
  \begin{matrix}
    0 & B_{12} \\
    B_{21} & B_{22}
  \end{matrix}
  \right]$$ 
  则$det(B)=(-1)^{mn}det(B_{12})det(B_{21})$
* 代数余子式$A_{ij}=(-1)^{i+j}det(R_{ij})$,其中$R_{ij}$为A删去第i行第j列得到的(n-1)阶方阵 （余子阵）
  * |A|展开： $|A|=\sum_{j=1}^na_{ij}A_{ij}$
* $\sum a_{ik}A_{jk}=|A|,i=j$;  $0,i \not= j$
* 伴随阵 **求伴随阵** 

 $$A^*=\left[
  \begin{matrix}
    A_{11} & A_{21} & \cdots & A_{n1} \\
    A_{12} & A_{22} & \cdots & A_{n2} \\
    \vdots & \vdots & \ddots & \vdots \\
    A_{1n} & A_{2n} & \cdots & A_{nn} 
  \end{matrix}
  \right]$$

* $A^*A=AA^*=det(A)*I$
* $det(A)\not=0$时，$A^{-1}=\frac{1}{det(A)}A^*$
* | rank($A$) | rank($A^*$) |
  | --------- | ----------- |
  | n         | n           |
  | n-1       | 1           |
  | <n-1      | 0           |
* $|xI|=x^n$
* **求二阶方阵的逆**
* $|A+B|=|A^{-1}+B^{-1}|=|A(A^{-1}+B^{-1})B|$
* $|A|\neq0\iff rank(A)=n$
* $$\left[
  \begin{matrix}
    1 & 1 \\
    0 & 1
  \end{matrix}
  \right]^n=\left[
  \begin{matrix}
    1 & n \\
    0 & 1
  \end{matrix}
  \right]$$ 
* $(\alpha\beta^T)^n=C(\alpha\beta^T)$
