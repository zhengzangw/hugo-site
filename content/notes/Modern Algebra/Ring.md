---
title: 环论
date: 2019-02-09
tags: [math, notes]
weight: 3
---

* 环：$R$为非空集合，其上有两个代数运算$+,\times$，且 $R$ 对于加法构成 Abel 群， 对于乘法构成半群，且满足分配律：$a(b+c)=ab+ac,(b+c)a=ba+ca$
* 交换环：环的乘法有交换律
* 幺环：环 $R$ 对于乘法构成幺半群，则乘法的单位元$e$称为单位元
* 零因子：若 $ab=0,a\not=0,b\not=0$ 则称 $a$ 为左零因子， $b$ 为右零因子
* 整环：没有零因子的交换幺环
* 对于 $R$ 中元素 $a$，定义 $na=a+a+a+\cdots+a$，$0a\equiv 0$，$(-n)a=-(na)$
* *定理*
  * $a_1,\cdots,a_m,b_1,\cdots,b_m,(\sum_{i=1}^na_i)(\sum_{i=1}^mb_i)=\sum_{i=0}^n\sum_{j=0}^ma_ib_j$
  * 环 $R$ 无零因子 $\iff$ 环 $R$ 有消去律
  * $a\in R, m\in Z, 0a=a0=0, a(mb)=(ma)b=m(ab)$
  * 交换环 $R$， $a,b\in R,n\in Z$ 有 $(a+b)^n=a^n+\sum_{k=1}^{n-1}\binom{n}{k}a^kb^{n-k}+b^n$
* 子环：$R$ 为环，$S$ 为 $R$ 的非空子集，若 $S$ 按 $R$ 中加乘法在 $S*S$ 上限制也构成环，则 $S$ 为 $R$ 的子环，记为 $S\leq R$
  * $S\leq R\iff S$ 对减法封闭且 $S$ 对乘法封闭
  * 零环：最小子环 $\{0\}$
  * 非零环加乘法单位元不同
* 理想：$R$ 为环，$\emptyset\not=I\leq R$，若 $I$ 对加减法封闭且 $a\in I,r\in R$ 时，$ar,ra\in I$，则 $I$ 为环 $R$ 的理想，$I\unlhd R$
* $a,b\in R$，记$a\equiv b(\bmod\ I)$ 表示 $a-b\in I$ （$a,b$ 模理想 $I$ 同余）
* 同态：$\sigma$ 为环 $R$ 到 $\overline{R}$ 的映射，若$\forall a,b\in R,\sigma(a+b)=\sigma(a)+\sigma(b),\sigma(ab)=\sigma(a)\sigma(b)$，则 $\sigma$ 为 $R$ 到 $\overline{R}$ 的同态
  * 单同态：单射
  * 满同态：满射sudo
  * 双射：同构 $R\cong \overline{R}$
* 同态核：$ker\sigma=\{a\in R:\sigma(a)=0\}$
* 同态限：$Im\sigma=\{\sigma(a):a\in R\}$
* **环的同态基本定理**：$\sigma$ 为环 $R$ 到 $\overline{R}$ 的同态
  * $ker\sigma$ 为理想
  * $Im\sigma\leq \overline{R}$
  * $R/ker\sigma\cong Im\sigma$
* $\sigma$ 为环 $R$ 到 $\overline{R}$ 的同态，$I=ker\sigma$，$R$的包含 $I$ 的子环与 $Im\sigma$ 的子环一一对应($I\leq S\leq R,\sigma(S)\leq Im\sigma$)。$R$ 的包含 $I$ 的理想与 $Im\sigma$ 的理想一一对应 ($I\leq J\unlhd R,\sigma(J)\unlhd Im\sigma$)，且 $R/J\cong \sigma(R)/\sigma(J)$
  * $R/I$ 理想形如 $J/I,I\leq J\unlhd R$
  * $I\leq J\unlhd R,(R/I)/(J/I)=R/J$
* $S\leq R, I\unlhd R$ 则 $(I\cap S)\unlhd S,I+S\unlhd R,S/(I\cap S)\cong (I+S)/I$
* $(m,n)[m,n]=mn$

## 中国剩余定理

* 外直和：$R_1,\cdots,R_n$ 为环， $R=R_1\times\cdots R_n=\{r=\langle r_1,\cdots,r_n\rangle\}$。定义 $R$ 上加法和乘法。在此加法乘法之下构成环。
  * $R_i^\star =\{\langle0,\cdots,a_i,\cdots,0\rangle :a_i\in R_i\}\cong R_i\unlhd R$
  * $R$ 中每个元素可唯一的表成 $x_1+\cdots+x_n,x_i\in R_i^\star $
* 内直和：$R_1,\cdots,R_n$ 为环 $R$ 的理想，若 $R$ 中每个元素可唯一的表成 $x_1+\cdots+x_n,x_i\in R_i$
* 直和：内直和同构与外直和
* 由 $X$ 生成的理想：包含 $X$ 的最小理想。$\langle X \rangle=\cap_{X\leq I\unlhd R} I$
  * $R$ 为幺环时， $\langle X \rangle=\{\sum_{i=1}^n r_ix_is_i:x_i\in X,r_i\in R,s_i\in R\}$
  * $R$ 为交换幺环时，$\langle X \rangle=\{\sum_{i=1}^n r_ix_i:x_i\in X,r_i\in R\}$
    * $(a_1,\cdots,a_n)=\{\sum_{i=1}^nr_ia_i:r_i\in R\}$
    * $(a)=Ra$
* $I,J\unlhd R$
  * $I+J\equiv\{i+j:i\in I,j\in J\}$
  * $IJ\equiv\{\sum_{i=1}^na_ib_i:a_i\in I,b_j\in J\}=(ab:a\in I,b\in J)$
* $I,J$ 为环 $R$ 的理想，若 $I+J=R$ 则 $I,J$ 互素
* $I,J,K\unlhd R$
  * $I,J,K$ 都互素时， $I$ 与 $JK$ 互素
  * $I,J$ 互素时，$IJ+JI=I\cap J$
    * 交换环中，$IJ=I\cap J$
* The Chinese Reminder Theorem(CRT)
  * 幺环 $R$ 的理想 $A_1,\cdots,A_k$ 互素，则 $R/\cap_{i=1}^kA_i\cong R/A_1\oplus\cdots\oplus R/A_n$，若 $R$ 交换，则 $R/(A_1\cdots A_n)\cong R/A_1\oplus\cdots\oplus R/A_n$
  * $m_1,\cdots,m_k$ 为互素正整数，$a_1,\cdots a_k$ 为整数，则同余式组 $x\equiv a_i (\bmod\ m_i)$ 有通解 $x=\sum_{i=1}^{k}a_iM_iM_i^\star  (\bmod M)$
    * $M = m_1\cdots m_k$
    * $M_i = M/a_i$
    * $M_i^\star M_i\equiv 1(\bmod\ m_i)$
  * 幺环 $R$ 中，$u\in R$ 整除 $R$ 单位元 1，即 $u$ 乘法可逆，则 $u$ 为 $R$ 的单位
    * 单位群：$U(R)$

## 例子

* 整数环：$\langle Z,+,\times\rangle$为环结构，$Z$ 为整环
  * 理想：$\{mq:m\in Z\}=(m)$
  * $Z/mZ=\{\overline{a}=a+mI:a\in Z\}$
  * $(m)\cap(n)=([m,n])$
  * $(m)(n)=(mn)$
  * $(m)+(n)=((m,n))$
  * $m>1,(m)$ 为极大理想 $\iff (m)$ 为素理想 $\iff$ $m$ 为素数
* 模 $m$ 的剩余类环：$Z/mZ$ 按剩余类的加法和乘法构成交换幺环
  * $Z/pZ$ 为整环
* $R$上一元多项式环：$R$ 为环，$R[x]=\{\sum_{i=0}^na_ix^i:a_i\in R\}$ 按多项式的加法和乘法构成环
  * $R$ 有单位元 $1$ 时， $x^0$ 为 $R[x]$ 单位元
  * $R$ 为整环，则 $R[x]$ 为整环
* $R$上$n$阶矩阵构成的环：$M_n(R)=\{n阶方阵 A=(a_{ij}),a_{ij}\in R\}$ 按矩阵的加法和乘法构成环
  * $a$所在的模 $I$ 同余类：$\overline{a}=a+I$
  * 商环：$R/I =\{\overline{a}=a+I:a\in R\}$
    * $\overline{a}+\overline{b}=\overline{ab}$
    * $\overline{a}\overline{b}=\overline{ab}$

## 素理想与极大理想

* 素理想：$R$ 为交换幺环，$I\not=R$ 为 $R$ 的理想满足$\forall a,b\in R, ab\in I$ 则 $a\in I$ 或 $b\in I$.
* 极大理想：不存在理想 $J$ 使 $I\subset J \subset U$ 则 $J$ 为极大理想
* $R$ 为交换幺环，则
  * $R$ 为整环 $\iff 0=(0)$ 为 $R$ 的素理想
  * $R$ 为域 $\iff 0=(0)$ 为极大理想
* $R$ 为交换幺环
  * $R$ 的理想 $P\not=R$, $P$ 为 $R$ 的素理想 $\iff$ $R/P$ 为整环
  * 对于 $R$ 的理想 $M\not= R$, $M$ 为 $R$ 的极大理想 $\iff$ $R/M$ 为域
  * $R$ 的极大理想为素理想
* $\sigma$ 为交换幺环 $R$ 到 $\overline{R}$ 的同态。则 $R$ 包含 $Ker\sigma$ 的极大理想与 $Im\sigma$ 的极大理想一一对应($M\rightarrow \sigma(M)$),$R$ 的包含 $Ker\sigma$ 的素理想与 $Im\sigma$ 的素理想一一对应 $M\rightarrow \sigma(M)$
* $R$ 为交换幺环，$I$ 为 $R$ 的理想，$I\cap\{a^n:n\in N\}=\emptyset,a\in R$, 则必有包含 $I$ 的素理想 $P$, $P\cap\{a^n:n\in N\}=\emptyset$
  * $Zorn$ 引理：若非空半序集 $X$ 的全序子集在 $X$ 中有上确界，则 $X$ 必有极大元
* $R$ 为交换幺环 $R$ 的所有素理想的交 $r(R)$ ($R$ 的谒零根) 恰有 $R$ 的全体幂零元构成。
  * $a\in R$ 为幂零元，则$\exists n>0(a^n=0)$
* $R$ 所有极大理想的交 $J(R)$ 为 Jacobson 根， $J(R)=\{a\in R:\forall x\in R(1-ax\in U(R))\}$

## 多项式环与形式幂级数环

* $R$ 为交换幺环，$R$ 之序列 $\{a_n\}_{n\in N}$ 中定义加乘法，构成一元形式幂级数环 $R[[x]]$：
  * $\{a_n\}+\{b_n\}=\{a_n+b_n\}$
  * $\{a_n\}\{b_n\}=\{c_n\},c_n=\sum_{k=0}^na_kb_{n-k}$
  * 单位元 $(1,0,\cdots)$
  * $x=(0,1,0,\cdots)$
  * $(a_0,a_1,\cdots)$ 形式地写成 $\sum_{n=0}^{\infty}a_n$
* $x$ 在 $R$ 上生成的 $R[[x]]$ 子环为 $R[x]=\{\sum_{k=0}^na_kx^k:a_0,\cdots,a_n\in R\}$ 为 $R$ 上一元多项式环，$x$为未定元
* $R$ 上多元多项式环递归定义如下：
  * $R[x_1,\cdots,x_n]=R[x_1,\cdots,x_{n-1}][x_n]$
* $R[x_1,\cdots,x_n]$ 中使$a_{i_1,\cdots,i_n}\not=0$ 的最大值为 $\deg f$. $\deg 0=-\infty$.
  * $\deg (f+g)\leq \max(\deg f,\deg g)$
  * $\deg(fg)\leq \deg(f)+\deg(g)$
* $R$ 为整环，则$R$ 上的 $n$ 元多项式环卫整环，且 $U(R[x])=U(R)$
* 带余除法：$R$ 为交换幺环，$f(x),g(x)\in R[x],g(x)\not=0$, 若 $g(x)$ 首项系数为 $R$ 的单位，则有唯一的 $g(x),r(x)\in R(x)$ 使 $f(x)=g(x)q(x)+r(x),r(x)< q(x)$
* $f(c)=0\iff (x-c)|f(x)$
  * 整环上 $n$ 元多项式至多有 $n$ 个零点

## Euclid 整环与主理想整环

* Euclid 整环：$R$ 为整环，若有 (Euclid) 函数 $N:R\backslash\{0\}\rightarrow\mathbb{N}:\forall a\in a\in R,b\in R\backslash\{0\},\exists q,r\in R$ 使得 $a=bq+r,r=0\vee N(r)<N(b)$. 则 $R$ 为 Euclid 整环
* $R$ 为交换幺环，$R$ 的只有一个元素生成的理想为主理想。若 $R$ 为整环且每个理想都为主理想，则 $R$ 为主理想整环（PID）
* Euclid 整环一定为主理想整环
  * $Z,F,F[x],Z[i],Z[\omega]$ 为主理想整环
* $a|b$: 整环 $R,a,b\in R,\exists q\in R$ 使得 $aq=b$; $(a)\subseteq(b)$
  * 单位$u$: $u|1$; $(u)=R$
* $a\sim b$: $a,b$ 相伴, $\exists u\in U(R),au=b$; $(a)=(b)$
  * 相伴为等价关系
* 非零非单位元 $p$ 不可约：$a|p\Rightarrow a\in U(R)\vee a\sim b$; $(p)\subset (a)\subset R\Rightarrow (a)=(p)\vee (a)=R$
* 非零非单位元 $p$ 为素元： $p|ab \Rightarrow p|a\vee p|b$; $(p)$ 为素理想
* $R$ 为整环，则
  * 素元不可约
  * PID中，不可约元为素元
* PID中唯一分解定理：设 $R$ 为主理想整环，$S$ 为一些素元集合，满足 (i) 每个素元与 $S$ 中一素元相伴 (ii) $\forall a,b\in S, a\not\sim b$. 则 $R$ 中每个非零元可唯一的表成 $u=\prod_{p\in S}p^{e(p)},u\in U(R),e(p)\in N$ 的形式, 只有有限个 $p$ 使 $e(p)\not=0$

## Noether 环

* 交换幺环 $R$ 为 Noether 环，$R$ 每个理想都是有限生成的，即形如 $(a_1,\cdots, a_n)=\{\sum_{i=1}^nr_ia_i:r_i\in R\}$
  * 理想升链条件：若 $I_1\subset I_2\subset \cdots$ 为 $R$ 中理想升链，则有 $N$，$I_N=I_{N+2}=\cdots$
  * $R$ 的每个非空理想簇 $\{I_\lambda\}_{\lambda\in \Lambda}$ 必有（按被包含关系）的极大元
* Hilbert 基定理: $R$ 为 Noether 环，则 $R[x]$ 为 Noether 环
  * $Z[x_1,\cdots,x_n],F[x_1,\cdots,x_n]$ 为 Noether 环
