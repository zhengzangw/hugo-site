---
title: Spectral Clustering
date: 2019-09-18
tags: [math]
---

# 理论基础

* 邻接矩阵 $E$：$\omega_{ij}$ 为 $v_i$ 与 $v_j$ 的边权
* $D$: $d_i=\sum_{j=1}^n\omega_i$

<!--more-->

## unnormalized graph Laplacian matrix

* $L=D-E$
* $\forall f\in\mathbb{R}^n,f^TLf=\frac{1}{2}\sum_{i,j=1}^n\omega_{ij}(f_i-f_j)^2$
* $L$ is symmetric and positive semi-definite
* The smallest eigenvalue of $L$ is $0$, the corresponding eigenvector is the constant one vector $\mathbb{1}$
* $L$ has $n$ non-negative, real-valued eigenvalues $0=\lambda_1\leq\lambda_2\leq\cdots\leq\lambda_n$
* self-edges in a graph do no change $L$
* the multiplicity $k$ of the eigenvalue $0$ of $L$ equals the number of connected components in the graph

## normalized graph Laplacians

* $L_{\text{sym}} = D^{-\frac{1}{2}}LD^{-\frac{1}{2}}=I-D^{-\frac{1}{2}}WD^{-\frac{1}{2}}$
* $L_{\text{rw}} = D^{-1}L=I-D^{-1}W$
* $\forall f\in\mathbb{R}^n,f^TL_{\text{sym}}f=\frac{1}{2}\sum_{i,j=1}^n\omega_{ij}(\frac{f_i}{\sqrt{d_i}}-\frac{f_j}{\sqrt{d_j}})^2$
* $\lambda$ is an eigenvalue of $L_\text{sym}$ with eigenvector $u$ iff
  * $\lambda$ is an eigenvalue of $L_{\text{sym}}$ with eigenvector $\omega=D^{\frac{1}{2}}u$
  * Or $\lambda$ and $u$ solve the generalized eigenproblem $Lu=\lambda Du$
* $L_{\text{sym}}$ and $L_{\text{rw}}$ are positive semi-definite and have $n$ non-negative real-valued eigenvalues $0=\lambda_1\leq\cdots\leq\lambda_n$

# 算法

## Unnormalized spectral clustering

* Construct a similarity graph
* Compute first $k$ eigenvalues $u1,\cdots,u_k$ of $L$
  * $U\in\mathbb{R}^{n\times k}$, $U$ contains $u_1,\cdots, u_k$ as column
* Cluster point $(y_i)$ of $U$ in $\mathbb{R}^k$ with $k$-means into cluster $C_1,\cdots,C_k$
* $A_i=\{j|y_j\in C_i\}$

## Normalized spectral clustering according to Shi and Malik

* Construct a similarity graph
* Compute the first $k$ generalized eigenvectors $u_1,\cdots,u_k$ of problem $Lu=\lambda Du$
  * $U\in\mathbb{R}^{n\times k}$, $U$ contains $u_1,\cdots, u_k$ as column
* Cluster point $(y_i)$ of $U$ in $\mathbb{R}^k$ with $k$-means into cluster $C_1,\cdots,C_k$
* $A_i=\{j|y_j\in C_i\}$

## Normalized spectral clustering according to Ng et al.

* Construct a similarity graph
* Compute first $k$ eigenvalues $u1,\cdots,u_k$ of $L_{\text{sym}}$
* Form $T\in\mathbb{R}^{n\times k}$ from $U$ by normalizing the rows to norm 1
  * $t_{ij}=\frac{u_{ij}}{(\sum_ku_{ik}^2)^\frac{1}{2}}$
* Cluster point $(y_i)$ of $T$ in $\mathbb{R}^k$ with $k$-means into cluster $C_1,\cdots,C_k$
* $A_i=\{j|y_j\in C_i\}$