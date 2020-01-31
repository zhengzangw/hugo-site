---
title: Stochastic Processes
date: 2019-11-08
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