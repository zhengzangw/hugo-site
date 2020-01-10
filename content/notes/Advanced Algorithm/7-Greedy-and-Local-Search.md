---
title: 7. Greedy and Local Search
date: 2019-09-04
weight: 7
---

## Set cover

* (P)Set Cover:
  * Input: $m$ subsets $S_1,\cdots,S_m\subseteq U$ of a universe of size $n$
  * Output: $C\subseteq\{1,2,\cdots, m\}$ such that $U=\bigcup_{i\in C}S_i$
  * $\text{freq}(x)=|\{i|x\in S_i\}|$
* (P)Hitting Set Problem:
  * Input: $n$ subsets $S_1,\cdots,S_m\subseteq U$ of a universe of size $m$
  * Output $C\subseteq U$ that $C$ intersects with every set $S_i$
  * $\text{freq}(x)=|S_i|$
  * NP-hard, equivalent to Set Cover
* (P)Vertex Cover Problem:
  * Input: an undirect graph $G(V,E)$
  * Output: the smallest $C\subseteq V$ such that $\forall e\in E$ is incident to at least one vertex in $C$
  * set cover with frequency $2$
  * NP-hard
* There is no poly-time algorithm with approximation ratio better than $(1-o(1))\ln n$ assuming that $NP\neq P$ (2014)

### Greedy Algorithm

* Algorithm
  * Initially $C=\emptyset$
  * while $U\not=\emptyset$ do
    * $C=C\cup\argmax_i|S_i\cap U|$
    * $U = U\backslash S_i$
* approximation ration $H_n\approx\ln n$
* Vertex cover problem
  * $2$-approximation
  * (2008) no poly-time algorithm with approximation ratio $2-\epsilon$ assuming UGC

### Primal-Dual Algorithm

* (Dual Problem) Matching: $M\subseteq U$ that $\forall i,|S_i\cap M|\leq 1$
* Find a maimal $M$, return $C=\{i:S_i\cap M\not=\emptyset\}$
* $\max\text{freq}(x)$-approximation algorithm

## Scheduling

* (P)Minimum Makespan on Identical Parallel Machine
  * Input: $n$ positive integers $p_1,p_2,\cdots,p_n$ nad a positive integer $m$
  * Output: an assignment $\sigma:[n]\rightarrow[m]$ which minimizes $C_{\max}=\max_{i\in [m]}\sum_{j:i=\sigma(j)}p_j$
  * NP-hard
* Partition Problem
  * Input: $S=\{x_1,\cdots,x_n\}$
  * Output: Whether there is a partition of $S$ into $A$ and $B$ such that $\sum_{x\in A}x=\sum_{x\in B}x$
  * NP-hard
* competitive ratio: $\forall$ input sequence $I$, $\text{SOL}_I\leq\alpha\text{OPT}_I$

### Graham's List algorithm

* List Algorithm
  * for $j = 1,2,\cdots,n$: assign job $j$ to the machine that currently has the smallest load
* approximation $2-\frac{1}{m}$

### Local Search

* start with a feasible solution, improve at each step by modifying locally
* start with an arbitrary schedule of $n$ jobs to $m$ machines
  * while (true)
    * let $\ell$ denote the job finished at last in the current schedule;
    * if there is machine $i$ such that job $\ell$ can finish earlier if transferred to machine $i$
      * job $\ell$ transfers to machine $i$
    * else break;
* Approximation ratio: $(2-\frac{1}{m})$

### Longest Processing Time (LPT)

* Algorithm
  * sort $p_i$ in non-increasing order
  * assign job $j$ to the machine currently has the smallest load
* Approximation: $\frac{3}{2}$