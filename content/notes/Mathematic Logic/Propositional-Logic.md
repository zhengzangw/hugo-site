---
title: Propositional Logic (PL)
date: 2019-04-01
tags: [math, notes]
header-includes:
    - \usepackage{mathrsfs}
    - \usepackage{latexsym}
    - \usepackage{enumitem}
    - \usepackage{extsizes}
mainfont: PingFang SC
fontsize: 14pt
weight: 1
---

## 语言

- 字母表：命题符+联结词+辅助符
    - 命题符(propositional symbol)：$\text{PS}=\{P_n|n\in\mathbb{N}\}$
- 命题集 $\text{PROP}$ (proposition)：为函数 $C_\neg,C_*$ 下 $\text{PS}$ 的归纳闭包
    - $C_\neg(A)=(\neg A),C_*(A,B)=(A*B),*\in\{\vee,\wedge,\rightarrow\}$
- free variable：$\text{FV}(A)=\{P\in \text{PS}|P 出现在 A 中\}$

### 定理

- 括号引理：$A$ 为命题，则 $A$ 中左右括号个数相等
- 构造序列：$A\in \text{PROP}\iff \exists A_0,\cdots,A_n,n\in\mathbb{N},A=A_n$ 且对于任意的 $A_i,i\leq n$ 至少满足下列三条之一
    - $A_i\in PS$
    - $\exists k<i,A_i=A_k$
    - $\exists k,l<i, A_i=(A_k*A_l)$
- 结构归纳：对 $A$ 的构造长度作归纳，是自然数上的归纳
    - 数学归纳法：
        - Basis
        - I.H.
        - Ind. Step

## 语义

- 真值集 $B=\{T,F\}$
    - $\neg:H_\neg:B\rightarrow B$
    - $*:H_*:B^2\rightarrow B$
- 赋值：函数 $v:\text{PS}\rightarrow B$
- 命题的解释：函数 $\hat v:\text{PROP}\rightarrow B$
    - $\hat v(P_n)=v(P_n),n\in \mathbb{N}$
    - $\hat v(\neg A)=H_\neg(\hat v(A))$
    - $\hat v(A*B)=H_\neg(\hat v(A),\hat v(B))$
- 满足：$\vDash$
    - $v \vDash A\iff\hat v(A)=T$
    - $v\vDash P\iff v(P)=T$
    - $v\not\vDash \phi \iff v\vDash \neg \phi$
    - $v\vDash \phi_1 \wedge/\vee \phi_2\iff v\vDash \phi_1 \text{ and/or }\phi_2$
    - $v\vDash \phi_1 \rightarrow \phi_2\iff v\not\vDash\phi_1\text{ or }v\vDash\phi_2$
    - tautology: $\vDash A\iff\forall v:v\vDash A$
    - $A$ 可满足：$\exists v,v\vDash A$
    - 语义结论：$\Gamma\subset \text{PROP},\Gamma\vDash A\iff\forall v$ 有 $\forall B\in\Gamma,\hat v(B)=T$ 则 $\hat v(A)=T$

### 定理

- $v\upharpoonright \text{FV}(A)$：$v$ 的限制
    - $v_1\upharpoonright \text{FV}(A)=v_2\upharpoonright \text{FV}(A)$ 则$\hat v_1(A)=\hat v_2(A)$
- $n$ 元真值函数：$A\in \text{PROP}, \text{FV}(A)=\{Q_1,\cdots,Q_n\},H_A:B^n\rightarrow B,\forall (a_1,\cdots,a_n)\in B^n, H_A(a_1,\cdots,a_n)=\hat v(A),v$满足$v(Q_i)=a_i(1\leq i\leq n)$. $H_A$ 为由 $A$ 定义的真值函数
- 析合范式(DNF)：$A$呈形 $\bigvee_{i=1}^m(\bigwedge_{k=1}^nP_{i,k}),P_{i,k}$ 为命题符或命题符之否定
    - $f:B^n\rightarrow B$, 存在析合范式 $A$, $f=H_A$
- 合析范式(CNF)：$A$呈形 $\bigwedge_{j=1}^l(\bigvee_{k=1}^nQ_{j,k})$
    - $f:B^n\rightarrow B$, 存在合析范式 $A$, $f=H_A$
- _求析合范式，合析范式_
- 逻辑等价：$A\simeq B$ 指 $\forall v,v\vDash A$ iff $v\vDash B$
- 任何命题均有逻辑等价的析合范式/合析范式
- 函数完全组
    - $\{\neg,\wedge,\vee\},\{\neg,\wedge\},\{\neg,\vee\},\{\neg,\rightarrow\},\{↑\}$

## 语法

### 自然推理系统 $G'$

- sequent: 二元组 $(\Gamma,\Delta)$, 记为 $\Gamma\vdash\Delta$, $\Gamma,\Delta$ 为命题的有穷集合，$\Gamma$ 为前件，$\Delta$ 为后件
- 公理：$\Gamma,A,\Delta\vdash\Lambda,A,\Theta$
- 规则(P10)
    - $\neg L:\frac{\Gamma,\Delta\vdash\Lambda,A}{\Gamma,\neg A,\Delta\vdash\Lambda}$
    - $\neg R$
    - $\vee L$
    - $\vee R$
    - $\wedge L$
    - $\wedge R$
    - $\rightarrow L: \frac{\Gamma,\Delta,\Gamma\ \Gamma,B,\Delta\vdash\Lambda}{\Gamma,A\rightarrow B,\Delta\Lambda}$
    - $\rightarrow R$
    - $\text{Cut}:\frac{\Gamma\vdash\Lambda,A\ \Delta,A\vdash\Theta}{\Gamma,\Delta\vdash\Lambda,\Theta}$
- provable: 存在 $\Gamma\vdash\Lambda$ 的证明树
- Falsifiable: 存在赋值 $v$, $v\vDash(A_1\wedge\cdots\wedge A_m)\wedge(\neg B_1\wedge\cdots B_n)$, 即 $v$ 反驳 $\Gamma\vdash \Delta$
- valid: $\forall v,v\vdash(A_1\wedge\cdots\wedge A_n)\rightarrow(B_1\vee\cdots\vee B_n)$, $v$ 满足 $v\vdash\Delta$ 或 $v\vDash\Delta$
- **Soundness**: $\Gamma\vdash\Delta\Rightarrow\Gamma\vDash\Delta$
- **Completeness**: $\Gamma\vDash\Delta\Rightarrow\Gamma\vdash\Delta$
- **Compactness**: $\Gamma$ 的任意有穷子集可满足 $\Rightarrow\Gamma$ 可满足

### 永真推理系统 $H$

- 公理模式
    - A1 : $A\rightarrow B$
    - A2 : $(A\rightarrow(B\rightarrow C))\rightarrow(B\rightarrow(A\rightarrow C))$
    - A3 : $(A\rightarrow B)\rightarrow((B\rightarrow C)\rightarrow(A\rightarrow C))$
    - A4 : $(A\rightarrow(A\rightarrow B))\rightarrow(A\rightarrow B)$
    - A5 : $(A\rightarrow\neg B)\rightarrow(B\rightarrow\neg A)$
    - A6 : $(\neg\neg A)\rightarrow A$
    - A7 : $(A\wedge B)\rightarrow A$
    - A8 : $(A\wedge B)\rightarrow B$
    - A9 : $A\rightarrow(B\rightarrow(A\wedge B))$
    - A10: $A\rightarrow(A\vee B)$
    - A11: $B\rightarrow(A\vee B)$
    - A12: $(A\rightarrow C)\rightarrow((B\rightarrow C)\rightarrow ((A\vee B)\rightarrow C))$
- 规则 MP: $\frac{A\rightarrow B\ \ A}{B}$
- 定理
    - T13: $(A\rightarrow B)\rightarrow((C\rightarrow A)\rightarrow(C\rightarrow B))$
    - T14: $(A\rightarrow B)\rightarrow((D\rightarrow(C\rightarrow A))\rightarrow(D\rightarrow(C\rightarrow B)))$
    - T15: $A\rightarrow (B\rightarrow A)$
    - T16: $(C\rightarrow (B\rightarrow A))\rightarrow ((C\rightarrow B)\rightarrow (C\rightarrow A))$
    - T17: $(\neg A\rightarrow\neg B)\rightarrow(B\rightarrow A)$
    - T18: $A\rightarrow\neg\neg A$
    - T19: $(A\rightarrow B)\rightarrow(\neg B\rightarrow\neg A)$
    - T20: $A\vee\neg A$
    - T21: $A,\neg A\vdash\neg B$
    - T22: $A,\neg A\vdash B$
    - T23: $(B\rightarrow\neg B)\rightarrow\neg B$
    - T24: $(A\rightarrow (C\wedge\neg C))\rightarrow\neg A$
    - T25: $(B\vee A)\rightarrow(\neg A\rightarrow B)$
    - T26: $(A\rightarrow B)\rightarrow(B\vee\neg A)$
    - T27: $(A\vee B)\rightarrow(B\vee A)$
    - T28: $(A\rightarrow(B\rightarrow C))\rightarrow((A\wedge B)\rightarrow C)$
    - T29: $(C\vee A)\rightarrow((C\vee B)\rightarrow(C\vee(A\wedge B)))$
    - T30: $(C\vee A)\rightarrow((B\rightarrow C)\rightarrow((A\rightarrow B)\rightarrow C))$
    - T31: $(A\rightarrow(C\vee B))\rightarrow(C\vee(A\rightarrow B))$
- $\Gamma\vdash_H(/\vdash/\rightarrow) A$
    - $\exists P_1,\cdots,P_n=A,i\leq n$, $P_i$ 为
        - $H$ 公理
        - 或$P_i\in\Gamma$
        - 或$\exists j,k<i,P_j=(P_k\rightarrow P_i)$ 即 $P_i$ 由前 $P_j$ 和 $P_k$ 实施 MP 而得
    - 序列 $P_1,\cdots,P_n$ 为证明过程，$n$ 为证明长度
    - $\text{Th}(\Gamma)=\{A|\Gamma\vdash A\}, A\in\text{Th}$ 为$\Gamma$-定理，
        - $\vdash A$: $A$ 为定理
- 推理定理：$\Gamma,C\vdash A$ 则 $\Gamma\vdash C\rightarrow A$
    - $\Gamma,C=\Gamma\cup\{C\}$
- $G'$ 与 $H$
    - $\vdash_H A\Rightarrow\vdash A$
    - $\Gamma\vdash\Delta\Rightarrow\Gamma\vdash_H\overline{\Delta}$
        - $\overline{\Delta}=\bigvee_{i=1}^nB_i,\Delta=\{B_1,\cdots,B_n\}$ if $\Delta\not=\emptyset$ else $=\perp=(C\wedge\neg C)$
