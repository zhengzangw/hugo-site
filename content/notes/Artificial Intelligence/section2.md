---
title: 2-智能 Agent
date: 2019-09-10
tags: [ml, notes]
weight: 2
---

* 理性
  * 依赖于：性能度量，先验知识，可能的行动，感知序列
  * 对环境的先验知识
    * 可以完成的行动：执行器
    * 截止此时的感知序列：信息收集，传感器
  * 期望性能最大化
  * 完美：实际性能最大化
* 任务环境 = (Performance Measurement,Environment,Actuators,Sensors) PEAS
* 任务环境的性质
  * Observable: 传感器是否能在每个时间点上获得完整信息
  * Multi Agents: 存在其它 Agents
  * Deterministic: 下一状态是否完全决定于当前转态与行为
  * Episodic
  * Static or Dynamic
    * Dynamic: Agent 计算时环境会变化
    * Semi: 环境不变，但性能评价变化
  * 离散/连续
  * 环境已知/未知
* Agent 函数：将感知信息映射到行动
* Agent 程序：实现 Agent 函数
* Agent = 体系结构（执行器，传感器，计算装置） + Agent 程序
* Agent 程序
  * Table Driven Agent
  * Simple Reflex Agent
    * RULE-MATCH
    * 仅使用当前状态
  * Model Based Reflex Agent
    * 拥有内部状态（模型）
    * 使用当前状态与内部状态
  * Agent with Goal
    * 不使用 RULE-MATCH
    * 确定当前状态与内部状态及动作后果，与目标比较后选择执行
  * Agent with Utility
* 学习 Agent
* 表达能力
  * 原子表示：单点
  * 要素化表示：集合
  * 结构化表示：逻辑等
