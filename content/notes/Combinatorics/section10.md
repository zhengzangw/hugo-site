---
title: 10. Ramsey's Theory
date: 2019-09-04
tags: [math, ps, notes]
weight: 10
---

* $R(k,l)$ is the smallest integer satisfying: if $n\geq R(k,l),\forall$ 2-coloring $K_n$, there exists a red $K_k$ or a blue $K_l$
* Remsey Theorem (In graph theory): $R(k,l)$ is finite
  * $R(k,2)=k,R(2,l)=l$
  * $R(k,l)\leq R(k,l-1)+R(k-1,l)$
  * $R(k,l)\leq {k+l-2\choose k-1}$
* $R(k,k)\geq n=\Omega(k2^{\frac{k}{2}})$
* $R(r;k_1,k_2,\cdots,k_r)$: if $n\geq R(r;k_1,k_2,\cdots,k_r)$ for any $r$-coloring of $K_n$, there exists a monochromatic $k_i$-clique with color $i$ for some $i\in\{1,2,\cdots,r\}$
* if $n\geq R_t(r;k_1,k_2,\cdots,k_r)$ for any $r$-coloring of ${[n]\choose t}$, there exists a monochromatic ${S\choose t}$ with color $i$ and $|S|=k_i$ for some $i\in\{1,2,\cdots,r\}$
  * Erdos-Rado partition arrow: $n\rightarrow(k_1,k_2,\cdots,k_r)^t$
* Erdos-Szekeres(1935) Theorem: $\forall m\geq 3,\exists N(m)$ such that any set of $n\geq N(m)$ points in the plane, no three on a line, contains $m$ points that are the vertices of a convec $m$-gon
  * $N(m)=R_3(2;m,m)$
* Problem: Is $x\in S,S\in{[N]\choose n},x\in[N]$
  * Theorem (Yao 1981): If $N\geq 2n$, on sorted table, any search Alg requires $\Omega(\log n)$ accesses in the worst-case
  * Theorem (Yao 1981): For sufficiently large $N$, on any implicit data structure, any search Alg requires $\Omega(\log n)$ accesses in the worst-case

