---
title: 4. Balls into Bins
date: 2019-09-04
tags: [algorithm, math, notes]
weight: 4
---

* $m$ balls into $n$ bins uniformly and independently
  * UHA

## Birthday Problem

the mapping is 1-1

* pigeonhole principle: $P=1,m>365$
  * $P>0.99,m>57$
* $P(\mathcal{E})=\frac{n\choose m}{n^m}m!=\prod_{k=1}^{m-1}(1-\frac{k}{n})\approx e^{-\frac{m^2}{2n}}$
  * $\mathcal{E}$: not share a bin
  * $m=\sqrt{2n\ln\frac{1}{\epsilon}},1-P=\epsilon$

## Coupon Collector Problem

the mapping is on-to

* $X$ is the number of balls thrown uniformly and independtly to $n$ bins until no bin is empty
* $\mathbb{E}(X)=nH(n)$
  * $H(n)=\sum_{i=1}^n\frac{1}{i}$
* $P(X\geq n\ln n+cn)<e^{-c},c>0$
* $\lim_{n\rightarrow\infty}P(X\geq n\ln n+cn)=1-e^{-e^{-c}}$

## Occupancy Problem

the maximum load of bins

* $\mathbb{E}(X_i)=\frac{m}{n}$
* with high probability $1-O(\frac{1}{n})$
  * $m=\Theta(n),\max_i X_i=O(\frac{\log n}{\log\log n})$ w.h.p
  * $m=\Omega(n\log n), X_i=O(\frac{m}{n})$
* 2-choice
  * $m=\Theta(n), \max_i X_i=\Theta(\log\log n)$ w.h.p
