---
title: Monte Carlo Method
date: 2019-12-18
---

## Defintion

* Problem
  * Universe $U$, subset $S\subseteq U$ where $\rho=\frac{|S|}{|U|}$
  * Assume a uniform sampler for elements
  * Estimate $Z=|S|$
* Monte Carlo Method: sample $X_1,X_2,\cdots,X_N$ uniformly and independently from $U$, $Y_i=[X_i\in S]$, $\hat Z=\frac{|U|}{N}\sum_{i=1}^NY_i$
* Estimator Theorem(Naive): $N\geq\frac{4}{\epsilon^2\rho}\ln\frac{2}{\delta}=\Theta(\frac{1}{\epsilon^2\rho}\ln\frac{1}{\delta})\Rightarrow P(\hat Z$ is $\epsilon$-approx of $|S|)\geq 1-\delta$

## Counting DNF Solutions

#P-hard

* Naive: $\rho=\frac{|S|}{|U|}$ can be exponentially small
* Implicityly: $m$ sets $S_1,S_2,\cdots,S_m$, estimate $|\bigcup_{i=1}^mS_i|$
* Multiset Union: $\rho\geq\frac{1}{m}$
  * Assumption following is efficient
    * compute $|S_i|$
    * sample uniform $x\in S_i$
    * check $x\in S_i$
* Coverage Algorithm
  * Sample unifomr $(x,i)\in U$
    * Sample $i\in\{1,2,\cdots,m\}$
    * Sample uniform $x\in S_i$
  * check if $(x,i)\in\overline{S}$ (if $x\in S_i,\forall j<i,x\neq S_j$)
* Coverage Algorithm is a counting algorithm and also a sampling algorithm
  * Rejection sampling

## Counting CSP

* Poly-time inter-reducible
  * appox. counting
  * sampling an uniform random CSP solution
  * approx. inference: estimate the chance of a variable to have certain value in a CSP solution