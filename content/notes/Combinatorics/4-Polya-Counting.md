---
title: 4. Pólya's Theory of Counting
date: 2019-09-04
tags: [math, ps, notes]
weight: 4
---

* Graph Isomorphism (GI)
  * Input: two undirected graphs $G$ and $H$
  * Output: $[G\cong H]$
* String Isomorphism (SI)
  * Input: two strings $x,y$: $[n]\rightarrow[m]$ and a permutation group $G\subseteq S_n$
  * Output: $[x\cong_G y]$

## 群作用的基本概念

* 群 $G$ 在非空集合 $X$上的左作用 $\circ:G\times X\rightarrow X$ 满足
  * $\forall x\in X(e\circ x=x)$
  * $g_1\circ(g_2\circ x) = (g_1g_2) \circ x$
* 轨道：$O_x=Gx=\{g\circ x:g\in G\}$
  * Let $X/G=\{O_x|x\in G\}$
  * $X=\bigsqcup O_x$
* $g$-不动点(invariant set)：$X_g=\text{fix}(g)=\{x\in X:g\circ x=x\}$
* 稳定化子(stabilizers)：$G_x=\text{stab}(x)=\{g\in G: g\circ x=x\}\leqslant G$
  * $[G:G_x]=|O_x|$
* **Burnside引理**: $|X/G|=\frac{1}{|G|}\sum_{g\in G}|X_g|$

## Pólya Theory of Counting

* $M_\pi(x_1,x_2,\cdots,x_n)=\prod_{i=1}^k x_{l_i},i$th cycle has length $i$
* cycle index of $G$: $P_G(x_1,x_2,\cdots,x_n) = \frac{1}{|G|}\sum_{\pi\in G}M_\pi(x_1,x_2,\cdots,x_n)$
* nonequivalent $m$-colorings of $n$ objects under the action of $G$ pattern inventory
  * $F_G(y_1,y_2,\cdots,y_m)=\sum_{v}a_vy_1^{n_1}y_2^{n_2}\cdots y_m^{n_m}$
  * $v=(n_1,n_2,\cdots,n_m),\sum_{i=1}^mn_i = n$
* Pólya's enumeration formula: $F_G(y_1,y_2,\cdots,y_m)=P_G(\sum_{i=1}^my_i,\sum_{i=1}^my_i^2,\cdots,\sum_{i=1}^my_i^n)$