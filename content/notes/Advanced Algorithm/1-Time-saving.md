---
title: 1. Time-saving
date: 2019-01-16
weight: 1
---

## Problems

- Min-Cut $\in\text{P}$
- Max-Cut $\in\text{NPH}$
- Polynomial Identity Testing (univariate) $\in$co-$\text{NPH}$
  - Input: a polynomial $f\in\mathbb{F}[x]$ of degree $d$
  - Determine whether $f\equiv0$
- PIT:
  - Input: two $n$-variate polynomials $f,g\in\mathbb{F}[x_1,x_2,\cdots,x_n]$ of degree $d$
  - Determine: $f\equiv g$
- Set Cover $\in\text{NPH}$:
  - Input: $m$ subsets $S_1,\cdots,S_m\subseteq U$ of a universe of size $n$
  - Output: $C\subseteq\{1,2,\cdots, m\}$ such that $U=\bigcup_{i\in C}S_i$
  - $\text{freq}(x)=|\{i|x\in S_i\}|$
- Hitting Set Problem $\in\text{NPH}$
  - Input: $n$ subsets $S_1,\cdots,S_m\subseteq U$ of a universe of size $m$
  - Output $C\subseteq U$ that $C$ intersects with every set $S_i$
  - $\text{freq}(x)=|S_i|$
  - equivalent to Set Cover
- Vertex Cover Problem $\in\text{NPH}$
  - Input: an undirect graph $G(V,E)$
  - Output: the smallest $C\subseteq V$ such that $\forall e\in E$ is incident to at least one vertex in $C$
  - set cover with frequency $2$
- Minimum Makespan on Identical Parallel Machine $\in\text{NPH}$
  - Input: $n$ positive integers $p_1,p_2,\cdots,p_n$ nad a positive integer $m$
  - Output: an assignment $\sigma:[n]\rightarrow[m]$ which minimizes $C_{\max}=\max_{i\in [m]}\sum_{j:i=\sigma(j)}p_j$
- Partition Problem $\in\text{NPH}$
  - Input: $S=\{x_1,\cdots,x_n\}$
  - Output: Whether there is a partition of $S$ into $A$ and $B$ such that $\sum_{x\in A}x=\sum_{x\in B}x$
- 算法设计
  - $\text{P}$: Randomize to accelerate
  - $\text{NPH}$
    - sampling: random approximation
    - greedy/local search: approximation

## Min-Cut

### Deterministic Algorithm

- Max-flow min-cut Theory: $(|V|-1)\times$ max-flow time
- Stoer–Wagner Algorithm(multi-graphs): $O(EV+V^2\log V)$
- Ken-ichi Kawarabayashi and Mikkel Thorup(simple graph, STOC 2015): near-linear time complexity

### Karger's Contraction Algorithm

- Contraction: merge two vertices into a new vertex
- Karger's Algorithm(1993): $\text{ZPP}$
  - Running time: $O(V^2)$
  - $P_c=\frac{2}{V(V-1)}$
  - w.h.p: $O(V^2\log V)$ times

```C
RandomContract(G){
  while V>2
    e = choose(E)
    contract(G,e)
  return remaining edges
}
```

- Analysis Details
  - Lemma: $E\geq\frac{VC}{2}$, min-cut $C$
  - $p_i=1-\frac{C}{E_i}\geq 1-\frac{2}{V_i}$
  - $p_{\text{correct}}\geq P_C=\prod_{i=1}^{n-2}P(e_i\not\in C|\forall j<i,e_j\not\in C)\geq \prod_{i=1}^{n-2}(1-\frac{2}{n-i+1})=\prod_{i=3}^{n}\frac{i-2}{i}=\frac{2}{n(n-1)}$

### Fast Min-Cut Algorithm

- Karger's Algorithm improved by recursion(1996)
  - Running time: $O(V^2\log V)$
  - $P_c=\Omega(\frac{1}{\log V})$
  - w.h.p: run $O(\log^2V)$ times

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

- Analysis Details
  - RandomContract(G,t): $P_{\text{survive}}=\frac{t(t-1)}{n(n-1)}$
    - $t=\lceil 1+\frac{n}{\sqrt{2}}\rceil,P\geq \frac{1}{2}$
  - $P_{\text{correct}}\geq 1-(1-\frac{1}{2}p(\lceil 1+\frac{n}{\sqrt{2}}\rceil))^2$
  - $T(n)=2T(\lceil 1+\frac{n}{\sqrt{2}}\rceil)+O(n^2)$
    - $T(n)=O(n^2\log_2n)$

## Max-Cut

### Greedy Heuristics

0.5-approximation algorithm

```C
GreedyMaxCut(V,E){
  S=T=emptyset
  for i=1,2,...,n (random order)
    vi joins one of S,T to maximize the current E(S,T)
}
```

- Analysis Details
  - $|E|=\sum_{i=1}^n(|E(S_i,\{v_i\})|+|E(T_i,\{v_i\})|)$
  - SOL$_G=\sum_{i=1}^n\max(|E(S_i,\{v_i\})|,|E(T_i,\{v_i\})|)\geq\frac{1}{2}E\geq\frac{1}{2}$OPT$_G$
- best known approximation ratio $\alpha^*\approx 0.878$ (best if assuming unique game conjecture)

### Derandomization from Average Case

- Randomized Algorithm: uniform and independent random bit $X_v\in\{0,1\}$
  - $\mathbb{E}(|E(S,T)|)=\sum_{uv\in E}\mathbb{E}(I(X_u\not=X_v))=\sum_{uv\in E}P(X_u\not= X_v)=\frac{|E|}{2}\geq\frac{\text{OPT}_G}{2}$
  - Probablistic method: $\exists \geq\frac{\text{OPT}_G}{2}$
  - solution space: $O(2^n)$
- Derandomization by Monotone Path: $\frac{\text{OPT}_G}{2}\leq\mathbb{E}(E(S,T))\leq\cdots\leq\mathbb{E}(E(S,T)|X_{v_1}=x_1,\cdots,X_{v_{i-1}})\leq\cdots$
  - This choice is equivalent to Greedy Heuristic one

```C
MonotonePath(V,E){
  S=T=emptyset
  for i=1,2,...,n (random order)
    vi joins one of S,T to maximize the average size of cut conditioning on the choices made so far by the vertice
}
```

### Derandomization by pairwise independence

- generate $n$ pairwise independent variables from $\log n$ mutually independent variables
  - Let $X_i$ be mutually indpendent uniform random bits
  - $S_i\subseteq 2^{[k]}$ be nonempty sets
  - $Y_i=\oplus_{j\in S_i}X_j$, $2^k-1$ pairwise independent varibles $Y_i$
- Randomized Algorithm: $X_v$ only need to be pairwise independent
  - solution space: $O(n^2)$
  - exhaustive search

```python
k = log(n)
for Y=0:2**k:
  X=generatePairwise(Y)
  t=assignVertexAccordingTo(X)
  ans = max(ans, t)
```

## Coupling

- Process $G_1$ and $G_2$ share same randomness
- stochastic dominance: partial orders of random variable
  - Statewise dominance: $A\geq B,\exists A>B$
  - first-order stochastic dominance (FSD): $P(A\geq x)\geq P(B\geq x),\exists xP(A\geq x)>P(B\geq x)$

## Polynomial Identity Testing

- Naive Randomized Algorithm for Univariate: co-$\text{RP}$
  - pick $r\in S$ and check $f(r)=0$
  - false posivitve: $f\not\equiv 0,P(f(r)=0))\leq\frac{d}{|S|}$
- multivariate polymonials
  - $f(x_1,\cdots,x_n)=\sum_{\sum_{j}i_j\leq d}a_{i_1,\cdots,i_n}x_1^{i_1}\cdots x_n^{i_n}$
  - total degree: $i_1+\cdots+i_n$
  - sum of monomials: # of coefficients ${n+d\choose d}\leq (n+d)^d$
  - product form: expend is expensive but evaluate is efficient
- Randomized Algorithm
  - $S\subseteq\mathbb{F}$
  - pick $r_1,\cdots,r_n\in S$ uniformly and independently at random
  - check $f(\overline{r})=0$
- Schwatz-Zippel Theorem: finte $\forall S\subset\mathbb{F},r_1,r_2,\cdots,r_n\in S$ choosed uniformly and independently at random, $P(f(r_1,r_2,\cdots,r_n)=0)\leq\frac{d}{|S|}$

## Set cover

- There is no poly-time algorithm with approximation ratio better than $(1-o(1))\ln n$ assuming that $\text{NP}\neq \text{P}$ (2014)

### Greedy Algorithm

- Algorithm
  - Initially $C=\emptyset$
  - while $U\not=\emptyset$ do
    - $C=C\cup\argmax_i|S_i\cap U|$
    - $U = U\backslash S_i$
- approximation ratio $H_n\approx\ln n$
- Vertex cover problem
  - $2$-approximation
  - (2008) no poly-time algorithm with approximation ratio $2-\epsilon$ assuming UGC

### Primal-Dual Algorithm

- (Dual Problem) Matching: $M\subseteq U$ that $\forall i,|S_i\cap M|\leq 1$
- Find a maimal $M$, return $C=\{i:S_i\cap M\not=\emptyset\}$
- $\max\text{freq}(x)$-approximation algorithm

## Scheduling

### Graham's List algorithm

- List Algorithm
  - for $j = 1,2,\cdots,n$: assign job $j$ to the machine that currently has the smallest load
- Approximation ratio: $2-\frac{1}{m}$

### Local Search

- start with a feasible solution, improve at each step by modifying locally
- start with an arbitrary schedule of $n$ jobs to $m$ machines
  - while (true)
    - let $\ell$ denote the job finished at last in the current schedule;
    - if there is machine $i$ such that job $\ell$ can finish earlier if transferred to machine $i$
      - job $\ell$ transfers to machine $i$
    - else break;
- Approximation ratio: $2-\frac{1}{m}$

### Longest Processing Time (LPT)

- Algorithm
  - sort $p_i$ in non-increasing order
  - assign job $j$ to the machine currently has the smallest load
- Approximation: $\frac{4}{3}$
- competitive ratio: $\forall$ input sequence $I$, $\text{SOL}_I\leq\alpha\text{OPT}_I,\text{OPT}_I$ is the solution returned by optimal oofline algorithm
