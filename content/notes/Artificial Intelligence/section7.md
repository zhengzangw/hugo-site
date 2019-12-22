---
title: 7-不确定性推理
date: 2019-09-10
tags: [ml, notes]
weight: 7
---

* 限制
  * 惰性
  * 理论的无知
  * 实践的无知
* 决策理论 = 概率理论+效用理论

## 反绎推理

溯因推理：$P\rightarrow Q,Q$ 可能推出 $P$

### 非单调推理逻辑

* 模态操作符
  * unless：缺省推理
    * $p(x)$ unless $q(x) \rightarrow r(x)$: $p(W)$ 成立且 $q(W)$ 未知则 $r(W)$；若 $q(W)$ 为真，则 $r(W)$ 需撤回
    * 默认规则：$p(x)$ unless ab $p(x)\rightarrow r(x)$ 除非 $p$ 有反常实例
  * is consistent with
    * $A(x)\wedge \text{M} B(x)\rightarrow C(x)$
* 默认逻辑
  * $A(x)\wedge : B(x)\rightarrow C(x)$: $A$ 可被证实，且它与对 $B$ 的假设相一致，则 ...

### 真值维护系统（TMS）

* 目标：维持推理系统的逻辑完整性
* 原理：通过存储每条推理的理由，再重新推断根据新的信念所得出的结论的支持情况
* 方法
  * 时序回溯：从死状态或者末状态返回，系统的遍历所有可能路径
  * 相关性指导回溯：直接回溯到出问题的点，并在那个状态对解进行修正
* 实现
  * 关联机制：每条结论和理由联系在一起
  * 定位机制：当给定矛盾和理由时，直接定位错误假设
  * 回收机制：收回错误的假设
  * 追溯机制：收回错误的假设的结论
* 理由网络 JTMS
  * 结点：知识库中的信念
  * 理由：知识结点结点上的信念
  * 联系
    * IN: 支持结点成立的信念集合
    * OUT: 不支持结点成立的信念集合

### 基于最小模型

* 模型：对所有变量赋值均满足谓词表达式集合 $S$ 的解释
* 最小模型：对所有变量赋值满足谓词表达式 $S$ 的模型中，最小的那个模型
* 封闭世界假设：求解所需的谓词会被创建，不知道则为假

### 集合覆盖

* 寻找现象的最小集合覆盖

## 确信度理论

* Stanford 确信度理论
  * $\text{MB}(H|E)$ 给定 $E$ 时，$H$ 的可信度量  
    * $=1$ if $P(H)=1$
    * $=\frac{\max\{P(H|E),P(H)\}-P(H)}{1-P(H)}$ o.w.
    * $\text{MB}(H|E)>0,P(H|E)>P(H)$
  * $\text{MD}(H|E)$ 给定 $E$ 时，$H$ 的不可信度量
    * $=1$ if $P(H)=0$
    * $=\frac{\min\{P(H|E),P(H)\}-P(H)}{-P(H)}$ o.w.
    * $\text{MD}(H|E)<0,P(H|E)<P(H)$
  * 互斥性：$\text{MB}(H|E),\text{MD}(H|E)$ 间有一个为 $0$
* 知识的确信度：$\text{CF}(H|E)=\text{MB}(H|E)-\text{MD}(H|E)$
  * 不确定性知识的产生式规则表达：IF E THEN H (CF(H|E))
  * 实际由专家给出
* 证据不确定性：$\text{CF}(E)$
  * $\text{CF}(\neg E)=-\text{CF}(E)$
  * $\text{CF}(E_1\wedge\cdots\wedge E_n)=\min\{\text{CF}(E_1),\cdots,\text{CF}(E_n)\}$
  * $\text{CF}(E_1\vee\cdots\vee E_n)=\max\{\text{CF}(E_1),\cdots,\text{CF}(E_n)\}$
* 不确定性的更新：$\text{CF}(H)=\text{CF}(H|E)\times\max\{0,\text{CF}(E)\}$
* 结论不确定性的合成

$$\text{CF}(H)=\begin{cases}
\text{CF}_1(H)+\text{CF}_2(H)-\text{CF}_1(H)\text{CF}_2(H) & \text{CF}_1(H)\geq 0,\text{CF}_2(H)\geq0\\
\text{CF}_1(H)+\text{CF}_2(H)+\text{CF}_1(H)\text{CF}_2(H) & \text{CF}_1(H)<0,\text{CF}_2(H)<0\\
\frac{\text{CF}_1(H)+\text{CF}_2(H)}{1-\min\{|\text{CF}_1(H)|,|\text{CF}_2(H)|\}}
\end{cases}
$$

## D-S证据理论

Dempster-Shafer 理论

* 概率密度函数 $m:2^\Omega\rightarrow[0,1],m(\emptyset)=0,\sum_{A\subseteq\Omega}m(A)=1$
* 信任函数：$\text{Bel}:2^\Omega\rightarrow[0,1],\text{Bel}(A)=\sum_{B\subseteq A}m(B)$
  * 对 $A$ 的总信任度
* 似然函数：$\text{Pl}:2^\Omega\rightarrow[0,1],\text{Pl}(A)=1-\text{Bel}(\neg A)$
  * 对 $A$ 非假的信任度
* $A$ 信任程度的上下限：$A[\text{Bel}(A),\text{Pl}(A)]$
  * $\text{Pl}(A)-\text{Bel}(A)$: 描述不知道的情况
* 不信任：识别框架
* Dempster 证据合并规则
  * $m_1\oplus m_2(A)=\frac{\sum_{B\cap C=A}m_1(B)m_2(C)}{\sum_{B\cap C\not=\emptyset}m_1(B)m_2(C)}$
  * 证据相互独立

## 模糊集

* 模糊谓词：$T(x)\in[0,1]$
* 模糊逻辑
  * $T(A\wedge B)=\min(T(A),T(B))$
  * $T(A\vee B)=\max(T(A),T(B))$
  * $T(\neg A)=1-T(A)$
* 问题：$T(A\wedge\neg A)$
* 模糊控制
