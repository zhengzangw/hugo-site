---
title: 2. Fingerprinting
date: 2019-01-16
tags: [ps, math, notes]
weight: 2
---

## PIT(Polynomial Identity Testing)

* Input: a polynomial $f\in\mathbbb{F}[x]$ of degree $d$
* Determine whether $f\equiv0$

```C
  r = random(S)
  if (f(r)==0) return true
```

* $P(f(r)=0))\leq\frac{d}{|S|}$

## Communication Complexity Equality

* Any deterministic communication protocol computing EQ on two $n$-bit strings costs $n$ bits of communication in the worst-case.

```C
//Bob
  r = random(p)
  send(r)
  send(g(r))
//Alice
  compute(f(r))
  if (f(r)==g(r)) return true
```

* Complexity: $O(\log p)$
* $P(f(r)=g(r)))\leq\frac{n-1}{p},[n^2,2n^2]$
  * Chebyshev's theorem

### Schwartz-Zippel Theorem

* Input: a polynomial $f\in\mathbb{F}[x_1,x_2,\cdots,x_n]$ of degree $d$
* Determine whether $f\equiv0$
* Randomized Algorithm
* Schwatz-Zippel Theorem: for all finite set $S\subset\mathbb{F},r_1,r_2,\cdots,r_n\in S$, $P(f(r_1,r_2,\cdots,r_n)=0)\leq\frac{d}{|S|}$
  * $P(f(r_1,r_2,\cdots,r_n)=0)=P(f(\overline{r})=0|f_k(r_1,r_2,\cdots,r_{n-1})=0)P(f_k(r_1,r_2,\cdots,r_{n-1})=0)+P(f(\overline{r})=0|f_k(r_1,r_2,\cdots,r_{n-1})\not=0)P(f_k(r_1,r_2,\cdots,r_{n-1})\not=0)$
  * the number of roots in $S^n$ is at most $d|S|^{n-1}$

### Fingerprinting

* $\text{FING}(\cdot)$ is a function, if $X=Y$ then $\text{FING}(X)=\text{FING}(Y)$
* easier to compute $\text{FING}$
* $X\not=Y,P(\text{FING}(X)=\text{FING}(Y))$ is small
* Communication protocol for EQ by fingerprinting
  * Fingerprinting by PIT: $\text{FING}(x)=\sum_{i=1}^nx_ir^i$
  * $x\not=y,P(\text{FING}(x)=\text{FING}(y))\leq\frac{n-1}{p}\leq{1}{n}$
  * $\text{FING}(x)=x\bmod p$
  * $P=P(z\bmod p=0)\leq\frac{n}{\pi(k)},k=2n^2\ln n,0<z<2^n,p\in[k]$
    * $\pi(k)\sim\frac{k}{\ln k}$
  * $O(\log n)$
* Checking identity of multisets
  * Input: $A,B\in\{1,2,\cdots,n\}$
  * Determine whether $A=B$(multiset equivalence)
  * $\text{FING}(A)=f_A(r)=\prod_{i=1}^n(r-a_i),r\in \mathbb{Z}_p$
    * $f_A\in\mathbb{Z}_p[x],p\in [(n\log n)^2,2(n\log n)^2]$
    * $O(\log n)$
    * Lipton: $A\not=B,P(\text{FING}(A)=\text{FING}(b))=O(\frac{1}{n})$
      * $A\not=B,P(\text{FING}(A)=\text{FING}(B))=P(f_A(r)=f_B(r)|f_A\not\equiv f_B)P(f_A\not\equiv f_B)+P(f_A(r)=f_B(r)|f_A\equiv f_B)P(f_A\equiv f_B)$
