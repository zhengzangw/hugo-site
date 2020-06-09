---
title: Balls into Bins
date: 2019-09-04
weight: 10
---

## Balls into Bins

$m$ balls into $n$ bins uniformly and independently

### Birthday Problem

the mapping is 1-1

* pigeonhole principle: $P=1,m>365$
* $P(\text{one-to-one})=\prod_{k=1}^{m-1}(1-\frac{k}{n})\approx e^{-\frac{m^2}{2n}}$
* $P(\text{collision})=1-P=1-\epsilon,m=\sqrt{2n\ln\frac{1}{\epsilon}}$
  * $P>0.99,m>57$

### Coupon Collector Problem

the mapping is on-to

* $X$ is the number of balls thrown uniformly and independtly to $n$ bins until no bin is empty
* $\mathbb{E}(X)=nH(n)=n\sum_{i=1}^n\frac{1}{i}$
* $P(X\geq n\ln n+cn)<e^{-c},\forall c>0$
* $\lim_{n\rightarrow\infty}P(X\geq n\ln n+cn)=1-e^{-e^{-c}}$

### Occupancy Problem

the maximum load of bins

* $X_i$: load of $i$th bin
* Average: $\mathbb{E}(X_i)=\frac{m}{n}$

$$\max_i X_i=\begin{cases}O(\frac{\log n}{\log\log n})&m=\Theta(n)&w.h.p\\O(\frac{m}{n})&m=\Omega(n\log n)&w.h.p\\\end{cases}$$

* 2-choice: $\max_i X_i=\Theta(\log\log n),m=\Theta(n)$ w.h.p
