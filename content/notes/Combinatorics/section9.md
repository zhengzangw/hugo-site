---
title: 9. Extremal set theory
date: 2019-09-04
tags: [math, ps, notes]
weight: 9
---

How large of how small a collection of finite objects can be, if it has to satisfy certain restrictions

* set system $\mathcal{F}\subset 2^{[n]}$ with ground set $[n]$
* a sunflower of size $r$ with center $C$
  * $|\mathcal{F}|=r$
  * $\forall S,T\in\mathcal{F},S\cap T=C$
* Sunflower Lemma (Erdős-Rado 1960)
  * $\mathcal{F}\subset{[n]\choose k},|\mathcal{F}|>k!(r-1)^k\Rightarrow\exists$ a sunflower $\mathcal{G}\subset\mathcal{F}$ such that $|\mathcal{G}|=r$
* Sunflower Conjecture: $|\mathcal{F}|>c(r)^k$
* Erdős-Ko-Rado Theorem: $\mathcal{F}\subset{[n]\choose k},n\geq 2k,\forall S,T\in\mathcal{F},S\cap T\neq\emptyset\Rightarrow|\mathcal{F}|\leq{n-1\choose k-1}$
  * Shifting(Compression)
    * Isoperimetric problem: Steiner symmetrization
  * Katona's proof
* Antichains: $\forall A,B\in\mathcal{F},A\not\subseteq B,{[n]\choose k}$ is an antichain
  * largest size: ${n\choose n/2}$
  * Sperner's Theorem(1928): $\mathcal{F}\subseteq 2^{[n]}$ is an antichain, $|\mathcal{F}\leq {n\choose\lfloor n/2\rfloor}$
    * Sperner's proof(shadows)
    * LYM inequality: $\mathcal{F}\subseteq 2^{[n]}$ is an antichain, $\sum_{S\in\mathcal{F}}\frac{1}{n\choose|S|}\leq 1$
      * Lubell's proof(counting)
      * Alon's proof(probabilistic)
* trace: the trace of $\mathcal{F}$ on $R$ is $\mathcal{F}|_R=\{S\cap R|S\in \mathcal{F}\}$
* $\mathcal{F}$ shatters $R$ if $\mathcal{F}|_R=2^R$
  * $\forall T\subseteq R,\exists S\in\mathcal{F},T=S\cap R$
* VC-dimesion(Vapnik–Chervonenkis dimension) of a set family $\mathcal{F}\subseteq 2^{[n]}$: $\text{VC-dim}(\mathcal{F})=\max\{|R||R\subseteq [n],\mathcal{F}|_R=2^R\}$
* Sauer's Lemma: Let $\mathcal{F}\subseteq 2^X,|X|=n$. If $|\mathcal{F}|>\sum_{1\leq i<k}{n\choose i}$ then $\exists R\in{X\choose k}$, $F$ shatters $R$.
* hereditary(ideal, abstract simplicial): $S\subseteq T\in\mathcal{F}\Rightarrow S\in\mathcal{F}$
  * $R\in\mathcal{F},\mathcal{F}$ shatters $R$
* down-shift $S_i$: $S_i(T)=T\backslash\{i\}$ if $i\in T$ and $T\backslash\{i\}\not\in\mathcal{F}$, $T$ otherwise
