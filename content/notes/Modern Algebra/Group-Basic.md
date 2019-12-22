---
title: 群的基本概念(问求内容)
date: 2019-02-09
tags: [math, notes]
weight: 1
---

## 群的定义

* 代数运算: 任一个由 $A\times A$ 到 $A$ 的映射（闭合）
  * 代数系统 $(A,\cdot)$：非空集合上定义代数运算
* 半群（semigroup）：满足结合律
  * $a_1a_2\dots a_n$的结果与括号的添加方式无关
  * 半群 $G$ 构成群 $\iff G$ 满足可除性条件：$\forall a,b\in G, ax=b,ya=b$ 在 $G$ 中都有解
  * 消去律成立的有限半群为群
* 幺半群（monoid）：满足结合律，有单位元
* 群：非空集合 $G$ 上定义一个代数运算满足
  * 结合律：$a(bc)=(ab)c$
  * 单位元（幺元）：$\exists e, \forall a\in G, ea=a$
  * $\forall a\in G, \exists b\in G, a\cdot b=b\cdot a=1$
* Basic Properties of Groups
  * uniqueness of identities
  * uniqueness of inverse
    * $(ab)^{-1}=b^{-1}a^{-1}$
    * $(a^{-1})^{-1}=a$
  * uniqueness of solution to $ax=b(xa=b)$
  * cancellation laws: $ab=ac\Rightarrow b=c,ba=ca\Rightarrow b=c$
* Visualization
  * Describe a group in Cayley table
  * Cayley graph: $\Gamma=\Gamma(G,S),S$ generates $G$
    * $s\in S$ assigned a color $c_s$
    * $\forall g\in G,s\in S,$ edge $(g,gs)$ is assigned $c_s$
* 交换群（Abel 群）
  * 满足交换律的半群，$a_1a_2\dots a_n$ 可任意颠倒顺序
  * 若 $G$ 中任一元素阶为1或2，则 $G$ 为 Abel 群
  * $(ab)^n=a^nb^n$
* 有限群：$|G|=n<\infty$，称为 $n$ 阶群

<!--more-->

## 循环群

* The smallest subgroup contains $a$: $\langle a\rangle$
  * abelian
* $o(g)$：元素 $g$ 的阶, 满足 $g^k=1$ 的最小正整数 $k$
  * 若不存在，则 $g$ 为无限阶元素
  * $g^k=1\Rightarrow o(g)|k$
  * $o(g)=|\langle g\rangle |$
* **定理**
  * 循环群的子群仍是循环群
    * $o(g^m)=|\langle g^m\rangle|=|\langle g^{(m,o(g))}\rangle|=\frac{o(g)}{(m,o(g))}$
  * 素数阶群为循环群

| 循环群阶 | $\cong$        | 子群                                      | 子群数量 | 生成元                             | 生成元数量   |
| -------- | -------------- | ----------------------------------------- | -------- | ---------------------------------- | ------------ |
| $\infty$ | $\mathbb{Z}$   | $\langle a^n\rangle$                      | $\infty$ | $g^{\pm1}$                         | 2            |
| $n$      | $\mathbb{Z}_n$ | $\langle g^{\frac{n}{s}}\rangle,s\vert n$ | $d(n)$   | $\{g^{k}\vert (k,n)=1,0\leq k<n\}$ | $\varphi(n)$ |

## 子群

* 子群：$H\subseteq G$且 $H$ 按 $G$ 的乘法构成群，则 $H\leqslant G$。 若$H\not= G$ 则 $H<G$
* **子群的验证定理**： 以下命题等价
  1. $H\leqslant G$
  2. $e\in H$ 且 $\forall a\in H,a^{-1}\in H$ 且 $\forall a,b\in H, ab\in H$
  3. $\forall a,b\in H, ab^{-1}\in H$
* 集合的运算
  * $X^{-1}=\{x^{-1}:x\in Z\}$
  * $XY=\{xy:x\in X,y\in Y\}$
  * 对于子群 $H$，$H^{-1}=H, HH=H$
* **定理**：群$G$若干子群交仍是$G$的子群
* 生成子群：$\langle S\rangle = \cap_{S\subseteq H\subseteq G}H = \{x_1^{m_1}\cdots x_k^{m_k}:x_i,m_i\in Z\}$
  * $\langle g\rangle=\{g^k|k\in Z\}$：包含 $g$ 的最小子群
  * 有限生成群：$|\langle S\rangle | < \infty$
  * 循环群：$\langle g\rangle$ ，$g$ 为生成元

## 陪集

* 陪集：右陪集 $aH=\{ah|a\in G, h\in H\}$, 左陪集 $Ha=\{ha|a\in G,h\in H\}$
  * 若$aH\not=bH$, 则 $aH\cap bH=\emptyset$
    * $x\in aH\iff aH=xH\iff x^{-1}a\in H$
  * $aH\approx H\approx Ha$
  * 指标（指数）：$[G:H]=|\{aH:a\in G\}|=|\{Hb:b\in G\}|$
  * **陪集分拆**：$G=\bigsqcup aH$
* **拉格朗日定理**：$|G|=|H|*[G:H]$
  * $\lvert H\rvert\vert\lvert G\rvert$
  * **欧拉定理**：$n$ 阶群 $G$ 中，$a^{|G|}=e$
  * 非 Abel 群最小阶数为6
* $H\leqslant G,K\leqslant G$
  * $K\leqslant H\leqslant G$， $[G:K] = [G:H][H:K]$
  * $HK\leqslant G\iff HK=KH$
  * $HK$ 是 $[K:H\cap K]$ 个两两不相交的 $H$ 右陪集的并
  * $|H||K| = |HK||H\cap K|$
  * （Poincare）$[G:H\cap K]\leq [G:H][G:K]$ 等号成立当且仅当$HK=G$

## 正规子群

* 共轭关系（等价关系）：$x\sim h\iff\forall g\in G, gxg^{-1}=h$
  * 正规子群是 $G$ 中共轭类之并
* 中心：$Z(G)$：$\forall h\in Z(G), g\in G, ghg^{-1}=h$
  * 只有一个元素的共轭类之并
  * $G$ 中所有元素都交换的元素
* 正规子群：$\forall g\in G, gH=Hg$, 则$H\trianglelefteq G$
  * 等价定义
    * $\forall g\in G$, $gHg^{-1}=H$
    * $\forall h\in H, \forall g\in G, ghg^{-1}\in H$
    * $H$ 任意两个左陪集的乘积仍是左陪集
  * $\{e\}\trianglelefteq G,G\trianglelefteq G$
  * Abel 群的任何子群都是正规子群
  * $H\trianglelefteq G, K\leqslant G$, 则$HK=KH\trianglelefteq G$
  * $H\leqslant K\leqslant G,H\trianglelefteq G$, 则$H\trianglelefteq K$
  * $\cap$ 封闭
* Factor(quotient) Groups $G/N$: $\{aN,a\in G\}$ under $(aN)(bN)=abN,N\trianglelefteq G$
  * $|G/N|=[G:N]$
* $H$ 在 $G$ 中的正规化子：$N_G(H)=\{g\in G:gH=Hg\}$
* $H$ 在 $G$ 中的正规核：$H_G=\cap_{g\in G}gHg^{-1}$
* 单群：没有非平凡正规子群的群
  * 阿贝尔单群即为素数阶循环群

## 同态与同构

* 同态（homomorphism）：映射 $f:G_1\rightarrow G_2$ 满足 $f(gh)=f(g)f(h)$
  * $\sigma(e)=\overline{e}$
  * $\sigma(a^{-1})=\sigma(a)^{-1}$
  * $H_1\leq G_1\Leftrightarrow\sigma(H_1)\leq G_2$
    * $G$ 包含 $\text{Ker}(\sigma)$ 的子群与 $\text{Im}(\sigma)$ 的子群一一对应
  * $\text{Ker}(\sigma)\leqslant H\leqslant G$，则 $H\trianglelefteq G\iff \sigma(H)\trianglelefteq\sigma(G)$
  * $\text{Ker}(\sigma)\leqslant H\trianglelefteq G$，则 $G/H \cong \sigma(G)/\sigma(H)$
  * $o(\phi(x))|o(x)$
* 同态像：$\text{Im} \phi=\{h\in G_2:\exists g\in G_1,f(g)=h\}$
* 同态核：$\text{ker} \phi=\{g\in G_1:f(g)=\overline{e}\}$
* 自然同态：$\phi:G\rightarrow G/K$ is $\forall a\in G,\sigma(a)=aK$
* **同态基本定理**(First Isomorphism Theorem): $\psi:G\rightarrow H$
  * $\text{Im}(\psi)\leqslant H$
  * $\text{Ker}(\psi)\trianglelefteq G$
  * $G/\text{Ker}(\psi)\cong \text{Im}(\psi):\eta$
    * $\psi=\eta\phi$
* 单同态（嵌入映射）：f 为单射
* 满同态：f 为满射
* 自同构：$G$ 到自身的同构
* 同构(Isomorphism): 双射 $f:G_1\rightarrow G_2$ 满足 $f(gh)=f(g)f(h)$
  * $G_1\cong G_2$
  * $f^{-1}$ is isomorphism
  * 同构为所有群集合上的等价关系
* **Cayley定理**：任何群 $G$ 同构于一个置换群
  * left regular representation: $g\rightarrow \lambda_g$, $\lambda_g:G\rightarrow G,\lambda_g(a)=ga$
* **第一同构定理**(Correspondence Thoerem)：$N\trianglelefteq G$
  * $\{K:K\leq G/N\}\leftrightarrow\{H:N\leqslant H\leqslant G\}$
  * $N\leqslant H\leqslant G$, 则$H/N\trianglelefteq G/N \iff H\trianglelefteq G$
  * (Third Isomorphism Theorem)$N\leqslant H\trianglelefteq G$，则$(G/N)/(H/N)\cong G/H$
* **第二同构定理**：(Second Isomorphism Theorem)
  * 已知 $N\trianglelefteq G, H\leqslant G$
  * $(H\cap N)\trianglelefteq H$
  * $H/(H\cap N)\cong HN/N$
* Dedekind律：$K\leqslant H\leqslant G$ 且 $L\leqslant G$， 则 $H\cap KL=K(H\cap L)$
* 引理：$K\trianglelefteq H \leqslant G$, $L\leqslant G$
  * $(K\cap L)\trianglelefteq (H\cap L), (H\cap L)/(K\cap L) \cong (K(H\cap L)/K)$
  * $L\trianglelefteq G$，则 $KL\trianglelefteq HL,K(H\cap L)\trianglelefteq H,HL/KL\cong H/(K(H\cap L))$
* **第三同构定理**（Zassenhaus）：$L_1\trianglelefteq H_1\leqslant G,L_2\trianglelefteq H_2\leqslant G$
  * $(H_1\cap L_2)L_1\trianglelefteq (H_1\cap H_2)L_1$
  * $(H_2\cap L_1)L_2\trianglelefteq (H_1\cap H_2)L_2$
  * $(H_1\cap H_2)L_1/(H_1\cap L_2)L_1\cong (H_1\cap H_2)L_2/(H_2\cap L_1)L_2$

## 直积

* External Direct Products: $G=G_1\times G_2\times \dots\times G_n$
  * $(g_1,\cdots,g_n)\in\prod G_i,o(g_i)=r_i,o((g_1,\cdots,g_n))=lcm(g_1,\cdots,g_n)$
  * $\prod_{i=1}^k\mathbb{Z}_{n_i}\cong\mathbb{Z}_{n_1\cdots n_k}\iff\gcd(n_i,n_j)=1$
  * $G_i^\star =\{\langle e_1,\dots,x,\dots,e_n\rangle:x\in G_i\}\cong G_i\unlhd G$
    * $G_1^\star G_2^\star \dots G_n^\star =G$
    * $G_1^\star \dots G_{i-1}^\star G_{i+1}^\star \dots G_n^\star \cap G_i^\star =\{e\}$
  * **定理**：以下三条等价
    * $G_1^\star \dots G_{i-1}^\star G_{i+1}^\star \dots G_n^\star \cap G_i^\star =\{e\}$
    * $x\in G$ 至多可以用一种方式表成 $x_1\dots x_n$
    * $e=x_1\dots x_n$，必有 $x_1=\dots=x_n=e$
* Cancellation: $G\times K\cong H\times K, |K|<\infty\Rightarrow G\cong K$
* Internal Direct Product: $G=G_1G_2\dots G_n:G_1,\dots,G_n\unlhd G;G_1^\star \dots G_{i-1}^\star G_{i+1}^\star \dots G_n^\star \cap G_i^\star =\{e\}$
  * $H,K\unlhd G$，$|H||K|=|G|,H\cap K=\{e\}$，则 $G\cong H\times K$
  * $G/K=H,G/H=K$
* 统称直积
  * If $G = H \times K$, then $\exists H' \simeq H,K' \simeq K$ such that $G$ is the internal direct product of $H'$ and $K'$.
  * If $G$ is internal product of $H$ and $K$ then $G\cong H\times K$

## 群的例子

### 数域

* $\mathbb{Q}^\star/\mathbb{R}^\star/\mathbb{C}^\star$ 在通常乘法意义下构成 *Abel群*，$\mathbb{Z}$ 在通常加法意义下构成 *Abel群*
  * $\mathbb{N}$ 在通常乘法加法意义下分别构成*幺半群*
    * 消去律成立，但不是群
  * $\mathbb{Z}=\langle 1\rangle$ 在加法意义下构成 *Abel群*， 称为*整数加群*
    * *正规子群* $\langle m \rangle = m\mathbb{Z}$ 在整数加法意义下构成 *Abel群*
    * *商群* $\mathbb{Z}_m=\mathbb{Z}/m\mathbb{Z}=\{\overline{a}:a\in \mathbb{Z}\}$按剩余类的加法构成 *$m$阶Abel群*
      * $a$ 模 $m$ 的剩余类：$\overline{a} = a+mZ$
    * $U_m=\{\overline{a}:(a,m)=1\}$按剩余类的乘法构成 *$\varphi(m)$阶Abel群*
  * $f(x)=|x|$ 为*同态*，（乘法群）同态核为$\{\pm 1\}$, 商群 $\cong Q^{+}$
  * $f(x)=lg(x)/e^x$为乘法群与加法群之间的*同构*
* $\mathbb{Z}[i] = \{a+bi:a,b\in \mathbb{Z}\}, \mathbb{Z}[\omega] = \{a+b\omega:a,b\in Z\}$在复数乘法的意义下分别构成*幺半群*
* $\forall m\in \mathbb{Z}, S_m=\{\frac{a}{b}:a,b\in \mathbb{Z},b\not=0,(b,m)=1\}$在乘法的意义下构成*幺半群*
  * $S_0=\mathbb{Z}$
* $M_d=\{x^2+dy^2:x,y\in \mathbb{Z}\}$在乘法的意义下构成*幺半群*
* $U_n=\{z\in\mathbb{C}:|z|=1\}=\langle e^{2\pi i/n}\rangle$ 在复数乘法的意义下构成 *n阶循环群*

### 映射

* 集合 $X$ 到自身映射（变换）的集合在映射复合的意义下为*幺半群*

#### 对称群

* 置换：双射
  * $\sigma\tau(i)=\sigma(\tau(i))$
  * 轮换：$l$ 轮换 $\sigma=(a_1a_2\dots a_l):\sigma(x)=a_{(i+1)\bmod l},x=a_i;\sigma(x)=x,o.w.$
    * 恒等映射：$l=1$
    * 对换：$l=2$
    * $l$ 轮换可表为 $l-1$ 个对换
    * 两个不相交的轮换$\sigma,\tau,\sigma\tau=\tau\sigma$
  * 任意置换总是可以表示为不相关的轮换的复合
    * $\sigma$ 写为不相交轮换乘积时，$k$ 轮换个数为 $\lambda_k$，则称 $\sigma$ 的型为 $1^{\lambda_1}2^{\lambda_2}\cdots n^{\lambda_n}$
      * $\sum_{i=1}^{n}i\lambda_i = n$
  * 置换奇偶性：
    * 偶数（奇数）个对换的乘积为偶（奇）置换
    * $N_\sigma$为偶数则为偶置换，否则为奇置换
      * $\sigma\in S_n,1\leq i<j\leq n$ 而 $\sigma(i)>\sigma(j)$，则称其为 $\sigma$ 的一个逆序，总逆序数为 $N_\sigma=\vert\{\langle i,j\rangle,1\leq i<j<n,\sigma(i)>\sigma(j)\}\vert$
    * $sgn(\sigma)=(-1)^{N_\sigma}$
      * $\prod_{1\leq i<j\leq n}(\sigma(j)-\sigma(i))=sgn(\sigma)\prod_{1\leq i<j\leq n}(i-j)$
      * $sgn(\sigma\tau)=sgn(\sigma)sgn(\tau)$
* *置换群*（对称群）$S(X)=Sym(X)$:
  * $|S_n|=n!$
  * $S_3$ 有两个元素生成，非 Abel 群
  * $S_3$ 有6个子群，$S_4$ 有30个子群
  * Sym(正方体)=$S_4$

#### 对称群子群

##### 交错群

* 交错群：$A_n=\{\sigma\in S_n: sgn(\sigma)=1\}\unlhd G$
  * $S_n/A_n=\{\pm 1\}=C_2$
  * $|A_n|=\frac{n!}{2}$
  * $A_n(n\geq 5)$ 是单群
  * $A_4$ has no subgroup of order 6
  * Sym(四面体)=$A_4$, 共10个子群
    * 9 elements of order 3
    * 3 elements of order 2

##### 刚体运动群

* 保持刚体不变的运动在复合意义下构成*群*
* Dihedral Group（*二面体群* ）: $D_n(D_{2n})$
  * Group of symmetries of regular n-gon
  * $|D_n|=2n$
  * consists of all product of $r$ and $s$
    * $r^n=1$
    * $s^2=1$
    * $srs=r^{-1}$
  * $D_3\cong S_3$
  * $D_n\cong D_{n/2}\times\mathbb{Z}_2,n\geq 6,n=4k+2$
  * Every subgroup of $D_n$ is cyclic or dihedral

$$
Z(D_n)=\begin{cases}
\{e\} & 2\not|n \\
\{e,r^{n/2}\} & 2|n
\end{cases}
$$

##### 自同构群

* *自同构群* $Aut(G)$：群 $G$ 所有自同构在复合映射意义下构成*群*
  * 有限自同构群 $Aut(G)\cong \mathbb{Z}/n\mathbb{Z}$
  * 无限自同构群 $Aut(G)\cong \mathbb{Z}/2\mathbb{Z}$
  * $\varphi:G\rightarrow H$ 为 $G$ 到 $H$ 同构，则 $G$ 到 $H$ 所有同构为 $\{\varphi\circ f|f\in Aut(G)\}$
* 内同构群 $\text{Inn}(G)$: $\phi_a(g)=aga^{-1}$
  * $\text{Inn}(G)\unlhd Aut(G)$
  * $G/Z(G)\cong\text{Inn}(G)$

### 矩阵

* $M_n(R)$ $n$ 阶实方阵在矩阵乘的意义下构成*幺半群*
* *一般线性群*$GL_n(P)$，其子群称为*典型群*
  * 正规子群，*特殊线性群*$SL_n(P)$
    * $f(A) = \det(A)$ 为*满同态*，同态核为$SL_n(P)$，商群$GL_n/SL_n\cong R^\star $
    * 子群，$T_n(F)$为对角线全一的n阶上三角阵
  * *正交群* $O_n(R)=\{A\in GL_n(R):A^TA=AA^T=I\}$
    * *特殊正交群* ${SO}_n(R)=O_n(R)\cap SL_n(R)$
  * *酉群*：$U(n)=\{A|\overline{A}^TA=A\overline{A}^T=I\}$
    * *特殊酉群* $SU(n)=U(n)\cap SL_n(C)$
  * $Z(GL_n(F))=\{xI_n:x\in F\}$
  * 射影一般线性群 $PGL_n(F)=GL_n/Z(GL_n)$
  * $SL_2(Z)/\{\pm I_2\}=PSL_2(Z)$ 为模群

### $n$ 阶群

| n   | 个数 | 群                                                                                                                 |
| --- | ---- | ------------------------------------------------------------------------------------------------------------------ |
| 1   | 1    | $\mathbb{Z}_1$                                                                                                     |
| 2   | 1    | $\mathbb{Z}_2$                                                                                                     |
| 3   | 1    | $\mathbb{Z}_3$                                                                                                     |
| 4   | 2    | $\mathbb{Z}_4$, $\mathbb{Z}_2\times\mathbb{Z}_2$                                                                   |
| 5   | 1    | $\mathbb{Z}_5$                                                                                                     |
| 6   | 2    | $\mathbb{Z}_6,D_3(S_3)$                                                                                            |
| 7   | 1    | $\mathbb{Z}_7$                                                                                                     |
| 8   | 5    | $\mathbb{Z}_8$, $\mathbb{Z}_2\times\mathbb{Z}_2\times\mathbb{Z}_2$, $\mathbb{Z}_4\times\mathbb{Z}_2$, $D_4$, $Q_8$ |
| 12  | 5    | $\mathbb{Z}_12$, $\mathbb{Z}_6\times\mathbb{Z}_2$, $D_6$, $A_4$, $Dic_{12}$                                        |

* 素数阶群为循环群
* $\mathbb{Z}_2\times\mathbb{Z}_2$: Klein 四元群
  * $\{e,a,b,c\}$ 在乘法（$a^2=b^2=c^2=e$）意义下构成 *Abel 群*
  * $\sigma(\pm 1/i/j/k)=e/a/b/c$ 为*同态*
* $\{\pm1,\pm i,\pm j,\pm k\}$ 在Hamilton四元数乘法意义下构成*群*
  * Hamilton 四元数: $a+bi+cj+dk,(a,b,c,d\in R)$, $i^2=j^2=k^2=ijk=-1$

### 其它

* $P(\mathbb{Z})$幂集在$\cup(\cap)$的意义下构成*幺半群*
* 字母表$S$中字母构成的字符串在字符串的拼接意义下构成*幺半群*
* 等长实数列在卷积的意义下构成*幺半群*
  * 单位元为$\{1,0,\dots,0\}$
* 区间$I$上全体连续函数在函数加法意义下构成*Abel群*
