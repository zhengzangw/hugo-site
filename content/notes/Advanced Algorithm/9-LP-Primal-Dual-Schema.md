---
title: 9. Primal Dual
date: 2019-09-04
weight: 9
---

## Primal-Dual

* Primal

$$\min c^Tx\\s.t.\ Ax\geq b\\x\geq 0$$

* Dual

$$\max b^Ty\\s.t.\ y^TA\leq c^T\\y\geq 0$$

* Weak Duality Theorem: $\forall$ feasible primal solution $x$ and dual solution $y$

$$y^Tb\leq y^TAx\leq c^Tx$$

* Strong Duality Theorem: Primal LP has finite optimal solution $x^*$ iff dual LP has finite optimal solution $y^{*T}b=c^Tx^*$
* Complementary Slackness Condition: $\forall$ feasible primal solution $x$ and dual solution $y$, both $x$ and $y$ are optimal iff

$$\forall i:A_{i\cdot}x=b_i\vee y_i=0\\\forall j:y^TA_{\cdot j}=c_j\vee x_j=0$$

### Primal-Dual Schema

* Relaxed Complementary Slackness: $\forall$ feasible primal solution $x$ and dual solution $y$, for $\alpha,\beta\geq 1$

$$\forall i:A_{i\cdot}x\leq \alpha b_i\vee y_i=0\\\forall j:y^TA_{\cdot j}=\frac{c_j}{\beta}\vee x_j=0\\\Rightarrow c^Tx\leq\alpha\beta b^Ty\leq\alpha\beta\text{OPT}_{\text{IP}}$$

* The Primal-Dual Schema
  * Write down an LP-relaxation and its dual
  * Start with a primal infeasible solution $x$ and a dual feasible solution $y$ (usually $x=0,y=0$)
  * Raise $x$ and $y$ until $x$ is feasible:
    * raise $y$ until some dual constrints gets tight $y^TA_{\cdot j}=c_j$
    * raise $x_i$ (integrally) corresponding to the tight dual constraints
  * Show the complementary slackness conditions
    * $\forall i, A_{i\cdot}x\leq\alpha b_i$ or $y_i=0$
    * $\forall j,y^TA_{\cdot j}=c_j$ or $x_j=0$
    * $c^Tx\leq\alpha b^Ty\leq\alpha\text{OPT}$
* Integrality Gap: $\sup_I\frac{\text{OPT}(I)}{\text{OPT}_{\text{LP}}(I)}$

### Vertex Cover

* Primal

$$\min \sum_{v\in V}x_v\\s.t.\ \sum_{v\in e}x_v\geq 1,\forall e\in E\\ x_v\in\{0,1\},\forall v\in V$$

* Dual

$$\max \sum_{e\in E}y_e\\s.t.\ \sum_{e\owns v}y_e\leq 1,\forall v\in V\\y_e\geq 0,\forall e\in E$$

* Initially $x=0,y=0$
* Raise $x$ and $y$ until $x$ is feasible
  * pick an $e\in E$ and raise $y_e$ to 1, set $x_v=1$ for $v\in e$ and delete all $e\owns v$ from $E$
  * Find a maximal matching and return the set of matched vertices
* Integrality Gap: $2$

### Facility Location

* (P)Facility location
  * Instance
    * $F$: Facilities
    * $C$: clients
    * $f: F\rightarrow[0,\infty)$: Facility opening costs
    * $c: F\times C\rightarrow [0,\infty)$: Facility connecting cost
  * total cost: $\sum_{j\in C}c_{\phi(j),j}+\sum_{i\in I}f_i$
  * Find $I\subset F$ and $\phi:C\rightarrow I$ minimize total cost
  * NP-hard
* (P)Metric Facility Location: $c_{\phi(j),j}=d_{\phi(j)j}$
  * triangle inequality: $d_{i_1j_1}+d_{i_2j_1}+d_{i_2j_2}\geq d_{i_1j_2}$
* Primal

$$\min \sum_{i\in F,j\in C}d_{ij}x_{ij}+\sum_{i\in F}f_iy_i\\s.t.\ y_i-x_{ij}\geq0,\forall i\in F,j\in C\\\sum_{i\in F}x_{ij}\geq 1,\forall j\in C\\x_{ij},y_i\in\{0,1\},\forall i\in F,j\in C$$

* Dual

$$\max\sum_{j\in C}\alpha_j\\s.t.\ \alpha_j-\beta_{ij}\leq d_{ij},\forall i\in F,j\in C\\\sum_{j\in C}\beta_{ij}\leq f_i,\forall i\in F\\\alpha_j,\beta_{ij}\geq 0,\forall i\in F,j\in C$$

* Initially $\alpha=0,\beta=0$
* raise $\alpha_j$ for all client $j$ simultaneously at a uniform continous rate
  * upon $\alpha_j=d_{ij}$ for a closed facility $i$: edge $(i,j)$ is paid, fix $\beta_{ij}=\alpha_j-d_{ij}$
  * upon $\sum_{j\in C}\beta_{ij}=f_i$: tentatively open facility $i$; all unconnected clients $j$ with paid edge $(i,j)$ to facility $i$ are declared connected to facility $i$ and stop raising $\alpha_j$
  * upon $\alpha_j=d_{ij}$ for an unconnected client $j$ and tentatively open facility $i$: client $j$ is declared connected to facility $i$ and stop raising $\alpha$
* Integrality Gap: $3$