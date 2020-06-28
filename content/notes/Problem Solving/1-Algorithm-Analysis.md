---
title: 1-算法复杂度分析与正确性证明
date: 2020-05-18
weight: 1
---

## 正确性证明

- Loop invariants
  - Initialization
  - Maintenance
  - Termination

## 时间复杂度

- cost: 硬件执行一条指令的代价
- times: 指令被执行的次数
- running time
- **计算方法**: $T(n)=\sum c_i n_i$
- worst-case running time
- average-case running time （按输入求期望）
- expected running time （任意输入，按程序随机数求期望）

### rate(order) of growth

- $\Theta(g(n)) = \{f(n):\exists c_1,c_2,n_0,\forall n\geq n_0,0\leq c_1g(n)\leq f(n)\leq c_2g(n)\}$
- $O(g(n)) = \{f(n):\exists c,n_0,\forall n\geq n_0, f(n)\leq cg(n)\}$
- $\Omega(g(n)) = \{f(n):\exists c,n_0,\forall n\geq n_0, 0\leq cg(n)\leq f(n)\}$
- $o(g(n)) = \{f(n):\exists c,n_0,\forall n\geq n_0, 0\leq f(n)< cg(n)\}$
- $\omega(g(n)) = \{f(n):\exists c,n_0,\forall n\geq n_0, 0<cg(n)\leq f(n)\}$
- $\lg(n!)=\Theta(n\lg n)$ (Stirling's approximation: $n ! =\sqrt{2\pi n})(\frac{n}{e})^n(1+\Theta(\frac{1}{n}))$
- $\lg^*n=\min\{i\geq 0:\lg^{(i)}n\leq 1\}$
- $F_i=\lfloor \frac{\phi^i}{\sqrt{5}}+\frac{1}{2}\rfloor$

### 递归时间复杂度分析

- substitution method
  - Guess the form of the solution
  - Use mathematical induction to prove
- recursion-tree method
  - node represents cost of single subproblem
- master method: $T(n)=aT(\frac{n}{b})+f(n)$
  - $\exists \epsilon>0,f(n)=O(n^{\log_ba-\epsilon}),T(n)=\Theta(n^{\log_ba})$
  - $f(n)=\Theta(n^{\log_ba}),T(n)=\Theta(n^{\log_ba}\lg n)$
  - $\exists \epsilon>0,f(n)=\Omega(n^{\log_ba+\epsilon}),\forall c<1,n>n_0,af(\frac{n}{b})\leq cf(n),T(n)=\Theta(f(n))$

### Probalistic analysis

- 平均/期望复杂度分析
  - $E[X]=\sum_{x=1}^n xP(X=x)=\sum_{i=1}^nE[X_i]$
- uniform random permutation
  - permute-by-sorting
  - permute-in-place

## 问题下界

- sort: decision-tree model $O(n)$

## 摊还分析

- amortized cost: average cost of each operation in the worst case
- aggregate analysis
- accounting method: assign amortized cost, credit nonnegative
- potential method: $\hat c_i=c_i+\Phi(D_i)-\Phi(D_{i-1})$
