---
title: 7. Probabilistic Method
date: 2019-09-04
tags: [math, ps, notes]
weight: 7
---

* Principle
  * $\exists x,A(x)\Leftarrow P(A(x))>0$ or $P(\neg A(x))<1$
  * Bad events: $A_1,\cdots,A_n$, $P(\wedge_{i=1}^n\overline{A}_i)>0$
  * $\exists x\leq/\geq E(x),P(X=x)>0$
* Ramsey's Theorem: $n\geq R(k,k),\forall$ two coloring of $K_n,\exists$ a monochromactic $K_k$
  * Ramsey number: $R(k,k)$
  * For any two coloring of $K_6$ there is a monobromatic $K_3$ ($R(3,3)=6$)
  * Erdős Theorem(1947): ${n\choose k}2^{1-C_k^2}<1$ then it is possible to color the edges of $K_n$ with two colors so that there is no monochromatic $K_k$ subgraph
* Tournament
  * orientation of the edges of the complete graph on set of vertices $V$
  * $k$-paradoxical: $\forall V, |V|=k,\exists v$ beats them all
  * Theorem (Erdős 1963): if ${n\choose k}(1-2^{-k})^{n-k}<1$, there is a tournament on $n$ vertices that is $k$-paradoxical
  * Theorem (Szele 1943): There is a tournament on $n$ players with at least $n!2^{-(n-1)}$ Hamiltonian paths
* Independent sets
  * a set of vertices with no edges between them
  * Theorem: $G$ has an independent set with at least $\frac{n^2}{4m}$ vertices
* Coloring large-girth graphs
  * girth: $g(G)$ is the length of the shortest cycle in $G$
  * $\chi(G)=\min(C\in\mathbb{N}|\exists :V\rightarrow [C],\forall uv\in E,f(u)\neq f(v))$
  * Independent number: $\alpha(G)=\max\{|S||S\subseteq V \text{ and }\forall u,v\in S,uv\not\in E\}$
  * Theorem (Erdős 1959): $\forall k,\ell,\exists G,g(G)>\ell,\chi(G)>k$
  * $G(n,p)$
* Lovász Sieve
  * dependency graph: $D(V,E)$
    * $ij\in E\iff A_i$ and $A_j$ are dependent
  * Lovasz Local Lemma: $\forall i,P(A_i)\leq p,ep(d+1)\leq 1(4dp\leq 1),d$ is max degree of dependency graph, then $P(\wedge_{i=1}^n\overline{A}_i)>0$
  * General Lovasz Local Lemma: $\exists x_1,\cdots,x_n\in [0,1),\forall i, P(A_i)\leq x_i\prod_{j\sim i}(1-x_j)$, then $P(\wedge_{i=1}^n\overline{A}_i)\geq \prod_{i=1}^n(1-x_i)$
