---
title: 8. Extremal Graph Problem
date: 2019-09-04
tags: [math, ps, notes]
weight: 8
---

* Triangle-free graph: contains no triangle as subgraph
* Mantel's Theorem (1907): if $G(V,E)$ has $|V|=n$ and is triangle-free, then $|E|\leq\frac{n^2}{4}$(for $n$ is even, extremal graph: $K_{\frac{n}{2},\frac{n}{2}}$)
  * First Proof: Induction
  * Second Proof: $d_u+d_v\leq n$
  * Third Proof
* Turán's Theorem (1941): If $G(V,E)$ has $|V|=n$ and is $K_r$-free, then $|E|\leq\frac{r-2}{2(r-1)}n^2$
  * Turán graph $T(n,r)=K_{n_1,\cdots,n_r},\sum_{i=1}^rn_i=n,n_i\in\{\lfloor\frac{n}{r}\rfloor,\lceil\frac{n}{r}\rceil\}$
    * $T(n,r-1)$ has no $K_r$
  * First Proof: Induction
  * Second Proof: weight shifting
  * Third Proof: the probalilistic method
  * Fourth Proof
* Turán's Theorem (independent set): $G(V,E)$ has $|V|=n$ and $|E|=m$ then $G$ has an independent set of size $\geq\frac{n^2}{2m+n}$
* Parallel Max: compute max of $n$ distinct numbers
  * 1-round: ${n\choose 2}$
  * 2-round: $O(n^{\frac{4}{3}}),k=n^{\frac{2}{3}}$
* $\text{ex}(n,H)=\max_{G\not\supset H,|V(G)|=n}|E(G)|$
  * Turan's Theorem: $\text{ex}(n,K_r)=|T(n,r-1)|\leq\frac{r-2}{2(r-1)}n^2$
  * $K_s^r=K_{s,s,\cdots,s}=T(rs,r)$: complete $r$-partite graph with $s$ vertices in each part
  * Erdős–Stone theorem: $\text{ex}(n,K_s^r)=(\frac{r-2}{2(r-1)}+o(1))n^2$
  * Corollary: For any nonempty graph $H$, $\lim_{n\rightarrow\infty}\frac{\text{ex}(n,H)}{n\choose 2}=\frac{\chi(H)-2}{\chi(H)-1}$
    * extremal density of subgraph $H$: $\text{ex}(n,H)/{n\choose 2}$
  * girth $g(G)$: length of the shortest cycle in $G$
  * Theorem: if $G(V,E)$ has $|V|=n$ and girth $g(G)\geq 5$ then $|E|\leq\frac{1}{2}n\sqrt{n-1}$
