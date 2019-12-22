---
title: 7. Greedy and Local Search
date: 2019-09-04
tags: [algorithm, math, notes]
weight: 7
---

## Set cover

* Set cover:
  * Input: $m$ subsets $S_1,\cdots,S_m\subseteq U$ of a universe of size $n$
  * Output: $C\subseteq\{1,2,\cdots, m\}$ such that $U=\bigcup_{i\in C}S_i$
  * frequency(x): $|\{i|x\in S_i\}$
* Hitting Set Problem:
  * Input: $n$ subsets $S_1,\cdots,S_m\subseteq U$ of a universe of size $m$
  * Output $C\subseteq U$ that $C$ intersects with every set $S_i$
  * NP-hard
* Vertex Cover Problem:
  * Input: an undirect graph $G(V,E)$
  * Output: the smallest $C\subseteq V$ such that $\forall e\in E$ is incident to at least one vertex in $C$
  * set cover with frequency $2$
  * NP-hard
* GreedyCover: approximation ration $H_n$
  * Initially $C=\emptyset$
  * while $U\not=\emptyset$ do
    * add $i$ with largest $|S_i\cap U|$ to $C$
    * $U = U\backslash S_i$
* there is no poly-time algorithm with approximation ratio better than $(1-o(1))\ln n$ assuming that $NP\neq P$ (2014)
* Primal-Dual Algorithm
  * Dual(Matching/Packing): $M\subseteq U$ that $\forall i,|S_i\cap M|\leq 1$
  * Find a maimal $M$, return $C=\{i:S_i\cap M\not=\emptyset\}$
  * $f$-approximation algorithm

## Scheduling

* completion time: $C_i=\sum_{j\text{ to }i} p_j$
* makespan: $C_{\max}=\max_jC_j$
* minimum makespan on identical parallel machines
  * Graham's $|\alpha|\beta|\gamma|$ notation for scheduling, this problem $P||C_{\max}$
  * NP-hard
  * $m=2$: partition problem, NP-hard
* Graham's List algorithm: approximation $2$
  * for $j = 1,2,\cdots,n$
    * assign job $j$ to the machine that currently has the smallest load
* Local Search
* start with an arbitrary schedule of $n$ jobs to $m$ machines
  * while (true)
    * let $\ell$ denote the job finished at last in the current schedule;
    * if there is machine $i$ such that job $\ell$ can finish earlier if transferred to machine $i$
      * job $\ell$ transfers to machine $i$
    * else break;
* Longest Processing Time: $\frac{3}{2}$
