---
title: 3. Dimension Reduction
date: 2019-09-04
weight: 3
---

## Metric Embedding

* Metric Space: $(X,d),X$ is a set and $d$ is a distance on $X$
* Embedding: $\phi:X\rightarrow Y$ on two metric space $(X,d_X),(Y,d_Y)$
  * Distortion $\alpha\geq 1$: $\forall x,y\in X,\frac{1}{\alpha}d(x,y)\leq d(\phi(x),\phi(y))\leq\alpha d(x,y)$
  * Dimension Reduction: $x_1,\cdots,x_n\in\mathbb{R}^d,y_1,\cdots,y_n\in\mathbb{R}^k$

### JLT Embedding

* Johnson-Lindenstrauss Theorem(JLT, 1984): it is always possble to embed $n$ points in arbitrary dimension to $O(\log n)$ dimension with constant distortion in Euclidian Space
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

### Problem

* NNS
  * Data: $y_1,\cdots,y_n\in X$
  * Query: $x\in X$
  * Answer: $y_i$ closest to $x$
* $c$-ANN: Approximate Nearest Neighbor
  * Answer: Find a $y_i$ such that $\text{dist}(x,y_i)\leq c\min_{1\leq j\leq n}\text{dist}(x,y_j)$
* $(c,r)$-ANN: Approximate Near Neighbor:
  
$$\begin{cases}y_{i^*}\in S,\text{dist}(x,y_{i^*})\leq cr & \exists y_i\in S,\text{dist}(x,y_i)\leq r\\\perp & \forall y_i\in S,\text{dist}(x,y_i)> r\\\text{arbitrary} & o.w.\end{cases}$$

* From $(c,r)$-ANN to $c$-ANN
  * Definition
    * $D_{\min}=\min\text{dist}(y_i,y_j)$
    * $D_{\max}=\max\text{dist}(y_i,y_j)$
    * $R=\frac{D_{\max}}{D_{\min}}$
  * $\forall r,\exists$ data structure for $(c,r)$-ANN
    * space $s$
    * answer time $t$
    * probability $1-\delta$
  * $\exists$ data structure for $r$-ANN
    * space $O(s\log_c R)$
    * answer time $O(t\log\log_c R)$
    * probability $1-O(\delta\log\log_c R)$

### Deterministic

* Dictionary data structure
  * k-d tree
  * Voronoi diagram
* Curse of dimensionality
  * conjecture: NNS in high dimension requires either super-polynomial space or super-polynomial time

### Dimension Reduction

* Solve $(c,r)$-ANN in Hamming Space $x\in\{0,1\}^d,d>>\log n$ w.h.p
* Data Structure
  * random Boolean matrix $A_{k\times d}$ with i.i.d. entries $\in$ Bernoulli($p$)
    * $z_i=Ay_i\in\{0,1\}^k$ on finite field GF(2)
  * $s$-balls: $B_s(u)=\{y_i|\text{dist}(u,z_i)\leq s\}$ for all $u\in\{0,1\}^k$ (打表)
  * space: $O(n2^k)$
* Answer: any $y_i\in B_s(Ax)$ (no if none)
  * query time: $O(kd)+O(1)$
* Decide $k,p,s$
  * $k=\frac{\ln n}{(\frac{1}{8}-2^{-(c+2)})^2}=O(\log n)$
  * $p=\frac{1}{2}-2^{-1-1/r}$
  * $s=(\frac{3}{8}-2^{-(c+2)})k$
  * space: $n^{O(1)}$
  * time: $O(d\log n)$

### Locality Sensitive Hashing

* $(r,cr,p,q)$-LSH: $h:X\rightarrow U$ satisfying $\forall x,y\in X$
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
      * find $\leq\frac{10}{p^*}$ number of $y_i,\exists j,g_j(x)=g_j(y_i)$
    * real answer "no": always correct
    * real answer not "no": $>\frac{1}{2}$
* Overall: solve $(c,r)$-ANN with space $O(n^{1+\frac{\log p}{\log q}})$, query time $O(n^{\frac{\log p}{\log q}}\log n)$ and one-sided error $<0.5$
* Hamming space: $h(x)=x_i$ for uniform $i\in[d]$ is a $(r,cr,1-\frac{r}{d},1-\frac{cr}{d})$-LSH
