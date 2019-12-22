---
title: Galois 理论
date: 2019-02-09
tags: [math, notes]
---

* 分裂域：最小的代数扩张 $L/K$ 使得 $f(x)$ 的所有根在 $L$ 中
* $L/K$ 为代数扩张，$\alpha\in L$ 为 $K$ 上可分元指 $\alpha$ 在 $K$ 上极小多项式在其分裂域中无重根
  * 若每个 $\alpha\in L$ 为 $K$ 上可分元，则称 $L/K$ 为可分扩
* 单扩张定理：$L/K$ 为有限可分扩张，则有 $\gamma\in L$ 使得 $L=K(\gamma)$
* 正规扩张：$L/K$ 为代数扩张，若对于任何不可约 $f(x)\in K[x]$, $f(x)=0$ 在 $L$ 有根 $\Rightarrow$ $f(x)$ 所有根在 $L$ 中
* Galois 扩张：$L/K$ 是**有限可分正规扩张**
* 域扩张 $L/K$ 的 Galois 群 $Gal(L/K)=\{\sigma\in Aut(L):\forall a\in K(\sigma(a)=a)\}$ 按复合构成 $Aut(L)$ 的子群
* $H\leq Gal(L/K)$, 则不变域 $Inv(H)=\{\alpha\in L:\forall \sigma\in H(\sigma(\alpha)=\alpha)\}$ 构成 $L$ 的子域， $K\leq M\leq L$
* Galois 理论基本定理：设 $L/K$ 为域的 Galois 扩张，则
  * 设 $K\leq M\leq L$，则 $L/M$ 为 Galois 扩张且 $Gal(L/M)\leq Gal(L/K), |Gal(L/M)|=[L:M], H=Inv(Gal(L/M))=M$
  * 任给 $H\leq Gal(L/K),M=Inv(H)$, 有 $K\leq M\leq L$，且 $Gal(L/M)=H$
  * 设 $K\leq M\leq L$ 则 $M/K$ 为正规扩张 $\iff Gal(L/M)\unlhd Gal(L/K)$。 $M/K$是正规扩张时，$Gal(M/K)\cong Gal(L/K)/Gal(L/M)$
* $K$ 为域，$K(\sqrt[n]{a})/K$ 称为根式扩充。$Gal(K(\sqrt[n]{a}/K))\cong U(Z/nZ)$ 为有限 Abel 群
* $f(x)\in K[x]$, $f(x)$ 根式可解指存在域扩张 $K_0=K\leq K_1\leq \cdots\leq K_n=L$ 使得 $K_{i+1}/K_i$ 每步都是根式可导的且 $f(x)=0$ 在 $L$ 中可完全分解成一次式乘积
* 域$K$，$f(x)\in K[x]$ 次数大于 0，且分裂元为 $L$，则 $f(x)$ 根式可解 $\iff Gal(L/K)$ 为可解群
* 尺规不可三等分角
  * 尺（一次）规（二次）只能做根号，无法进行3次扩张