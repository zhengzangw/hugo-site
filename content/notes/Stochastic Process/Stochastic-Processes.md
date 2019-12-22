---
title: Stochastic Processes
date: 2019-11-08
tags: [math]
---

> Stochastic Processes, Ross

# Preliminaries

## Sequence of Events

* increasing sequence of events: $\{E_n,n\geq 1\},E_n\subset E_{n+1}$
  * $\lim_{n\rightarrow\infty}E_n=\bigcup_{i=1}^\infty E_i$
* decreasing sequence of events: $\{E_n,n\geq 1\},E_n\supset E_{n+1}$
  * $\lim_{n\rightarrow\infty}E_n=\bigcap_{i=1}^\infty E_i$
* for an increasing or decreasing sequences of events, $\lim_{n\rightarrow\infty}P(E_n)=P(\lim_{n\rightarrow\infty}E_n)$
* Borel-Cantelli Lemma: if $\sum_{n=1}^{\infty}P(E_n)<\infty$, then $P(\text{an infinite number of the }E_i\text{ occur})=P(\lim\sup_{t\rightarrow\infty}E_i)=P(\cap_{n=1}^\infty\cup_{i=n}^\infty E_i)=0$
  * Converse: $E_i$ are independent events, $\sum_{n-1}^\infty P(E_n)=\infty$, then $P(\text{an infinite number of the }E_i\text{ occur})=1$

# Poisson Process
# Renewal Theory
# Markov Chains
# Continuous-Time Markov Chains
# Martingales
# Random Walks
# Brownian Motion and Other Markove Processes
# Stochastic Order Relations
# Poisson Approximations

<!--more-->