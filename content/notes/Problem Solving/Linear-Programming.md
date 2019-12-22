---
title: Linear Programming
date: 2019-02-24
tags: [ps, notes]
---

# Linear Programming

* Linear Programming Problem: the problem of either minimizing or maximizing a linear function subject to a finite set of linear constraints
  * feasible solution, feasible area, objective function, objective value, optimal solution, optimal objective value
* unbounded: have a infinite objective value
* infeasible: no feasible value
* Equivalent: for each feasible solution $\overline{x}$ to $L$ with objective value $z$, there is a corresponding feasible solution $\overline{x}'$ to $L'$ with objective value $z'$, and for each feasible solution $\overline{x}'$ to $L'$ with objective value $z'$, there is a corresponding feasible solution $\overline{x}$ to $L$ with objective value  ́.

<!--more-->

## Standard Form

* Maximize $\sum_{j=1}^nc_jx_j$
* subject to $\sum_{j=1}^na_{ij}x_j\leq b_i, x_{j}\geq 0$
* Converting to Stand Form
  * Turn Minimize to Maximize
  * $x=x_1-x_2,x_1>0,x_2>0$
  * Turn equation to inequation
  * Turn $\geq$ to $\leq$
* $(A,b,c)$
  * Maximize $c^Tx$
  * subject to $Ax\leq b,x\geq 0$

## Slack Form

* Maximize $\sum_{j=1}^nc_jx_j$
* subject to $x_t=\sum_{j=1}^nt_jx_j,x_i>0$
* basic variable: Left side of equation
* nonbasic variable: Right side of equation
* $(N,B,A,b,c,v)$
  * Maximize $v+c*x$
  * subject to $x_i=b_i-\sum_{j\in N}a_{ij}x_j$

<!--more-->

## Formulating Problems

* Shortest Path
  * Maximize $d_t$
  * subject to $d_v\leq d_u+w(u,v),d_s=0$
* Maximum Flow
  * Maximize $\sum_{v\in V}f_{sv}-\sum_{v\in V}f_{vs}$
  * subject to $f_{uv}\leq c(u,v),\sum_{v\in V}f_{vu}=\sum_{v\in V}f_{uv},f_{uv}\geq 0$
* Minimum-cost Flow
  * Minimize $\sum_{(u,v)\in E}a(u,v)f_{uv}$
  * subject to $f_{uv}\leq c(u,v), \sum_{v\in V}f_{vu}-\sum_{v\in V}f_{uv}=0,f_{uv}\geq 0,\sum_{v \in V}f_{sv}-\sum_{v\in V}f_{vs}=d$
* Multicommodity Flow
  * Minimize $0$
  * subject to $\sum_{i=1}{k}f_{iuv}\leq c(u,v),\sum_{v\in V}f_{iuv}-\sum_{v\in V}f_{ivu} = 0,\sum_{v\in V}f_{is_iv}-\sum_{v\in V}f_{ivs_i}=d_i,f_{iuv}\geq 0$

## Simplex Algorithm

* basic solution: set N to be 0, calculating B
* pivot: choose a nonbasic varible(entering variable) and a basic variable(leaving variable) and exchange their roles.
  * $(N,B,A,b,c,v)\rightarrow (\hat{N},\hat{B},\hat{A},\hat{b},\hat{c},\hat{v})$
* Proof:
  * 若初始解可行，最终返回一个可行解或无解
  * 算法会终止
    * 至多$\binom{n+m}{m}$次迭代
    * Bland 规则必终止
  * 返回解最优
  * 可以找到初始可行值
    * Maximize $-x_0$
    * subject to $A^Ty-c\geq 0$

## Duality

* 标准型转换
  * prime linear program
    * Maximize $c^Tx$
    * subject to $Ax\leq b,x\geq 0$
  * dual linear program
    * Minmize $b^Ty$
    * subject to $A^Ty\geq c,y\geq 0$
* 一般型转换

| prime | dual |
|---| ---|
| $\max c_1x_1+\cdots+c_nx_n$ | $\min b_1y_1+\cdots+b_my_m$ |
| $a^Tx\geq b$ | $y_i\leq 0$ |
| $a^Tx=b$ | - |
| $a^Tx\leq b$ | $y_i\geq 0$ |
| - | $y_i=0$ |
| $x_i\geq 0$ | $a^Ty\geq c$ |
| $x_i\leq 0$ | $a^Ty\leq c$ |
| - | $a^Ty=c$ |
| $x_i=0$ | - |

* Weak Duality Theorem: $\forall$ feasible primal solution $x$ and dual solution $y$, $b^Ty\geq c^Tx$
* Strong Duality Theorem: Primal LP has finite optimal solution $x^*$ iff dual LP has finite optimal solution $y^*$, $y^{*T}b=c^Tx^*$
* Complementary Slackness Conditions: $\forall$ feasible primal solution $x$ and dual solution $y$, $x$ and $y$ are both optimal iff
  * $\forall i$: either $A_{i\cdot}x=b_i$ or $y_i=0$
  * $\forall j$: either $y^TA_{\cdot j}=c_j$ or $x_j=0$
* Relaxed Complementary Slackness Conditions: $\forall$ feasible primal solution $x$ and dual solution $y$
  * $\forall i$: either $A_{i\cdot}x\leq \alpha b_i$ or $y_i=0$
  * $\forall j$: either $y^TA_{\cdot j}=c_j/\beta$ or $x_j=0$
  * then $c^Tx\leq \alpha\beta b^Ty\leq\alpha\beta\text{OPT}_\text{LP}$
* Fundamental theorem of linear programming
  * Any linear program L, given in standard form, either:
    * has an optimal solution with a finite objective value
    * infeasible
    * unbounded

## Code

```C
//n: number of variable
//m: number of restriction

void pivot(int l, int e) {
    b[l] /= a[l][e];
    for (int j = 1; j <= n; j++)
        if (j != e) a[l][j] /= a[l][e];
    a[l][e] = 1 / a[l][e];

    for (int i = 1; i <= m; i++)
        if (i != l && fabs(a[i][e]) > 0) {
            b[i] -= a[i][e] * b[l];
            for (int j = 1; j <= n; j++)
                if (j != e) a[i][j] -= a[i][e] * a[l][j];
            a[i][e] = -a[i][e] * a[l][e];
        }

    ans += c[e] * b[l];
    for (int j = 1; j <= n; j++)
        if (j != e) c[j] -= c[e] * a[l][j];
    c[e] = -c[e] * a[l][e];
}

double simplex() {
    while (true) {
        int enter = 0, leave = 0;
        // Select enter variable
        for (enter = 1; enter <= n; ++enter)
            if (c[enter] > eps) break;
        if (enter == n + 1) return ans;
        // Select leave variable
        double mn = INF;
        for (int i = 1; i <= m; ++i)
            if (a[i][enter] > eps && mn > b[i] / a[i][enter]) {
                mn = b[i] / a[i][enter];
                leave = i;
            }
        if (mn == INF) return INF;
        pivot(leave, enter);
    }
}
```