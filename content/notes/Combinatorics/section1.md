---
title: 1. The Twelvefold Way
date: 2019-09-04
tags: [math, ps, notes]
weight: 1
---

* Function $f:N\rightarrow M$

| elements of $N$ | elements of $M$ | any $f$                       | 1-1($\leq 1$) | on-to($\geq 1$)    |
| --------------- | --------------- | ----------------------------- | ------------- | ------------------ |
| distinct        | distinct        | $m^n$                         | $(m)_n$       | $m!\{n,m\}$        |
| identical       | distinct        | $({m\choose n})$              | $m\choose n$  | ${m-1\choose n-1}$ |
| distinct        | identical       | $\sum_{k=1}^n\{n, k\}$        | $[n\leq m]$   | $\{n , m\}$        |
| identical       | identical       | $\sum_{k=1}^mp_k(n)=p_k(n+k)$ | $[n\leq m]$   | $p_m(n)$           |

<!--more-->

* Product Rule: finite set $|S\times T|=|S||T|$
* Sum Rule: finite Disjoint set $|S\cup T|=|S|+|T|$
* Bijection Rule: finite set $\exists\phi:S\rightarrow T$ onto and 1-1 then $|S|=|T|$
  * 1-1: $\leq$
  * onto: $\geq$
* $[m] = \{0,1,2,\cdots,m-1\}$
* $2^{[m]}=\{S|S\subseteq [n]\}$: Power set
* ${n\choose k}=|{[n]\choose k}|$
  * ${S\choose k}=\{T\subseteq S||T|=k\}$
* ${n\choose m_1,\cdots,m_k}=\frac{n!}{m_1!\cdots m_k!}$
  * number of assignments such that $i$-th bin has $a_i$ balls in it
  * number of permutations of a multiset $M$ with $|M|=n$ such that $M$ has $m$  distinct elements whose multiplicities are given by $a_1,a_2,\cdots,a_m$
* $(m)_n$: $m$ lower factorial $n = {m\choose m-n}$
* Binominal theorem: $(1+x)^n=\sum_{k=0}^n{n\choose k}x^k$
* Multinominal theorem: $(x_1+\cdots+x_k)^n=\sum_{m_1+\cdots+m_k=n}{n\choose m_1,\cdots,m_k}x_1^{m_1}\cdots x_k^{m_k}$
* $k$-composition of $n$: ${n-1\choose k-1}$
  * ordered sum of positive integers
* week $k$-composition of $n$: ${n+k-1\choose k-1}$
  * number of solutions to $x_1+x_2+\cdots+x_k\leq n$: ${n+k \choose k}$
* $k$-multisets on $S$: $({n\choose k})={n+k-1\choose n-1}={n+k-1\choose k}$
* $\{n , k\}$: $k$-partitions of an $n$-set, Stirling number rof the second kind
   * $\{n , k\}=k\{n-1 , k\}+\{n-1 , k-1\}$
* $B_n=\sum_{k=1}^n\{n, k\}$: partitions of an $n$-set, Bell number
* $p_k(n)$: Partitions of a number, a multiset $\{x_1,\cdots,x_k\}$ with $x_i\geq 1$ and $\sum_{i=1}^kx_i=n$
   * $p_k(n)=p_{k-1}(n-1)+p_k(n-k)$
   * $p_k(n)\sim\frac{n^{k-1}}{k!(k-1)!},n\rightarrow\infty$
     * ${n-1\choose k-1}\leq k!p_k(n)\leq {n+\frac{k(k-1)}{2}-1\choose k-1}$
* $p(n)=\sum_{k=1}^np_k(n)$: partition number
* Ferrers diagram(Young diagram)
   * Conjugate partition
   * The number of partitions of $n$ which have largest summand $k$ is $p_k(n)$
   * $p_k(n)=\sum_{j=1}^kp_j(n-k)$