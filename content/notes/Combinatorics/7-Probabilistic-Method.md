---
title: 7. Probabilistic Method
date: 2019-09-04
weight: 7
---

## Existence by Probability

$$\exists x,A(x)\Leftarrow P(A(x))>0$$

$$\exists x,A(x)\Leftarrow P(\neg A(x))<1$$

$$P(A)=P(\wedge_{i=1}^n\overline{A}_i)>0\Leftarrow P(\vee_{i=1}^nA_i)<1\Leftarrow \sum_{i=1}^nP(A_i)$$

### Lower Bound for Ramsey's Number
  
* $R(k,k),\forall$ two coloring of $K_n,n>R(k,k),\exists$ a monochromactic $K_k$
* Erdős Theorem(1947): ${n\choose k}2^{1-C_k^2}<1$ then it is possible to color the edges of $K_n$ with two colors so that there is no monochromatic $K_k$ subgraph

### Paradoxical Tournament
  
* orientation of the edges of the complete graph on set of vertices $V$
* $k$-paradoxical: $\forall V, |V|=k,\exists v$ beats them all
* Theorem (Erdős 1963): if ${n\choose k}(1-2^{-k})^{n-k}<1$, there is a tournament on $n$ vertices that is $k$-paradoxical

## The Averaging principle

$$\exists x,A(x)\geq t\Leftarrow E(x)\geq t$$

### Hamilton Path in Tournament

* Theorem (Szele 1943): There is a tournament on $n$ players with at least $n!2^{-(n-1)}$ Hamiltonian paths

### Independent sets


* independent set: a set of vertices with no edges between them
* Theorem: $G$ has an independent set with at least $\frac{n^2}{4m}$ vertices

### Coloring large-girth graphs

* $G(n,p)$: graph of $n$ vertices and each edge occurs at probability $p$
* girth: $g(G)$ is the length of the shortest cycle in $G$
* $\chi(G)=\min(C\in\mathbb{N}|\exists :V\rightarrow [C],\forall uv\in E,f(u)\neq f(v))$
* Independent number: $\alpha(G)=\max\{|S||S\subseteq V \text{ and }\forall u,v\in S,uv\not\in E\}$
* Lemma: $\chi(G)\geq\frac{n}{\alpha(G)}$
* Theorem (Erdős 1959): $\forall k,\ell,\exists G,g(G)>\ell,\chi(G)>k$

## Lovász Local Lemma

Consider a set of "bad" events $A_1,A_2,\cdots,A_n$, suppose $P(A_i)\leq p,1\leq i\leq n$

* Mutually independent events: $P(\wedge_{i=1}^n\overline{A_i})\geq(1-p)^n$
* Arbirarily dependent events: $P(\wedge_{i=1}^n\overline{A_i})=1-P(\vee_{i=1}^n)\geq 1-np$
* dependency graph: $D(V,E)$
    * $ij\in E\iff A_i$ and $A_j$ are dependent
    * $d=\max\{\deg(i)\}$
* Lovasz Local Lemma
  * $\forall i,P(A_i)\leq p$
  * $ep(d+1)\leq 1$ or $4dp\leq 1$
  * Then $P(\wedge_{i=1}^n\overline{A}_i)>0$
* General Lovasz Local Lemma
  * $\exists x_1,\cdots,x_n\in [0,1),\forall i, P(A_i)\leq x_i\prod_{(j,i)\in E}(1-x_j)$
  * Then $P(\wedge_{i=1}^n\overline{A}_i)\geq \prod_{i=1}^n(1-x_i)$
