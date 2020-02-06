---
title: Sequential Logic Design
date: 2020-02-01
weight: 7
---

## 基本器件

- S-R 锁存器（Latch）

| S   | R   | Q      | QN      |
| --- | --- | ------ | ------- |
| 0   | 0   | last Q | last QN |
| 0   | 1   | 0      | 1       |
| 1   | 0   | 1      | 0       |
| 1   | 1   | 0      | 0       |

- D Latch

| C   | D   | Q      | QN      |
| --- | --- | ------ | ------- |
| 1   | 0   | 0      | 1       |
| 1   | 1   | 1      | 0       |
| 0   | x   | last Q | last QN |

- Flip-Flop 触发器：某个信号处于上升沿或者下降沿的时候工作
  - D Flip-Flop
  - Master/Slave S-R flip-flop
  - Master/Slave J-K Flip-Flop
  - T Flip-Flop
- 特征方程

  ![CE](/images/content/characteristicequation)

## 同步时序电路

- 输出方程，状态方程，激励方程
  - 输入 $X$
  - 输出 $Z$
  - 当前电路状态：$Q^n$
  - 触发器输入 $Y$
- 摩尔型电路：$Z$ 为当前状态函数
- 米里型电路：$Z$ 为当前状态与输入的函数
- 激励方程：$Y=F(X,Q^n)$
- 状态方程：$Q^{n+1}=F(Y,Q^n)$
- 同步时序逻辑电路分析
  - 特性方程+激励方程+输出方程
  - 获得 $Q^{n+1}$ 的表达式
  - 画出状态转换表，转态转换图，确定功能
- 同步时序逻辑逻辑电路设计
  - 建立状态图或状态表
  - 状态化简：合并等价状态
  - 状态分配：$n$ 个触发器确定 $2^n$ 个状态
  - 选择触发器
  - 求出激励方程与输出方程
