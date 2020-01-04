---
title: 11. Matching Theory
date: 2019-12-18
weight: 11
---

## Hall Theorem

* SDR: system of Distinct Representives
  * distinct $x_1,x_2,\cdots,x_m,x_i\in S_i,i=1,2,\cdots,m$
* Hall's Theorem (marriage theorem): $S_1,S_2,\cdots,S_m$ have a SDR $\iff \forall I\subseteq\{1,2,\cdots,m\},|\bigcup_{i\in I}S_i|\geq|I|$
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

## Flow

* Flow
  * digraph: $D(V,E)$, source $s$, sink $t$
  * capacity: $c:E\rightarrow\mathbb{R}^+$
  * flow: $f:E\rightarrow\mathbb{R}^+$
  * constrain
    * capacity: $\forall(u,v)\in E,f_{uv}\leq c_{uv}$
    * conservation: $\forall u\in V\backslash\{s,t\},\sum_{(w,u)\in E}f_{wu}=\sum_{(u,v)\in E}f_{uv}$
  * value of flow: $\sum_{(s,u)\in E}f_{su}=\sum_{(v,t)\in E}f_{vt}$
* Cut
  * same input
  * $s$-$t$cut: $S\subset V,s\in S,t\notin S,\sum_{u\in S,v\notin S,(u,v)\in E}c_{uv}$
* Flow Integrality Theorem: max integral flow = max-flow if capcities are integers
* Max-Flow Min-Cut Theorem: max-flow = min-cut (Ford-Fulkerson 1956, Kotzig 1956)
* Augmenting Path: $s=u_0u_1\cdots u_k=t$
  * $f(u_iu_{i+1})<c(u_iu_{i+1})$ if $u_i\rightarrow u_{i+1}$
  * $f(u_{i+1}u_i)>0$ if $u_i\leftarrow u_{i+1}$
  * maximum flow $\iff$ no augmenting path
* Proof that max-flow = min-cut iff no augmenting path
  * Weak duality
    * $\sum_{u:(s,u)\in E}f_{su}=\sum_{u\in S,v\notin S,(u,v)\in E}f_{uv}-\sum_{u\in S,v\notin S,(u,v)\in E}f_{vu}$
    * flow $\leq \sum_{u\in S,v\notin S,(u,v)\in E}f_{uv}\leq$ cut
  * no augmenting path
    * $S=\{u|\exists \text{augmenting path from } s \text{ to} u\}$
    * $s\in S,t\notin S$
    * $\forall u\in S,v\notin S,(u,v)\in E,f_{uv}=c_{uv},f_{vu}=0$
    * flow = cut
* Menger's Theorem: undirected graph, $s$-$t$ cut $C\subset E$ that removing $C$ disconnects $s,t$
  * min $s$-$t$ cut = max # of disjoint $s$-$t$ path

## Linear Programming