---
title: 11. Lovász Local Lemma
date: 2019-09-04
tags: [algorithm, math, notes]
weight: 11
---

* Constraint Satisfaction Problem(CSP)
  * variables: $x_1,x_2,\cdots,x_n\in\Omega$
  * constraints: $C_1,C_2,\cdots,C_m,C_i:\Omega^{S_i}\rightarrow\{T,F\},S_i\subset X$
  * satisfiability: determine whether $\exists$ an assignment satisfying all constraints
    * search
  * optimization: find an assignment satisfying as may constraints as possible
    * refutation: find a proof of no assignment can satisfy $>m^*$ constraints for $m^*$ as small as possible
  * counting: estimate the number of satisfying assignments
    * sampling: random sample a satisfying assignments
    * inference: calculate the possibility of a variable being assigned certain value
* $k$-SAT
  * degree $d$: each clause intersects with $\leq d$ other clauses
* Lovasz Local Lemma(1997)
  * $m$ bad event: $A_1,A_2,\cdots,A_m$
  * $A_i$ is independent of all but $\leq d$ other events
  * $\forall i,P(A_i)\leq\frac{1}{e(d+1)},P(\wedge_{i=1}^m\overline{A}_i)>0$
  * $\forall i,P(A_i)\leq\frac{1}{4d},P(\wedge_{i=1}^m\overline{A}_i)>0$
  * $\exists\alpha_1,\alpha_2,\cdots,\alpha_m\in[0,1),\forall i,P(A_i)\leq\alpha_i\prod_{j\sim i}(1-\alpha_j),P(\wedge_{i=1}^m\overline{A}_i)>\prod_{i=1}^m(1-\alpha_i)$
  *  for $k$-SAT: $d\leq 2^{k-2}\Rightarrow\phi$ is always satisfiable

## Algorithmic LLL 

### Moser's Algorithm

for $k$-SAT(Moser 2009): $d\leq 2^{k-2}\Rightarrow$ satisfying assignment can be found in time $O(n+km)$ w.h.p.

* Algorithm
  * Solve: sample a uniform random assignment, while $\exists$ unsatisfied clause $C$ Fix($C$)
  * Fix($C$): resample variables in $C$ uniformly at random, while $\exists$ unsatisfied clause $D$ intersecting $C$: Fix($D$)
* $T$: total # of calls to Fix($C$)
* \# of random bits: $n+kT$
* transcript: $\leq m+T(\log_2 d+O(1))$ bits
* Incompressibility Theorem(Kolmogorov): $N$ uniform random bits cannot be encoded to less than $N-l$ bits with probability at least $1-O(2^{-l})$

### Moser-Tardos Algorithm

(Moser-Tardos 2010): $\exists\alpha_1,\alpha_2,\cdots,\alpha_m\in[0,1),\forall i,P(A_i)\leq\alpha_i\prod_{j\sim i}(1-\alpha_j)\Rightarrow$ a satisfying assignment is returned with $\sum_{i=1}^m\frac{\alpha_i}{1-\alpha}$ resamples in expectation

* $\text{vbl}(A_i)$: set of variables on which $A_i$ is defined
* $\Gamma(A_i)=\{A_j|j\neq i\wedge\text{vbl}(A_i)\cap\text{vbl}(A_j)\neq\emptyset\}$
* execution log $\Gamma$
* $N_A=|\{i|\Gamma_i=A\}|$
* $\forall i,P(A_i)\leq\frac{1}{e(d+1)}\Rightarrow$ a satisfying assignment is returned within $\frac{m}{d}$ resamples in expectation
* $\forall i,P(A_i)\leq\frac{1}{4d}\Rightarrow$ a satisfying assignment is returned within $\frac{m}{2d-1}$ resamples in expectation
* Algorithm
  * sample all $X_1,\cdots,X_n$
  * while $\exists$ an occurring bad event $A_i$: resample all $X_j\in\text{vbl}(A_i)$
