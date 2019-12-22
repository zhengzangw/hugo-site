---
title: 6. Existence
date: 2019-09-04
tags: [math, ps, notes]
weight: 6
---

* Shannon 1949: There is a boolean function $f:\{0,1\}^n\rightarrow\{0,1\}$ which cannot be computed by any circuit with $\frac{2^n}{3n}$ gates
  * $f$ computable by $t$ gates: $2^{2^n}$
  * circuits with $t$ gates: $<2^t(2n+t+1)^{2t}$
* Double Counting
  * Handshaking Lemma: $\sum_{v\in V}d(v)=2|E|$
  * Sperner's Lemma(1928): For any properly colored trangulation, there existst a cell receiving all three colors
    * trangulation: a decompostion of $abc$ to small triangles(cells) such that any two different cells are either disjoint or share and edge of vertex
    * proper coloring: color with 3 color that
      * $a,b,c$ has different color
      * The vertices in each of the three lines $ab,bc,ac$ receive two colors
  * Brouwer's fixed point theorem (1911)
    * $\forall$ continous function $f:B\rightarrow B$ of an $n$-dimensional ball, $\exists$ a fixed point $x=f(x)$
* Pigeonhole Principle (Schubfachprinzip)
  * Dirichlet's approximation: $x$ is an irrational number, $\forall n\in\mathbb{N},\exists\frac{p}{q},1\leq q\leq n$ and $|x-\frac{p}{q}|<\frac{1}{nq}$
