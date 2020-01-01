---
title: 3. Sieve methods
date: 2019-09-04
weight: 3
---

## PIE

* PIE(Priciple of Inclusion-Exclusion)
  * $A_I=\bigcap_{i\in I}A_i$
  * $|\bigcup_{i=1}^nA_i|=\sum_{I\subseteq\{1,\cdots,n\},|I|\geq 1}(-1)^{|I|-1}|A_I|$
  * $|\bigcap_{i=1}^n\overline{A_i}|=\sum_{I\subseteq\{1,\cdots,n\}}(-1)^{|I|}|A_I|$
* Sieve methods: 计算恰好具备某种性质的 $\Rightarrow$ 计算不具有一系列坏性质的
  * Define $|U|$
  * Define 'bad' properties $A_i$
  * Use PIE count the number

### Surjections

* Count Surjections $f:N\rightarrow M$
* $U=\{f:[n]\rightarrow[m]\}, |U|=m^n$
* $A_i=\{f:[n]\rightarrow[m]\backslash\{i\}\},|A_i|=(m-1)^n$
* $A_I=\{f:[n]\rightarrow[m]\backslash I\},|A_I|=(m-|I|)^n$
* $|\bigcap_{i=1}^n\overline{A_i}|=\sum_{I\subseteq\{1,\cdots,n\}}(-1)^{|I|}|A_I|=\sum_{j=0}^m(-1)^j{m\choose j}(m-j)^n=m!{n\brace m}$

### Derangements

* fixed point $i$: $i\in\{1,2,\cdots,n\},\pi(i)=i$
* derangement of $\{1,2,\cdots,n\}$ is $\pi$ that has no fixed points
* $U=S_n,|U|=n!$
* $A_i=\{\pi|\pi(i)=i\}$, $|A_i|=(n-1)!$
* $|A_I|=(n-|I|)!$
* $\sum_{I\subseteq[n]}(-1)^{|I|}|A_I|=n!\sum_{k=0}^n\frac{(-1)^k}{k!}\approx\frac{n!}{e}$

### Permutations with restricted positions

* $B\subseteq [n]\times[n]$
* $G_\pi(V,E)=\{(i,\pi(i))|i\in [n]\}$
* $N_0=|\{\pi|B\cap G_\pi=\emptyset\}$ (Non-attacking rooks)
* $r_k:|\{S\in{B\choose k}|\forall(i_1,j_1),(i_2,j_2)\in S,i_1\not= i_2,j_1\not=j_2\}$
* $N_0=\sum_{k=0}^n(-1)^kr_k(n-k)!$

#### Derangement problem

$B=\{(i,i)|i\in [n]\}$

#### Probleme des menages
  
* $n$ couples at a circular table, M&F in alternate and no one sits next to his/her spouse
* Lady: $2(n!)$
* Men: $B=\{(0,0),(1,1),\cdots,(n-1,n-1),(0,1),(1,2),\cdots,(n-2,n-1),(n-1,0)\}$
  * $r_k$: choosingn $k$ points, no two consecutive, from a collection of $2n$ points arranged in a circle
    * line: ${m-k+1\choose k}$
    * circle: $\frac{m}{m-1}{m-k\choose k}$
* $N_0=\sum_{k=0}^n(-1)^k\frac{2n}{2n-k}{2n-k\choose k}(n-k)!$

### Euler totient function

* $\phi(n)=n\prod_{i=1}^r(1-\frac{1}{p_i})$
* $\sum_{d|n}\phi(d)=n$

## Inversion

* Poset $P$: partially ordered set
  * Set $P$ with $\leq_P$ satisfying reflexivity, antisymmetry and transitivity
  * comparable: $x\leq y$ or $y\leq x$
* incidence algebra: algebra $I(P)$ 
  * $I(P)=\{\alpha:P\times P\rightarrow\mathbb{R}|\alpha(x,y)=0,\forall x\not\leq_P y\}$ ($\alpha$ can be seen as matrix)
  * if $\alpha,\beta\in I(P)$ then $\alpha+\beta\in I(P)$
  * if $\alpha\in I(P)$ then $c\alpha\in I(P)$
  * $(\alpha\beta)(x,y)=\sum_{z\in P}\alpha(x,z)\beta(z,y)=\sum_{x\leq z\leq y}\alpha(x,z)\beta(z,y)$
* zeta function $\zeta(x,y)=[x\leq_P y]\in I(P)$
* Möbius function: $\mu\zeta=I$
  * $I(x,y)=[x=y]$
  * $\sum_{x\leq z\leq y}\mu(x,z)=[x=y]$

$$\mu(x,y)=
\begin{cases}
-\sum_{x\leq z<y}\mu(x,z) & x<y \\
1 & x=y \\
0 & x\not\leq y
\end{cases}
$$

* $P\times Q$: $\forall (x,y),(x',y')\in P\times Q,(x,y)\leq(x',y')$ iff $x\leq x',y\leq y'$
  * product rule: $\mu_{P\times Q}((x,y),(x',y'))=\mu_P(x,x')\mu_Q(y,y')$
* $(f\zeta)(x)=\sum_{y\in P}f(y)\zeta(y,x)=\sum_{y\leq x}f(y)$
* $(g\mu)(x)=\sum_{y\in P}g(y)\mu(y,x)=\sum_{y\leq x}g(y)\mu(y,x)$
  * $f,g:P\rightarrow \mathbb{R}$
* Mobius inversion formula
  * $\forall x\in P,g(x)=\sum_{y\leq x}f(y)\iff\forall x\in P,f(x)=\sum_{y\leq x}g(y)\mu(y,x)$
  * $f\zeta=g\iff f=g\mu$
  * dual form: $\zeta f\iff f=\mu g$

### 剩余系

$P=[n],\leq_P$ if $i=j+1$

$$\mu(i,j)=
\begin{cases}
1 & i=j \\
-1 & i+1=j \\
0 & o.w.
\end{cases}
$$

### Boolean algebra

$P=2^U,\leq_P$ is $\subseteq$

$$\mu(S,T)=
\begin{cases}
(-1)^{|T|-|S|} & S\subseteq T\\
0 & o.w.
\end{cases}
$$

* $g(J)=|\bigcap_{i\in J}A_i|=\sum_{i\supseteq J}f(I)$
* belongs to exactly the sets $A_i,i\in J$: $f(J)=|(\bigcap_{i\in J}A_i)\backslash(\bigcup_{i\not\in J}A_i)|=\sum_{I\supseteq J}g(I)\mu(J,I)=\sum_{I\supseteq J}(-1)^{|I|-|J|}|\bigcap_{i\in I}A_i|$
* PIE:
  * $f(\emptyset)=|U\backslash\bigcup_iA_i|=\sum_{I\subseteq[n]}(-1)^{|I|}|\bigcap_{i\in I}A_i|$
  * $\sum_{T\subseteq I\subseteq S}(-1)^{|S|-|I|}=0$ if $S\not=T$ else $1$, $A_1=A_2=\cdots=A_n=\{1\}$
* Bipartite Perfect Matching
  * $A_{i,j}=1$ if $(i,j)\in E$
  * perm(A) = $\sum_{\pi\in S_n}\prod_{i\in[n]}A_{i,\pi(i)}$ (#P-hard)
  * det(A) = $\sum_{\pi\in S_n}(-1)^{r(\pi)}\prod_{i\in[n]}A_{i,\pi(i)}$ (poly-time)
  * Ryser's formula: $\sum_{\pi\in S_n}\prod_{i\in[n]}A_{i,\pi(i)}=\sum_{I\subseteq[n]}(-1)^{n-|I|}\prod_{i\in[n]}\sum_{j\in I}A_{i,j}$
    * $O(n!)\rightarrow O(n2^n)$

### 数论

$P=\{a>0|a|n\},\leq_p$ is $|$

$$\mu(a,b)=
\begin{cases}
(-1)^r & \frac{b}{a} \text{ is the product of }r\text{ distinct primes} \\\\
0 & o.w.
\end{cases}
$$

* number-theoretical Mobius function: $\mu(\frac{n}{d})=\mu(n,d)$
  * $\sum_{d|n}\mu(d)=[n=1]$
  * $\phi\zeta=\text{id}$
  * $\phi=\text{id}\mu=\sum_{d|n}\mu(d)\frac{n}{d}$
* $g(n)=\sum_{d|n}f(d)$
* $f(n)=\sum_{d|n}g(d)\mu(\frac{n}{d})$
