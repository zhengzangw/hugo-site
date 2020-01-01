---
title: 5. Cayley's Formula
date: 2019-09-04
weight: 5
---

* Cayley's formula: There are $n^{n-2}$ different trees on $n$ distinct vertices

## Double Counting

* Count: # of sequences of adding directed edges to an empty graph to form a rooted tree
  * From a Tree: $T_nn(n-1)!=n!T_n$
  * From an empty graph: $\prod_{k=0}^{n-2}n(n-k-1)=n^{n-2}n!$

## Prüfer code

* encoder:
  * $T_1=T$
  * for i=1 to n-1
    * $u_i$: smallest leaf in $T_i$
    * $(u_i,v_i)$: edge in $T_i$
    * $T_{i+1}=T_i\backslash u_i$
  * return $(v_1,v_2,\cdots,v_{n-2})$
* decoder:
  * $T=\emptyset,v_{n-1}=n$
  * for i=1 to n-1
    * $u_i$: smallest not in $\{u_1,\cdots,u_{i-1}\}\cup\{v_i,\cdots,v_{n-1}\}$
    * $T\cup=\{u_i,v_i\}$
  * return $T$

## Kirchhoff's Matrix-Tree Theorem

* Adjacent matrix $A$: $A_{ij}=[\{i,j\}\in E]$
* Degree matrix $D$: $D_{ij}=\text{deg}(i)[i=j]$
* incidence matrix: $B_{n\times m}$

$$ B(i,e)=\begin{cases}
1 & e=\{i,j\}\wedge i<j\\
-1 & e=\{i,j\}\wedge i>j\\
0 & o.w.
\end{cases}
$$

* Laplacian matrix: $L=D-A$
  * $xLx^T=\frac{1}{2}\sum_{ij\in E}(x_i-x_j)^2$
  * $L=BB^T$
  * $L_{i,i}=B_iB_i^T$
* Kirchhoff's Matrix-Tree Theorem
  * $L_{i,i}$: submatrix of $L$ obtained by removing the ith row and ith collumn
  * $t(G)$: number of spanning trees in $G$
  * $\forall i,t(G)=\det(L_{i,i})$
* Cauchy-Binet Theorem
  * $\det(AB)=\sum_{S\in C_{[m]}^n}\det(A_{[n],S})\det(B_{S,[n]})$
  * ${\displaystyle A_{[n],S}}$ and ${\displaystyle B_{S,[n]}}$ denote, respectively, the ${\displaystyle n\times n}$ submatrices of $A$ and $B$, consisting of the columns of $A$, or the rows of $B$, indexed by elements of $S$
* $\det(B_{[n]\backslash\{i\},S})=\pm 1$ if $S$ is a spanning tree of $G$ o.w. $0$
* ${\displaystyle {\begin{aligned}\det(L_{i,i})&=\sum _{S\in {[m] \choose n-1}}\det(C_{[n-1],S})^{2}.\end{aligned}}}$
