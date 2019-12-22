---
title: 6. Dimension Reduction
date: 2019-09-04
tags: [algorithm, math, notes]
weight: 6
---

## Metric Embedding

* embedding: $\phi:X\rightarrow Y$ on two metric space $(X,d_X),(Y,d_Y)$
  * low-distortion $\alpha\geq 1$: $\forall x,y\in X,\frac{1}{\alpha}d(x,y)\leq d(\phi(x),\phi(y))\leq\alpha d(x,y)$
  * Dimension Reduction: $x_1,\cdots,x_n\in\mathbb{R}^d,y_1,\cdots,y_n\in\mathbb{R}^k$
* Johnson-Lindenstrauss Theorem(1984):
  * $\forall0<\epsilon <1,\forall S\subset \mathbb{R}^{d},|S|=n,\exists k=O(\epsilon ^{-2}\log n),\phi :\mathbb{R} ^{d}\rightarrow \mathbb{R}^{k}$ such that $\forall x,y\in S,(1-\epsilon )\|x-y\|^{2}\leq \|\phi (x)-\phi (y)\|^{2}\leq (1+\epsilon )\|x-y\|^{2}$
  * (linear embedding): $\phi(x)=Ax$
  * (2016) Lower Bound: $\Omega(\epsilon^{-2}\log n)$
* Contruction
  * projection onto uniform random $k$-dimensional subspace of $\mathbb{R}^d$ (1999)
  * random matrix with i.i.d. $\pm 1$ (2003)
  * random matrix with i.i.d. Gaussian entries (1998): $A\in\mathbb{R}^{k\times d}$ is drawn from the Gaussian distribution $\mathcal{N}(0,\frac{1}{k})$
    * To prove: $P(|\| Au\|^2_2-1|>\epsilon)<\frac{1}{n^3}$
    * $\lVert Au\rVert^2=\sum_{i=1}^kY_i^2,Y_i\sim\mathcal{N}(0,\frac{1}{k})$
    * Chernoff bound for $\chi^2$-distribution

## Nearest Neighbor Search(NNS)

* NNS: $y_1,\cdots,y_n,x\in X$, find $y_i$ closest to $x$
  * $d$ is small
    * k-d tree
    * Voronoi diagram
  * Curse of dimensionality: It is conjectured that NNS in high dimension requires either super-polynomial(n) space or super-polynomial(d) time
* ANN
  * Approximate Nearest Neighbor($c$-ANN): Find a $y_i$ such that $\text{dist}(x,y_i)\leq c\min_{1\leq j\leq n}\text{dist}(x,y_j)$
  * Approximate Near Neighbor($(c,r)$-ANN):
    * return a $y_i$ that $\text{dist}(x,y_i)\leq cr$ if $\exists y_j$ x.t. $\text{dist}(x,y_j)\leq r$
    * return "no" if $\forall y_i,\text{dist}(x,y_j)>cr$
    * arbitrary if o.w.
  * $\forall r:(\sqrt{c},r)$-ANN solved with space $s$ and query time $t\Rightarrow c$-ANN solved with space $O(s\log_c R)$ and query time $O(t\log\log_cR)$
    * $R=\frac{D_{\max}}{D_{\min}}$
    * $r_k=c^{\frac{k}{2}}r_0$
      * $r_0=D_{\min}=\min_{1\leq i<j\leq n}\text{dist}(y_i,y_j)$
      * $r_{\log_{\sqrt{c}}(R)}=D_{\max}=\max_{1\leq i<j\leq n}\text{dist}(y_i,y_j)$
    * 在 $r_k$ 中二分查找

### Dimension Reduction

Hamming Space $x\in\{0,1\}^d,d>>\log n$

* random Boolean matrix $A_{k\times d}$ with i.i.d. entries $\in$ Bernoulli($p$)
  * $z_i=Ay_i\in\{0,1\}^k$ on finite field GF(2)
* 打表 $s$-balls: $B_s(u)=\{y_i|\text{dist}(u,z_i)\leq s\}$ for all $u\in\{0,1\}^k$
  * space: $O(n2^k)$
* Algorithm
  * retrieve $B_s(Ax)$
  * if $B_s(Ax)=\emptyset$: "no"
  * else: any $y_i\in B_s(Ax)$:
  * query time: $O(kd)+O(1)$
* Decide $k=O(\log n),p,s$
  * Solve $(c,r)$ w.h.p: $\forall x,y\in\{0,1\}^d$
    * $\text{dist}(x,y)\leq r\Rightarrow P(\text{dist}(Ax,Ay)>s)<\frac{1}{n^2}$
    * $\text{dist}(x,y)> cr\Rightarrow P(\text{dist}(Ax,Ay)\leq s)<\frac{1}{n^2}$
  * $k=\frac{\ln n}{(\frac{1}{8}-2^{-(c+2)})^2}, p=\frac{1}{2}-2^{-1-1/r},s=(\frac{3}{8}-2^{-(c+2)})k$
  * space: $n^{O(1)}$, time: $O(d\log n)$, w.h.p

### Locality Sensitive Hashing

* random $h:X\rightarrow U$ is an $(r,cr,p,q)$-LSH if $\forall x,y\in X$
  * $\text{dist}(x,y)\leq r\Rightarrow P(h(x)=h(y))\geq p$
  * $\text{dist}(x,y)>cr\Rightarrow P(h(x)=h(y))\leq q$
* $\exists (r,cr,p,q)$-LSH $\Rightarrow\exists (r,cr,p^k,q^k)$-LSH
  * $g(x)=(h_1(x),\cdots,h_k(x))\in U^k$
  * $k=\log_{\frac{1}{q}}n,p^k={n^{-\frac{\log p}{\log q}}},q=\frac{1}{n}$
* with $(r,cr,p^*,\frac{1}{n})$-LSH $g$
  * Algorithm 1:
    * space: $O(n)$
      * store $y_1,\cdots,y_n$ in nondecreasing order $g(y_i)$
    * time: $O(\log n)+O(1)$ in expectation
      * find all $y_i$ that $g(x)=g(y_i)$ and check $\text{dist}(x,y_i)$
    * real answer "no": always correct
    * real answer not "no": $\geq p^*$
  * Algorithm 2:
    * space: $O(\frac{n}{p^*})$
      * draw independent $g_1,\cdots,g_{\frac{1}{p^*}}$
      * store $y_1,\cdots,y_n$ in table-$j$ in nondecreasing order of $g_j(y_i)$
    * time: $O(\frac{\log n}{p^*})$
      * find $\leq\frac{10}{p^*}y_i,\exists j,g_j(x)=g_j(y_i)$
    * real answer "no": always correct
    * real answer not "no": $>\frac{1}{2}$
* Overall: solve $(c,r)$-ANN with space $O(n^{1+\frac{\log p}{\log q}})$, query time $O(n^{\frac{\log p}{\log q}}\log n)$ and one-sided error $<0.5$
* Hamming space: $h(x)=x_i$ for uniform $i\in[d]$ is a $(r,cr,1-\frac{r}{d},1-\frac{cr}{d})$-LSH
