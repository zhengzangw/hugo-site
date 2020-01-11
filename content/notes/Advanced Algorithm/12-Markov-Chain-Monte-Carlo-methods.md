---
title: Markov Chain Monte Carlo Methods
date: 2019-12-18
weight: 12
---

## Median Trick

* $\forall\epsilon$, return a $\hat Z$ in time Poly($|\phi|,\frac{1}{\epsilon}$), $P((1-\epsilon)Z\leq\hat Z\leq(1+\epsilon)Z)\geq\frac{2}{3}$
* Repeat $O(\log(\frac{1}{\delta}))$ and choose median number (Chernoff Bound)
* FPRAS: $\forall\epsilon,\delta$, return a $\hat Z$ in time Poly($|\phi|,\frac{1}{\epsilon},\log\frac{1}{\delta}$), $P((1-\epsilon)Z\leq\hat Z\leq(1+\epsilon)Z)\geq1-\delta$

## Monte Carlo Method

* (P)Problem
  * Universe $U$, subset $S\subseteq U$ where $\rho=\frac{|S|}{|U|}$
  * Assume a uniform sampler for elements
  * Estimate $Z=|S|$
* Monte Carlo Method
  * Sample $X_1,X_2,\cdots,X_N$ uniformly and independently from $U$
  * $Y_i=[X_i\in S]$
  * counting: $\hat Z=\frac{|U|}{N}\sum_{i=1}^NY_i$
* $\epsilon$-approx estimator: $(1-\epsilon)Z\leq\hat Z\leq(1+\epsilon)Z$
* Estimator Theorem(Naive): $N\geq\frac{4}{\epsilon^2\rho}\ln\frac{2}{\delta}=\Theta(\frac{1}{\epsilon^2\rho}\ln\frac{1}{\delta})\Rightarrow P(\hat Z$ is $\epsilon$-approx of $|S|)\geq 1-\delta$

### Counting DNF Solutions

* (P)Counting DNF Solutions
  * Input: DNF formula $\phi:\{T,F\}^n\rightarrow\{T,F\},U=\{T,F\}^n$
  * Output: $Z=|\phi^{-1}(T)|,S=\phi^{-1}(T)$
  * #P-hard
  * $\rho=\frac{|S|}{|U|}$ can be exponentially small
* (P)Union of Sets
  * Input: $m$ sets $S_1,S_2,\cdots,S_m$, estimate $|\bigcup_{i=1}^mS_i|$
  * Output: $|\bigcup_{i=1}^mS_i|$
* Coverage Algorithm: $\rho\geq \frac{1}{m}$
  * $U=\{(x,i)|x\in S_i\}$ (multiset union)
  * $\overline{S}=\{(x,i^*)|x\in S_{i^*}\text{ and }x\in S_i\Rightarrow i^*\leq i\}$
  * Sample unifomr $(x,i)\in U$
    * Sample $i\in\{1,2,\cdots,m\}$
    * Sample uniform $x\in S_i$
  * check if $(x,i)\in\overline{S}$
    * $x\in S_i$
    * and $\forall j<i,x\not\in S_j$
* Counting by Coverage Algorithm: $|U|=\sum_i|S_i|$
* Sampling by Coverage Algorithm: Rejection Sampling

## Markov Chain

$$\{X_t|t\in T\},X_t\in\Omega$$

* discrete time: $T=\{0,1,\cdots\}$
* discrete space: $\Omega$ is finite
* state $X_t\in\Omega$
* chain: stochastic process in discrete time and discrete state space  
* Markov property(memoryless): $X_{t+1}$ depends only on $X_t$  

$$ P[X_{t+1}=y|X_0=x_0,\cdots,X_{t-1}=x_{t-1},X_t=x]=P[X_{t+1}=y|X_t=x] $$

* Markov chain(memoryless): discrete time discrete space stochastic process with Markov property
* homogeneity: transition does not depend on time
* homogenous Markov chain $\mathfrak{M} = (\Omega,P)$: $P[X_{t+1}=y|X_t=x]=P_{xy}$
  * transition matrix $P$ over $\Omega\times\Omega$
  * (row-)stochastic matrix $P\mathbf{1}=\mathbf{1}$
  * distribution $p^{(t)}(x)=P[X_t=x]$
  * $p^{(t+1)}=p^{(t)}P$
* stationary distribution $\pi$ of matrix $P$: $\pi P=\pi$  
* Perron-Frobenius Theorem

### Fundamental Theorem of Markov Chain
  
If a **finite** Markov chain is **irreducible** and **ergodic**(aperiodic), then $\forall$ initial distribution $\pi^{(0)},\lim_{t\rightarrow\infty}\pi^{(0)}P^t=\pi$ where $\pi$ is a **unique** stationary distribution
  
* **finite**: the stationary distribution $\pi$ exists
* **irreducible**: the stationary distribution is unique
  * all pairs of states communicate
  * Special case
    * not connected: $\pi=\lambda\pi_A+(1-\lambda)\pi_B$
    * weak connected(absorbing case): $\pi=(0,\pi_B)$
* **aperiodicity**: distribution converges to $\pi$
  * period of state $x$: $d_x=\gcd\{t|P^t(x,x)>0\}$
  * aperiodic: all states have period $1$
  * if $\forall x\in\Omega,P(x,x)>0$(self-loop), then a chain is aperiodic
  * $x$ and $y$ communicate $\Rightarrow$ $d_x=d_y$

If Markov chain is infinite: positive recurrent

### Random Walk

* random walk: Markov Chain Sample on stationary distribution $\pi$
* Fundamental Theorem of Markov Chain on Graph
  * irreducible: $G$ is connected
  * aperiodic: $G$ is non-bipartite
* uniform random walk (on undirected graph) $\mathfrak{M} = (V,P)$
  * Strategy: At each step, uniformly at random move to a neighbor $v$ of current vertex
  * necessary condition for stationary distribution: $\pi(u)=\frac{\text{deg(u)}}{2|E|}$

$$P(u,v)=\begin{cases}\frac{1}{\text{deg}(u)} & uv\in E\\0&uv\not\in E\end{cases}$$

* lazy random walk $\mathfrak{M} = (V,\frac{1}{2}(I+P))$
  * Strategy: At each step, uniformly at random move to a neighbor $v$ of current vertex with probability $\frac{1}{2}$, otherwise do nothing
  * $\pi P=\pi\Rightarrow \pi\frac{1}{2}(I+P)=\pi$

$$P(u,v)=\begin{cases}\frac{1}{2} & u=v\\\frac{1}{2\text{deg}(u)} & uv\in E\\0&uv\not\in E\end{cases}$$

### PageRank

* Rank $r(v)$:importance of a page
  * pointed by more high-rank pages
  * high-rank page have greater influence
  * pages pointing to few others have greater influence
* $r(v)=\sum_{u:(u,v)\in E}\frac{r(u)}{d_+(u)}$
* random walk: $P(u,v)=[(u,v)\in E]\frac{1}{d_+(u)}$
* stationary distribution: $rP=r$

### Detailed Balance Equation

* Detailed Balance Equation: $\pi(x)P(x,y)=\pi(y)P(y,x)$
* time-reversible Markov chain: $\exists\pi,\forall x,y\in\Omega,\pi(x)P(x,y)=\pi(y)P(y,x)$
  * time-reversible: when start from $\pi$, $(X_0,X_1,\cdots,X_n)\sim(X_n,X_{n-1},\cdots,X_0)$
  * $\forall x,y\in\Omega,\pi(x)P(x,y)=\pi(y)P(y,x)\Rightarrow \pi$ is a stationary distribution
* Analyze $\pi$ for a given $P$ (Random walk on graph)
  * $u=v,u\not\sim v$: DBE holds
  * $u\sim v$: $\pi(u)\propto\frac{1}{P(u,v)}\propto\text{deg}(u),\Delta=\max_v\text{deg}(v)$
* Design $P$ to make $\pi$ uniform distribution

$$ P(u,v)=\begin{cases}
1-\frac{\text{deg}(u)}{2\Delta} & u=v\\
\frac{1}{2\Delta} & uv\in E\\
0 & o.w.
\end{cases} $$

## MCMC

* Problem setting
  * Given a Markov chain with transition matrix $Q$
  * Goal: a new Markov chain $P$ with stationary distribution $\pi$
* Detailed Balance Equation with acceptance ratio: $\pi(i)Q(i,j)\alpha(i,j)=\pi(j)Q(j,i)\alpha(j,i)$
  * $P(i,j)=Q(i,j)\alpha(i,j)$
  * $\alpha(i,j)=\pi(j)Q(j,i)$
* Original MCMC
  * (proposal) propose $y\in\Omega$ with probability $Q(x,y),x$ is current state
  * (accept-reject sample) accept the proposal and move to $y$ with probability $\pi(y)$
  * run above $T$ times and return
* mixing time $T$: time to be close to the stationary distribution
  * 前沿研究

### Metropolis Algorithm

* Metroplis-Hastings Algorithm (symmetric case)
  * (proposal) propose $y\in\Omega$ with probability $Q(x,y),x$ is current state
  * (filter) accept the proposal and move to $y$ with probability $\min\{1,\frac{\pi(y)}{\pi(x)}\}$
* New Transition Matrix (Meet Detailed Balance Equation)

$$P(x,y)=\begin{cases} Q(x,y)\min\{1,\frac{\pi(x)}{\pi(y)}\}& x\neq y\\ 1-\sum_{y\neq x}P(x,y) & x=y\end{cases} $$

* Metropolis Algorithm (M-H for sampling uniform random CSP solution)
  * Initially, start with an arbitrary CSP solution $\sigma=(\sigma_1,\cdots,\sigma_n)$
  * (proposal) pick a variable $i\in[n]$ and value $c\in[q]$ uniformly at random
  * (filter) accept the proposal and change $\sigma_i$ to $c$ if it does not violate any constraint

### Gibbs Sampling

* For $A(x_1,y_1),B(x_1,y_2)$, we have

$$ \pi(A)\pi(y_2|x_1)=\pi(x_1,y_1)\pi(y_2|x_1)=\pi(x_1)\pi(y_1|x_1)\pi(y_2|x_1)\\=\pi(x_1,y_2)\pi(y_1|x_1)=\pi(B)\pi(y_1|x_1)$$

Let $P(A,B)$ be the marginal distribution on their corrdinate of the same value, then DBE condition holds.

* Goal: Sample a random vector $X=(X_1,\cdots,X_n)$ according to a joint distribution $\pi(x_1,\cdots,x_n)$
* Gibbs Sampling
  * Initially, start with an arbitrary possible $X$
  * run following after $T$ steps:
    * pick a variable $i\in[n]$ uniformly at random
    * resample $X_i$ according to the marginal distribution of $X_i$ conditioning on the current values of $(X_1,\cdots,X_{i-1},X_{i+1},\cdots,X_n)$

#### Glauber Dynamics

* Glauber Dynamics for CSP
  * Initially, start with an arbitrary CSP solution; at each step, the current CSP solution is $\sigma$
  * pick avarible $i\in[n]$ uniformly at random
  * change value of $\sigma_i$ to a uniform value $c$ among all $\sigma$'s available values $c$, namely changing $\sigma_i$ to $c$ won't violate any constraint

