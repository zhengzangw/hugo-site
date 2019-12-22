---
title: 10. Matching Theory
date: 2019-12-18
tags: [math, ps, notes]
weight: 11
---

## Hall Theorem

* SDR: system of Distinct Representives
  * distinct $x_1,x_2,\cdots,x_m,x_i\in S_i,i=1,2,\cdots,m$
* Hall's Theorem (marriage theorem): $S_1,S_2,\cdots,S_m$ have a SDR $\iff \forall I\subseteq\{1,2,\cdots,m\},|\bigcup_{i\in I}S_i\geq|I|$
* Hall's Theorem (graph theory form): A bipartite graph $G(U,V,E)$ has a matching of $U$ $\iff\forall S\subseteq U,|N(S)|\geq|S|$
  * $N(S)=\{v|\exists u\in S,uv\in E\}$
  * proof: induction, divide into two cases according to critical family ($|\bigcup_{i=1}^kS_i|=k$)

## Min-Max Theorems

* König-Egerváry theorem: in bipartite graph, $\min$ vertex cover = $\max$ matching
  * matchign: $M\subseteq E,\neg\exists e_1,e_2\in M$ share a vertex
  * vertex cover: $C\subseteq V,\forall e\in E$ adjacent to some $v\in C$
* König-Egerváry theorem (matrix form): For any 0-1 matrix, the maximum number of independent 1's $s$ equals the minimum number of rows and columns required to cover all the 1's $t$
  * $r\leq s$
  * $r\geq s$: Hall Thoerem
* Dilworth's theorem: $\max$ size of antichain $r$ in poset $P$ $=$ $\min$ size $s$ of smallest partition of $P$ into chains
  * chain: totally ordered set, all pairs of elements are comparable
  * antichain: all pairs of elements are incomparable
  * $r\leq s$
  * $r\geq s$: 
* Erdős-Szekeres Theorem: A sequence of more than $mn$ different real numbers must contain either an increasing subsequence of length {\displaystyle m+1}{\displaystyle m+1}, or a decreasing subsequence of length $(m+1)(n+1)$.