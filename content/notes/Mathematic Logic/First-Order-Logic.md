---
title: First Order Logic (FOL)
date: 2019-04-01
tags: [math, notes]
header-includes:
    - \usepackage{mathrsfs}
    - \usepackage{latexsym}
    - \usepackage{enumitem}
    - \usepackage{extsizes}
mainfont: PingFang SC
fontsize: 14pt
weight: 2
---

## 语言

- 字母表
    - 逻辑符集合
        - 变元集 $V$
        - 联结词、辅助词、(等词)
        - 量词 $\forall,\exists$
    - 非逻辑符集合 $\mathscr{L}$
        - 常元集合 $\mathscr{L}_c$
        - 函数集合 $\mathscr{L}_f$, $\mu(f)>0$ 为 $f$ 的元数
        - 谓词集合 $\mathscr{L}_P$, $\mu(P)\geq0$ 为 $f$ 的元数
- 项 $T$：变元符 $\cup$ 常元符 $\cup f(v_1,\cdots)$
    - 自由变元
        - $\text{\text{FV}}(x)=\{x\}$, $\text{\text{FV}}(c)=\{\}$
        - $\text{\text{FV}}(f(t_1,\cdots))=\bigcup_{i=1}^n\text{\text{FV}}(t_i)$
    - 闭项：$\text{\text{FV}}(t)=\emptyset$
    - 替换：$s[\frac{t}{x}]$
- 公式 $\Psi$：$\{t_1\doteq t_2\}$ $\cup$ $P(t_1,\cdots)$ $\cup$ 公式在联结词、量词下的组合
    - 自由变元
        - $\text{\text{FV}}(t_1\doteq t_2)=\text{\text{FV}}(t_1)\cup\text{\text{FV}}t_2$
        - $\text{\text{FV}}(P(t_1,\cdots))=\bigcup_{i=1}^n\text{\text{FV}}(t_i)$
        - 联结词取并
        - $\text{\text{FV}}(Qx.A)=\text{FV}(A)\backslash\{x\}$
    - 句子：$\text{\text{FV}}(A)=\emptyset$
    - 替换：$A[\frac{t}{x}]$
        - $(Qx.A)[\frac{t}{x}]=Qx.A$
        - $(Qy.A)[\frac{t}{x}]=Qy.(A[\frac{t}{x}]),y\not\in\text{\text{FV}}(t)$
        - $(Qy.A)[\frac{t}{x}]=Qz.(A[\frac{z}{y}][\frac{t}{x}]),y\in\text{\text{FV}}(t)$

### Godel 编码

- $\langle a_0,\cdots,a_n\rangle=\prod_{i=0}^nP_i^{a_i}$
- $\text{ep}:\mathbb{N}^2\rightarrow\mathbb{N}$ 为 $x$ 的素因子分解式中 $P_n$ 的幂次
- Godel 编码： $\#()$
    - Godel 编码与一阶语言中所有元素一一对应

## 语义

- 结构：$\mathbb{M}=(M,I)$ 对 $\mathscr{L}$ 做解释
    - 论域 $M$ 为非空集
    - $I$ 为定义域为 $\mathscr{L}$ 的映射
        - $c\in\mathscr{L}_c,c_{\mathbb{M}}=I(c)\in M$
        - $f\in\mathscr{L}_f,f_{\mathbb{M}}=I(f):M^n\rightarrow M$
        - $P\in\mathscr{L}_p,\mu(P)>0,P_{\mathbb{M}}=I(P)\subseteq M^n$
        - $P\in\mathscr{L}_p,\mu(P)=0,I(P)\in B=\{T,F\}$
- 模型： $(\mathbb{M},\sigma)$ 是对一阶语言的解释
    - $\sigma:V\rightarrow M$ 为赋值
- 解释
    - 项：$t_{\mathbb{M}[\sigma]}\in M$
        - $x_{\mathbb{M}[\sigma]}=\sigma(x)$
        - $c_{\mathbb{M}[\sigma]}=c_M$
        - $(f(t_1,\cdots))_{\mathbb{M}[\sigma]}=f_M((t_1)_{\mathbb{M}[\sigma]},\cdots)$
    - 公式：$A_{\mathbb{M}[\sigma]}\in\{T,F\}$ (排中律)
        - 联结词：同 PL
        - $(P(t_1,\cdots))_{\mathbb{M}[\sigma]}=T\iff \langle (t_1)_{\mathbb{M}[\sigma]},\cdots,\rangle\in P_\mathbb{M}$
        - $(t_1\doteq t_2)_{\mathbb{M}[\sigma]}=T\iff (t_1)_{\mathbb{M}[\sigma]}=(t_2)_{\mathbb{M}[\sigma]}$
        - $(\forall x.A)_{\mathbb{M}[\sigma]}=T\iff$ 对所有$a\in M,A_\mathbb{M}[\sigma[x:=a]]=T$
        - $(\exists x.A)_{\mathbb{M}[\sigma]}=T\iff$ 对某个$a\in M,A_\mathbb{M}[\sigma[x:=a]]=T$
            - $(\sigma[x_i:=a])(x_j)=a$ if $i=j$ else $\sigma(x_j)$
- 满足：$\vDash$
    - $\mathbb{M}\vDash_\sigma A\iff A_{\mathbb{\mathbb{M}}[\sigma]}=T$
    - $A$ 可满足: 存在 $(\mathbb{M},\sigma)$ 使得 $\mathbb{M}\vDash_\sigma A$
    - $\mathbb{M}\vDash_\sigma \Gamma\iff\forall A\in\Gamma,\mathbb{M}\vDash_\sigma A$
    - $\mathbb{M}\vDash A\iff \forall \sigma,\mathbb{M}\vDash_\sigma A$
    - $\vDash A$
    - $\vDash \Gamma$
    - $\Gamma\vDash A\iff \forall (\mathbb{M},\sigma), \mathbb{M}\vDash_\sigma\Gamma,$ 则 $\mathbb{M}\vDash_\sigma A$
    - $\Gamma\vDash A\iff\Gamma\cup\{\neg A\}$ 不可满足

### 替换引理

- $(t[\frac{s}{x}])_{\mathbb{M}[\sigma]}=t_{M[\sigma[x:=s_{\mathbb{M}[\sigma]}]]}$
- $(A[\frac{t}{x}])_{\mathbb{M}[\sigma]}=A_M[\sigma[x:=t_{\mathbb{M}[\sigma]}]]$

### Hintikka 集

- 公式集 $\Psi$ 为 Hintikka 集指其满足以下 19 条 (FOL with equality)
    - 2$\neg$,2$\rightarrow$,2$\wedge$,2$\vee$,(2$\leftrightarrow$),2$\exists$,2$\forall$,3$\doteq$,f,P
- Hintikka 集可满足
- $T$ 上二元关系：$s\sim t\iff s\doteq t\iff [s]=[t]$

## 语法

### 自然推理系统 $G$

- 公理：$\Gamma,A,\Delta\vdash\Lambda,A,\Theta$
- 规则：
    - $\neg L:\frac{\Gamma,\Delta\vdash\Lambda,A}{\Gamma,\neg A,\Delta\vdash\Lambda}$
    - $\neg R$
    - $\vee L$
    - $\vee R$
    - $\wedge L$
    - $\wedge T$
    - $\rightarrow L: \frac{\Gamma,\Delta,\Gamma\ \Gamma,B,\Delta\vdash\Lambda}{\Gamma,A\rightarrow B,\Delta\Lambda}$
    - $\rightarrow R$
    - $\forall L: \frac{\Gamma,A[t/x],\forall x A(x),\Delta\vdash\Lambda}{\Gamma,\forall xA(x),\Delta\vdash\Lambda}$
    - $\forall R: \frac{\Gamma\vdash,A[y/x],\Theta}{\Gamma\vdash\Lambda,\forall x A(x),\Theta}$ **y 为新变元**
    - $\exists L:\frac{\Gamma,A[y/x],\Delta\vdash\Lambda}{\Gamma,\exists xA(x),\Delta\vdash\Gamma}$ **y 为新变元**
    - $\exists R:\frac{\Gamma\vdash\Lambda,A[t/x],\exists xA(x),\Theta}{\Gamma\vdash \Lambda,\exists xA(x),\Theta}$
    - $\text{Cut}:\frac{\Gamma\vdash\Lambda,A\ \Delta,A\vdash\Theta}{\Gamma,\Delta\vdash\Lambda,\Theta}$
- Hauptsatz：Cut 规则可由其它规则导出
- $\Gamma\vdash \Lambda$ 可证：存在证明树
- $A_1,\cdots,A_m\vdash B_1,\cdots,B_n\iff \wedge_{i=1}^mA_i\vdash\wedge_{i=1}^nB_i$
- $\Gamma\vdash\Delta\Rightarrow \Gamma,\Theta\vdash \Delta,\Psi$
- 导出规则 $(A(t)=A[\frac{t}{x}])$
    - 反证法：$\frac{\neg A,\Gamma\vdash B,\neg A,\Gamma\vdash\neg B}{\Gamma\vdash A}$
    - 分情况：$\frac{A,\Gamma\vdash B\ \ \neg A,\Gamma\vdash B}{\Gamma\vdash B}$
    - 逆否推演：$\frac{\Gamma\vdash A\rightarrow B}{\Gamma\vdash\neg B\rightarrow\neg A}$
    - 矛盾规则：$\frac{\Gamma\vdash A\ \ \Gamma\vdash\neg A}{\Gamma\vdash B}$
    - MP：$\frac{\Gamma\vdash A\ \ \Gamma\vdash A\rightarrow B}{\Gamma\vdash B}$
    - 三段论：$\frac{\Gamma\vdash A(t)\ \ \Gamma\vdash\forall x(A(x)\rightarrow B(x))}{\Gamma\vdash B(t)}$
- $\Gamma\vdash\Delta$ 有效：$\vDash(\wedge_{i=1}^nA_i)\rightarrow(\vee_{j=1}^mB_j)$
    - $\{\}\vdash\{\}$ 非有效
    - 有反例即非有效
- 除 Cut 外规则：上矢列有效 $\iff$ 下矢列有效
- **Soundness**: $\Gamma\vdash\Delta$ 则 $\Gamma\vDash\Delta$

#### $Ge$

- $G$ 加上以下三个等词公理
    - $\vdash s\doteq s$
    - $s_1\doteq t_1,\cdots,s_n\doteq t_n\vdash f(s_1,\cdots,s_n)\doteq f(t_1,\cdots,t_n)$
    - $s_1\doteq t_1,\cdots,s_n\doteq t_n, p(s_1,\cdots,s_n)\vdash p(t_1,\cdots,t_n)$
- $Ge$ 中可证以下矢列
    - $\vdash(s\doteq t)\rightarrow(t\doteq s)$
    - $\vdash(s\doteq t)\rightarrow(t\doteq u\rightarrow s\doteq u)$
- $\Gamma\vdash\Delta$在$Ge$中可证$\iff\Gamma e,\Gamma\vdash\Delta$在 $G$ 中可证
    - $\Gamma e=\{\forall x(x\doteq x),\forall\vec x\forall\vec y(\vec x\dot=\vec y\rightarrow f(\vec x)\doteq f(\vec y)),\forall\vec x\forall\vec y(\vec x\doteq\vec y\rightarrow(p(\vec x)\rightarrow p(\vec y)))\}$

#### Completeness

- $\text{Incon}(\Gamma)$：矛盾指 $\Gamma$ 有穷子集 $\Delta,\Delta\vdash$
    - $\text{Incon}(\Gamma)\iff\forall A$ 存在 $\Gamma$ 有穷子集 $\Delta,\Delta\vdash A$
    - $\text{Con}(\Gamma)$：协调指 $\Gamma$ 不矛盾
        - $\Gamma\vdash A\Rightarrow\text{Con}(\Gamma\cup\{A\})$
        - $\Gamma\vdash A$ 不可证$\Rightarrow\text{Con}(\Gamma\cup \{\neg A\})$
- $\Gamma$ 可满足 $\Rightarrow\text{Con}(\Gamma)$
    - $\text{Incon}(\Gamma)\Rightarrow\Gamma$ 不可满足
- $\text{Con}(\Gamma)\Rightarrow\Gamma$ 可满足
    - 极大协调
        - $\text{Con}(\Gamma)$ 且 $\forall \Delta,\text{Con}(\Delta),\Gamma\subseteq\Delta\Rightarrow\Gamma=\Delta$
        - $\iff\text{Con}(\Gamma)$ 且 $(\forall A)\text{Con}(\Gamma\cup\{A\}),A\in\Gamma$
        - $\iff\text{Con}(\Gamma)$ 且 $\forall A,A\in\Gamma\vee\neg A\in\Gamma$
        - 存在 $\Gamma$ 的有穷子集 $\Delta$ 使 $\Delta\vdash A\iff A\in\Gamma$
    - Henkin 集
        - $\Gamma$ 极大协调
        - 若 $\exists x.A\in\Gamma$, 则有项 $t$ 使 $A[\frac{t}{x}]\in\Gamma$
    - Henkin construction: $\text{Con}(\Phi)\Rightarrow$存在 Henkin 集 $\Psi$ ($\mathscr{L'}=\mathscr{L}\cup\{c_n|c\in \mathbb{N}\}$下), 使 $\Psi\supseteq\Phi$
    - $\Gamma$ 为 Henkin 集 $\Rightarrow$ $\Gamma$ 为 Hintikka 集
- **Completeness**: $\Gamma\vDash A\Rightarrow\Gamma\vdash A$
- **Compactness**: $\Gamma$ 的任意有穷子集可满足 $\Rightarrow\Gamma$ 可满足
    - 另有语义证明

### 一阶逻辑的永真推理系统 $PK$

- 公理
    - 第一组
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
    - 第二组
        - A13: $\forall xA\rightarrow A[\frac{t}{x}]$
        - A14: $A[\frac{t}{x}]\rightarrow\exists xA$
        - A15: $A\rightarrow\forall xA,x\not\in\text{\text{FV}}(A)$
        - A16: $\exists xA\rightarrow A,x\not\in\text{\text{FV}}(A)$
        - A17: $\forall x(A\rightarrow B)\rightarrow(\forall xA\rightarrow\forall xB)$
        - A18: $\exists x(A\rightarrow B)\rightarrow(\exists xA\rightarrow\exists xB)$
    - 第三组等词定理
        - A19: $x\dot=x$
        - A20: $(x_1\dot=y_1)\rightarrow\cdots((x_n\dot=y_n)\rightarrow(f(x_1,\cdots,x_n)\dot=f(y_1,\cdots,y_n))$
        - A21: $(x_1\dot=y_1)\rightarrow\cdots((x_n\dot=y_n)\rightarrow(P(x_1,\cdots,x_n)\dot=P(y_1,\cdots,y_n))$
    - 第四组：前面各组公理的全称化
        - $A$ 的全称化：$\forall x_1\forall x_2\cdots\forall x_n.A$
- 规则：MP:$\frac{A\rightarrow B\ A}{B}$
- $\Gamma\vdash_{\text{PK}}A$ 指存在序列 $A_1,\cdots,A_n=A$, $i\leq n$ 时满足以下任一条
    - $A_i$ 为公理
    - $A_i\in\Gamma$
    - $\exists j,k<i,A_j=(A_k\rightarrow A_i)$
- 推理定理：$\Gamma,C\vdash A$ 则 $\Gamma\vdash C\rightarrow A$
- 泛化性定理：$x\not\in\text{\text{FV}}(\Gamma)$, 若 $\Gamma\vdash A$ 则 $\Gamma\vdash\forall xA$
- Generalization on Constants:
    - 常元 $c$ 不在 $\Gamma,A$ 中出现，若 $\Gamma\vdash A[\frac{c}{x}]$ 则 $\Gamma\vdash\forall xA$
    - 常元 $c$ 不在 $\Gamma,A,B$ 中出现, 若 $\Gamma,A[\frac{c}{x}]\vdash B$ 则 $\Gamma,\exists xA\vdash B$
- 定理
    - $\vdash\forall x.A\leftrightarrow\neg\exists x\neg A$
    - $\vdash\exists x.A\leftrightarrow\neg\forall x\neg A$
- $\vdash A$ 在 $G$ 中可证$\iff$ $A$ 在 $PK$ 中可证

## Herbrand 定理

- 前束范式：一阶语言的公式呈形 $Q_1x_1.(Q_2x_2.(\cdots,Q_nx_n.(B)))$, $Q_i\in\{\forall,\exists\}(i\leq n),B$ 中无量词
    - 记为 $Q_1x_1\cdots Q_nx_n.B$
    - $Q^*$ 为 $Q$ 的对偶
    - 任意公式有前束范式
        - $\forall A,\exists B,\vdash A\leftrightarrow Q_1x_1\cdots Q_nx_n.B$, $x_1,\cdots,x_n$ 互异且 $B$ 中无量词
    - 命题
        - $x\not\in\text{\text{FV}}(B)$, 则 $\vdash Qx.B\leftrightarrow B$
        - $y$ 为新变元, $\vdash Qx.B\leftrightarrow Qy.B[\frac{y}{x}]$
        - $\vdash\neg\forall x.A\leftrightarrow\exists x.\neg A.$
        - $\vdash\neg\exists x.A\leftrightarrow\forall x.\neg A.$
        - $x\not\in\text{\text{FV}}(B)$, 则 $\vdash (Qx.A · B)\leftrightarrow Qx.(A·B)$
- Skolem 范式：前束范式的 Skolem 范式 $A^s$ 归纳定义如下：
    - 若 $A$ 中无量词，则 $A^s=A$
    - $(\forall x.A)^s=\forall x.(A^s)$
    - 若 $\text{\text{FV}}(\exists x.A)=\emptyset$, 则 $(\exists x.A)^s$ 为 $(A[\frac{c}{x}])^s$, $c$ 为新常元
    - 若 $\text{\text{FV}}(\exists x.A)=\{x_1,\cdots,x_n\}$, 则$(\exists x.A)^s=(A[\frac{f(x_1,\cdots,x_n)}{x}])^s$, $f$ 为 $n$ 元新函数
- $A$ 为闭前束范式（即无自由变元），$A$可满足$\iff A^s$ 可满足
- Herbrand 域 $H_A$
    - $A$ 中无常元，则 $H_0=\{c_0\}$，$c_0\in\mathscr{L}_c$
    - $A$ 中有常元，则 $H_0=\{c|c\in\mathscr{L}_c$ 且出现在 $A$ 中$\}$
    - $H_{n+1}=H_n\cup\{f(t_1,\cdots,t_m)|f\in \mathscr{L}_f,t_1,\cdots,t_m\in H_n\}$
    - $H_A=\cup\{H_n|n\in N\}$
        - 其中元素为 $\mathscr{L}$-闭项
- $A$ 对应于 $\mathbb{M}$ 的 Herbrand 结构 $\mathbb{H}_A=(H_A,I_A)$
    - $I_A(c)=c$ 若 $c\in H_A$ 否则 $c_0$
    - $I_A(f)(t_1,\cdots,t_m)=f(t_1,\cdots,t_m)$ 若 $f$ 出现在 $A$ 中否则 $c_0$
    - $I_A(P)=\{\langle t_1,\cdots,t_m\rangle\in H_A^m|\mathbb{M}\vDash P(t_1,\cdots,t_m)\}$
- $\mathscr{L}$-闭公式 $A$ 为 Skolem 范式，$\mathbb{M}\vDash A$ 则 $\mathbb{H}_A\vDash A$
    - $\mathscr{L}$-闭公式 $A^s$ 可满足 $\iff$ $A^s$ 在某个 Herbrand 结构中满足
- **Herbrand 定理**：$\mathscr{L}$-闭公式 $A^s=\forall x_1\cdots\forall x_n.B$ 可满足 $\iff$ $\Gamma$ 可满足, $\Gamma=\{B[\frac{t_1}{x_1}]\cdots[\frac{t_n}{x_n}]|t_1,\cdots,t_n\in H_A\}$

## 实例

### 初等算术语言 $\mathscr{A}$

- 常元$\{0\}$, 函数符集$\{S,+,\cdot\}$, 谓词符集$\{<\}$
- 初等算术的标准模型

### 群论语言 $\mathfrak{B}$

- 常元$\{e\}$, 函数符集$\{^{-1},\cdot\}$

### 集合论

#### Cantor 集合论

- 外延原则：$A=B\leftrightarrow\forall x(x\in A\rightarrow x\in B)$
- 概括原则：$\forall P,\exists S, a\in S\rightarrow P(a),$ 记为 $S=\{x|P(x)\}$
- Russell 悖论：$P(x)=x\not\in x$

#### 公理集合论

- 集合论语言
    - 谓词 $\in$(2)
    - 常元 $\emptyset$
    - 函数符
        - 对偶函数符 ,(2)
        - 幂集函数符 $\mathcal{P}$(1)
        - 并集函数符 $\cup$(1)
    - 变元符 $x,y,z,A,B,C$
- 约定
    - $A\subseteq B$ 即 $\forall x(x\in A\rightarrow x\in B)$
    - $\{a\}$ 即 $\{a,a\}$
    - $a^+$ 即 $a\cup\{a\}$
    - $A\cup B$ 即 $\{x|x\in A\vee x\in B\}$
    - $(\forall x\in A)\phi$ 即 $\forall x(x\in A\rightarrow\phi)$
    - $(\exists x\in A)\phi$ 即 $\exists x(x\in A\wedge\phi)$
- ZF 公理
    - 外延性公理 $\forall A\forall B(\forall x(x\in A\leftrightarrow x\in B)\rightarrow A=B)$
    - 空集公理 $\exists B\forall x(\neg(x\in B))$
        - 若有常元 $\emptyset$ 可记为 $\forall x(x\not\in \emptyset)$
    - 对偶公理 $\forall u\forall v\exists B\exists x(x\in B\leftrightarrow(x=u\vee x=v))$
        - 若有函数 , 则可记为 $\forall u\forall v\exists x(x\in \{u,v\}\leftrightarrow(x=u\vee x=v))$
    - $\forall A\exists B\forall x(x\in B\leftrightarrow(\exists b\in A)(x\in b))$
        - 若有函数 $\cup$ 则可记为 $\forall A\exists B\forall x(x\in B\leftrightarrow(\exists b\in A)(x\in b))$
    - 幂集公理 $\forall a\exists B\forall x(x\in B\leftrightarrow x\subseteq a)$
        - 若有函数 $\mathcal{P}$ 则可记为 $\forall x(x\in \mathcal{P}(a)\leftrightarrow x\subseteq a)$
    - 子集公理 S-公式$\phi$, $\text{\text{FV}}(\phi)\subseteq\{x_1,\cdots,x_k,x\},B\not\in\text{\text{FV}}(\phi)$, 有 $\forall\vec x\forall C\exists B\forall x(x\in B\leftrightarrow(x\in C\wedge\phi))$
        - 以 Cantor 记号记：$B=\{x\in C|\phi\}$
        - 避免 Russell 悖论
    - 无穷公理：$\exists A(\emptyset\in A\wedge(\forall a\in A)(a^+\in A))$
        - 不唯一
        - $\text{Ind}(A)=\emptyset\in A\wedge(\forall a\in A)(a^+\in A)$, 满足者称归纳集
        - $\mathbb{N}=\{x|x\in A\wedge\forall B(\text{Ind(B)}\rightarrow x\in B)\}$
        - Peano 算术模型：$(\mathbb{N},0,\text{Suc})$
        - Peano 公理
            - $(e ∈ S)$
            - $(∀ a ∈ S)( f(a) ∈ S )$
            - $(∀ b ∈ S)(∀ c ∈ S)(f(b) ＝ f(c) → b ＝ c)$
            - $(∀ a ∈ S)( f(a) ≠ e )$
            - $(∀ A ⊆ S)( ((e ∈ A) ∧ (∀ a ∈ A)(f(a) ∈ A)) → (A ＝ S) )$
- ZFC: ZF+AC
    - 选择公理(AC) : $\forall A\exists\tau((\tau:\mathcal{P}(A)-\{\emptyset\}\rightarrow A)\wedge(\forall B\in (\mathcal{P}(A)-\{\emptyset\}))(\tau(B)\in B))$
    - Zorn 引理：设 $S$ 为偏序集，$S$ 中每个链皆有界，则 $S$ 有极大元
        - 等价于选择公理
    - 独立性结果
        - $\text{con}(ZF)\Rightarrow\text{con}(ZF+AC)$
        - $\text{con}(ZF)\Rightarrow\text{con}(ZF+\neg AC)$
