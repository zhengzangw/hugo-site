---
title: 9. Primal Dual
date: 2019-09-04
tags: [algorithm, math, notes]
weight: 9
---

find a pair of solutions to the primal and dual programs which are close to each other

* Vertex Cover
  * Find a maximal matching $M$
  * $C=\{v:uv\in M\}$
  * Weak duality: $|M|\leq\text{OPT}_{\text{VC}}$
  * $|C|\leq 2|M|\leq 2\text{OPT}$
* [Primal Dual](/Linear-Programming.md)
* Primal-Dual Schema
  * Primal IP
  * Dual LP-relax
  * $c^Tx\leq\alpha\beta\text{OPT}_\text{IP}$
* The Primal-Dual Schema
  * Write down an LP-relaxation and its dual
  * Start with a primal infeasible solution $x$ and a dual feasible solution $y$ (usually $x=0,y=0$)
  * Raise $x$ and $y$ until $x$ is feasible:
    * raise $y$ until some dual constrints gets tight $y^TA_{\cdot j}=c_j$
    * raise $x_i$ (integrally) corresponding to the tight dual constraints
  * Show the complementary slackness conditions
    * $\forall i, A_{i\cdot}x\leq\alpha b_i$ or $y_i=0$
    * $\forall j,y^TA_{\cdot j}$ or $x_j=0$
    * $c^Tx\leq\alpha b^Ty\leq\alpha\text{OPT}$
* Facility Location
  * $F$: Facilities
  * $C$: clients
  * $f: F\rightarrow[0,\infty)$
  * $c: F\times C\rightarrow [0,\infty)$
  * total cost: $\sum_{j\in C}c_{\phi(j),j}+\sum_{i\in I}f_i$
  * NP-hard
  * Metric Facility Location: triangle inequality
