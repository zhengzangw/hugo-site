---
title: 语法分析
date: 20200227
---

## 上下文无关文法

- 语法描述
  - 上下文无关文法 CFG
  - BNF
- 上下文无关文法
  - 终结符号
  - 非终结符号
  - 开始符号
  - 产生式
- 推导：$A\rightarrow\gamma$，则 $\alpha A\beta\Rightarrow \alpha\gamma\beta$
  - 最左推导：$\alpha$ 中不包含终结符 $\overset{*}{\Rightarrow}_{\text{lm}}$
  - 零步或多步推导：$\overset{*}{\Rightarrow}$
  - 一步或多步推导：$\overset{+}{\Rightarrow}$
  - 句型 $\alpha$：$S\overset{*}{\Rightarrow} \alpha$
  - 句子：不包含非终结符号的句型
  - 语言：$L(G)=\{\omega|S\overset{*}{\Rightarrow}\omega\}$
- 二义性：如果一个文法可以为某个句子生成多棵语法分析数，则该文法二义
- 上下文无关语言强于正则表达式
- 设计文法
  - 消除二义性
  - 消除左递归：$A\overset{+}{\Rightarrow} A\alpha$
  - 提取左公因子

## 语法分析技术

- 自顶向下语法分析器：处理 LL 文法
- 自底向上语法分析器：处理 LR 文法

## 语法分析器生成工具