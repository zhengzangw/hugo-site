---
title: 3. Hashing and Sketching
date: 2019-01-16
tags: [ps, math, notes]
weight: 3
---

$A$ with high probility = w.h.p = $P(A)>1-O(\frac{1}{n})$

## Count Distinct Elements

* Input: a sequence $x_1,x_2,\cdots,x_n\in\Omega$
* Output: an estimation of $z=|\{x_1,x_2,\cdots,x_n\}|$
* straight-forward: $O(n)$ space
* $(\epsilon,\delta)$-estimator $Z$: $P((1-\epsilon)z\leq Z\leq(1+\epsilon)z))\geq1-\delta$
  * $\epsilon$: approximation error
  * $\delta$: confidence error

### Hashing

* $h:\Omega\rightarrow[0,1]$
* $h(x_1),\cdots,h(x_n)$: $z$ uniform independent values in $[0,1]$
  * partition $[0,1]$ into $z+1$ subintervals
  * $E(\min_{1\leq i\leq n}h(x_i))=E($length of a subinterval$)=\frac{1}{z+1}$
* $Z=\frac{1}{\min_ih(x_i))}-1$: $V(\min_ih(x_i))$ is too large
* data stream model: space $O(1)$

### Flajolet-Martin algorithm

* Markov's Inequality: $P(X\geq t)\leq\frac{E(x)}{t}$
* Chebyshev's Inequality: $P(|X-E(X)|\geq t)\leq\frac{V(X)}{t^2}$
* $\overline{Y}=\frac{1}{k}\sum_{j=1}^k Y_j$
  * $Y_j'=\min_{1\leq i\leq n}h_j(x_i)$
* Flajolet-Martin estimator: $Z=\frac{1}{Y}-1$
  * $E(Y)=\frac{1}{z+1}$
* $\forall \epsilon,\delta<\frac{1}{2}$, if $k\geq\lceil\frac{4}{\epsilon^2\delta}\rceil$ then output $Z$ is an $(\epsilon, \delta)$ estimator of the correct answer $z$
  * $O(\epsilon^{-2}\log n)$ bits
* 2010: $\Theta(\epsilon^{-2}+\log n)$
* UHA(uniform hash assumption): A uniform random function $h:[N]\rightarrow[M]$ is available and the computation of $h$ is efficient.

## Set Memship

* Data: a set of elements $x_1,\cdots,x_n\in\Omega$
* Input: $x\in\Omega$
* Output: $[x\in\Omega]$
* space cost: size of data structure(in bits)
  * entropy of a set: $O(n\log|\Omega|)$
* time cost
  * balanced tree: $O(n\log|\Omega|)$ space, $O(\log n)$ time
  * perfect hashing: $O(n\log|\Omega|)$ space, $O(1)$ time
* Bloom filter (1970)
  * $h_1,h_2,\cdots,h_k:\Omega\rightarrow [m]$ are uniform and independent random hash function
  * Data Structure $m$ bit vector $v\in\{0,1\}^m$
    * initially: all $0$
    * for each $x\in S,A[h_i(x)]=1$ for $1\leq i\leq k$
  * Query: yes if $A[h_i(x)]=1,1\leq i\leq k$
    * time cost: $O(k)$
    * $x\in S$: always correct
    * $x\not\in S$:
      * $P(A(h_1(x)=0)=(1-\frac{1}{m})^{kn}\approx e^{\frac{-kn}{m}}$
      * $P=(1-e^{\frac{-kn}{m}})^k$ 非单调，$k=\frac{n}{m}\ln 2,(0.6185)^\frac{n}{m}$
* sketch: lossy representation of data and tolerate a bounded error in answering queries

## Frequency Estimation

* Data: a sequence of elements $x_1,\cdots,x_n\in\Omega$
* Input: $x\in\Omega$
* Output: $f_x=|\{i|x_i=x\}$|
* Additive error: $P(|\hat f_x-f_x|\leq\epsilon n)\geq 1-\delta$
* heavy hitters: elements $x$ with $f_x>\epsilon n$
* Count-min sketch
  * Data Structure: $k\times m$ integer array $\text{CMS}[k][m]$
    * initially: $\text{CMS}[k][m] = 0$
    * for each $x_i$, $\text{CMS}[j][h_j(x_i)]++$
  * Query: $\hat f_x=\min_{1\leq j\leq}\text{CMS}[j][h_j(x)]$
    * $\text{CMS}[j][h_j(x)]\geq f_x$
    * $\mathbb{E}(\text{CMS}[j][h_j(x)])=f_x+\frac{n}{m}$
    * $P\leq\frac{1}{\epsilon m}^k$
    * $=\lceil\frac{e}{\epsilon}\rceil,k=\lceil\ln\frac{1}{\delta}\rceil$
