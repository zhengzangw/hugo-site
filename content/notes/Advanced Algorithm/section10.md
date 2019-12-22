---
title: 10. Semidefinite Programs
date: 2019-09-04
tags: [algorithm, math, notes]
weight: 10
---

* LP for Max-Cut 

$$
\begin{aligned}
\max & \sum_{uv\in E}y_{uv}\\
\text{s.t.} & y_{uv}\leq y_{uw}+y_{wv} &\forall u,v,w\in V\\
& y_{uv}+y_{uw}+y_{wv}\leq 2 &\forall u,v,w\in V\\
& y_{uv}\in\{0,1\},\forall u,v\in V
\end{aligned}
$$

$$
\begin{aligned}
\max & \sum_{uv\in E}y_{uv}\\
\text{s.t.} & y_{uv}\leq |x_u-x_v| &\forall uv\in E\\
& x_v\in\{0,1\} & \forall v\in V
\end{aligned}
$$

* quadratic program

$$
\begin{aligned}
\max & \sum_{uv\in E}y_{uv}\\
\text{s.t.} & y_{uv}\leq \frac{1}{2}(1-x_ux_v) &\forall uv\in E\\
& x_v\in\{-1,1\} &\forall v\in V
\end{aligned}
$$

* strictly quadratic program (Nonlinear,non-convex)

$$
\begin{aligned}
\max & \sum_{uv\in E}\frac{1}{2}(1-x_ux_v)\\
\text{s.t.} & x_v^2=1 &\forall v\in V
\end{aligned}
$$

* relex to vector program: semidefinite program (SDP)
* rounding: uniform random unit vector $u\in\mathbb{R}^n,\|u\|_2=1,\hat x_v=\text{sgn}(\langle x_v^*,u\rangle)$
  * uniform random unit vector: $r=(r_1,\cdots,r_n)\in\mathbb{R}^n,r_i\sim N(0,1)$ i.i.d and normalize
  * $E(\text{cut})=\sum_{uv\in E}{\frac{\theta_{uv}}{\pi}}=\sum_{uv\in E}\frac{\arccos\langle x_u^*,x_v^*\rangle}{\pi}\geq\alpha\sum_{uv\in E}\frac{1}(1-\rangle x_u^*,x_v^*\rangle),\alpha=\inf_{x\in[-1,1]}\frac{2\arccos(x)}{\pi(1-x)}=0.87856\cdots\geq\alpha\text{OPT}$
  * Assuming the unique games conjecture: no poly-time algorithm with approx. ration $<\alpha$

$$
\begin{aligned}
\max & \sum_{uv\in E}\frac{1}{2}(1-\langle x_u,x_v\rangle)\\
\text{s.t.} & \langle x_v,x_v\rangle=1 &\forall v\in V\\
& x_v\in\mathbb{R}^n &\forall v\in V,n=|V|
\end{aligned}
$$

* Positive Semidefiniteness: $A\succeq 0$
  * $\forall x\in\mathbb{R}^n,x^TAx\geq 0$
  * $\lambda(A)\geq 0$
  * $\exists B\in\mathbb{R}^{n\times n},A=B^TB$
* SDP
  * $C,A_1,\cdots,A_k\in\mathbb{R}^{n\times n},b_1,b_2,\cdots,b_k\in\mathbb{R}$

$$
\begin{aligned}
\max & tr(C^TY)=\sum_{i=1}^n\sum_{i=1}^nc_{ij}y_{ij}\\
\text{s.t.} & tr(A^T_rY)\leq b_r & \forall 1\leq r\leq k\\
&Y\succeq 0\\
&Y=Y^T\in\mathbb{R}^{n\times n}
\end{aligned}
$$

* vector program (Variant of SDP)

$$
\begin{aligned}
\max & \sum_{i=1}^n\sum_{i=1}^nc_{ij}\langle v_i,v_j\rangle\\
\text{s.t.} & \sum_{i=1}^n\sum_{j=1}^na_{ij}^{(r)}\langle v_i,v_j\rangle\leq b_r & \forall 1\leq r\leq k\\
&v_1,\cdots,v_n\in\mathbb{R}^n
\end{aligned}
$$

* Unique Games Conjecture
  * Unique Label Cover(ULC): An undirected graph $G(V,E)$, $q$ colors, each dege $e$ associated with a bijection $\phi_e:[q]\rightarrow[q]$. A coloring $\sigma\in[q]^V$ satisfies the constraint of the edge $e=(u,v)\in E$ if $\phi_{e}(\sigma_u)=\phi_e(\sigma_v)$
  * UGC(2002 Khot): $\forall e,\exists q$ such that this is NP-hard to ditinguish between ULC instances:
    * $>1-\epsilon$ fraction of edges satisfied by a coloring;
    * no more than $\epsilon$ fraction of edges satisfied by any coloring
* A Wishlist for Optimization Algorithms
  * Nonlinear, non-convex objectives
  * Powerful enough to tackle hard problems in a systematic way, and meanwhile is still practical
  * Becoming more accurate as we're paying more
  * A generic framework that can be applied obviously to various problems.
* Methods
  * sum-of-squares (SoS) SDP
  * Lasserre hierarchy
  * Lovász-Schrijver hierarchy

## SoS

* Given a $n$-variate polynomial $f$, determine whether $f(x)\geq 0$ for all $x\in\{0,1\}^n$
  * NP-hard
* multilinear: $f(x)=\sum_{d=(d_1,\cdots,d_n)\in\{0,1\}^n}x_1^{d_1}\cdots x_n^{d_n}$
* Given a $n$-variate polynomial $f$, find
  * either an $x\in\{0,1\}^n$ such that $f(x)<0$
  * or a "proof" of $f(x)\geq 0$ over all $x\in\{0,1\}^n$
    * SoS proof: $f(x)=\sum_{i=1}^rg_1(x)^2$
    * For nonnegatvie polynomial
      * $f:\{0,1\}^n\rightarrow\mathbb{R}$, degree-$2n$ SoS proof always exists
      * degree-$d$ SoS proof needs at most $r=n^{O(d)}$ length
      * if $f$ has degree=$d$ SoS proff, then it can be found in $n^{O(d)}$ time (by SDP)
