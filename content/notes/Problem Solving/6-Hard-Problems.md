---
title: 6-难问题求解
date: 2019-08-28
weight: 6
---

## Definition

### Alphabet

- $\Sigma$: alphabet
  - $\Sigma^*=\mathcal{P}(\Sigma)$
  - $\Sigma^+=\Sigma^*-\{\lambda\}$
- $s\in\Sigma$: symbol
  - $s\in w$
- $w\subseteq\Sigma, \omega\in\Sigma^*$: word over $\Sigma$
  - $w\in L$
  - $\lambda$: empty word
  - $|w|$: length of word
    - $\Sigma^n=\{w\in\Sigma^*|\vert w\vert=n\}$
  - #$_a(w)$: number of occurence of $a$ in $w$
  - $vw$: concatenation of $v$ and $w$
    - $w^{n+1}=ww^n,w^0=\lambda$
  - prefix, suffix, subword
- $L\subseteq\Sigma^*$: language over $\Sigma$
  - $L^C =\Sigma^*-L$
  - $L_1L_2=\{uv\in(\Sigma_1\cup\Sigma_2)^*|u\in L_1,v\in L_2\}$: concatenation
- canonical ordering: let $s_1<...<s_m$ be a linear ordering, $u<v$
  - if $\vert u\vert<\vert v\vert$
  - or $\vert u\vert=\vert v\vert,u=xs_iu',v=xs_jv',i<j$

### Algorithmic Problems

- polynomially related: codings $e_1\in L_1,e_2\in L_2,\exists f:L_1\rightarrow L_2,f(e_1)$ is polynomial
- decision Problem: $(L,U,\Sigma),L\subseteq U\subseteq \Sigma^*$
  - $A$ solves/decides $U$
    - $A(x)=1,x\in L$
    - $A(x)=0,x\in U-L$
  - $A$ accepts $U$: $A(x)=1,x\in L$
    - Halting Problem: Undecidable but acceptable
- optimization Problem: $U=(\Sigma_I,\Sigma_O,L,L_I,M,cost,goal)$
  - briefly: $U=(L,$ constraints, costs, goal$)$
  - $\Sigma_I$: input alphabet
  - $\Sigma_O$: output alphabet
  - $L\subset\Sigma_I^*$: language of feasible Problem instances
  - $L_I\subset L$: language of the actual Problem instance
  - $M:L\rightarrow \mathcal{P}(\Sigma_O^*)$, $\mathcal{M}(x)$ is the set of feasible solutions for $x$
  - cost$:\mathcal{M}(x)\times L\rightarrow \mathbb{R}$
  - goal $\in\{\min,\max\}$
  - optimal solution $Opt_U(x)=cost(y,x)=goal_{x\in L_I}\{cost(z,x)|z\in \mathcal{M}(x)\}$
  - $Output_U(x)\subseteq \mathcal{M}(x)$: all optimal solutions for instance $x\in U$
- Algorithm $A$ is consistent for $U$: $\forall x\in L_I,A(x)\in \mathcal{M}(x)$
- Algorithm $B$ solves $U$
  - consistent
  - $\forall x\in L_I,B(x)=Opt_U(x)$
- $U_1$ is a subProblem of $U_2$ if $L_{I,1}\subseteq L_{I,2}$ (Others are same)

### Turing Machine

- Turing Machine: $M=(Q,\Sigma,\Gamma,\delta,q_0,q_{ac},q_{rej})$
  - $Q$: state set
  - $\Sigma$: Input alphabet
  - $\Gamma\subseteq\Sigma$: alphabet on tape
  - $\delta:Q\times\Gamma\rightarrow Q\times\Gamma\times\{L,R,-\}$
  - $q_0\in Q$: initial satate
- nondeterministic TM: $\delta:Q\times\Gamma\rightarrow \mathcal{P}(Q\times\Gamma\times\{L,R\})$
- nondeterministic TM $M$ accept $L=L(M)$
  - $\forall x\in L,\exists$ computation of $M$ accepts $x$
  - $\forall y\not\in L$, all computations of $M$ rejects $y$
- time complexity of nondeterministic TM $M$
  - $T_M(\omega)$: shortest accepting computation of $M$ on $\omega$
  - $T_M(n)=\max\{T_M(x)|x\in L(M)\cap\Sigma^n\}$
- Church-Turing thesis: Problem $U$ can be solved by an algorithm iff $\exists$ Turing machine solving $U$
- Theorem: for every increasing function $f:\mathbb{N}\rightarrow\mathbb{R}^+$
  - $\exists$ decision Problem such that every TM solving it has the time complexity in $\Omega(f(n))$
  - but $\exists$ TM solving it in $O(f(n)\log f(n))$
- $L(M)$: language decided by $M$

### Examples

#### Decision

- PRIM: test if a number is a prime
- EQ-POL: $p_1\equiv p_2$ in $\mathbb{Z}_p$
- EQ-1BP: equivalence of one-time-only branching programs
- C-SAT: whether a formula with AND, NOT, OR gate is satisfiable
- SAT (kSAT): whether a CNF can be satisfied
- Clique: whether a graph contain $K_k$
- VCP: whether graph contains a vertex cover of size $k$
- HC: whether graph contains a Hamiltonian cycle
- SOL-IP: existence of a solution of linear integer programming
  - SOL-0/1-IP
  - SOL-IP$_p$
- PM: whether a bipartite graph has a perfect matching
- SUBSET-SUM: exists a subset $S'\subseteq S$ sum up to $t$

#### Optimization

- TSP: find a Hamiltonian cycle of the minial cost in a complete weighted graph
  - $\Delta$-TSP: metric traveling salespaerson Problem (satisfying triangle inequality)
  - Euclidean TSP: geometrical, can be embedded in the two-dimensional Euclidean space
- MSP: Makespan Scheduling Problem
- MIN-VCP: find minimum vertex cover
  - WEIGHT-VCP
- SCP: Set Cover Problem
- MAX-CL: Maximum Clique Problem
- MAX/MIN-CUT
- KP: Knapsack Problem
  - SKP: Simple Knapsack Problem
  - BIN-P: Bin-Packing Problem
- MAX-SAT: maximize the number of stisfied clauses
  - MAX-kSAT
  - MAX-EkSAT: exactly
- LP: Linear Programming
  - IP: Integer Linear Programming
  - 0/1-Linear Programming
- MAX-LinModk: Maximum Linear Equation Problem Mod k
  - MAX-EmLinModk: k is prime, m is positive integer
- MAX-CSP: $\max_{S,T}|E(S,T)|$

## Complexity Theory

- main objective of the complexity theory is:
  - find a formal specification of the class of practically solvable Problems
  - to develop methodes enabling the classification of algorithmic Problemcs accoording to their membershiop in this class
- uniform cost
  - all numbers bounded
  - basic operation: $O(1)$
- logarithmic cost
  - numbers $k$ takes $O(\lg k)$ bits
  - addition, subtraction, assignment: $O(n)$
  - multiplication, division: $O(n\log n)$
- pseudopolynomial time complexity:
  - $T(n)$ is polynomial in the numeric value of the input
  - $T(n)$ is not polynomial in the number of bits required to repensent it of the input
- bound
  - $T/S_A(x)$: time/space complexity on $x\in\Sigma_I$
  - $T/S_A(n)=\max\{T/S_A(x)|x\in\Sigma_I^n\}$: worst case analysis
  - upper bound on the time complexity of $U$: $\exists A$ solving $U$ with $T_A(n)\in O(g(n))$
  - lower bound on the time complexity of $U$: $\forall B$ solving $U$ has $T_B(n)\in\Omega(f(n))$
- There is a decision Problem such that $\forall A$ deciding $L$, $\exists B$ deciding $L$: $T_A(n)=\log_2T_B(n)$
- optimal algorithm: $\text{Time}_C(n)\in O(g(n))$ and $\Omega(g(n))$ is a lower bound

### Complexity Class

- [Complexity Zoo](https://www.math.ucdavis.edu/~greg/zoology/diagram.xml)
- $\text{P}=\{L(M)|M$ is a TM, $\exists c>0,T_M(n)\in O(n^c)\}$
  - tractable (solvable): $L\in P$, $L$ is accepted/decided by a polynomial-time algorithm
  - intractable: $L\not\in P$
- $\text{NP}=\{L(M)|M$ is a polynomial-time nondeterministic TM$\}$
  - verifier for $L$: $A$ works on $\Sigma^*\times\{0,1\}^*$, $L=V(A)=\{\omega\in\Sigma^*|\exists c\in\{0,1\}^*,A$ accepts $(\omega,c)\}$
  - $\text{NP}=\{V(A)|T_A(\omega,c)\in O(|\omega|^d)\}$
  - closed under $\cap,\cup,\cdot,\star$
- polynomial-time reduction (Karp, many-one) $L_1\leq_p L_2$: $\exists$ poly. time $f$ that $\forall x: x\in L_1\iff f(x)\in L_2$
  - Cook/Turing reduction: an algorithm that solves Problem $A$ using a polynomial number of calls to a subroutine for Problem $B$, and polynomial time outside of those subroutine calls
- $\text{NP}$-hard $L$: $\forall U\in \text{NP},U\leq_p L$
- $\text{NP}$-complete $L$: $L\in \text{NP}$ and $L$ is $\text{NP}$-hard
- co-$\text{NP}$: $\overline{L}\in \text{NP}$, $x\not\in L$ can be poly. time verified with $c$
- strongly $\text{NP}$: $\text{NP}$ when all of its numerical parameters are bounded by a polynomial in the length of the input
- $\text{L}\subseteq\text{NL}\subseteq\text{P}\subseteq\text{ZPP}\subseteq\text{NP}\subseteq\text{PH}\subseteq\text{PSPACE}=\text{NPSPACE}\subseteq\text{EXP}\subseteq\text{NEXP}\subseteq\text{EXPSPACE}\subseteq\text{ELEMENTARY}\subseteq\text{PR}\subseteq\text{R}\subseteq\text{RE}\subseteq\text{ALL}$
  - $\text{P}\neq\text{EXP}$
  - $\text{NP}\neq\text{NEXP}$
- $\text{P}\subseteq\text{ZPP}\subseteq\text{RP}\subseteq\text{BPP}\subseteq\text{PP}$
- $\text{P}\subseteq\text{BQP}\subseteq\text{PSPACE}$
- Conjecture: $\text{P}\neq \text{NP}$: no hope for a polynomial-time algorithm
- Conjecture: $\text{BPP}=\text{P}$: randomization alone not help

#### Optimization Complexity

- $\text{NPO}$:
  - $L_I\in \text{P}$
  - exists a polynomial $p_U$ such that
    - $\forall x\in L_I,y\in\mathcal{x},|y|\leq p_U(|x|)$
    - exists a polynomial-time algorithm that $\forall y\in\Sigma_O^*,x\in L_I$ such that $|y|\leq p_U(|x|)$, decides wheter $y\in M(x)$
  - cost is computable in polynomial time
- $\text{PO}$:
  - $U\in \text{NPO}$
  - $\forall x\in L_I,\exists$ polynomial-time algorithm computes an optimal solution
- threshold language of $U$ (minimum): $Lang_U=\{(x,a)\in L_I\times\Sigma^*_{bool}|Opt_U(x)\leq Number(a)\}$
- $U$ is $\text{NP}$-hard if $Lang_U$ is $\text{NP}$-hard
  - $U\in \text{PO},Lang_U\in \text{P}$

### Reduction

- Cook's Theorem: C-SAT is $\text{NP}$-complete
- $\text{NPC}$
  - C-SAT $\leq_p$ SAT
  - SAT $\leq_p$ 3SAT
  - 3SAT $\leq_p$ SOL-0/1-ILP: $x_1\vee\overline{x}_2\vee\overline{x}_3\iff x_1+(1-x_2)+(1-x_2)\geq1$
  - 3SAT $\leq_p$ SUBSET-SUM
  - 3SAT $\leq_p$ Clique: $K_{3,3,\cdots,3}$
  - Clique $\leq_p$ VC: $(G,k)\in$ Clique$\iff(\overline{G},|V|-k)\in$ VC
  - VC $\leq_p$ HAM-CYCLE
  - VC $\leq_p$ SCP
  - HAM-CYCLE $\leq_p$ HAM-PATH
  - HAM-CYCLE $\leq_p$ TSP
  - MAX-CUT
- strongly $\text{NPC}$: 3-Partition
- PM $\in\text{NP}\cap$co-$\text{NP}$
- $\text{EXP}$-complete: Go
- $\text{NEXP}$-complete: equivalence of regular expressions with squaring, concatenating and union
- $\text{EXPSPACE}$-complete: equivalence of regular expressions with squaring, concatenating, union and Kleene

## Approximation

### Error

- relative error $\epsilon_A(x)=\frac{|cost(A(x))-Out_U(x)|}{Opt_U(x)}$
  - $\epsilon_A(n)=\max\{\epsilon_A(x)|x\in L_I\cap(\Sigma_I)^n\}$
- approximation ratio $R_A(x)=\max\{\frac{cost(A(x))}{Opt_U(x)},\frac{Opt_U(x)}{cost(A(x))}\}$
  - $R_A(n)=\max\{R_A(x)|x\in L_I\cap(\Sigma_I)^n\}$
  - (minimization) $R_A(x)=1+\epsilon_A(x)$

| NPO               | Name                                       | Description                                                                                                                                                                                                                   | Examples                       |
| ----------------- | ------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------ |
| $\text{FPTAS}$    | fully polynomial-time approximation scheme | $\text{Time}_A(x,\epsilon^{-1})$ bounded by a function that is polynomial in both $\lvert x\rvert$ and $\epsilon^{-1}$                                                                                                        | knapsack                       |
| $\text{PTAS}$     | polynomial-time approximation scheme       | $\forall (x,\epsilon)\in L_I\times\mathbb{R}^+$, $A$ computes a feasible solution $A(x)$ with $\epsilon_A(x)<\epsilon$ and $\text{Time}_A(x,\epsilon^{-1})$ can be bounded by a function that is polynomial in $\vert x\vert$ | MSP                            |
| $\text{APX}$      | $\delta$-approximation algorithm           | $\forall x\in L_I,R_A(x)\leq \delta$                                                                                                                                                                                          | MIN-VCP, MAX-SAT, $\delta$-TSP |
| $\log\text{-APX}$ | $f(n)$-approximation algorithm             | $R_A(n)\leq f(n),f(n)$ is bounded by a polylogarithmic function $\sum_{i}a_i\log^i(n)$                                                                                                                                        | SCP                            |
| $f(n)\text{-APX}$ | $f(n)$-approximation algorithm             | $R_A(n)\leq f(n),f(n)$ is not bounded by any polylogarithmic function                                                                                                                                                         | TSP, MAX-CL                    |

### Distance

- distance function from $\overline{U}$ according to $L_I$: $h_L:L\rightarrow\mathbb{R}^+$
  - $\forall x\in L_I, h_L(x)=0$
  - $h_L$ is polynomial-time computable
- $Ball_{r,h}(L_I)=\{w\in L|h(w)\leq r\}$
- $U_r=(\Sigma_I,\Sigma_O,L,Ball_{r,h}(L_I),M,cost,goal)$
- property of infinite jumps: If $Ball_{q,h'}(L_I)\subset Ball_{r,h'}(L_I)$ for some $q<r$, then $|Ball_{r,h'}(L_I)|-|Ball_{q,h'}(L_I)|$ is infinite

for $\delta$-approximation $A$

| Stability according to $h$ | Description                                                                                                                  |
| -------------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| $p$-stable                 | $\forall r\leq p,\exists \delta_{r,\epsilon}\in\mathbb{R}^{>1},A$ is $\delta_{r,\epsilon}$-approximation algorihtm for $U_r$ |
| stable                     | $A$ is $p$-stable according to $h$ for all $p\in R^+$                                                                        |
| $(r,f_r(n))$-quasistable   | $A$ is an $f_r(n)$-approxiamtion algorithm for $U_r$                                                                         |

for PTAS $A$:

| Stability according to $h$ | Description                                                                                                                                                    |
| -------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| stable                     | $\forall r>0,\forall\epsilon>0,A_\epsilon$ is a $\delta_{r,\epsilon}$-approximation algorithm for $U_r$                                                        |
| superstable                | $\delta_{r,\epsilon}\leq f(\epsilon)g(r)$, $f,g$ are some functions from $\mathbb{R}^{\geq0}$ to $\mathbb{R}^+$ and $\lim_{\epsilon\rightarrow0}f(\epsilon)=0$ |

- constraint distance function for $u$ is $h:L_I\times\Sigma^*_O\rightarrow\mathbb{R}^{\geq0}$, $\forall S\in M(x),h(x,S)=0$, $\forall S\not\in M(x),h(x,S)>0$ and $h$ is polynomial-time computable.
  - $\epsilon$-ball of $M(x)$ according to $h$: $M_\epsilon^h(x)=\{S\in\Sigma^*_O|h(x,S)\leq\epsilon\}$

| $h$-dual | Description                                                                                                                                                                                                                              |
| -------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| PTAS     | $\forall (x,\epsilon)\in L_I\times\mathbb{R}^+,A(x,\epsilon)\in M_\epsilon^h(x)$ and $cost(A(x,\epsilon))\geq Opt_U(x)$ if goal=max and $\text{Time}_A(x,\epsilon^{-1})$ is bounded by a function that is polynomial in $\lvert x\rvert$ |
| FPTAS    | $\text{Time}_A(x,\epsilon^{-1})$ can be bounded by a function that is polynoimal in both $\lvert x\rvert$ and $\epsilon^{-1}$                                                                                                            |

## Randomization

- $\text{Random}_A(x)$: the maximum number of random bits used
  - $\text{Random}_A(n)$: $\max\{\text{Random}_A(x)||x|=n\}$
  - derandomization: $\text{Random}_A(n)\leq\log n$
- $\text{Prob}_{A,x}(C)$: Probability of the executaion $C$ on $x$
  - $\text{Prob}(A(x)=y) = \sum_{C\text{ outputs }y}\text{Prob}_{A,x}(C)$
- $\text{Exp-Time}_A(x)=\sum_C\text{Prob}_{A,x}(C)*Time(C)$
  - $\text{Exp-Time}_A(n)=\max\{\text{Exp-Time}_A(x)||x|=n\}$
- $\text{Time}_A(x)=\max\{\text{Time}(C)|C\text{ runs on }x\}$
  - $\text{Time}_A(n)=\max\{\text{Time}_A(x)||x|=n\}$

### Decision Problem

| Classification | Name                                  | Description                                                                                                   | Repeat k times                                                            |
| -------------- | ------------------------------------- | ------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------- |
| $\text{ZPP}$   | Las Vegas algorithm                   | $\text{Prob}(A(x)=F(x))\geq\frac{1}{2}$ <br> $\text{Prob}(A(x)=?)<\frac{1}{2}$                                | $L\in \text{ZPP}_{1-(1-\delta)^k}$                                        |
| $\text{RP}$    | One-sided-error Monte Carlo algorithm | $\forall x\in L,\text{Prob}(A(x)=F(x)=1)\geq\frac{1}{2}$ <br> $\forall x\not\in L,\text{Prob}(A(x)=F(x)=0)=1$ | $L\in \text{RP}_{1-(1-\delta)^k}$                                         |
| $\text{BPP}$   | Two-sided-error Monte Carlo algorithm | $\text{Prob}(A(x)=F(x))\geq\frac{1}{2}+\epsilon,0<\epsilon\leq\frac{1}{2}$                                    | $k\geq\frac{2\ln 2\delta}{\ln(1-4\epsilon^2)},L\in \text{BPP}_{1-\delta}$ |
| $\text{PP}$    | Unbounded-error Monte Carlo algorithm | $\text{Prob}(A(x)=F(x))>\frac{1}{2}$                                                                          |                                                                           |

### Optimization Problem

| Algorithm                                                        | Description                                                                                                                                                                                          |
| ---------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| $\text{RFPTAS}$                                                  | $p(\vert x\vert,\delta^{-1})$ is polynomial in both $\vert x\vert$ and $\delta^{-1}$                                                                                                                 |
| $\text{RPTAS}$ (randomized polynomial-time approximation scheme) | $\text{Prob}(A(x)\in M(x))=1$ and $\text{Prob}(\epsilon_A(x,\delta)\leq\delta)\geq\frac{1}{2}$ and $Time_A(x,\delta^{-1})\leq p(\vert x\vert,\delta^{-1})$ and $p$ is a polynomial in $\vert x\vert$ |
| randomized $f(n)$-approximation algorithm                        | $\text{Prob}(A(x)\in M(x))=1$ and $\text{Prob}(R_A(x)\leq f(\vert x\vert))\geq\frac{1}{2}$                                                                                                           |
| randomized $\delta$-approximation                                | $\text{Prob}(A(x)\in M(x))=1$ and $\text{Prob}(R_A(x)\leq\delta)\geq\frac{1}{2}$                                                                                                                     |
| randomized $\delta$-expected approximation                       | $\text{Prob}(A(x)\in M(x))=1$ and $E(R_A(x))\leq\delta$                                                                                                                                              |

- w.h.p (with high probility): $p_c=O(1-\frac{1}{n})$
- Median Trick
  - $\forall\epsilon$, return a $\hat Z$ in time poly($|\phi|,\frac{1}{\epsilon}$), $P((1-\epsilon)Z\leq\hat Z\leq(1+\epsilon)Z)\geq\frac{2}{3}$
  - Repeat $O(\log\frac{1}{\delta})$ and choose median number (Chernoff Bound)
  - FPRAS: $\forall\epsilon,\delta$, return a $\hat Z$ in time Poly($|\phi|,\frac{1}{\epsilon},\log\frac{1}{\delta}$), $P((1-\epsilon)Z\leq\hat Z\leq(1+\epsilon)Z)\geq1-\delta$

### Paradigms of Design of Randomized Algorithm

- Foiling an adversary
- Abundance of witness: decision Problem
  - Fingerprinting: equivalence Problem
- random sampling
  - relexation and random rounding
