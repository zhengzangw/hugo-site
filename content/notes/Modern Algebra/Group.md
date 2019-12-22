---
title: 群论
date: 2019-02-09
tags: [math, notes]
weight: 2
---

## 群作用的基本概念

* 群 $G$ 在集合 $X$（$G$-集） 上的（左）作用$\circ$： $G$ 为群， $X$ 为非空集合，若 $\forall g\in G, x\in X, !\exists g\circ x\in X$ 且
  * $\forall x\in X(e\circ x=x)$
  * $g_1\circ(g_2\circ x) = (g_1g_2) \circ x$
* **定理**：$G$ 在 $X$ 上的群作用与 $G$ 到 $S(X)$ 的同态构成双射
* 轨道：$O_x=Gx=\{g\circ x:g\in G\}$，是 $X$ 上的等价类
  * $X/G=\{O_x|x\in G\}$
  * 若$O_x=X$，则 $G$ 在 $X$ 上可迁
  * $X=\bigsqcup O_x$
* 稳定化子(stabilizers)：$G_x=\text{stab}(x)=\{g\in G: g\circ x=x\}\leqslant G$
  * $[G:G_x]=|O_x|$
* 作用核：$\text{ker}(X)=\cap_{x\in X}G_x=\{g\in G:\forall x\in X, g\circ x=x\}$
  * $\text{ker}(X)\trianglelefteq G$ 且 $G/\text{ker}(X)$ 可嵌入到 $S(X)$ 中
* $g$-不动点(invariant set)：$X_g=\text{fix}(g)=\{x\in X:g\circ x=x\}$
* 不动点：$\text{fix}(G)=\cap_{g\in G}X_g=\{x\in X: \forall g\in G(g\circ x=x)\}$
* **Burnside引理**: $|X/G|=\frac{1}{|G|}\sum_{g\in G}|X_g|$
* **定理**：非不动点个数可表达成 $|G|$ 的一些素因子相加（可重复）
* $|O_x|=1\iff x\in \text{fix}(G)$

## Pólya Theory of Counting

* $M_\pi(x_1,x_2,\cdots,x_n)=\prod_{i=1}^k x_{l_i}$
* cycle index of $G$: $P_G(x_1,x_2,\cdots,x_n) = \frac{1}{|G|}\sum_{\pi\in G}M_\pi(x_1,x_2,\cdots,x_n)$
* pattern inventory: $F_G(y_1,y_2,\cdots,y_m)=\sum_{v}a_vy_1^{n_1}y_2^{n_2}\cdots y_m^{n_m}$
  * $v=(n_1,n_2,\cdots,n_m),\sum_{i=1}^m = n$
* Pólya's enumeration formula: $F_G(y_1,y_2,\cdots,y_m)=P_G(\sum_{i=1}^my_i,\sum_{i=1}^my_i^2,\cdots,\sum_{i=1}^my_i^n)$

## $p$群与 Sylow 定理

* $p$群：$p^\alpha$阶群
* **定理**：
  * $p$群作用在$X$上，则$|X|\equiv|Fix(G)| (\bmod p)$
    * $p\not|\ |X|$, 则必有不动点
  * $p$群中心$Z(G)$有非单位元
  * $p^2$阶群为$Abel$ 群
* $ord_p(a)=n$：$p^n\ ||\ a$
* Sylow $p$子群：$|H| = p^{ord_p|G|}$
* $G$ 必有$p(p\ |\ |G|)$阶元
* **Sylow 定理**：
  * **Sylow 第一定理**（存在性）：$G$ 必有Sylow $p$子群
  * **Sylow 第二定理**（关系）：$H$为有限群 $G$ 的一个Sylow $p$子群，则 $G$ 的任一个 $p$子群 $K$ 都被包含在某个与 $H$ 共轭的子群中
    * $\{G$ 的Sylow $p$子群$\}=\{aHa^{-1}:a\in G\}$
    * $p$为有限群 $G$ 的 Sylow $p$子群，则 $p\trianglelefteq G\iff p$是唯一的 Sylow $p$子群
    * (Fratinni) $H$ 是群 $G$ 的有穷正规子群，$P$是 $H$ 的 Sylow $p$-子群，则 $G=HN_G(P)$
  * **Sylow 第三定理**（数量）：$|G|=p^\alpha m$，则
    * $n_p|m$
    * $n_p\equiv 1(\bmod p)$
    * $n_p=[G:N_G(H)],H$为任一Sylow $p$子群

## 群作用的例子

* $G$ 为群，$H$ 为子群。$h\in H,x\in X=G$, $h\circ x=hx$
  * $O_x=Hx$，轨道分解即为右陪集分解
  * $stab(x)=\{e\}$
  * $|Hx|=|O_x|=[H:stab_x]=|H|$
* $X=G, \forall g\in G,x \in X, g\circ x=gxg^{-1}$
  * $O_x=C(x)$ 为 $x$ 所在的共轭类
  * $stab(x)=C_G(x)=\{g\in X: gx=xg\}$ 为中心化子
  * $ker(X)=Z(X)$ 为中心
  * $G/Z(G)\cong Inn(G)$ 可嵌入 $S(G)$ 中
* $H\leqslant G,X=G/H$（所有左陪集）$g\circ (xH)=gxH$
  * $O_x=X$
  * $stab(x)=xHx^{-1}$
  * $[G:xHx^{-1}]=|X|=[G:H]$
  * $ker(X)=H_G$ 为 $H$ 在 $G$ 中的正规核
  * $G/H_G$ 可嵌入 $S(G/H)$
    * $[G:H][H:H_G] = |G/H_G|\ |\ |S(G/H)|=[G:H]!\Rightarrow [H:H_G]\ |\ ([G:H]-1)!$
    * $[G:H]$ 为 $|G|$ 中的最小素因子$p$时，$H\trianglelefteq G$
* $H\trianglelefteq G$, $X=\{aHa^{-1}:a\in G\}, g\circ (aHa)=(ga)H(ga)^{-1}$
  * $O_x=X$
  * $stab(aHa^{-1})=N_G(H)$
  * $[G:N_G(H)]=|O_x|=|X|$，与$H$共轭的$G$的子群个数等于正规化子的指标

## 正规群列与合成群

* $G_0=\{e\}\trianglelefteq G_1\trianglelefteq G_2 \trianglelefteq\cdots\trianglelefteq G_n=G$ 则称此为 $G$ 的一个正规群列，$n$ 为正规群长度，相应的商群 $G_1/G_0, G_2/G_1,\cdots, G_n/G_{n-1}$
* 若一个正规群列的子群(1)都在另一个正规群列(2)中出现，则称(2)为(1)的加细。若不存在异于自身的加细，则称(1)为群 $G$ 的一个合成群列
  * 合成群列$\iff G_{i-1}$为$G_i$的极大正规群$\iff G_i/G_{i-1}$ 为单群
* 列(1)与列(2)等价指 $m=n$ 且 $\sigma\in S_n$，使 $G_i/G_{i-1}\cong H_{\sigma(i)}/H_{\sigma(i)-1}$
* $G$ 的极大正规群 $H$：$H\trianglelefteq G$ 且没有 $G$ 的正规子群 $K$ 使 $H<K<G$
* **Schreier 定理**：群 $G$ 的任两个正规群列有等价的加细
* **Jordan-Holder 定理**：群 $G$ 的有合成群列
  * $G$ 的每个正规群列可加细成合成群列
  * $G$ 任何两个合成群列等价
* $H$ 在 $G$ 中次正规：存在从$H$到$G$的正规群列
  * $H$ 是群 $G$ 的指标有穷的次正规子群，则存在从 $H$ 到 $G$ 的合成群列
    * 有限群必有合成群列
  * $H,K\leqslant G$, $H$ 在 $G$ 中次正规
    * $H\cap K$ 在 $K$ 中次正规
    * $K\trianglelefteq G$，$HK$ 在 $G$ 中次正规

## 导群与可解群

* x, y的换位子（commutator）：$[x,y]=x^{-1}y^{-1}xy=(yx)^{-1}xy$
* $H,K\leqslant G$，$[H,K]=\langle [h,k]:h\in H, k\in K\rangle$
* 导群（换位子群）：$G'=[G,G]=\langle [x,y]:x,y\in G\rangle$
* $[x,y]=e\iff xy=yx$
* $[x,y]^{-1}=[y,x]$
* $[H,K]=[K,H]$
* $H,K\trianglelefteq G\Rightarrow[H,K]\trianglelefteq G$，$H\trianglelefteq G\Rightarrow H'\trianglelefteq G$
* $G/H$ 为 Abel 群的最小正规子群 $H=G'$
  * $G$ 为 Abel 群 $\iff G'=\{e\}$
* $G^{(0)}=G,G^{(1)}=G',G^{(n)}=(G^{(n-1)})'$, $G^{(n)}$ 为 $G$ 的 $n$ 阶导群
* $n\in N$，则 $G^{(n)}\trianglelefteq G$。$H\trianglelefteq G$ 时，$(G/H)^{(n)}=G^{(n)}H/H$
* 导列：$G=G^{(0)}\trianglerighteq G^{(1)}\trianglerighteq \cdots$。若$G^{(n)}=G^{(n+1)}$，则导列长度为 $n$
* 可解群：$G$ 的群列 $G_0=\{e\}\unlhd G_1\unlhd \cdots \unlhd G_n$ 相应的商群 $G_1/G_0, G_2/G_1,\cdots, G_n/G_{n-1}$ 都是 Abel 群，则 $G$ 其为 Abel 列。有 Abel 列的群为可解群
  * $G$ 可解 $\iff \exists n\in N(G^{(n)}=\{e\})$
  * 可解群 $G$ 的导列是下降最快的 Abel 列
* 可解单群为素数阶循环群
* $|G|=p^n$ 为可解群，且 $G$ 有 $p^i$ 阶正规子群 $H_i$，$\{e\}= H_0\unlhd H_1\unlhd\cdots H_n=G$
* 有限群 $G$ 可解$\iff\exists$ 正规群列 $G_0=\{e\}\unlhd G_1 \unlhd G_2 \unlhd \cdots \unlhd G_n=G$ 其中 $G_i/G_{i-1}$ 为素数阶循环群
* **定理**
  * 可解群的子群和商群为可解
  * $H\unlhd G$，若 $H$ 与 $G/H$ 皆可解，则 $G$ 可解
  * $H\unlhd G, K\unlhd G$，则 $G/(H\cap K)$ 可解 $\iff G/H$ 可解且 $G/K$ 可解
* **Burnside 定理**：$p^aq^b$ 阶群可解
  * $p^2q$ 阶群可解
* **Feit-Thompson 定理(1963)**：奇数阶群可解
  * 不可解单群必须为偶数阶（奇合数单群不可解）
* **有限单群的分类(2004)**
  * 26散在单群，最大的散在单群（魔群）阶为 $2^{40}\cdot3^{20}\times5^{9}\cdot7^{6}\cdot11^{2}\cdot13^3\cdot17\cdot19\cdot23\cdot29\cdot31\cdot41\cdot47\cdot59\cdot71\approx 8\cdot10^{53}$
* **定理**
  * $n\in Z^+, S_n'=A_n$
  * $n\leq 3,S_n''=A_n'=\{e\}$
  * $n=4,S_4''=A_4'$ 为 Klein 四元群 $\{(1),(12)(34),(13)(24),(14)(23)\}$，$S_4'''=\{e\}$
* **Galois**：$n\geq 5$
  * $A_n$ 为单群 （证明复杂没听）
  * $S_n$ 与 $A_n$ 不可解

## Abel 群结构

* 幂指数$exp(G)$: $\forall x,x^n=e$ 最小的 $n$
  * $exp(G)= lcm(o(x_i))$
* 有限 Abel 群 $G$，$a,b\in G$ 且 $(o(a),o(b))=1$， 则 $o(ab)=o(a)o(b)$
* 有限 Abel 群 $G$，$exp(G)=max_{g\in G}o(g)$
  * $n_1,n_2,\dots,n_k$ 两两互素，则 $C_{n_1}\times C_{n_2}\times \dots C_{n_k} \cong C_{n_1n_2\dots c_k}$
* 有限 Abel 群 $|G|=p_1^{\alpha_1}\cdots p_n^{\alpha_n}$，则 $G\cong G_1\times\cdots G_n$，其中 $G_i$ 为 $G$ 的 Sylow $p_i$子群
* **有限 Abel 群的结构定理**：$G$ 为阶大于1的有限 Abel 群
  * 有唯一的一组正整数 $n_1,\dots,n_k$使$1<n_1|n_2|n_3|\cdots|n_k$ 且 $G\cong C_1\times\cdots\times C_{n_k}$
  * 可以唯一表示成一些循环 $p$群的直积
* **有限生成的 Abel 群的结构定理**：
  * $Tor(G)=\{a\in G:o(a)有穷\}$ 为 $G$ 的有限子群（挠子群，torsion subgroup）
  * $G\cong Tor(G)\times Z\times\cdots\times Z$($r$个)，$rank(G)=r$
* **Mordell-Weil 定理**

## 其它

* 几何研究不变量的，代数研究结构
* 群论与组合
  * (Haul) $G=\{g_1,\dots,g_n\}$ 为 $n$ 阶加法 Abel 群，$a_1,a_2,\dots,a_n\in G$，$\sum{a_i}=0$，一定存在$\sigma$ 使得  $a_\sigma(i)+g=G$
  * (Snevily猜想) $0<k<n,a_1,\dots,a_k\in Z$，则有 $1,\dots,k$ 的排列 $i_1,\dots,i_k$ 使得 $a_i+k_i$ 模 $n$ 的余数两两不同
    * $k\leq\frac{n+1}{2}$ 时猜想成立
