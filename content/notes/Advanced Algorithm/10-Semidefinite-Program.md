---
title: 10. Semidefinite Programs
date: 2019-09-04
weight: 10
---

## A Wishlist for Optimization Algorithms

* Nonlinear, non-convex objectives
* Powerful enough to tackle hard problems in a systematic way, and meanwhile is still practical
* Becoming more accurate as we're paying more
* A generic framework that can be applied obviously to various problems.
* Methods
  * sum-of-squares (SoS) SDP
  * Lasserre hierarchy
  * Lovász-Schrijver hierarchy


## Semidefinite Program

* $A≽0$: symmetric matrix $A\in\mathbb{R}^{n\times n}$ is positive semidefinite ($\forall x\in\mathbb{R}^n,x^TAx\geq0$)
* $A≽0\iff\forall\lambda(A)\geq 0\iff\exists B\in\mathbb{R}^{n\times n},A=B^TB$
* Semidefinite Programing(SDP): $C,A_1,\cdots,A_k\in\mathbb{R}^{n\times n},b_1,b_2,\cdots,b_k\in\mathbb{R}$

$$
\begin{aligned}
\max\ & \text{tr}(C^TY)=\sum_{i=1}^n\sum_{i=1}^nc_{ij}y_{ij}\\
\text{s.t. } & \text{tr}(A^T_rY)\leq b_r & \forall 1\leq r\leq k\\
&Y≽0\\
&Y=Y^T\in\mathbb{R}^{n\times n}
\end{aligned}
$$

* SDP (vector program form, LP for inner products)

$$
\begin{aligned}
\max & \sum_{i=1}^n\sum_{i=1}^nc_{ij}\langle v_i,v_j\rangle\\
\text{s.t.} & \sum_{i=1}^n\sum_{j=1}^na_{ij}^{(r)}\langle v_i,v_j\rangle\leq b_r & \forall 1\leq r\leq k\\
&v_1,\cdots,v_n\in\mathbb{R}^n
\end{aligned}
$$

* LP $\subset$ SDP $\subset$ convex programs
* ellipsoid method: find $\text{OPT}\pm\epsilon$ in time $\text{poly}(n,\frac{1}{\epsilon})$
* SDP-Relaxation
  * Present the original quadratic program
  * SDP relaxation: $x_ux_v\rightarrow\langle \mathbf{x}_v,\mathbf{x}_u\rangle$
  * Solve SDP relaxtion
  * Round optimal solution $x^*_v$ to $\hat x_v$

## Max-Cut

* Some Algorithm
  * Greedy: $\frac{1}{2}$-approximate
  * Random: $\frac{1}{2}$-approximate
  * Local Search: $\frac{1}{2}$-approximate
* LP for Max-Cut

$$
\begin{aligned}
\max & \sum_{uv\in E}y_{uv}\\
\text{s.t. } & y_{uv}\leq |x_u-x_v| &\forall uv\in E\\
& x_v\in\{0,1\} & \forall v\in V
\end{aligned}
$$

* Linearization: Integrality gap $>2$

$$
\begin{aligned}
\max & \sum_{uv\in E}y_{uv}\\
\text{s.t. } & y_{uv}\leq y_{uw}+y_{wv} &\forall u,v,w\in V\\
& y_{uv}+y_{uw}+y_{wv}\leq 2 &\forall u,v,w\in V\\
& y_{uv}\in\{0,1\},\forall u,v\in V
\end{aligned}
$$

* Quadratic Program

$$
\begin{aligned}
\max & \sum_{uv\in E}y_{uv}\\
\text{s.t. } & y_{uv}\leq \frac{1}{2}(1-x_ux_v) &\forall uv\in E\\
& x_v\in\{-1,1\} &\forall v\in V
\end{aligned}
$$

* Strictly Quadratic Program (nonlinear,non-convex)

$$
\begin{aligned}
\max & \sum_{uv\in E}\frac{1}{2}(1-x_ux_v)\\
\text{s.t. } & x_v^2=1 &\forall v\in V
\end{aligned}
$$

* Relax to vector program

$$
\begin{aligned}
\max & \sum_{uv\in E}\frac{1}{2}(1-\langle x_u,x_v\rangle)\\
\text{s.t. } & \|x_v\|^2=1 &\forall v\in V\\
& x_v\in\mathbb{R}^{|V|}
\end{aligned}
$$

* Rounding: $\hat x_v=\text{sgn}(\langle x_v^*,u\rangle),u\in\mathbb{R}^n,\|u\|_2=1$ is uniform random unit vector
  * Generate $u$: $u=\frac{r}{\|r\|_2},r=(r_1,\cdots,r_n)\in\mathbb{R}^n,r_i\sim N(0,1)$ i.i.d
  * $E(\text{cut})=\sum_{uv\in E}{\frac{\theta_{uv}}{\pi}}=\sum_{uv\in E}\frac{\arccos\langle x_u^*,x_v^*\rangle}{\pi}\geq\alpha\sum_{uv\in E}\frac{1}{2}(1-\langle x_u^*,x_v^*\rangle),\geq\alpha\text{OPT}_{\text{IP}}\geq\alpha\text{OPT}$
  * Assuming the unique games conjecture: no poly-time algorithm with approx. ratio $<\alpha=\inf_{x\in[-1,1]}\frac{2\arccos(x)}{\pi(1-x)}=0.87856\cdots$

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
