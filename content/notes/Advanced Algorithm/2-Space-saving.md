---
title: 2. Space-saving
date: 2019-01-16
weight: 2
---

## Problems

- Checking Identity
  - $\text{EQ}(a,b)=[a=b]$ (bit-string $x\in\{0,1\}^n$)
  - Communication cost
- checking distinctness
  - Input: $A,B\in\{1,2,\cdots,n\}$
  - Determine whether $A=B$(multiset equivalence)
- counting distinct elements
  - Data: Stream Model, $n$ is unknown and elements is presented one at a time
  - Input: a sequence $x_1,x_2,\cdots,x_n\in\Omega$
  - Output: an estimation of $z=|\{x_1,x_2,\cdots,x_n\}|$
- Set Membership
  - Data: a set of elements $x_1,\cdots,x_n\in\Omega$
  - Input: $x\in\Omega$
  - Output: $[x\in\Omega]$
- Frequency Estimation
  - Data: a sequence of elements $x_1,\cdots,x_n\in\Omega$
  - Input: $x\in\Omega$
  - Output: $f_x=|\{i|x_i=x\}$|

## Fingerprint

- use Fingerprint to design One-sided-error Monte Carlo algorithm
  - $\text{FING}(\cdot)$: function easy to compute and compare
  - $X=Y,\text{FING}(X)=\text{FING}(Y)$
  - $X\not=Y,P(\text{FING}(X)=\text{FING}(Y))$ is small

### Communication Protocol

- Theorem (Yao 1979): Any deterministic communication protocol computing EQ on two $n$-bit strings costs $n$ bits of communication in the worst-case.
- Fingerprinting by PIT
  - $\text{FING}(x)=\sum_{i=0}^{n-1}x^ir^i$ under $\mathbb{Z}_p$, $r$ chosen uniformly at random
  - $x\neq y,P(\text{FING}(x)=\text{FING}(y))\leq\frac{n-1}{p}$
    - $p\in[n^2,2n^2],P\leq\frac{1}{n}$
  - communication cost: $O(\log p)$
- Fingerprinting by check sum
  - $\text{FING}(x)=x\bmod p,p\in[k],k=2n^2\ln n$
  - $x\neq y,P(\text{FING}(x)=\text{FING}(y))=P(|x-y|\bmod p=0)\leq\frac{n}{\pi(k)}\leq\frac{1}{n}$
  - Proof technique
    - number of prime divisors of $n\leq \log_2n$
    - number of primes in $[k]$: $\pi(k)\sim\frac{k}{\ln k}$
  - communication cost: $O(\log k)=O(\log n)$

### Checking distinctness

- $\text{FING}(A)=f_A(r)=\prod_{i=1}^n(r-a_i),r\in \mathbb{Z}_p$
  - $p\in [(n\log n)^2,2(n\log n)^2]$
  - Theorem (Lipton 1989): $A\not=B,P(\text{FING}(A)=\text{FING}(b))=O(\frac{1}{n})$
  - Proof technique
    - $A\not=B,P(\text{FING}(A)=\text{FING}(B))=P(f_A(r)=f_B(r)|f_A\not\equiv f_B)P(f_A\not\equiv f_B)+P(f_A(r)=f_B(r)|f_A\equiv f_B)P(f_A\equiv f_B)$
  - space cost: $O(\log p)=O(\log n)$

## Hashing

### Distinct Elements

- deterministic: $O(n)$ space
- $(\epsilon,\delta)$-estimator $\hat Z$: $P((1-\epsilon)z\leq \hat Z\leq(1+\epsilon)z))\geq1-\delta$
  - $\epsilon$: approximation error
  - $\delta$: confidence error
- UHA(uniform hash assumption)
  - $h:[N]\rightarrow[M]$ takes $\Omega(N\log M)$ bits according to information theory
  - SUHA(Simple UHA): A uniform random function $h:[N]\rightarrow[M]$ is available and the computation of $h$ is efficient.
- Hashing Estimator
  - $h:\Omega\rightarrow[0,1]$
  - Compute $h(x_i)$: independent values in $[0,1]$
  - $Z=\frac{1}{\min_ih(x_i)}-1$
    - $E(\min_{1\leq i\leq n}h(x_i))=E($length of a subinterval$)=\frac{1}{z+1}$
    - drawback: $V(\min_ih(x_i))$ is too large
- Flajolet-Martin algorithm (1985)
  - $\overline{Y}=\frac{1}{k}\sum_{j=1}^k Y_j$
  - $E(\overline{Y})=\frac{1}{z+1}$
  - $Z=\frac{1}{\overline{Y}}-1$
  - $k\geq\lceil\frac{4}{\epsilon^2\delta}\rceil,\forall \epsilon,\delta<\frac{1}{2}$
  - Space cost: $O(\epsilon^{-2}\log n)$ bits
- 2010: $\Theta(\epsilon^{-2}+\log n)$

## Sketch

- sketch: lossy representation of data and tolerate a bounded error in answering queries

### Set Membership

- Dictionary data structure
  - balanced tree: $O(n\log|\Omega|)$ space, $O(\log n)$ time
  - perfect hashing: $O(n\log|\Omega|)$ space, $O(1)$ time
- Bloom filter (1970)
  - $h_1,h_2,\cdots,h_k:\Omega\rightarrow [cn]$ are uniform and independent random hash function
  - Data Structure $A$ of $cn$ bits $O(n)$
    - initially: all $0$
    - for each $x\in S,A[h_i(x)]=1$ for $1\leq i\leq k$
  - Query: yes if $A[h_i(x)]=1,1\leq i\leq k$
    - time cost: $O(k)$
  - $\text{RP}$
    - $x\in S$: always correct
    - $x\not\in S$:
      - $P(A[h_1(x)]=0)=(1-\frac{1}{cn})^{kn}\approx e^{\frac{-k}{c}}$
      - $P=(1-e^{\frac{-k}{c}})^k$
      - $k=c\ln 2,P=(0.6185)^c$

### Frequency Estimation

- Additive error: $P(|\hat f_x-f_x|\leq\epsilon n)\geq 1-\delta$
  - heavy hitters: elements $x$ with $f_x>\epsilon n$
- Count-min sketch (Cormode and Muthukrishnan, 2003)
  - Data Structure: $k\times m$ integer array $\text{CMS}[k][m]$
    - initially: $\text{CMS}[k][m] = 0$
    - for each $x_i$, $\text{CMS}[j][h_j(x_i)]$++
  - Query: $\hat f_x=\min_{1\leq j\leq k}\text{CMS}[j][h_j(x)]$
    - Time cost: $O(\frac{1}{\epsilon})$
  - Space cost: $O(km\log n)=O(\frac{1}{\epsilon}\log\frac{1}{\delta}\log n)$
  - Proof
    - $\text{CMS}[j][h_j(x)]\geq f_x$
    - $\mathbb{E}(\text{CMS}[j][h_j(x)])\leq f_x+\frac{n}{m}$
    - $P(|\hat f_x-f_x|\leq\epsilon n)\leq\frac{1}{\epsilon m}^k$
    - $m=\lceil\frac{e}{\epsilon}\rceil,k=\lceil\ln\frac{1}{\delta}\rceil$
