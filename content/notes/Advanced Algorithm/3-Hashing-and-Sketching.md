---
title: 3. Hashing and Sketching
date: 2019-01-16
weight: 3
---

## Distinct Elements

* (P)counting distinct elements
  * Input: a sequence $x_1,x_2,\cdots,x_n\in\Omega$
  * Output: an estimation of $z=|\{x_1,x_2,\cdots,x_n\}|$
* Data Stream Model: $n$ is unknown and elements is presented one at a time
* exact value of $z$: $O(n)$ space
* $(\epsilon,\delta)$-estimator $\hat Z$: $P((1-\epsilon)z\leq \hat Z\leq(1+\epsilon)z))\geq1-\delta$
  * $\epsilon$: approximation error
  * $\delta$: confidence error
* UHA(uniform hash assumption)
  * $h:[N]\rightarrow[M]$ takes $\Omega(N\log M)$ bits according to information theory
  * SUHA(Simple UHA): A uniform random function $h:[N]\rightarrow[M]$ is available and the computation of $h$ is efficient.
* Hashing Estimator
  * $h:\Omega\rightarrow[0,1]$
  * Compute $h(x_i)$: independent values in $[0,1]$
  * $Z=\frac{1}{Y}-1,Y=\min_ih(x_i))$
    * $E(\min_{1\leq i\leq n}h(x_i))=E($length of a subinterval$)=\frac{1}{z+1}$
    * drawback: $V(\min_ih(x_i))$ is too large
* Flajolet-Martin algorithm
  * $k\geq\lceil\frac{4}{\epsilon^2\delta}\rceil,\forall \epsilon,\delta<\frac{1}{2}$
  * $\overline{Y}=\frac{1}{k}\sum_{j=1}^k Y_j$
  * $Z=\frac{1}{Y}-1$
    * $E(Y)=\frac{1}{z+1}$
  * Space cost: $O(\epsilon^{-2}\log n)$ bits
* 2010: $\Theta(\epsilon^{-2}+\log n)$

## Set Membership

* sketch: lossy representation of data and tolerate a bounded error in answering queries
* (P)Set Membership
  * Data: a set of elements $x_1,\cdots,x_n\in\Omega$
  * Input: $x\in\Omega$
  * Output: $[x\in\Omega]$
  * space cost: size of data structure(in bits) $O(n\log|\Omega|)$
  * time cost
* Dictionary data structure
  * balanced tree: $O(n\log|\Omega|)$ space, $O(\log n)$ time
  * perfect hashing: $O(n\log|\Omega|)$ space, $O(1)$ time
* Bloom filter (1970)
  * $h_1,h_2,\cdots,h_k:\Omega\rightarrow [cn]$ are uniform and independent random hash function
  * Data Structure $A$ of $cn$ bits, $n=|S|$
    * initially: all $0$
    * for each $x\in S,A[h_i(x)]=1$ for $1\leq i\leq k$
  * Query: yes if $A[h_i(x)]=1,1\leq i\leq k$
    * time cost: $O(k)$
  * One-sided error
    * $x\in S$: always correct
    * $x\not\in S$:
      * $P(A(h_1(x)=0)=(1-\frac{1}{cn})^{kn}\approx e^{\frac{-k}{c}}$
      * $P=(1-e^{\frac{-k}{c}})^k$
      * $k=c\ln 2,P=(0.6185)^c$

## Frequency Estimation

* (P)Frequency Estimation
  * Data: a sequence of elements $x_1,\cdots,x_n\in\Omega$
  * Input: $x\in\Omega$
  * Output: $f_x=|\{i|x_i=x\}$|
* Additive error: $P(|\hat f_x-f_x|\leq\epsilon n)\geq 1-\delta$
  * heavy hitters: elements $x$ with $f_x>\epsilon n$
* Count-min sketch(Cormode and Muthukrishnan)
  * Data Structure: $k\times m$ integer array $\text{CMS}[k][m]$
    * initially: $\text{CMS}[k][m] = 0$
    * for each $x_i$, $\text{CMS}[j][h_j(x_i)]++$
  * Query: $\hat f_x=\min_{1\leq j\leq}\text{CMS}[j][h_j(x)]$
    * Time cost: $O(\frac{1}{\epsilon})$
  * Space cost: $O(km\log n)=O(\frac{1}{\epsilon}\log\frac{1}{\delta}\log n)$
  * Proof
    * $\text{CMS}[j][h_j(x)]\geq f_x$
    * $\mathbb{E}(\text{CMS}[j][h_j(x)])\leq f_x+\frac{n}{m}$
    * $P(|\hat f_x-f_x|\leq\epsilon n)\leq\frac{1}{\epsilon m}^k$
    * $m=\lceil\frac{e}{\epsilon}\rceil,k=\lceil\ln\frac{1}{\delta}\rceil$
