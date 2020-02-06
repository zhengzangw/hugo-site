---
title: Stochastic Processes
date: 2019-11-08
weight: 1
---

## Probability

### Definition of Probability

Three Axioms

* $0\leq P(E)\leq 1$
* $P(S)=1$
* For any sequence of eventes $E_1,E_2,\cdots,$ that are mutually exclusive
  
  $$P(\bigcup_{i=1}^\infty E_i)=\sum_{i=1}^{\infty}P(E_i))$$

### Sequence of Events

* increasing sequence of events: $\{E_n,n\geq 1\},E_n\subset E_{n+1}$
  
  $$\lim_{n\rightarrow\infty}E_n=\bigcup_{i=1}^\infty E_i$$

* decreasing sequence of events: $\{E_n,n\geq 1\},E_n\supset E_{n+1}$
  
  $$\lim_{n\rightarrow\infty}E_n=\bigcap_{i=1}^\infty E_i$$

* for an increasing or decreasing sequences of events
  
  $$\lim_{n\rightarrow\infty}P(E_n)=P(\lim_{n\rightarrow\infty}E_n)$$

* Borel-Cantelli Lemma
  
  if $\sum_{n=1}^{\infty}P(E_n)<\infty$, then 
  
  $$P(\text{an infinite number of the }E_i\text{ occur})=P(\lim\sup_{t\rightarrow\infty}E_i)=P(\bigcap_{n=1}^\infty\bigcup_{i=n}^\infty E_i)=0$$

* Converse
  
  $E_i$ are independent events, $\sum_{n-1}^\infty P(E_n)=\infty$, then 
  
  $$P(\text{an infinite number of the }E_i\text{ occur})=1$$

## Random Variable

* Random Varible $X$: a function that assigns a real value to each outcome in $S$

    $$P(X\in A)=P(X^{-1}(A))$$

* Distribution function $F$:

    $$F(x)=P(X\leq x)=P(X\in(-\infty,x])$$
    $$\overline{F}(x)=P(X>x)$$

## Expected Value

* $$E[X]=\int_{-\infty}^{\infty}xdF(x)=\begin{cases}\int_{-\infty}^{\infty}xf(x)dx \\ \sum_xxP(X=x)\end{cases}$$
* $$Var[X]=E[X^2]-E^2[X]$$
* $$Var[\sum X_i]=\sum Var(X_i)+2{\sum\sum}_{i<j}Cov(X_i,X_j)$$
* $$Cov(X,Y)=E[XY]-E[X]E[Y]$$

### Probability Identities

Let $A_1,A_2,\cdots,A_n$ be events; $I_i=[[A_i$ occurs$]]$; $N=\sum_{i=1}^nI_i$; $I=[[N>0]]$

* 容斥原理

  $$\begin{aligned}
  1-I &= (1-1)^N \\
      & = \sum_{i=0}^n{N\choose i}(-1)^i\\
  E[I] &= E[N] = E[{N\choose 2}] +\cdots + (-1)^{n+1}E[{N\choose n}]\\
  P(\bigcup_{1}^{n}A_i) &=\sum_{i=1}^n P(A_i)-{\sum\sum}_{i<j}P(A_iA_j)+\cdots+(-1)^{n+1}P(A_1A_2\cdots A_n)
  \end{aligned}$$

* exactly $r$ of the events $A_1,\cdots, A_n$ occur

  $$\begin{aligned}
  I_r &= [[N=r]] \\
      &= {N\choose r}(1-1)^{N-r}\\
      &= {N\choose r}\sum_{i=0}^{N-r}{N-r\choose i}(-1)^i \\
      &= \sum_{i=0}^{n-r}{N\choose r+i}{r+i\choose r}(-1)^i\\
  P   &= E[I_r] =\sum_{i=0}^{n-r}(-1)^i{r+i\choose r}E[{N\choose r+i}]\\
      &= \sum_{i=0}^{n-r}(-1)^i{r+i\choose r}{\sum\cdots\sum}_{j_1<j_2<\cdots j_{r+i}}P(A_{j_1}\cdots A_{j_{r+i}})
  \end{aligned}$$

## Moment Generating

* moment generating function of $X$

  $$ \psi(t)=E[e^{tX}]=\int e^{tX}dF(x)$$

  $E[X^n]=\psi^n(0),n\geq 1$

* moment generating function of random variable $X_1,\cdots,X_n$

  $$ \psi(t_1,\cdots,t_n)=E[e^{\sum_{j=1}^nt_jX_j}]$$

  MGF determines probability distribution, but doesn't always exist

* characteristic function of $X$

  $$\phi(t)=E[e^{itX}]$$
  
  CF determines probability distribution, and always exist

* Laplace transform of distribution $F$ (for nonnegative values):

  $$\widetilde{F}(s)=\int_{0}^{\infty}e^{-sx}dF(x)$$

## Conditional Expectation

* $$E[X|Y=y]=\int_{-\infty}^{\infty}xdF(x|y)$$
* $$E[X]=E[E[X|Y]]=\int E[X|Y=y]dF_Y(y)$$

### Ballot Problem

The probability $A$ receiving $n$ votes is always ahead in the count of $B$ receiving $m$ votes: $\frac{n-m}{n+m}$

## Exponential Distribution

* $E[e^{tX}]=\int_0^{\infty}e^{tx}\lambda e^{-\lambda x}dx=\frac{\lambda}{\lambda-t}$
* Gamma with parameters $(n,\lambda)$: $S=\sum X$
  * $E[e^{tS}]=(\frac{\lambda}{\lambda-t})^n$
  * $f(x)=\frac{\lambda e^{-\lambda x}(\lambda x)^{n-1}}{\Gamma(n-1)}$
* memeoryless: $P(X>s+t|X>t)=P(X>s)$
* failure rate funtion: probability intensity that a $t$-year-old item will fail

  $$\lambda(t)=\frac{f(t)}{\overline{F}(t)}$$

  $$\overline{F}(t)=\exp(-\int_{0}^t\lambda(t)dt)

## Inequality

* Jensen's inqeuality: $E[f(X)]\geq f(E[X])$

## Stochastic Process

* stochastic process $\underline{X}=\{X(t),t\in T\}$, $T$ is an index set
* discrete-time stochastic process: $T$ is a countable set
* sample path: realization of $\underline{X}$
* independent increments (continuous-time): $X(t_n)-X(t_{n-1})$ are independent
* stationary increments: $X(t+s)-X(t)$ has same distribution for all $t$