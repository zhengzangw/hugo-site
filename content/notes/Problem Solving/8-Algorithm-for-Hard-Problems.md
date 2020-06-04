---
title: algorithm for hard problems
date: 2019-08-28
tags: [algorithm, notes]
---

> Algorithms for Hard Problems
> NJU: Problem Solving

# Fundamentals

## Alphabet

* $\Sigma$: alphabet
* $a\in\Sigma$: symbol
* $w\subseteq\Sigma$: word over $\Sigma$
  * $\lambda$: empty word
  * $\Sigma^*=\mathcal{P}(\Sigma)$
  * $\Sigma^+=\Sigma^*-\{\lambda\}$
  * $|w|$: length of word
    * $\Sigma^n=\{w\in\Sigma^*|\vert w\vert=n\}$
  * $\sharp_a(w)$: number of occurence of $a$ in $w$
* $vw$: concatenation of $v$ and $w$
  * $w^{n+1}=ww^n,w^0=\lambda$
* prefix, suffix, subword
* $L\subseteq\Sigma^*$: language over $\Sigma$
  * $L^C =\Sigma^*-L$
* $L_1L_2=\{uv\in(\Sigma_1\cup\Sigma_2)^*|u\in L_1,v\in L_2\}$: concatenation
* canonical ordering: let $s_1<...<s_m$ be a linear ordering, $u<v$
  * if $\vert u\vert<\vert v\vert$
  * or $\vert u\vert=\vert v\vert,u=xs_iu',v=xs_jv',i<j$

|       |                     |                         |
| ----- | ------------------- | ----------------------- |
| $s$   | $\in$               | $\Sigma$                |
| $\in$ | $\subseteq\uparrow$ |                         |
| $w$   | $\in$               | $\Sigma^*$              |
| $\in$ | $\subseteq\uparrow$ |                         |
| $L$   | $\in$               | $\mathcal{P}(\Sigma^*)$ |

<!--more-->

## Algorithmic Problems

* codings $e_1$ and $e_2$ are polynomially related if exists polynomial-time transformation
* decision problem: $(L,U,\Sigma),L\subseteq U\subseteq \Sigma^*$
  * $A$ solves/decides $U$ if $A(x)=1,x\in L$ and $A(x)=0,x\in U-L$
  * $A$ accepts $U$ if $A(x)=1,x\in L$
    * Halting Problem: Undecidable but acceptable
* Examples:
  * PRIM (primality testing)
  * EQ-POL
    * $p_1\equiv p_2$ in $\mathbb{Z}_p$
  * EQ-1BP
    * equivalence of one-time-only branching programs
  * SAT (kSAT)
  * Clique
    * graph contain $K_k$
  * VCP
    * graph contain a vertex cover of size $k$
  * HC
  * SOL-IP (SOL-0/1-IP,SOL-IP$_p$)
  * PM: bipartite and has a perfect matching
* optimization problem: $U=(\Sigma_I,\Sigma_O,L,L_1,M,cost,goal)$
  * $\Sigma_I$: input alphabet
  * $\Sigma_O$: output alphabet
  * $L\subset\Sigma_I^*$: language of feasible problem instances
  * $L_1\subset L$: language of the actual problem instance
  * $M:L\rightarrow \mathcal{P}(\Sigma_O^*)$, $\mathcal{M}(x)$ is the set of feasible solutions for $x$
  * cost$:\mathcal{M}(x)\times L\rightarrow \mathbb{R}$
  * goal$\in\{\min,\max\}$
  * $y$ is optimal solution for $x\in L_I$ and $U$ if $cost(y,x)=goal\{cost(z,x)|z\in \mathcal{M}(x)\}$
    * $Opt_U(x)=cost(y,x)$
    * $Output_U(x)\subseteq \mathcal{M}(x)$: all optimal solutions for instance $x\in U$
    * Algorithm $A$ is consistent for $U$: $\forall x\in L_I,A(x)\in \mathcal{M}(x)$
    * Algorithm $B$ solves $U$ if $B$ is consistent for $U$ and $\forall x\in L_I,B(x)$ is an optimal solution for $x$ and $U$
* $U=(L,$ constraints, costs, goal$)$ (briefly)
* $U_1$ is a subproblem of $U_2$ if $L_{I,1}\subseteq L_{I,2}$ (Others are same)
* Examples:
  * TSP
    * $\Delta$-TSP (metric traveling salespaerson problem)
      * Euclidean TSP (geometrical TSP)
  * MSP (Makespan Scheduling Proble)
  * MIN-VCP
    * WEIGHT-VCP
    * SCP(Set Cover Problem)
  * MAX-CL (Maximum Clique Problem)
  * MAX/MIN-CUT
  * Knapsack Problem
    * Simple Knapsack Problem (SKP)
  * BIN-P (Bin-Packing Problem)
  * MAX-SAT
    * MAX-kSAT
    * MAX-EkSAT
  * LP
    * IP (Integer Linear Programming)
      * 0/1-Linear Programming
  * MAX-LinModk (Maximum Linear Equation Problem Mod k)
    * MAX-EmLinModk: k is prime, m is positive integer

## Complexity Theory

* main objective of the complexity theory is:
  * find a formal specification of the class of practically solvable problems
  * to develop methodes enabling the classification of algorithmic problemcs accoording to their membershiop in this class

### cost

* uniform cost
  * all values' size is bounded by a fixed constant
* logarithmic cost
  * addition, subtraction, assignment: $O(n)$
  * multiplication, division: $O(n\log n)$

### bound

* $\text{Time}/\text{Space}_A(x)$: time/space complexity on $x\in\Sigma_I$
* $\text{Time}/\text{Space}_A(n)=\max\{\text{Time}/\text{Space}_A(x)|x\in\Sigma_I^n\}$: worst case analysis
* upper bound on the time complexity of $U$: exists an algorithm $A$ solving $U$ with $\text{Time}_A(n)\in O(g(n))$
* lower bound on the time complexity of $U$: every algorithm $B$ solving $U$ has $\text{Time}_B(n)\in\Omega(f(n))$
* optimal algorithm: $\text{Time}_C(n)\in O(g(n))$ and $\Omega(g(n))$ is a lower bound

### Classification

* $L(M)$ denote the language decided by TM(algorithm) $M$
* $P=\{L=L(M)|M$ is a TM with $\text{Time}_M(n)\in O(n^c)$ for some positive integer c$\}=\{L:L$ is accepted/decided by a polynomial-time algorithm$\}$
  * tractable (solvabel): $L\in P$
  * Polynomially equivalent
* $NP=\{L(M)|M$ is a polynomial-time nondeterministic TM$\}=\{x\in\{0,1\}^*\vert\exists$ poly. time verifier $V(x,c), \exists c,|c|=O(|x|^k)$ such that $V(x,c)=1\}$
  * nondeterministic TM $M$ accept $L=L(M)$
    * $\forall x\in L,\exists$ computation of $M$ accepts $x$
    * $\forall y\not\in L$, all computations of $M$ rejects $y$
    * time complexity of $M$: $\text{Time}_M(n)=\max\{\text{Time}_M(x)|x\in L(M)\cap\Sigma^n\}$
* NP-hard $L$: $\forall U\in NP,U\leq_p L$
* NP-complete $L$: $L\in NP$ and $L$ is NP-hard
  * Cook's Theorem: C-SAT is NP-complete
* co-NP: $\overline{L}\in \text{NP}$
  * $\exists$ poly. time verifier $V(x,c)$ such that $\forall x\not\in L\iff\exists c,|c|=O(|x|^k)$ such that $V(x,c)=1$
  * PM $\in$ NP, PM $\in$ coNP
    * Hall's Condition
* NP is closed under $\cap,\cup,\cdot,\star$
* strongly NP(NP-complete in the strong sense): NP when all of its numerical parameters are bounded by a polynomial in the length of the input
  * 3-Partition

### reduction

* $L_1\leq_p L_2:$ polynomial-time reducible
* Karp Reduction: $\exists$ poly. time $f$ that $\forall x: x\in L_1\iff f(x)\in L_2$
  * HAM-CYCLE $\leq_p$ HAM-PATH
  * 3SAT $\leq_p$ SOL-0/1-ILP
    * $x_1\vee\overline{x}_2\vee\overline{x}_3\iff x_1+(1-x_2)+(1-x_2)\geq1$
  * SAT$\leq_p$Clique
  * Clique$\leq_p$VC
    * $(G,k)\in$ Clique$\iff(\overline{G},|V|-k)\in$ VC
* NPC proof
  * CIRCUIT-SAT
    * SAT
      * 3-CNF-SAT
        * SUBSET-SUM
        * CLIQUE
          * VERTEX-COVER
          * HAM-CYCLE
          * TSP

### P$\not=$NP

* NL $\subseteq$ P$\subseteq$ NP $\subseteq$ PSPACE$\subseteq$ EXP$\subseteq$ EXPSPACE
* P$\subsetneq$ EXP
* NP$\subsetneq$ NEXP
* NEXP-complete
  * Equivalence of Regular Expressions with Squaring
* [Complexity Zoo](https://www.math.ucdavis.edu/~greg/zoology/diagram.xml)

### Optimization

* NPO:
  * $L_I\in P$
  * exists a polynomial $p_U$ such that
    * $\forall x\in L_I,y\in\mathcal{x},|y|\leq p_U(|x|)$
    * exists a polynomial-time algorithm that $\forall y\in\Sigma_O^*,x\in L_I$ such that $|y|\leq p_U(|x|)$, decides wheter $y\in M(x)$
  * cost is computable in polynomial time
* PO:
  * $U\in NPO$
  * there is a polynomial-time algorithm that, $\forall x\in L_I$, computes an optimal solution for $x$
* threshold language of $U$: $Lang_U=\{(x,a)\in L_I\times\Sigma^*_{bool}|Opt_U(x)\leq Number(a)\}$ (goal==minimum)
* $U$ is NP-hard if $Lang_U$ is NP-hard
  * $U\in PO,Lang_U\in P$
  * MAX-SAT is NP-hard
  * MAX-CL is NP-hard

### Turing Machine

* Turing Machine: $M=(Q,\Sigma,\Gamma,\delta,q_0,q_{ac},q_{rej})$
  * $Q$: state set
  * $\Sigma$: Input alphabet
  * $\Gamma\subseteq\Sigma$: 带字母表
  * $\delta:Q\times\Gamma\rightarrow Q\times\Gamma\times\{L,R,-\}$
  * $q_0\in Q$: initial satate
* nondeterministic TM: $\delta:Q\times\Gamma\rightarrow \mathcal{P}(Q\times\Gamma\times\{L,R\})$
* For every increasing function $f:\mathbb{N}\rightarrow\mathbb{R}$
  * exists decision problem such that every TM solving it has the time complexity in $\Omega(f(n))$
  * exists a TM solving it in $O(f(n)\log f(n))$

# Approximation

## Error

* relative error $\epsilon_A(x)$ of $A$ on $x\in L_I$ of a optimization problem $U$: $\epsilon_A(x)=\frac{|cost((A(x)))-Out_U(x)|}{Opt_U(x)}$
  * relative error of $A$: $\epsilon_A(n)=\max\{\epsilon_A(x)|x\in L_I\cap(\Sigma_I)^n\}$
* approximation ratio $R_A(x)$ of $A$ on $x$: $R_A(x)=\max\{\frac{cost(A(x))}{Opt_U(x)},\frac{Opt_U(x)}{cost(A(x))}\}$
  * approximation ratio(worst case performance) of $A$: $R_A(n)=\max\{R_A(x)|x\in L_I\cap(\Sigma_I)^n\}$
  * goal=minimization: $R_A(x)=1+\epsilon_A(x)$

| NPO | Name                                              | Description                                                                         | Examples |
| --- | ------------------------------------------------- | ----------------------------------------------------------------------------------- | -------- |
| I(FPTAS)   | fully polynomial-time approximation scheme | $\text{Time}_A(x,\epsilon^{-1})$ bounded by a function that is polynomial in both $\lvert x\rvert$ and $\epsilon^{-1}$ | knapsack |
| II(PTAS)  | polynomial-time approximation scheme | $\forall (x,\epsilon)\in L_I\times\mathbb{R}^+$, $A$ computes a feasible solution $A(x)$ with $\epsilon_A(x)<\epsilon$ and $\text{Time}_A(x,\epsilon^{-1})$ can be bounded by a function that is polynomial in $\vert x\vert$ | MSP |
| III(APX) | $\delta$-approximation algorithm | $\forall x\in L_I,R_A(x)\leq \delta$ | MIN-VCP, MAX-SAT, $\delta$-TSP |
| IV(Log-APX) | $f(n)$-approximation algorithm | $R_A(n)\leq f(n),f(n)$ is bounded by a polylogarithmic function $\sum_{i}a_i\log^i(n)$ | SCP |
| V(f(n)-APX)  | $f(n)$-approximation algorithm | $R_A(n)\leq f(n),f(n)$ is not bounded by any polylogarithmic function | TSP, MAX-CL |

## Greedy makespan schedule

* List-Scheduling Algorithm: 2-APX
  * $2-\frac{1}{m}$
* Longest Processing Time Rule: $\frac{4}{3}$-APX
  * $\frac{4}{3}-\frac{1}{3m}$
* No FPTAS for MS
  * 3-Partition$\leq_p$MS

## Distance

* distance fucntion from $\overline{U}$ according to $L_I$: $h_L:L\rightarrow\mathbb{R}^+$
  * $\forall x\in L_I, h_L(x)=0$
  * $h_L$ is polynomial-time computable
* $Ball_{r,h}(L_I)=\{w\in L|h(w)\leq r\}$
* $U_r=(\Sigma_I,\Sigma_O,L,Ball_{r,h}(L_I),M,cost,goal)$
* property of infinite jumps: If $Ball_{q,h'}(L_I)\subset Ball_{r,h'}(L_I)$ for some $q<r$, then $|Ball_{r,h'}(L_I)|-|Ball_{q,h'}(L_I)|$ is infinite
* $\delta$-approximation $A$

| Stability according to $h$ | Description |
| -- | -- |
| $p$-stable | $\forall r\leq p,\exists \delta_{r,\epsilon}\in\mathbb{R}^{>1},A$ is $\delta_{r,\epsilon}$-approximation algorihtm for $U_r$ |
| stable | $A$ is $p$-stable according to $h$ for all $p\in R^+$ |
| $(r,f_r(n))$-quasistable | $A$ is an $f_r(n)$-approxiamtion algorithm for $U_r$ |

* PTAS $A$:

| Stability according to $h$ | Description |
| -- | -- |
| stable | $\forall r>0,\forall\epsilon>0,A_\epsilon$ is a $\delta_{r,\epsilon}$-approximation algorithm for $U_r$ |
| superstable | $\delta_{r,\epsilon}\leq f(\epsilon)g(r)$, $f,g$ are some functions from $\mathbb{R}^{\geq0}$ to $\mathbb{R}^+$ and $\lim_{\epsilon\rightarrow0}f(\epsilon)=0$ |

* constraint distance function for $u$ is $h:L_I\times\Sigma^*_O\rightarrow\mathbb{R}^{\geq0}$, $\forall S\in M(x),h(x,S)=0$, $\forall S\not\in M(x),h(x,S)>0$ and $h$ is polynomial-time computable.
  * $\epsilon$-ball of $M(x)$ according to $h$: $M_\epsilon^h(x)=\{S\in\Sigma^*_O|h(x,S)\leq\epsilon\}$

| $h$-dual | Description |
| -- | -- |
| PTAS | $\forall (x,\epsilon)\in L_I\times\mathbb{R}^+,A(x,\epsilon)\in M_\epsilon^h(x)$ and $cost(A(x,\epsilon))\geq Opt_U(x)$ if goal=max and $\text{Time}_A(x,\epsilon^{-1})$ is bounded by a function that is polynomial in $\lvert x\rvert$ |
| FPTAS | $\text{Time}_A(x,\epsilon^{-1})$ can be bounded by a function that is polynoimal in both $\lvert x\rvert$ and $\epsilon^{-1}$ |

# Randomization

* $Random_A(x)$: the maximum number of random bits used
  * $Random_A(n)$: $\max\{Random_A(x)||x|=n\}$
  * derandomization: $Random_A(n)\leq\log n$
* $Prob_{A,x}(C)$: probability of the executaion $C$ on $x$
  * $Prob(A(x)=y) = \sum_{C\text{ outputs }y}Prob_{A,x}(C)$
* $\text{Exp-Time}_A(x)=\sum_CProb_{A,x}(C)*Time(C)$
  * $\text{Exp-Time}_A(n)=\max\{\text{Exp-Time}_A(x)||x|=n\}$
* $\text{Time}_A(x)=\max\{\text{Time}(C)|C\text{ runs on }x\}$
  * $\text{Time}_A(n)=\max\{\text{Time}_A(x)||x|=n\}$

### Decision Problem

| Classification | Name | Description | Repeat $A^{(k)}$ times |
| --- | --- | --- | --- |
| ZPP | Las Vegas algorithm | $Prob(A(x)=F(x))\geq\frac{1}{2}$ <br> $Prob(A(x)='?')<\frac{1}{2}$ | $L\in ZPP_{1-(1-\delta)^k}$ |
| RP(co-RP) | One-sided-error Monte Carlo algorithm | $\forall x\in L,Prob(A(x)=F(x)=1)\geq\frac{1}{2}$ <br> $\forall x\not\in L,Prob(A(x)=F(x)=0)=1$ | $L\in RP_{1-(1-\delta)^k}$|
| BPP | Two-sided-error Monte Carlo algorithm |  $Prob(A(x)=F(x))\geq\frac{1}{2}+\epsilon,0<\epsilon\leq\frac{1}{2}$ | $k\geq\frac{2\ln 2\delta}{\ln(1-4\epsilon^2)},L\in BPP_{1-\delta}$ |
| PP | Unbounded-error Monte Carlo algorithm | $Prob(A(x)=F(x))>\frac{1}{2}$ | |

* P$\subseteq$ZPP$\subseteq$RP$\subseteq$BPP$\subseteq$PP

### Optimization Problem

| Algorithm | Description |
| ---  | ----------- |
| randomized $\delta$-approximation | $Prob(A(x)\in M(x))=1$ and $Prob(R_A(x)\leq\delta)\geq\frac{1}{2}$ |
| randomized $f(n)$-approximation algorithm | $Prob(A(x)\in M(x))=1$ and $Prob(R_A(x)\leq f(\vert x\vert))\geq\frac{1}{2}$ |
| randomized polynomial-time approximation scheme(RPTAS) | $Prob(A(x)\in M(x))=1$ and $Prob(\epsilon_A(x,\delta)\leq\delta)\geq\frac{1}{2}$ and $Time_A(x,\delta^{-1})\leq p(\vert x\vert,\delta^{-1})$ and $p$ is a polynomial in $\vert x\vert$ |
| RFTAS | $p(\vert x\vert,\delta^{-1})$ is polynomial in both $\vert x\vert$ and $\delta^{-1}$ |
| randomized $\delta$-expected approximation | $Prob(A(x)\in M(x))=1$ and $E(R_A(x))\leq\delta$ |

### Paradigms of Design of Randomized Algorithm

* Foiling an adversary
* Abundance of witness: decision problem
  * Fingerprinting: equivalence problem
* random sampling
  * relexation and random rounding

# Heuristics

* a heuristic is a robust technique for the design of randomized algorithms for optimziation problems, and it provides randomized algorithms for which one is not able to guarantee at once the efficiency and the qulity of the computed feasible solution, even not with any bounded constant probability p>0

## Simulated Annealing

* local search scheme
  * multistart local search
  * threshold local search
* Difference with LSS: may accept a deterioration with $e^{-\frac{E(q)-E(s)}{k_B*T}}$
  * Boltzmann distribution
* free variable
  * neighborhood choice
  * cooling schedule
    * initial temperature $T$
    * temperature reduction function $f(T,t)$
      * $T:=rT$
      * $T:=\frac{T}{\log_2(k+2)}$
    * termination condition
* asymptotic convergence
  * $M(x)$ is reachable from $\forall x\in M(x)$
  * $T$ is at least as large as the depth of the deepest local, nonglobal minimum
* Avoid following structural properties
  * spiky structure
  * deep trough
  * large plateau-like areas

## Tabu Search

* forbid any feasible solution in the last k steps
* or require local transformations do not always change the same parts of the representation
* or modify the cost function

## Genetic algorithm

* GAS
  * initial
  * crossover
  * fitness value
  * mutation
  * pass away
* The Schema Theorem for GAS
* parameters
  * population size
  * selection of initial population
  * fitness estimation and selection mechanism for parents
  * representation of individuals and the crossover operation
  * probability of mutation
  * selection mechanism for a new population
  * stop criterion

## Ant System

* heuristic value $\eta(s_i,s_j)$
* pheromone $\tau(s_i,s_j)$
  * update
    * for all edge: $\tau=(1-\rho)\tau$
    * then for edge path: $\tau += f(\text{cost})$
* agent(ant)
* path selection: $p_{ij}=\frac{\tau_{ij}^\delta\eta_{ij}^\beta}{\sum_k\tau_{ik}^\delta\eta_{ik}^\beta}$