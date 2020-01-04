---
title: 2. Fingerprinting
date: 2019-01-16
weight: 2
---

## Polynomial Identity Testing

### Univariate

* (P)Polynomial Identity Testing (univariate)
  * Input: a polynomial $f\in\mathbb{F}[x]$ of degree $d$
  * Determine whether $f\equiv0$
* Naive Randomized Algorithm
  * pick $r\in S$ and check $f(r)=0$
  * false posivitve: $f\not\equiv 0,P(f(r)=0))\leq\frac{d}{|S|}$

### Multivariate

* (P)PIT
  * Input: two $n$-variate polynomials $f,g\in\mathbb{F}[x_1,x_2,\cdots,x_n]$ of degree $d$
  * Determine: $f\equiv g$
* multivariate polymonials
  * $f(x_1,\cdots,x_n)=\sum_{\sum_{j}i_j\leq d}a_{i_1,\cdots,i_n}x_1^{i_1}\cdots x_n^{i_n}$
  * total degree: $i_1+\cdots+i_n$
  * sum of monomials: # of coefficients ${n+d\choose d}\leq (n+d)^d$
  * product form: expend is expensive but evaluate is efficient
* Randomized Algorithm
  * $S\subseteq\mathbb{F}$
  * pick $r_1,\cdots,r_n\in S$ uniformly and independently at random
  * check $f(\overline{r})=0$
* Schwatz-Zippel Theorem: finte $\forall S\subset\mathbb{F},r_1,r_2,\cdots,r_n\in S$ choosed uniformly and independently at random, $P(f(r_1,r_2,\cdots,r_n)=0)\leq\frac{d}{|S|}$

## Fingerprint

$\text{FING}(\cdot)$: function easy to compute and compare  
$X=Y,\text{FING}(X)=\text{FING}(Y)$  
$X\not=Y,P(\text{FING}(X)=\text{FING}(Y))$ is small

### Communication Protocol

* (P)Checking Identity
  * $\text{EQ}(a,b)=[a=b]$ (bit-string $x\in\{0,1\}^n$)
  * Communication cost
* Theorem (Yao 1979): Any deterministic communication protocol computing EQ on two $n$-bit strings costs $n$ bits of communication in the worst-case.
* Fingerprinting by PIT
  * $\text{FING}(x)=\sum_{i=0}^{n-1}x^ir^i$ under $\mathbb{Z}_p$, $r$ chosen uniformly at random
  * $x\neq y,P(\text{FING}(x)=\text{FING}(y))\leq\frac{n-1}{p}$
    * $p\in[n^2,2n^2],P\leq\frac{1}{n}$
  * communication cost: $O(\log p)$
* Fingerprinting by check sum
  * $\text{FING}(x)=x\bmod p,p\in[k],k=2n^2\ln n$
  * $x\neq y,P(\text{FING}(x)=\text{FING}(y))=P(|x-y|\bmod p=0)\leq\frac{n}{\pi(k)}\leq\frac{1}{n}$
  * Proof technique
    * number of prime divisors of $n\leq \log_2n$
    * number of primes in $[k]$: $\pi(k)\sim\frac{k}{\ln k}$
  * communication cost: $O(\log k)=O(\log n)$

### Checking distinctness

* checking distinctness
  * Input: $A,B\in\{1,2,\cdots,n\}$
  * Determine whether $A=B$(multiset equivalence)
* $\text{FING}(A)=f_A(r)=\prod_{i=1}^n(r-a_i),r\in \mathbb{Z}_p$
  * $p\in [(n\log n)^2,2(n\log n)^2]$
  * Theorem (Lipton 1989): $A\not=B,P(\text{FING}(A)=\text{FING}(b))=O(\frac{1}{n})$
  * Proof technique
    * $A\not=B,P(\text{FING}(A)=\text{FING}(B))=P(f_A(r)=f_B(r)|f_A\not\equiv f_B)P(f_A\not\equiv f_B)+P(f_A(r)=f_B(r)|f_A\equiv f_B)P(f_A\equiv f_B)$
  * space cost: $O(\log p)=O(\log n)$
