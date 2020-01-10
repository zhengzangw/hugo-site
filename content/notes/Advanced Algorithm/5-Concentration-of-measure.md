---
title: 5. Concentration of measure
date: 2019-09-04
weight: 5
---

## Basic Tail inequality

Markov's Inequality

$$P(X\geq t)\leq\frac{E(x)}{t}$$

Chebyshev's Inequality

$$P(|X-E(X)|\geq t)\leq\frac{V(X)}{t^2}$$

## Moment Generating Functions

Moment-generating function of a random variable $X$:

$$M_X(t)=E[e^{tX}]=\sum_{k=0}^\infty\frac{\lambda^k}{k!}E(X^k)=\int_{-\infty}^{\infty}e^{tx}f(x)dx,t\in\mathbb{R}$$

Some Moment-generating function

| $t\sim$                  | $M_X(t)$                          |
| ------------------------ | --------------------------------- |
| Bernoulli $p$            | $1-p+pe^t$                        |
| Geometric $p$            | $\frac{pe^t}{1-(1-p)e^t}$         |
| Binomial $B(n,p)$        | $(1-p+pe^t)^n$                    |
| Poisson $P(\lambda)$     | $e^{\lambda(e^t-1)}$              |
| Normal $N(\mu,\sigma^2)$ | $e^{t\mu+\frac{1}{2}\sigma^2t^2}$ |

## Chernoff Bound

Generic Chernoff Bound:

$$P(X\geq t)=P(e^{\lambda X}\geq e^{\lambda t})\leq\frac{E[e^{\lambda X}]}{e^{\lambda t}}\\P(X\leq t)=P(e^{-\lambda X}\geq e^{-\lambda t})\leq\frac{E[e^{-\lambda X}]}{e^{-\lambda t}}$$

Chernoff Bound for $X=\sum_{i=1}^nX_i$ of **independent** events

$$P(X\geq t)\leq \min_{\lambda>0}e^{-\lambda t}\prod_i E[e^{tX_i}]$$

Chernoff Bound for concentration $t=(1+\delta)\mu,\mu=E[X]$

$$P(X\geq (1+\delta)\mu)=P(e^{\lambda X}\geq e^{\lambda(1+\delta)\mu})\leq\frac{E(e^{\lambda X})}{e^{\lambda(1+\delta)\mu}}$$

Chernoff Bound for independent Poisson trials (Bernoulii)

$$P(X\geq(1+\delta)\mu)\leq(\frac{e^\delta}{(1+\delta)^{(1+\delta)}})^\mu$$
$$P(X\leq(1-\delta)\mu)\leq(\frac{e^{-\delta}}{(1-\delta)^{(1-\delta)}})^\mu$$

Useful forms of Chernoff Bound for independent Poisson trials

$$P(X\geq(1+\delta)\mu)<e^{-\frac{\mu\delta^2}{3}},0<\delta\leq 1$$
$$P(X\leq(1-\delta)\mu)<e^{-\frac{\mu\delta^2}{2}},0<\delta\leq 1$$
$$P(X\geq t)\leq 2^{-t},t\geq 2e\mu$$

Chernoff bound for $\chi^2$-distribution $X\sim\chi^2(k)$

$$P(X\geq(1+\epsilon)k)<e^{-\frac{\epsilon^2k}{8}}\\P(X\geq(1-\epsilon)k)<e^{-\frac{\epsilon^2k}{8}}\\X\sim\mathcal{N}(0,1),\mathbb{E}(e^{sX^2})=\frac{1}{\sqrt{1-2s}}$$

## Martingales (鞅论)

### Definition

* martingale: a sequence of random varibles $X_0,X_1,\cdots,\mathbb{E}(X_i|X_0,\cdots,X_{i-1})=X_{i-1}$
* martingale (general version): a sequence of varibales $Y_0,Y_1,\cdots$ is a martingale with respect to $X_0,X_1,\cdots$ if
  * $Y_i$ is a function of $X_0,X_1,\cdots,X_i$
  * $\mathbb{E}(Y_{i+1}|X_0,\cdots,X_i)=Y_i$

### Azuma's Inequality

Azuma's Inequality: $X_0,X_1,\cdots$ is a martingale satisfying bounded difference condition ($|X_k-X_{k-1}|\leq c_k,k\geq 1$), then 

$$P(|X_n-X_0|\geq t)\leq 2e^{-\frac{t^2}{2\sum_{k=1}^nc_k^2}}$$

Corollary of Azuma's Inequality: martingale satisfying bounded difference condition with same $c$

$$P(|X_n-X_0|\geq ct\sqrt{n})\leq 2e^{-\frac{t^2}{2}}$$

### Doob Sequence

* Doob Sequence of a function $f$ respect to $X_1,\cdots,X_n$ is: $Y_i=\mathbb{E}[f(X_1,\cdots,X_n)|X_1,\cdots,X_i]$
  * $Y_0=\mathbb{E}(f(X_1,\cdots,X_n))$
  * $Y_n=f(X_1,\cdots,X_n)$
* edge exposure martingale: $Y_0,Y_1,\cdots,Y_m$
  * $m={n\choose 2}$, fix an arbitrary numbering of potential edges between the $n$ vertices, $X_i=[e_i\in G],Y_0=E(f(G)),Y_i=E(f(G)|X_1,\cdots,X_i)$
* vertex exposure martingale: $Y_0,Y_1,\cdots,Y_n$
  * $X_i$ is the subgraph of $G$ induced by the vertex set $[i]$
* Shamir and Spencer Theorem: $G\sim G(n,p)$

$$P(|\chi(G)-\mathbb{E}(\chi(G))|\geq t\sqrt{n})\leq 2e^{\frac{-t^2}{2}}$$

### Hoeffding's Bound

For independent $X_1,X_2,\cdots,X_n$ with $X_i\in[a_i,b_i],X=\sum_{i=1}^nX_i,\forall t>0,\mu=E[X]$

$$P(X\geq \mu+t)\leq e^{-\frac{t^2}{2\sum_{i=1}^n(b_i-a_i)^2}}\\P(X\leq \mu-t)\leq e^{-\frac{t^2}{2\sum_{i=1}^n(b_i-a_i)^2}}$$

## Method of Bounded Differences

* Method of Averaged Bounded Differences
  * Averaged Bounded Condition: $|E(f(X)|X_1,\cdots,X_i)-E(f(X)|X_1,\cdots,X_{i-1})|\leq c_i$
  * Averaged Lipschitz condition(ALC): $\forall a,b, |E(f(X)|X_1,\cdots,X_i=a_i)-E(f(X)|X_1,\cdots,X_{i-1},X_i=b_i)|\leq c_i$
  * Restate of Azuma's inequality
* Lipshitz condition: $|f(x_1,\cdots,x_n)-f(x_1,\cdots,x_{i-1},y_i,x_{i+1},\cdots,x_n)|\leq c_i$
* Method of Bounded Difference: $n$ dependent random variables $X_1,\cdots,X_n$ and $f(X)$ satisfies the Lipshitz condition

$$P(f(X)\geq E(f(X))+t)\leq e^{-\frac{t^2}{2\sum_{i=1}^nc_i^2}}\\P(f(X)\geq E(f(X))-t)\leq e^{-\frac{t^2}{2\sum_{i=1}^nc_i^2}}$$
