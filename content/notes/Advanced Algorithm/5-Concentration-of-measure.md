---
title: 5. Concentration of measure
date: 2019-09-04
weight: 5
---

## Basic Tail inequality

* Markov's Inequality: $P(X\geq t)\leq\frac{E(x)}{t}$
* Chebyshev's Inequality: $P(|X-E(X)|\geq t)\leq\frac{V(X)}{t^2}$

## Chernoff Bound

* Chernoff Bound Method
  * $P(X\geq (1+\delta)\mu)=P(e^{\lambda X}\geq e^{\lambda(1+\delta)\mu})\leq\frac{E(e^{\lambda X})}{e^{\lambda(1+\delta)\mu}}$
  * $E(e^{\lambda X})=\prod_{i=1}^n E(e^{\lambda X_i})$
    * Moment generating functions $M(\lambda)=E[e^{\lambda X}]=\sum_{k=0}^\infty\frac{\lambda^k}{k!}E(X^k)$
  * 估计 $E(e^{\lambda X_i})$
  * 确定 $\lambda$
* For independent trials $X_1,\cdots,X_n\in[0,1],X=\sum_{i=1}^nX_i,\mu=E[X],\forall\delta>0$
  * $P(X\geq(1+\delta)\mu)\leq(\frac{e^\delta}{(1+\delta)^{(1+\delta)}})^\mu$
  * $P(X\leq(1-\delta)\mu)\leq(\frac{e^{-\delta}}{(1-\delta)^{(1-\delta)}})^\mu$
* (Corollary) For $X=\sum_{i=1}^n,X_1,\cdots,X_n$ are independent Poisson trials.
  * $0<\delta\leq 1$
    * $P(X\geq(1+\delta)\mu)<e^{-\frac{\mu\delta^2}{3}}$
    * $P(X\leq(1-\delta)\mu)<e^{-\frac{\mu\delta^2}{2}}$
  * $t\geq 2e\mu$
    * $P(X\geq t)\leq 2^{-t}$
* Chernoff bound for $\chi^2$-distribution
  * $X\sim\chi^2(k),P(X\geq(1+\epsilon)k)<e^{-\frac{\epsilon^2k}{8}},P(X\geq(1-\epsilon)k)<e^{-\frac{\epsilon^2k}{8}}$
    * $X\sim\mathcal{N}(0,1),\mathbb{E}(e^{sX^2})=\frac{1}{\sqrt{1-2s}}$

## Maratingales (鞅论)

* martingale: a sequence of random varibles $X_0,X_1,\cdots,\mathbb{E}(X_i|X_0,\cdots,X_{i-1})=X_{i-1}$
* martingale (general version): a sequence of varibales $Y_0,Y_1,\cdots$ is a martingale with respect to $X_0,X_1,\cdots$ if
  * $Y_i$ is a function of $X_0,X_1,\cdots,X_i$
  * $\mathbb{E}(Y_{i+1}|X_0,\cdots,X_i)=Y_i$
* Azuma's Inequality: $X_0,X_1,\cdots$ is a martingale such that $|X_k-X_{k-1}\leq c_k,K\geq 1$, then $P(|X_n-X_0|\geq t)\leq 2e^{-\frac{t^2}{2\sum_{k=1}^nc_k^2}}$
  * bounded difference condition
* (Corollary) $|X_k-X_{k-1}|\leq c,P(|X_n-X_0|\geq ct\sqrt{n})\leq 2e^{-\frac{t^2}{2}}$
* Doob Sequence of a function $f$: $X_1,\cdots,X_n,Y_i=\mathbb{E}[f(X_1,\cdots,X_n)|X_1,\cdots,X_i)$
  * $Y_0=\mathbb{E}(f(X_1,\cdots,X_n))$
  * $Y_n=f(X_1,\cdots,X_n)$
* edge exposure martingale: $Y_0,Y_1,\cdots,Y_m$
  * $m={n\choose 2}$, fix an arbitrary numbering of potential edges between the $n$ vertices, $X_i=[e_i\in G],Y_0=E(f(G)),Y_i=E(f(G)|X_1,\cdots,X_i)$
* vertex exposure martingale: $Y_0,Y_1,\cdots,Y_n$
  * $X_i$ is the subgraph of $G$ induced by the vertex set $[i]$
* Shamir and Spencer Theorem: $G\sim G(n,p)$, $P(|\chi(G)-\mathbb{E}(\chi(G))|\geq t\sqrt{n})\leq 2e^{\frac{-t^2}{2}}$

## Hoeffding's Bound

* For independent $X_1,X_2,\cdots,X_n$ with $X_i\in[a_i,b_i],X=\sum_{i=1}^nX_i,\forall t>0$
  * $P(X\geq \mu+t)\leq e^{-\frac{t^2}{2\sum_{i=1}^n(b_i-a_i)^2}}$
  * $P(X\leq \mu-t)\leq e^{-\frac{t^2}{2\sum_{i=1}^n(b_i-a_i)^2}}$
* Lemma: random variable $Y\in[a,b]$ with $\mathbb{E}[Y]=0,\mathbb{E}[e^{\lambda Y}]\leq e^{\lambda^2(b-a)^2/8}$
* (Corollary) $X_i\in\{0,1\},X=\sum_{i=1}^n$
  * $P(X\geq E(X)+t)\leq e^{-\frac{2t^2}{n}}$
  * $P(X\geq E(X)-t)\leq e^{-\frac{2t^2}{n}}$

## Method of Bounded Differences

* Method of Averaged Bounded Differences
  * Averaged Bounded Condition: $|E(f(X)|X_1,\cdots,X_i)-E(f(X)|X_1,\cdots,X_{i-1})|\leq c_i$
  * Averaged Lipschitz condition(ALC): $\forall a,b, |E(f(X)|X_1,\cdots,X_i=a_i)-E(f(X)|X_1,\cdots,X_{i-1},X_i=b_i)|\leq c_i$
* For Independent random variables: $X=(X_1,\cdots,X_n), f(X)$ satisfies the Lipshitz condition for all $x_1,\cdots,x_n,y_i$
  * Lipshitz condition: $|f(x_1,\cdots,x_n)-f(x_1,\cdots,x_{i-1},y_i,x_{i+1},\cdots,x_n)|\leq c_i$
  * $P(f(X)\geq E(f(X))+t)\leq e^{-\frac{t^2}{2\sum_{i=1}^nc_i^2}}$
  * $P(f(X)\geq E(f(X))-t)\leq e^{-\frac{t^2}{2\sum_{i=1}^nc_i^2}}$
