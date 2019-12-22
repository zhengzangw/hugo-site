---
title: 2. Generating Functions
date: 2019-09-04
tags: [math, ps, notes]
weight: 2
---

* ordinary generating function(OGF) define by $a_n$: $G(x)=\sum_{n\geq0}a_nx^n$
* coefficient: $[x^k]G(x)$
* $\mathbb{C}[[x]]$: ring of formal power series with complex coefficient
* Combination: 3 red, 4 blue, and 5 green
  * $(1+x+x^2+x^3)(1+x+x^2+x^3+x^4)(1+x+x^2+x^3+x^4+x^5)$
  * coefficient $x^k$ gives the number of way to select $k$ balls
* Fibonacci number
  * $F_n=\frac{1}{\sqrt{5}}(\phi^n-\hat\phi^n),\phi=\frac{1+\sqrt{5}}{2},\hat\phi=\frac{1-\sqrt{5}}{2}$
  * $G(x)=\frac{x}{1-x-x^2}=\frac{x}{(1-\phi x)(1-\hat\phi x)}=\frac{\alpha}{1-\phi x}+\frac{\beta}{1-\hat\phi x}$
* General Methodology
  * Give a recursion that computes $a_n$
  * Give the generating function and manipulate the right hand side of equation so that it becomes some other expression involving $G(x)$
    * shift: $x^kG(x)=\sum_{n\geq k}g_{n-k}x^n$
    * addition: $F(x)+G(x)=\sum_{n\geq 0}(f_n+g_n)x^n$
    * convolution: $F(x)G(X)=\sum_{n\geq 0}\sum_{k=0}^nf_kg_{n-k}x^n$
    * differentiation: $G'(x)=\sum_{n\geq0}(n+1)g_{n+1}x^n$
  * Solve the resulting equation to derive an explicit formula for $G(x)$
  * Expand $G(x)$ into a power series and read off the coefficient of $x^n$
    * Taylor expansion: $G(x)=\sum_{n\geq 0}\frac{G^{(n)}(0)}{n!}x^n$
    * Geometric sequence: $\frac{1}{1-x}=\sum_{n\geq0}x^n$
      * $G(x)=\sum_{i=1}^{k}\frac{a_i}{1-b_ix}$, coefficient of $x^n$ in $G(x)$ is $\sum_{i=1}^ka_ib_i^n$
    * Newton's formular: $(1+x)^\alpha=\sum_{n\geq0}{\alpha\choose n}x^n$
      * ${\alpha\choose n}=\frac{\alpha(\alpha-1)\cdots(\alpha-(n-1))}{n!}$
      * ${-n\choose m}=(-1)^m{n+m-1\choose m}$
* Catalan Number: $C_n=\sum_{k=0}^{n-1}C_kC_{n-1-k},C_0=1$
  * Interpretation
    * Dyck words of length $2n$(A Dyck word is a string consisting of n X's and n Y's such that no initial segment of the string has more Y's than X's)
    * the number of expressions containing n pairs of parentheses which are correctly matched
    * the number of different ways n + 1 factors can be completely parenthesized
    * the number of full binary trees with n + 1 leaves
    * the number of monotonic lattice paths along the edges of a grid with n × n square cells, which do not pass above the diagonal
    * triangulations of a convex (n+2)-gon
  * $C_n=\frac{1}{n+1}{2n\choose n}$
    * Generating function
      * $G(x)^2=\sum_{n\geq0}\sum_{k=0}^nC_kC_{n-k}x^n$
      * $G(x)=1+xG(x)^2\Rightarrow G(x)=\frac{1-(1-4x)^{\frac{1}{2}}}{2x}$
        * 二次方程只有一解：$\lim_{x\rightarrow0}G(x)=C_0$
      * $G(x)=2\sum_{n\geq0}{\frac{1}{2}\choose n+1}(-4x)^n$
    * Andre's reflection method: $C_n={2n\choose n}-{2n\choose n+1}$
    * bijective proof: split up the set of all monotonic paths into $n + 1$ equally sized classes
* Quicksort
  * Quicksort recursion: $T_n=\frac{1}{n}\sum_{k=1}^n(n-1+T_{k-1}+T_{n-k})$
  * $\sum_{n\geq0}nT_nx^n=\sum_{n\geq 0}n(n-1)x^n + 2\sum_{n\geq0}(\sum_{k=0}^{n-1}T_k)x^n$
  * $xG'(x)=\frac{2x^2}{(1-x)^3}+\frac{2x}{1-x}G(x)$
  * $G(x)=\frac{2}{(1-x)^2}\ln\frac{1}{1-x}$
  * $T_n=2(n+1)H(n)-2n$
