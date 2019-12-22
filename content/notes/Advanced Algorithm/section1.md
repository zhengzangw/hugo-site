---
title: 1. Min-Cut and Max-Cut
date: 2019-01-16
tags: [ps, math, notes]
weight: 1
---

## Min-Cut

### deterministic algorithm

* max-flow min-cut
* Stoer–Wagner algorithm $O(mn+n^2\log n)$

### Karger's Contraction Algorithm

```C
RandomContract(G){
  while V>2
    e = choose(E)
    contract(G,e)
  return remaining edges
}
```

* RandomContract: $O(|V|^2)$
  * Contract(G,e) can be inplemented within $O(|V|)$
* $|E|\geq\frac{|V||C|}{2}$
* $p_i=1-\frac{|C|}{|E_i|}\geq 1-\frac{2}{|V_i|}$
* $p_{\text{correct}}\geq P_C=\prod_{i=1}^{n-2}P(e_i\in C|\forall j<i,e_j\not\in C)\geq \prod_{i=1}^{n-2}(1-\frac{2}{n-i+1})=\prod_{i=3}{n}\frac{i-2}{i}=\frac{2}{n(n-1)}$
* Run $t=\frac{n(n-1)\ln n}{2}$ times, $P=1-(1-\frac{2}{n(n-1)})^\frac{n(n-1)\ln n}{2}\geq 1-\frac{1}{n}$
  * $O(n^4\log n)$

### Fast Cut

```C
FastCut(G){
  if (V<=6) return brute_force(V)
  else {
    t = ceil(1+V/sqrt(2))
    G1 = RandomContract(G,t)
    G2 = RandomContract(G,t)
    return min(FastCut(G1), FastCut(G2))
  }
}
```

* RandomContract(G,t): $P_{\text{survive}}=\frac{t(t-1)}{n(n-1)}$
  * $t=\lceil 1+\frac{n}{\sqrt{2}}\rceil,P\geq \frac{1}{2}$
* $P_{\text{correct}}\geq 1-(1-\frac{1}{2}p(\lceil 1+\frac{n}{\sqrt{2}}\rceil))^2$
* $p(n)=\Omega{(\frac{1}{\log n})}$
  * $p(n)=\Omega(\frac{1}{\log n})$
* $T(n)=2T(\lceil 1+\frac{n}{\sqrt{2}}\rceil)+O(n^2)$
  * $T(n)=O(n^2\log_2n)$
* Run $t=(\log n)^2$ times, $P\geq 1-\frac{1}{n}$
  * $O(n^2\log^3 n)$

## Max-Cut

NP-hard

### Greedy Heuristics

```C
GreedyMaxCut(V,E){
  S=T=emptyset
  for i=1,2,...,n
    vi joins one of S,T to maximize the current E(S,T)
}
```

* $|E|=\sum_{i=1}^n(|E(S_i,\{v_i\})|+|E(T_i,\{v_i\})|)$
* SOL$_G=\sum_{i=1}^n\max(|E(S_i,\{v_i\})|,|E(T_i,\{v_i\})|)\geq\frac{1}{2}E\geq\frac{1}{2}$OPT$_G$
  * 0.5-approximation algorithm
* best known approximation ratio $\alpha^*\approx 0.878$

### Derandomization from Average Case

* $\mathbb{E}(|E(S,T)|)=\sum_{uv\in E}\mathbb{E}(I(X_u\not=X_v))=\sum_{uv\in E}P(X_u\not= X_v)=\frac{|E|}{2}\geq\frac{\text{OPT}_G}{2}$
  * there must exist a bipartition of size at least $\frac{\text{OPT}_G}{2}$
* monotone path: $\frac{\text{OPT}_G}{2}\leq\mathbb{E}(E(S,T))\leq\cdots\leq\mathbb{E}(E(S,T)|X_{v_1}=x_1,\cdots,X_{v_{i-1}})\leq\cdots$
* $v_{i}$ joins one of $S,T$ to maximize the average size of cut conditioning on the choices made so far by the vertice

### Derandomization by pairwise independence

```C
for all x in {0,1}^k
  generate y_i, split into S,T
return {S,T} with the largest E(S,T)
```

* $\mathbb{E}(|E(S,T)|)=\frac{|E|}{2}$ only requires pair-wise independent
* generate $n$ $X$ by $k=\lceil\log(n+1)\rceil$ $Y$
  * exhaustive search in a smaller soulution space of size $2^k-1=O(n)$ 

## HW


* 耦合两个过程
  * 单调性 $G_1\subseteq G_2$
  * $P(p(G_1))\leq P(p(G_2))$
* stochastic dominance
  * Statewise dominance
  * first-order stochastic dominance (FSD)