---
title: Quantum Algorithm
date: 2019-09-05
tags: [cs, physics, notes]
weight: 3
---

## Query value of function

* $U_f:|x,y\rangle\rightarrow|x,y\oplus f(x)\rangle$
  * $f:\{0,1\}^n\rightarrow\{0,1\}$
  * 对应的矩阵为置换阵 $2^n\times 2^n$
* Quantum Parallelism: $U_f H^{\oplus n}|0^n\rangle=\frac{1}{\sqrt{2^n}}\sum_x|x,f(x)\rangle$
* Store the query in phase: $O_f|x\rangle=(-1)^{f(x)}|x\rangle$
  * $U_f|x,-\rangle=(-1)^{f(x)}|x\rangle|-\rangle$
* Deutsch Algorithm
  * Question: Given a function $f:\{0,1\}\rightarrow\{0,1\}$, decide whether $f(0)=f(1)$
  * $|0\rangle \rightarrow H \rightarrow O_f \rightarrow H \rightarrow M(|0\rangle,|1\rangle)$
* Deutsch-Joszsa Algorithm
  * Question: Given a function $f:\{0,1\}^n\rightarrow\{0,1\}$, it is either constant or balanced($|f^{-1}(0)|=|f^{-1}(1)|=2^{n-1}$).
  * $|0\rangle^{\otimes n}\rightarrow H^{\otimes n}\rightarrow O_f\rightarrow H^{\otimes n}\rightarrow M(|0^n\rangle)$

## Quantum Teleportation

![Quantum Teleportation](/images/general/teleportation.png)

## Super-dense Coding

one qubit encode two bits (tight)

* share EPR state
* $00:I,01:Z,10:X,11:iY$

## Bernstein-Vazirani Algorithm

* For $N=2^n$, given $x\in\{0,1\}^N$, there is some unknown $a\in\{0,1\}^n$ such that $x_i=(i\cdot a)\bmod 2$. The goal is to find $a$
* Algorithm
  1. Prepare the state: $H|0^n\rangle$
  2. Make a query $O_f$: $\frac{1}{\sqrt{2^n}}\sum_{i\in\{0,1\}^n}(-1)^{x_i}|i\rangle=\frac{1}{\sqrt{2^n}}\sum_{i\in\{0,1\}^n}(-1)^{i\cdot a}|i\rangle=H^{\otimes n}|a\rangle$
  3. Apply $H^{\otimes n}$: $|a\rangle$

## Simon's Algorithm

* Simon's Problem(Hidden Shift): $N=2^n,x-(x_0,\cdots,x_{N-1}),x_i=\{0,1\}^n$, there is some unknown nonzero $s\in\{0,1\}^n$ such that $x_i=x_j$ iff $i=j$ or $i=j\oplus s$. The goal is to find $s$
* Algorithm
  1. Prepare the state: $H^{\oplus n}|0^n\rangle|0^n\rangle=\frac{1}{\sqrt{2^n}}\sum_{i\in\{0,1\}^n}|i\rangle|0^n\rangle$
  2. Make a query: $\frac{1}{\sqrt{2^n}}\sum_{i\in\{0,1\}^n}|i\rangle|x_i\rangle$
  3. Measure the second register.
     * Output $x_i$ w.p. $\frac{1}{2^n}$. 
     * Post-measurement state: $\frac{1}{\sqrt{2}}(|i\rangle+|i\otimes s\rangle)$
  5. Apply $H^{\otimes n}$
  6. Measure the register.
     * Output a random element from $\{j:s\cdot s=0\pmod 2\}$
  7. Repeat this procedure until we have obtained $n-1$ independent linear equations involving $s$
  8. Gaussian elimination modulo $2$
* Lower bound
  * decision version
    * Given: $N=2^n,x=(x_0,\cdots,x_{N-1}),x_i\in\{0,1\}^n$
    * Promise: $\exists s\in\{0,1\}^n$ such that $x_i=x_j$ iff $i=j$ or $i=j\oplus s$
    * Task: decide whether $s=0^n$
  * Proof
    * Let $\Pi$ be a $T$-query randomized algorithm that solve the problem w.p. $\geq\frac{2}{3}$
    * Let $r$ be internal randomness of $Pi$ ($\Pi_r$ is a determininistic algorithm)
    * Let $\mu$ be a distribution on the inputs
    * $P_{x\sim\mu}(\Pi(x)\text{ is correct})\geq\frac{2}{3}\Rightarrow P_{x\sim\mu,r}(\Pi_r(x)\text{ is correct})\geq\frac{2}{3}\Rightarrow\exists$ a deterministic $T$-query algorithm that solve the problem with probability $\geq\frac{2}{3}$ under $\mu$ (在一个概率分布下随机化为确定)
    * Find a "hard distribution" $\mu$:
      * $\mu(s=0)=\frac{1}{2}:x$ is a uniform random permutation of $\{0,1\}^n$
      * $\mu(s\not=0)=\frac{1}{2}:s$ is picked from a nonzero string at random. For each pair $\{i,i\oplus s\}$ in a lexicographic order, we pick $x_i$ at random without replacement
    * Let $i_1,\cdots,i_T$ be queries made by algorithm, $P(i_1,\cdots,i_k\text{ is bad})$ should $\leq\frac{1}{3}$
      * $\prod_i(1-x_i)\geq 1-\sum_i x_i$
    * $T=\Omega(\sqrt{2^n})$

## Complexity

* BPP: probabilistically polynomial-time computable by a classical computer
* BQP: probabilistically polynomial-time computable by a classical computer
* Theorem
  * $\text{P}\subseteq \text{NP}\subseteq \text{PSPACE}$
  * $\text{P}\subseteq \text{BPP}\subseteq\text{BQP}\subseteq\text{PSPACE}$

## Phase estimation

* Given a unitary gate $U$ and an eigenvector $|\varphi\rangle$ of $U$, $U|\varphi\rangle=\lambda|\varphi$, estimate $|\varphi\rangle$ ($\lambda=e^{i\phi}$, estimate $\phi\in [0,2\pi)$)
* Algorithm
  * Prepare the state: $F_N|0^n\rangle|\varphi\rangle=\frac{1}{\sqrt{2^n}}\sum_{j=0}^{N-1}|j\rangle|\varphi\rangle,N=2^n$
  * Make a query: $|j\rangle|\varphi\rangle\rightarrow |j\rangle U^j|\varphi\rangle$
  * Apply $F_N^{-1}$ to first $n$ qubits
  * Get $|\phi_1\phi_2\cdots\phi_n\rangle,\phi=2\pi * 0.\phi_1\phi_2\cdots\phi_n$

## Shor's Factoring Algorithm

* Factoring: Given a composite $N$, find an integer $1<p<N,p|N$
* Period-Finding: Given $f:\mathbb{N}\rightarrow Z_{N},f(a)=x^a\bmod N$ with the property for unknown $r\in Z_N,f(a)=f(b)$ iff $a=b\pmod{r}$
* Theorem (Shor): There exists a quantum algortihm solving Period-find algorithm using $O(\log\log N)$ evaluations of $f$ and $O(\log\log N)$ quantum Fourier transforms.
  * time complextity of each evaluation

![period find algorithm](/imgaes/../images/general/periodfind.png)

* Algorithm
  * Find $q=2^l,N^2<q\leq 2N^2$
  * Prepare the state: $\frac{1}{\sqrt{q}}\sum_{a=0}^{q-1}|a\rangle|0^q\rangle$
  * Make a query: $\frac{1}{\sqrt{q}}\sum_{a=0}^{q-1}|a\rangle|f(a)\rangle$
  * Apply $F_q$
    * Condition the second register is $f(s)$, the first register is $\frac{1}{\sqrt{m}}\sum_{j=0}^{m-1}|jr+s\rangle$

$$|\varphi_3\rangle=\frac{1}{\sqrt{m}}\sum_{j=0}^{m-1}\frac{1}{\sqrt{q}}\sum_{b=0}^{q-1}e^{\frac{2\pi i(jr+s)b}{q}}|b\rangle=\frac{1}{\sqrt{mq}}\sum_{b=0}^{q-1}=\frac{1}{\sqrt{mq}}\sum_{b=0}^{q-1}e^{2\pi i\frac{sb}{q}}(\sum_{j=0}^{m-1}e^{2\pi i\frac{jrb}{q}})|b\rangle$$
$$\sum_{j=0}^{m-1}e^{2\pi i\frac{jrb}{q}}=\begin{cases}m & e^{2\pi i\frac{rb}{q}}=1\\\frac{1-e^{2\pi i\frac{rb}{q}}}{1-e^{2\pi i\frac{rb}{q}}} & o.w.\end{cases}$$

* Case 1: $r|q$
  * $m=\frac{q}{r},e^{2\pi i\frac{rb}{q}}=1\iff \frac{rb}{q}$ is an integer $\iff\frac{q}{r}|b$
  * exactly $r$ such $b$ with amplitudes $\frac{1}{r}$
  * Get $b$, $\frac{b}{q}=\frac{c}{r}$
  * $c$ uniformly random in $[1,r-1]$, with probability $\Omega(\frac{1}{\log\log r}),c$ coprime with $r$
  * Repeat algorithm $O(\log\log N)$ times
* Case 2: $r\not|q$
  * $|\frac{1-e^{2\pi i\frac{mrb}{q}}}{1-e^{2\pi i\frac{rb}{q}}}|=|\frac{\sin(\pi mrb/q)}{\sin(\pi rb/q)}|$
  * w.h.p, $|\frac{b}{q}-\frac{c}{r}|\leq\frac{1}{2q}$
  * $r\not=r',r,r'<N$ then $|\frac{c}{r}-\frac{c'}{r'}|>\frac{1}{N^2}$
  * use continued fraction find the fraction with denominator $\leq N$ that is closest to $\frac{b}{q}$, which is $\frac{c}{r}$

### Reduction of Factoring to period-finding

* Theorem: $N$ is composite number $L$ bits long and $x$ is non-trival solution to equation $x^2=1\pmod{N}$ in range $1\leq x\leq N$. Then at least one of $\gcd(x-1,N)$ and $\gcd(x+1,N)$ is a non-trivial factor of $n$ that can be computed using $O(L^3)$ operation
  * 找模$N$下 $1$ 的非平凡平方剩余
* Lemma: $p$ is an odd prime, $2^d$ be the largest power of $2$ dividing $\varphi(p^\alpha)$, then $P_{x\sim U[Z^*_{p^\alpha}]}(2^d|\text{ord}(x\bmod p^\alpha))=\frac{1}{2}$
* Theorem: Suppose $N>0$ is an odd composite, $x\sim U[Z^*_N]$ and $r=\text{ord}(x\bmod{N})$, then $P(2|r\wedge x^{\frac{r}{2}}\not=-1\pmod{N})\geq 1-2^{-m}$
* Algorithm
  * if $2|N$, return $2$
  * Determine whether $N=a^b$ for $a\geq 1,b\geq 2$
  * Randomly choose $x$ in $Z_N$, if $\gcd(x,N)>1$ return $\gcd(x,N)$
  * Use period-finding subroutine find the $r=\text{ord}(x\bmod N)$
  * if $2|r,x^{\frac{x}{2}}\not=1\pmod{N}$ then compute $\gcd(x^{\frac{r}{2}-1})$ and $\gcd(x^{\frac{r}{2}+1},N)$, return the non-trivial factor. Otherwise, the algorithm fails.

### Hidden Subgroup Algorithm

* Problem: Given a known group $G$ and a map $f:G\rightarrow S$ where $S$ is some finite set. Suppose $f$ has the property that there exists a subgroup $H\leq G$ such that $f$ is constant within each coset and distinct on different cosets.
  * Goal: find $H$
* Discrete logarithm: find $\alpha,A=\gamma^\alpha$
* Algorithm for Abelian HSP
  * Initiate: $|0\rangle|0\rangle$ of dimensions $|G|$ and $|S|$
  * Prepare: $\frac{1}{\sqrt{G}}\sum_{g\in G}|g\rangle|0\rangle$
  * Query: $\frac{1}{\sqrt{g}}\sum_{g\in G}|g\rangle|f(g)\rangle$
  * Mesure the second registerm yielding $f(s)$ for $s\in G$: $\frac{1}{\sqrt{H}}\sum_{h\in H}|s+h\rangle$
  * Apply QFT: $\frac{1}{\sqrt{H}}\sum_{h\in H}|\chi_{s+h}\rangle$
  * Measure and output $g$
    * uniform random $g$ satisfying $\chi_g\in H^{\perp}=\{\chi_k|(\forall h\in H)\chi_k(h)=1\}$
    * output: $g_1,\cdots,g_t$
* Graph isomorphism
* Algorithm for Abelian HSP
  * $|g\rangle\rightarrow\sum_{\rho\in\hat G}\sqrt{\text{dim}\frac{\rho}{|G|}}|\rho\rangle\sum_{i,j=1}^{\text{dim}(\rho)}\rho(g)_{ij}|i,j\rangle$
  * Heisenberg group: $\text{poly}(\log|G|)$
  * solvable groups: $\text{poly}(\log|G|)$
  * nil-2 groups: $\text{poly}(\log|G|)$
  * dihedral groups: $2^{O(\sqrt{\log|G|})}$
* Query complexity of HSP
  * The quantum query complexity of HSP on any group $G$ is $O(\log^2|G|)$

### Grover's Search Algorithm

* Problem: $N=2^n$, given an arbitrary $x\in\{0,1\}^N$. The goal is to find $i$ such that $x_i=1$.
* Oracle query: $O|x\rangle|i\rangle=(-1)^{x_i}|x\rangle|i\rangle$ ($O_x|i\rangle=(-1)^{x_i}|i\rangle$)
* 以 $|\varphi\rangle$ 为对称轴反转矩阵：$U=2|\varphi\rangle\langle\varphi|-I$
* Grover iterate: $G=H^{\otimes n}RH^{\otimes n}O_x,R=2|0^n\rangle\langle0^n|-I$
  * $O_x=-(2|i_0\rangle\langle i_0|-I)$ (只有 $i_0=0$)
  * $H^{\otimes n}RH^{\otimes n}=2|\varphi\rangle\langle\varphi|-I$
* Algorithm
  * Initiate: $|U\rangle=H^{\otimes n}|0^n\rangle$
  * Repeat following $k=O(\frac{1}{\sqrt{\epsilon}})$ times
    * Apply $O_x$
    * Apply $H^{\otimes n}RH^{\otimes}$
  * Measure the first register and check that the resulting $i$ is a solution
* $|G\rangle=\frac{1}{\sqrt{t}}\sum_{i:x_i=1}|i\rangle$
* $|B\rangle=\frac{1}{\sqrt{t}}\sum_{i:x_i=0}|i\rangle$
* $O_x$: 在 $|B\rangle$ 上翻转
  * $\sin\theta=\sqrt{\frac{t}{N}}$
  * $|U\rangle=\sin\theta|G\rangle+\cos\theta|B\rangle$
  * $G^k|U\rangle=\sin(2k+1)\theta|G\rangle+\cos(2k+1)\theta|B\rangle$
  * $k'=\frac{\pi}{4\theta}-\frac{1}{2}=O(\frac{1}{\theta})=O(\sqrt{\frac{N}{t}}),t$ 为 $x_i=1$ 的个数
* If $t$ is unknown
  * $t\leq N/2$ then the eigenvalues are $e^{i\theta}$ and $e^{i(2\pi-\theta)}$

#### Optimality of Grover's algorithm

* Adversary Method
  * $|\psi_k^x\rangle=U_kO_xU_{k-1}O_x\cdots U_1O_x|\psi\rangle$
  * $|\psi_k\rangle=U_kU_{-1}\cdots U_1|\psi\rangle$
  * $D_k=\sum_x\||\psi_k^x\rangle-|\psi_k\rangle\|^2$
  * $D_k\leq 4k^2$
  * $D_k\geq cN$
* Polynomial method

### Amplitude amplification

* $\chi:\mathbb{Z}\rightarrow\{0,1\}$ be any Boolean function, suppose we have a quantum algorithm $A$ that uses no intermediate measurements and finds a solution $z\in\chi^{-1}(1)$ with probability $p$
* Suppose we have an algorithm check whether $z$ is a solution.
* Algorithm
  * Initiate: $|U\rangle=A|0\rangle$
  * Repeat $k=O(\frac{1}{\sqrt{p}})$
    * Apply $O_x$
    * Apply 
* Application
  * TSP: $O(\sqrt{n!})$
  * Satisfiability: $O(\sqrt{2^n}\text{poly}(n))$

### Random walk

* Problem: Given a d-regular simple graph $G=(V,E)$ with $m$ marked vertices, find one of the marked vertex.
* Normalized adjacency matrix $P$: $|V|\times|V|$ matrix $P(x,y)=\frac{1}{d},(x,y)\in E$ else $0$
* $P^kv(x,y)$: $v$ is $1$ at the starting position
* Stationary distribution: $G(V,E)$ is $d$-regular connected non-bipartite simple graph, then for any $v$, $P^kv$ will converge to a uniform distribution over all vertices
  * Spectral gap: $\delta=1-\lambda_2$
* Problem: $G=(V,E)$ with $\epsilon N$ marked vertices where $N=|V|$
  * $S$: set up an initial state $v$
  * $U$: update the current vertex
  * $C$: check whether the given vertex is marked
  * expected cost: $S+\frac{1}{\epsilon}(C+\frac{1}{\delta}U)$
* Quantum walk
  * Prepare: $|U\rangle=\frac{1}{\sqrt{N}}\sum_x|x\rangle|p_x\rangle$
  * Repeat the following $O(\frac{1}{\sqrt{\epsilon}})$ times
    * Reflect through $|B\rangle=\frac{1}{\sqrt{N-|M|}}\sum_{x\not\in M}|x\rangle|p_x\rangle$
    * Reflect through $|U\rangle$
  * Measure the first register and check the $x$ is marked
  * Time complexity: $S+\frac{1}{\sqrt{\epsilon}}(C+\frac{1}{\sqrt{\delta}}U)$
* Application
  * Grover Search
  * Collision Problem (03,tight)
  * Triangle finding problem

