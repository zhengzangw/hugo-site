---
title: 8. Rounding Linear Programs
date: 2019-09-04
weight: 8
---

## LP Relaxation & Rounding

* Represent problem as Integer Linear Program(ILP)
* Relaxation: relax ILP to LP
* Find the optimal fractional solution $x^*$ of LP
  * ellipsoid
  * interior-point
* Rounding: round the solution to a feasible integral solution $\hat x$
* Integrality Gap = $\sup_I\frac{\text{OPT}(I)}{\text{OPT}_{\text{LP}}(I)}$

### Vertex Cover

$$\min \sum_{v\in V}x_v\\s.t. \sum_{v\in e}x_v\geq 1,e\in E\\x_v\in \{0,1\},v\in V$$

Rounding

$$\hat x_v=\begin{cases}1&x_v^*\geq 0.5\\0&o.w.\end{cases}$$

Integrality Gap: $2$

### MAX-SAT

#### Random solution

$$P(C_j\text{ is satisfied})\geq(1-2^{-k})y_j^*$$

$\frac{1}{2}$-approximation

#### LP relaxation and randomized roudning

$$\max \sum_{j=1}^my_j\\s.t. \sum_{i\in S_j^+}x_i+\sum_{i\in S_j^-}(1-x_i)\geq y_j\\x_i\in\{0,1\},y_j\in\{0,1\}$$

Random Rounding

$$\hat x_i=\begin{cases}1& w.p.\ x_i^*\\0& w.p.\ 1-x_i^*\end{cases}$$

Analysis

$$P(C_j\text{ is satisfied})\geq(1-(1-\frac{1}{k})^k)y_j^*\geq(1-\frac{1}{e})y_j^*\\E[\text{\# of satisfied clauses}]\geq(1-\frac{1}{e})\text{OPT}$$

$(1-\frac{1}{e})$-approximation

#### Combination

![average](/images/content/AALProunding.png)

Sample random solution, satisfy $m_1$ clauses  
Randomized rounding LP-relaxation, satisfy $m_2$ clauses

$$E[\max(m_1,m_2)]\geq E[\frac{m_1+m_2}{2}]\geq\frac{3}{4}\text{OPT}$$

Integrality gap: $\frac{3}{4}$  
MAX-3SAT has a $\frac{7}{8}$-approximation algorithm by semidefinite programming and cannot have $>\frac{7}{8}$-approx unless NP=P