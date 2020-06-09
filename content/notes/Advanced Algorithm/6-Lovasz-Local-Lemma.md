---
title: 11. Lovász Local Lemma
date: 2019-09-04
weight: 11
---

## Unique Games Conjecture

* Unique Label Cover(ULC): An undirected graph $G(V,E)$, $q$ colors, each dege $e$ associated with a bijection $\phi_e:[q]\rightarrow[q]$. A coloring $\sigma\in[q]^V$ satisfies the constraint of the edge $e=(u,v)\in E$ if $\phi_{e}(\sigma_u)=\phi_e(\sigma_v)$
* UGC(2002 Khot): $\forall e,\exists q$ such that this is $\text{NP}$-hard to ditinguish between ULC instances:
  * $>1-\epsilon$ fraction of edges satisfied by a coloring;
  * no more than $\epsilon$ fraction of edges satisfied by any coloring

## Constraint Satisfaction Problem

* CSP Definition
  * variables: $V=\{v_1,v_2,\cdots,v_n\},v_i\in\Omega$
  * constraints: $C_1,C_2,\cdots,C_m,C_i:\Omega^{S_i}\rightarrow\{T,F\},S_i\subset X$
  * assignment: $\sigma\in[q]^V$
  * $\mu(\sigma)=\prod_{i=1}^mC_i(\sigma_{S_i})/Z$
* CSP
  * satisfiability: determine whether $\exists$ an assignment satisfying all constraints
    * search: find an assignment
  * optimization: find an assignment satisfying as may constraints as possible
    * refutation: find a proof of no assignment can satisfy $>m^*$ constraints for $m^*$ as small as possible
  * counting: estimate the number of satisfying assignments
    * sampling: random sample a satisfying assignments
    * inference: calculate the possibility of a variable being assigned certain value

| CSP             | Satisfiability | Optimization | Counting    |
| --------------- | -------------- | ------------ | ----------- |
| 2SAT            | P              | NP-hard      | #P-complete |
| 3SAT            | NP-complete    | NP-hard      | #P-complete |
| matching        | P              | P            | #P          |
| 2-coloring(cut) | P              | NP-hard      | FP          |
| 3-coloring      | NP-complete    | NP-hard      | #P-complete |

* Poly-time inter-reducible
  * appox. counting
  * sampling
  * approx. inference
* Random Sampling
  * Uniform independent set in graphs of max-degree $\Delta$: (poly-time when $\Delta$≤5, NP-hard when $\Delta$≥6 or higher
  * Uniform matching in any graph (always poly-time)
  * Uniform proper$q$-coloring of graphs of max-dgree $\Delta$: NP-hard when $q<\Delta$
* $k$-SAT
  * $\Omega=\{T,F\}$, constraints are clauses
  * $k$-CNF: each clause contains $k$ variables
  * Determine satisfiability
  * degree $d$: each clause intersects with $\leq d$ other clauses

## Lovász Local Lemma

* Goal: $P(\bigwedge_{i=1}^m\overline{A}_i)>0$, $m$ bad event $A_1,\cdots,A_m$
  * union bound: $\sum_{i=1}^mP(A_i)<1$
  * PIE: $\sum_{I\subseteq\{m\},|I|>0}(-1)^{|I|-1}P(\bigwedge_{i\in S}A_i)<1$
  * LLL: $\forall i,P(A_i)\leq\frac{1}{4d}$ and $A_i$ is independent of all but $\leq d$ other bad events
* LLL for $k$-SAT: $d\leq 2^{k-2}\Rightarrow\phi$ is always satisfiable
* LLL (asymmetric version): $\exists \alpha_1,\alpha_2,\cdots,\alpha_m\in[0,1)$

$$\forall i:P(A_i)\leq\alpha_i\prod_{j\sim i}(1-\alpha_j)\Rightarrow P(\wedge_{i=1}^m\overline{A}_i)>\prod_{i=1}^m(1-\alpha_i)$$

## Algorithmic LLL

### Moser's Algorithm

* Algorithmic LLL for $k$-SAT(Moser 2009): $d\leq 2^{k-c}\Rightarrow$ satisfying assignment can be found in time $O(n+km)$ w.h.p.
* Algorithm
  * Solve($\phi$)
    * sample a uniform random assignment
    * while $\exists$ unsatisfied clause $C$: Fix($C$)
  * Fix($C$)
    * resample variables in $C$ uniformly at random
    * while $\exists$ unsatisfied clause $D$ intersecting $C$: Fix($D$)
* Analysis
  * $T$: total # of calls to Fix($C$)
  * \# of random bits: $n+kT$
    * $n$: intial bits
    * $kT$: each calls resampling uses $k$ bits
  * transcript($\leq m+T(\log_2 d+O(1))$ bits) + $n$ bits
    * $n$: final bits
    * $m$: Fix calls order in Solve
    * $T(\log_2 d+O(1))$: recursive calls order
  * 1-1 mapping between above: $n+kT-\log_2 n\leq m+T(\log_2d+O(1))+n\Rightarrow T\leq m+\log_2n$
  * $O(n+k(m+\log n))=O(n+km)$
* Incompressibility Theorem(Kolmogorov): $N$ uniform random bits cannot be encoded to less than $N-l$ bits with probability at least $1-O(2^{-l})$

### Moser-Tardos Algorithm

* Suppose $A_1,\cdots,A_m$ are determined by mutually independent random variables $X_1,\cdots,X_n$, then LLL conditions $\Rightarrow\exists$ an assignment of $X_1,\cdots,X_n$ avoiding all bad events $A_1,\cdots,A_m$
  * $\text{vbl}(A_i)$: set of variables on which $A_i$ is defined
  * $\Gamma(A_i)=\{A_j|j\neq i\wedge\text{vbl}(A_i)\cap\text{vbl}(A_j)\neq\emptyset\}$
* Assumption: followings can be done efficiently
  * draw an independent sample on a random variable $X_j$
  * check whether a bad event $A_i$ occurs on current $X_1,\cdots,X_n$
* Moser-Tardos Algorithm
  * sample all $X_1,\cdots,X_n$
  * while $\exists$ an occurring bad event $A_i$
    * resample all $X_j\in\text{vbl}(A_i)$
* Algorithmic LLL(Moser-Tardos 2010): $\exists\alpha_1,\alpha_2,\cdots,\alpha_m\in[0,1)$

$$\forall i,P(A_i)\leq\alpha_i\prod_{j\sim i}(1-\alpha_j)\Rightarrow E[\text{resamples until a satisfying assignment is returned}]\leq \sum_{i=1}^m\frac{\alpha_i}{1-\alpha}$$

$$\forall i,P(A_i)\leq\frac{1}{e(d+1)}\Rightarrow E[\text{resamples until a satisfying assignment is returned}]\leq \frac{m}{d}$$

$$\forall i,P(A_i)\leq\frac{1}{4d}\Rightarrow E[\text{resamples until a satisfying assignment is returned}]\leq \frac{m}{2d-1}$$

* Ananlysis
  * execution log $\Lambda$: $\Lambda_i\in\mathcal{A}$
  * total # of times $A$ is resampled: $N_A=|\{i|\Gamma_i=A\}|$
