---
title: Monte Carlo Method
date: 2019-12-18
---

## Defintion

* Problem
  * Universe $U$, subset $S\subseteq U$ where $\rho=\frac{|S|}{|U|}$
  * Assume a uniform sampler for elements
  * Estimate $Z=|S|$
* Monte Carlo Method: sample $X_1,X_2,\cdots,X_N$ uniformly and independently from $U$, $Y_i=[X_i\in S]$, $\hat Z=\frac{|U|}{N}\sum_{i=1}^NY_i$
* Estimator Theorem(Naive): $N\geq\frac{4}{\epsilon^2\rho}\ln\frac{2}{\delta}=\Theta(\frac{1}{\epsilon^2\rho}\ln\frac{1}{\delta})\Rightarrow P(\hat Z$ is $\epsilon$-approx of $|S|)\geq 1-\delta$

## Counting DNF Solutions

#P-hard

* Naive: $\rho=\frac{|S|}{|U|}$ can be exponentially small
* Implicityly: $m$ sets $S_1,S_2,\cdots,S_m$, estimate $|\bigcup_{i=1}^mS_i|$
* Multiset Union: $\rho\geq\frac{1}{m}$
  * Assumption following is efficient
    * compute $|S_i|$
    * sample uniform $x\in S_i$
    * check $x\in S_i$
* Coverage Algorithm
  * Sample unifomr $(x,i)\in U$
    * Sample $i\in\{1,2,\cdots,m\}$
    * Sample uniform $x\in S_i$
  * check if $(x,i)\in\overline{S}$ (if $x\in S_i,\forall j<i,x\neq S_j$)
* Coverage Algorithm is a counting algorithm and also a sampling algorithm
  * Rejection sampling

## Counting CSP

* Constraint Satisfaction Problem
  * variable: $V$
  * assignment: $\sigma\in[q]^V$
  * Constraints: Boolean Function $C_i:[q]^{S_i}\rightarrow\{0,1\}$
  * $\mu(\sigma)=\prod_{i=1}^mC_i(\sigma_{S_i})/Z$
* Poly-time inter-reducible
  * appox. counting
  * sampling an uniform random CSP solution
  * approx. inference: estimate the chance of a variable to have certain value in a CSP solutionet
* Metropolis Algorithm
  * start with an arbitrary CSP solution $\sigma=(\sigma_1,\cdots,\sigma_n)$
  * (proposal) pick a variable $i\in[n]$ and value $c\in[q]$ uniformly at random
  * (filter) accept the proposal and change $\sigma_i$ to $c$ if it does not violate any constraint
  * return solution $\sigma$ after $T$ steps
* Glauber Dynamics (Gibbs sampling)
  * Initially, start with an arbitrary CSP solution; at each step, the current CSP solution is $\sigma$
  * pick avarible $i\in[n]$ uniformly at random
  * change valueof $\sigma_i$ to a uniform value $c$ among all $\sigma$'s available values $c$, changing $\sigma_i$ to $c$ won't violate any constraint
  * return the solution after $T$ steps
* Gibbs Sampling: Sample a random vector $X=(X_1,\cdots,X_n)$ according to a joint distribution
  * pick a variable $i\in[n]$ uniformly at random
  * resample $X_i$ according to the marginal distribution of $X_i$ conditioning on the current values of $(X_1,\cdots,X_{i-1},X_{i+1},\cdots,X_n)$
* 效率分析：前沿研究
* 正确性：尘埃落定

## Stochastic Process

$$\{X_t|t\in T\},X_t\in\Omega$$

time $t$: discrete  
state space $\Omega$: discrete  
state $x\in\Omega$  
chain: stochastic process in discrete time and discrete state space  
Markov property(memoryless): $X_{t+1}$ depends only on $X_t$  
Markov chain(memoryless): discrete time discrete space

$$ \mathfrak{M} = (\Omega,P) $$

stochastic process with Markov property 
time-homogenenous: transition does not depend on time   
transition matrix: $P$ over $\Omega\times \Omega$, $P_{xy}=P(X_{t+1}=y|X_t=x)$  
(row-)stochastic matrix: $P\mathbf{1}=\mathbf{1}$

$$ p^{(t+1)}=p^{(t)}P $$

stationary distribution $\pi$: $\pi P=\pi$  
* Perron-Frobenius Theorem
  * $1$ is eigenvalue of $P$
  * also a left eigenvalue of $P$
  * the left eigenvalue $\pi P=\pi$ is nonnegative
  * stationary distribution always exists
* Fundamental Theorem of Markov Chain
  * if a **finite** Markov chain is **irreducible** and **ergodic**(aperiodic), then $\forall$ initial distribution $\pi^{(0)},\lim_{t\rightarrow\infty}\pi^{(0)}P^t=\pi$ where $\pi$ is a **unique** stationary distribution
  * infinit chain: +positive recurrent
  * irreducible: all pairs of states communicate
    * not connected: $\pi=\lambda\pi_A+(1-\lambda)\pi_B$
    * weak connected(absorbing case): $\pi=(0,\pi_B)$
  * aperiodicity
    * period of state $x$: $d_x=\gcd\{t|P^t(x,x)>0\}$
    * aperiodic: all states have period $1$
    * if $\forall x\in\Omega,P(x,x)>0$(self-loop), then a chain is aperiodic
    * $x$ and $y$ communicate $\Rightarrow$ $d_x=d_y$

## Random Walk

* uniform random walk: $\Omega=V$ (undirected graph)
  * at each step, the current position is $u\in V$
    * pick a neighbor $v$ of $u$ uniformly at random move to vertex $v$
  * $P(u,v)=[uv\in E]\frac{1}{\text{deg}(u)}$
  * Irreducible: $G$ is connected
  * Aperiodic: $G$ is non-bipartite
* lazy random walk
  * at each step, the current position is $u\in V$
    * for probabiliry $\frac{1}{2}$, do nothing
    * else pick a a neighbor $v$ of $u$ uniformly at random and move to vertex $v$
  * $P(u,v)=[u=v]\frac{1}{2}+[uv\in E]\frac{1}{2\text{deg}(u)}$
  * Irreducible: $G$ is connected
  * Aperiodic: always
* stationary distribution of random walk on graph: $\pi(u)=\frac{\text{deg}(u)}{2|E|}$
* PageRank
  * Rank $r(v)$:importance of a page
    * pointed by more high-rank pages
    * high-rank page have greater influence
    * pages pointing to few others have greater influence
  * $r(v)=\sum_{u:(u,v)\in E}\frac{r(u)}{d_+(u)}$
  * random walk: $P(u,v)=[(u,v)\in E]\frac{1}{d_+(u)}$
  * stationary distribution: $rP=r$
* Detailed Balance Equation: $\pi(x)P(x,y)=\pi(y)P(y,x)$
  * time-reversible Markov chain: $\exists\pi,\forall x,y\in\Omega,\pi(x)P(x,y)=\pi(y)P(y,x)$
  * This $\pi$ is stationary distribution
  * time-reversible: when start from $\pi$, $(X_0,X_1,\cdots,X_n)\sim(X_n,X_{n-1},\cdots,X_0)$
  * Random walk on graph
    * $u=v,u\not\sim v$: holds
    * $u\sim v$: $\pi(u)\propto\frac{1}{P(u,v)}\propto\text{deg}(u)$
* Random Walk on Graph
  * $\Delta=\max_v\text{deg}(v)$
  * satisfies Detailed Balance Equation

$$ P(u,v)=\begin{cases}
1-\frac{\text{deg}(u)}{2\Delta} & u=v\\
\frac{1}{2\Delta} & uv\in E\\
0 & o.w.
\end{cases} $$