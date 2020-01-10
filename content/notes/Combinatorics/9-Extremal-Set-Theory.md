---
title: 9. Extremal set theory
date: 2019-09-04
weight: 9
---

How large or how small a collection of finite objects can be, if it has to satisfy certain restrictions

## Sunflower

* set system $\mathcal{F}\subset 2^{[n]}$ with ground set $[n]$
* a sunflower of size $r$ with center $C$
  * $|\mathcal{F}|=r$
  * $\forall S,T\in\mathcal{F},S\cap T=C$
* Sunflower Lemma (Erdős-Rado 1960)
  * $\mathcal{F}\subset{[n]\choose k},|\mathcal{F}|>k!(r-1)^k\Rightarrow\exists$ a sunflower $\mathcal{G}\subset\mathcal{F}$ such that $|\mathcal{G}|=r$
* Sunflower Conjecture: $|\mathcal{F}|>c(r)^k$

## Mutually Intersecting

* Erdős-Ko-Rado Theorem: $\mathcal{F}\subset{[n]\choose k},n\geq 2k,\forall S,T\in\mathcal{F},S\cap T\neq\emptyset\Rightarrow|\mathcal{F}|\leq{n-1\choose k-1}$
  * Katona's proof: double counting
  * Erdős' proof: shifting
* Shifting(Compression)
  * Define a shift operator
    * perserve desired property
    * original problem is easy on shifted elements
  * e.g. Isoperimetric problem: Steiner symmetrization
  
## Sperner System

* Antichains: $\forall A,B\in\mathcal{F},A\not\subseteq B,{[n]\choose k}$ is an antichain
* Sperner's Theorem(1928): $\mathcal{F}\subseteq 2^{[n]}$ is an antichain, $|\mathcal{F}|\leq {n\choose\lfloor n/2\rfloor}$
  * Sperner's proof(shadows)
  * LYM inequality: $\mathcal{F}\subseteq 2^{[n]}$ is an antichain, $\sum_{S\in\mathcal{F}}\frac{1}{n\choose|S|}\leq 1$
    * Lubell's proof(counting)
    * Alon's proof(probabilistic)

## VC-dimension

* trace: $\mathcal{F}\subseteq 2^X,R\subseteq X$, the trace of $\mathcal{F}$ on $R$ is $\mathcal{F}|_R=\{S\cap R|S\in \mathcal{F}\}$
* $\mathcal{F}$ shatters $R$ if $\mathcal{F}|_R=2^R$
  * $\forall T\subseteq R,\exists S\in\mathcal{F},T=S\cap R$
* VC-dimesion(Vapnik–Chervonenkis dimension) of a set family $\mathcal{F}\subseteq 2^{[n]}$: $\text{VC-dim}(\mathcal{F})=\max\{|R||R\subseteq [n],\mathcal{F}|_R=2^R\}$
* Sauer's Lemma: Let $\mathcal{F}\subseteq 2^X,|X|=n$. If $|\mathcal{F}|>\sum_{1\leq i<k}{n\choose i}$ then $\exists R\in{X\choose k}$, $F$ shatters $R$
  * $|\mathcal{F}|>\sum_{1\leq i<k}{n\choose i}$ then $\text{VC-dim}(\mathcal{F})\geq k$
* hereditary(ideal, abstract simplicial): $S\subseteq T\in\mathcal{F}\Rightarrow S\in\mathcal{F}$
  * $R\in\mathcal{F},\mathcal{F}$ shatters $R$
* down-shift $S_i$: $S_i(T)=T\backslash\{i\}$ if $i\in T$ and $T\backslash\{i\}\not\in\mathcal{F}$, $T$ otherwise
