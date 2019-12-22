---
title: Model Logic
date: 2019-04-01
tags: [math, notes]
header-includes:
    - \usepackage{mathrsfs}
    - \usepackage{latexsym}
    - \usepackage{enumitem}
    - \usepackage{extsizes}
mainfont: PingFang SC
fontsize: 14pt
weight: 3
---


## 模态语言

| 模式       | 分支                | 应用                                   |
| ---------- | ------------------- | -------------------------------------- |
| 可能与必然 | 基本模态逻辑        |                                        |
| 过去与将来 | 时态逻辑(temporal)  | 软硬件系统形式化验证                   |
| 知道与相信 | 认知逻辑(epistemic) | 知识表示                               |
| 义务与允许 | 道义逻辑(deontic)   | 分布式智能系统进行协同与控制的规范系统 |

- 模态逻辑特征
    - 模态逻辑是用于描述关系结构的简单而富于表达力的语言
    - 模态语言为关系结构提供了一种内部和局部的视角
    - 模态逻辑并不是孤立的形式化系统
- 关系结构 $\mathfrak{F}=(W,R_1,\cdots,R_n)$, $W$ 为 domain/universe, $R_i$ 为 $\mathfrak{F}$ 上的关系
    - $W$ 中的元素可以为不同名称如点、状态、世界、时间、状况等。关系结构通常可以表示为简单图形
    - 严格偏序
        - 全序
    - 标注转换系统（LTS）$(W,\{R_a|a\in A\}),a\in A,R_a\subseteq W\times W$
    - 时间的内在结构为全序集 $(S,<)$
        - 假设：1.时间离散 2.有一个没有前驱的时刻 3.有无穷后续时刻进入未来

## 基本模态逻辑

### 语言

- 命题符集合 $\Phi$
- 一元模态算子 $\diamondsuit$
    - 读作 "可能"
    - 对偶算子 $\square\varphi:=\neg\diamondsuit\neg\varphi$
        - 读作 "不可能不/必然"
    - $\varphi\wedge\psi:=\neg(\neg\varphi\vee\neg\psi)$
    - $\top:=\neg\perp$
- 合式公式(well-formed formula) $\varphi::=p|\perp|\neg\varphi|\varphi\vee\phi|\diamondsuit\varphi$
- 部分合式公式
    - $K:\square(\varphi\rightarrow\phi)\rightarrow(\square\varphi\rightarrow\square\phi)$
    - $T:\square\varphi\rightarrow\phi$
    - $4:\square\phi\rightarrow\square\square\phi$
    - $B:\varphi\rightarrow\square\diamondsuit\varphi$
    - $D:\square\varphi\rightarrow\diamondsuit\varphi$
    - $5:\diamondsuit\varphi\rightarrow\square\diamondsuit\phi$

#### 标准翻译

- $\mathcal{L}^1(\Phi)$ 为一阶语言
    - 具有一元谓词 $P_0,P_1,\cdots$ 对应 $\Phi$ 中命题符 $p_0,p_1,\cdots$
    - 具有二元关系 $R$ 对应 $\diamondsuit$
- 标准翻译 $\text{ST}_x$:
    - $\text{ST}_x(p)=P_x$
    - $\text{ST}_x(\perp)=x\not=x$
    - $\text{ST}_x(\neg\phi)=\neg\text{ST}_x(\phi)$
    - $\text{ST}_x(\phi\vee\psi)=\text{ST}_x(\phi)\vee\text{ST}_x(\psi)$
    - $\text{ST}_x(\diamondsuit\phi)=\exists y(Rxy\wedge\text{ST}_y(\phi))$, **y 为新变元**
- $\mathfrak{M},\omega\Vdash\varphi\iff\mathfrak{M}\vDash\text{ST}_x(\varphi)[\omega]$
    - $\text{ST}_x(\varphi)[\omega]$: $\omega$ 被赋给自由变元 $y$
- $\forall\mathfrak{M},\omega\Vdash\varphi\iff\mathfrak{M}\vDash\forall x\text{ST}_x(\varphi)$

### 语义

- Kripke 模型：$\mathfrak{M}=(W,R,L)=(\mathfrak{F},L)$
    - 状态 $\omega\in W$
    - $R$ 为 $W$ 上的关系
    - $L:W\rightarrow 2^\Phi$ 为标记函数，把 $W$ 每个点标记上再该点为真的命题符
- $\mathfrak{M},\omega\Vdash\varphi$ 基本模态公式 $\varphi$ 在状态 $\omega$ 被满足
    - $\mathfrak{M},\omega\Vdash p,p\in\Phi\iff p\in L(\omega)$
    - $\mathfrak{M},\omega\Vdash \perp$ 从不成立
    - $\mathfrak{M},\omega\Vdash\neg\varphi\iff \mathfrak{M},\omega\Vdash\varphi$ 不成立
    - $\mathfrak{M},\omega\Vdash\varphi\vee\psi\iff\mathfrak{M},\omega\Vdash\varphi$ 或 $\mathfrak{M},\omega\Vdash\psi$
    - $\mathfrak{M},\omega\Vdash\diamondsuit\varphi\iff$ 存在 $v\in W,Rwv,\mathfrak{M},\omega\Vdash\varphi$
        - $\mathfrak{M},\omega\Vdash\square\varphi\iff$ 对于任意的 $v\in W,Rw v,\mathfrak{M},\omega\Vdash\varphi$
- 盲状态：不能到达任意后续状态的状态，$\square\varphi$ 空真
- $\mathfrak{F},\omega\Vdash\varphi$：任意的 $L$, $\mathfrak{M},\omega\Vdash\varphi$
- $\mathfrak{F}\Vdash\varphi$: 任意的 $\omega$, $\mathfrak{F},\omega\Vdash\varphi$
- $\mathbb{F}\Vdash\varphi$: 任意的 $\mathfrak{F}\in\mathbb{F},\mathfrak{F}\Vdash\varphi$
    - $\Lambda_\mathbb{F}$: $\mathbb{F}$ 的逻辑，对 $\mathbb{F}$ 有效的所有公式的集合
- $\Vdash\varphi$: 任意的 $\mathbb{F}$, $\mathbb{F}\Vdash\varphi$

## 线性时间时态逻辑 (LTL)

### 语言

- 线性时间时态算子
    - $\mathcal{U}$: until
    - $\bigcirc$: next-time
- 常用时态算子
    - $\diamondsuit\phi:=\top\mathcal{U}\phi$: Finally
    - $\square\phi:=\neg\diamondsuit\neg\phi$: Globally
    - $\overset{\infty}{\diamondsuit}\phi:=\square\diamondsuit\phi$: Infinitely Often
    - $\overset{\infty}{\square}\phi:=\diamondsuit\square\phi$: Almost Everywhere
    - $\phi_1\mathcal{R}\phi_2:=\neg(\neg\phi_1\mathcal{U}\neg\phi_2)$: Release
- $\psi::=p|\perp|\neg\psi|\psi_1\vee\psi_2|\bigcirc\psi|\psi_1\mathcal{U}\psi_2,p\in\Phi$

### 语义

- 模型 $\mathfrak{M}=(S,x,L)$
    - $S$: 非空状态集
    - $x:N\rightarrow S$：状态的无穷序列
    - $L:W\rightarrow2^\Phi$
- $\mathfrak{M},x\vDash\psi$: 在模型 $\mathfrak{M}$ 的时间线 $x$ 上，公式 $\psi$ 为真
    - $\mathfrak{M},x\vDash p,p\in\Psi\iff p\in L(s_0)$
    - $\mathfrak{M},x\vDash\perp$ 从不成立
    - $\mathfrak{M},x\vDash \neg\psi\iff\mathfrak{M},x\vDash \psi$ 不成立
    - $\mathfrak{M},x\vDash \psi_1\vee\psi_2\iff\mathfrak{M},x\vDash \psi_1$ 或 $\mathfrak{M},x\vDash \psi_2$
    - $\mathfrak{M},x\vDash \psi_1\mathcal{U}\psi_2\iff\exists j(\mathfrak{M},x^j\vDash \psi_2$ 且 $\forall k<j(\mathfrak{M},x^k\vDash \psi_1))$
    - $\mathfrak{M},x\vDash\bigcirc\psi\iff\mathfrak{M},x^1\vDash\psi$
        - $x^i$ 表示 $s$ 的后缀 $s_i,s_{i+1},\cdots$

## 分支时间时态逻辑

### 语言

#### BTL

- 命题符 $\Psi$
- 线性时态算子
- 路径选择算子 $\exists$: for some futures
    - $\forall\psi:=\neg\exists\neg\psi$: for all futures
- 路径公式：$\psi::=\phi|\psi_1\vee\psi_2|\neg\psi|\bigcirc\psi|\psi_1\mathcal{U}\psi_2$
- 状态公式：$\varphi::=p|\perp|\varphi_1\vee\varphi_2|\neg\varphi|\exists\psi$

#### Sublanguage

- 路径公式：$\psi::=\bigcirc\varphi|\varphi_1\mathcal{U}\varphi_2$
    - 不允许线性时态算子的布尔组合和嵌套
    - 状态公式不变
- 等价于：
    - 基本时态算子：$\exists\bigcirc,\exists\square,\exists\mathcal{U}$
        - $\forall\bigcirc\varphi:=\neg\exists\bigcirc\neg\varphi$
        - $\forall\square\varphi:=\neg\exists\diamondsuit\neg\varphi$
        - $\forall\diamondsuit\varphi:=\neg\exists\square\neg\varphi$
        - $\exists\diamondsuit\varphi:=\exists(\perp\mathcal{U}\varphi)$
        - $\forall(\varphi_1\mathcal{U}\varphi_2):=\neg\exists(\neg\varphi_2\mathcal{U}\neg\varphi_2)\wedge\neg\exists\square\neg\varphi_2$
    - $\varphi::=p|\perp|\neg\varphi|\varphi_1\vee\varphi_2|\exists\bigcirc\varphi|\exists\square\varphi|\exists(\varphi_1\mathcal{U}\varphi_2)$

### 语义 Computation Tree Logic

#### CTL$^*$

- Kripke 模型：$\mathfrak{M}=(S,R,L)$
    - $S$：非空状态集
    - $R\subset S\times S$ 是一个完全的二元关系
        - 完全：$\forall s\in S\exists t\in S:(s,t)\in R$
    - $L:S\rightarrow2^\Phi$
- 全路径(full path) $x=(s_0,s_1,\cdots)$：$\forall i\in\mathbb{N}:(s_i,s_{i+1})\in R$
- $\mathfrak{M},s_0\vDash\varphi$: 在 $\mathfrak{M}$ 的状态 $s_0$ 为真
    - (S1)
        - $\mathfrak{M},s_0\vDash p\iff p\in L(s_0)$
        - $\mathfrak{M},s_0\vDash\perp$ 从不成立
    - (S2)
        - $\mathfrak{M},s_0\vDash\varphi_1\vee\varphi_2\iff\mathfrak{M},s_0\vDash\varphi_1$ 或 $\mathfrak{M},s_0\vDash\varphi_2$
        - $\mathfrak{M},s_0\vDash\neg\varphi\iff\mathfrak{M},s_0\vDash\varphi$ 不成立
    - (S3) $\mathfrak{M},s_0\vDash\exists\psi\iff\mathfrak{M}$ 中存在全路径 $x,\mathfrak{M},x\vDash\psi$
- $\mathfrak{M},x\vDash\psi$: 在 $\mathfrak{M}$ 中的全路径 $x$ 为真
    - (P1) $\mathfrak{M},x\vDash\varphi\iff\mathfrak{M},s_0\vDash\varphi$
    - (P2)
        - $\mathfrak{M},x\vDash\psi_1\vee\psi_2\iff\mathfrak{M},x\vDash\psi_1$ 或 $\mathfrak{M},x\vDash\psi_2$
        - $\mathfrak{M},x\vDash\neg\psi\iff\mathfrak{M},x\vDash\psi$ 不成立
    - (P3)
        - $\mathfrak{M},x\vDash\psi_1\mathcal{U}\psi_2\iff\exists j(\mathfrak{M},x^j\vDash\psi_2$且$\forall k<j(\mathfrak{M},x^k\vDash\psi_1))$
        - $\mathfrak{M},x\vDash\bigcirc\varphi\iff\mathfrak{M},x^1\vDash\psi$

#### CTL

- S1,S2,S3
- S4
    - $\mathfrak{M},s_0\vDash\exists\bigcirc\varphi\iff\exists s_1,Rs_0s_1,\mathfrak{M},s_1\vDash\varphi$
    - $\mathfrak{M},s_0\vDash\exists\square x,\forall i\in\mathbb{N},\mathfrak{M},s_i\vDash\psi$
    - $\mathfrak{M},s_0\vDash\exists(\varphi_1\mathcal{U}\varphi_2)\iff\exists x,\exists j(\mathfrak{M},s_j\vDash\psi_2$且$\forall k<j(\mathfrak{M},s_k\vDash\psi_1))$

## 语法

### 正规模态逻辑 $\Lambda$

- 包含 TAUT,K,Dual
- 对规则 MP,US,N 封闭

### $K$

- 公理
    - TAUT: 所有重言式
    - K: $\square(p\rightarrow q)\rightarrow(\square p\rightarrow \square q)$
    - Dual: $\diamondsuit p\leftrightarrow\neg\square\neg p$
- 规则
    - MP (Modus Ponens): $\frac{\varphi\rightarrow\psi,\varphi}{\psi}$
    - US (Uniform Substitutious): $\frac{\varphi}{\theta}$
        - $\theta$ 为将 $\varphi$ 中命题符一致地替换为任意的公式而得到的公式
    - N (Generalization): $\frac{\varphi}{\square\varphi}$
- $K$-系统对应基本模态逻辑
    - soundness
    - completeness
- 最小的正规模态逻辑为 $K$

### $K\Gamma$

- $K4$
    - 增加公理 $\diamondsuit\diamondsuit p\rightarrow\diamondsuit p$
    - 对应传递框架

## 其它

- 定理等级
    - Fundamental Thm
    - Main Thm
    - Theorem
    - Lemma
    - Proposition
    - Law
    - Thesis
- 三次数学危机
    - 小数$\rightarrow$无理数
        - 希伯索斯
    - $\infty$ (牛顿-莱布尼茨)
        - 柯西
    - 罗素悖论 (集合论)
        - 公理逻辑论
