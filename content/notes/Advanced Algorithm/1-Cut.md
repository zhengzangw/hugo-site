---
title: 1. Min-Cut and Max-Cut
date: 2019-01-16
weight: 1
---

## Min-Cut

### Deterministic Algorithm

* Max-flow min-cut Theory: $(|V|-1)\times$ max-flow time
* Stoer–Wagner Algorithm(multi-graphs): $O(|E||V|+|V|^2\log |V|)$
* Ken-ichi Kawarabayashi and Mikkel Thorup(simple graph, STOC 2015): near-linear time complexity

### Karger's Contraction Algorithm

* Contraction: merge two vertices into a new vertex
* Karger's Algorithm(1993)
  * Running time: $O(|V|^2)$
  * $P_c=\frac{2}{|V|(|V|-1)}$
  * Find a minimum cut with high probility(w.h.p $p_c=O(1-\frac{1}{n})$): run $O(|V|^2\log n)$ times

```C
RandomContract(G){
  while V>2
    e = choose(E)
    contract(G,e)
  return remaining edges
}
```

* Analysis Details
  * Lemma: $|E|\geq\frac{|V||C|}{2}$
  * $p_i=1-\frac{|C|}{|E_i|}\geq 1-\frac{2}{|V_i|}$
  * $p_{\text{correct}}\geq P_C=\prod_{i=1}^{n-2}P(e_i\in C|\forall j<i,e_j\not\in C)\geq \prod_{i=1}^{n-2}(1-\frac{2}{n-i+1})=\prod_{i=3}{n}\frac{i-2}{i}=\frac{2}{n(n-1)}$

### Fast Min-Cut Algorithm

* Karger's Algorithm improved by recursion
  * Running time: $O(|V|^2\log |V|)$
  * $P_c=\Omega(\frac{1}{\log |V|})$
  * Find w.h.p: run $O(\log^2|V|)$ times

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

* Analysis Details
  * RandomContract(G,t): $P_{\text{survive}}=\frac{t(t-1)}{n(n-1)}$
    * $t=\lceil 1+\frac{n}{\sqrt{2}}\rceil,P\geq \frac{1}{2}$
  * $P_{\text{correct}}\geq 1-(1-\frac{1}{2}p(\lceil 1+\frac{n}{\sqrt{2}}\rceil))^2$
  * $T(n)=2T(\lceil 1+\frac{n}{\sqrt{2}}\rceil)+O(n^2)$
    * $T(n)=O(n^2\log_2n)$

## Max-Cut

typical MAX-CSP, NP-hard  
conjecture N!=NP: no hope for a polynomial-time algorithm  
conjecture P=BPP: randomization alone not help


### Greedy Heuristics

0.5-approximation algorithm

```C
GreedyMaxCut(V,E){
  S=T=emptyset
  for i=1,2,...,n (random order)
    vi joins one of S,T to maximize the current E(S,T)
}
```

* Analysis Details
  * $|E|=\sum_{i=1}^n(|E(S_i,\{v_i\})|+|E(T_i,\{v_i\})|)$
  * SOL$_G=\sum_{i=1}^n\max(|E(S_i,\{v_i\})|,|E(T_i,\{v_i\})|)\geq\frac{1}{2}E\geq\frac{1}{2}$OPT$_G$
* best known approximation ratio $\alpha^*\approx 0.878$ (best if assuming unique game conjecture)

### Derandomization from Average Case

* Randomized Algorithm: uniform and independent random bit $X_v\in\{0,1\}$
  * $\mathbb{E}(|E(S,T)|)=\sum_{uv\in E}\mathbb{E}(I(X_u\not=X_v))=\sum_{uv\in E}P(X_u\not= X_v)=\frac{|E|}{2}\geq\frac{\text{OPT}_G}{2}$
  * Probablistic method: $\exists \geq\frac{\text{OPT}_G}{2}$
  * solution space: $O(2^n)$
* Derandomization by Monotone Path: $\frac{\text{OPT}_G}{2}\leq\mathbb{E}(E(S,T))\leq\cdots\leq\mathbb{E}(E(S,T)|X_{v_1}=x_1,\cdots,X_{v_{i-1}})\leq\cdots$
  * This choice is equivalent to Greedy Heuristic one

```C
MonotonePath(V,E){
  S=T=emptyset
  for i=1,2,...,n (random order)
    vi joins one of S,T to maximize the average size of cut conditioning on the choices made so far by the vertice
}
```

### Derandomization by pairwise independence

* generate $n$ pairwise independent variables from $\log n$ mutually independent variables
  * Let $X_i$ be mutually indpendent uniform random bits
  * $S_i\subseteq 2^{[k]}$ be nonempty sets
  * $Y_i=\oplus_{j\in S_i}X_j$, $2^k-1$ pairwise independent varibles $Y_i$
* Randomized Algorithm: $X_v$ only need to be pairwise independent
  * solution space: $O(n^2)$
  * exhaustive search

```python
for Y=0:2**k:
  X=generatePairwise(Y)
  t=assignVertexAccordingTo(X)
  ans = max(ans, t)
```

## Coupling

* Process $G_1$ and $G_2$ share same randomness
* stochastic dominance: partial orders of random variable
  * Statewise dominance: $A\geq B,\exists A>B$
  * first-order stochastic dominance (FSD): $P(A\geq x)\geq P(B\geq x),\exists xP(A\geq x)>P(B\geq x)$