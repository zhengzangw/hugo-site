---
title: Poisson Process
date: 2020-01-31
weight: 2
---

## Poisson Process

### Counting Process

1. $N(t)\geq 0$
2. $N(t)\in\mathbb{N}$
3. $s<t,N(s)\leq N(t)$
4. $s<t,N(t)-N(s)$ equals the number of events that have occurred in the interval $(s,t]$

### Definition 1 of Poisson Process

1. $N(0)=0$
2. independent increments
3. $\forall s,t\geq 0$

   $$P(N(t+s)-N(s)=n)=e^{-\lambda t}\frac{(\lambda t)^n}{n!},n=0,1$$

### Definition 2 of Poisson Process

1. $N(0)=0$
2. The process has stationary and independent increments
3. $P(N(t+h)-N(t)=1)=\lambda h+o(h)$
4. $P(N(t+h)-N(t)\geq 2)=o(h)$

### Sequence of interarrival times

- $\{X_n,n\geq 1\}$: $X_n$ denotes the time of the $n$th event

  $$P(X_1>t)=P(N(t)=0)=e^{-\lambda t}$$

- $X_n$ are independent identically distributed exponential random variables having mean $\frac{1}{\lambda}$

### Arrival time of $n$th event

- $S_n=\sum_{i=1}^nX_i,n\geq 1$: Gamma Distribution
- order statistics $Y_{(i)}$ corresponding to $Y_i$: $Y_{(i)}$ is the $k$th minimum of $Y_{i}$

  $$ f(y_1,y_2,\cdots,y_n)=n!\prod_{i=1}^nf(y_i) $$

- $Y_i$ are uniformly distributed over $(0,t)$, then the joint density funciton of order statistics is

  $$ f(y_1,y_2,\cdots,y_n)=\frac{n!}{t^n} $$

- Given that $N(t)=n$, the $n$ arrival times $S_1,\cdots,S_n$ have the same distribution as the order statistics corresponding to $n$ independent random variables uniformly distributed on the interval $(0,t)$

### Two Type Poisson random variables

- event occurs at time $s$, then, indepentently of all else, it is classified as being a type-I event with probability $P(s)$ and a type-II event with probability $1-P(s)$
- $N_1(t)$ and $N_2(t)$ are independent Poisson random variables having respective means $\lambda tp$ and $\lambda t(1-p)$

$$ p=\frac{1}{t}\int^t_0P(s)ds $$

### M/G/1 Busy Period

- M/G/1 queueing system
  - customers arrive in accordance with a Poisson process with rate $\lambda$
  - upon arrival, either enter service if the server is free or else join the queue
  - successive service times are independent and identically distributed according to $G$: $Y_i$ denotes the sequence of service times
  - busy period begins: an arrival finds the server free
  - busy period ends: no longer any customers in the system
- busy period last a time $t$ and consits of $n$ services (Probability $B(t,n)$) iff
  - $S_k\leq Y_1+\cdots Y_k$
  - $Y_1+\cdots Y_n=t$
  - There are $n-1$ arrivals in $(0,t)$

$$B(t,n)=\int_0^te^{-\lambda t}\frac{(\lambda t)^{n-1}}{n!}dG_n(t)$$

$$B(t)=\sum_{n=1}^\infty B(t,n)$$