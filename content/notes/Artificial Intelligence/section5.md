---
title: 规划
date: 2019-09-10
tags: [ml, notes]
weight: 5
---

设计一个动作规划以达成目的

* PDDL(planning domain definition language)
  * 流：基元的（无变量的），无函数的原子
  * 状态：流的合取
  * 初始状态：Init
  * 目标状态：Goal
  * 动作：Action(Name(x,y),PRECOND:,EFFECT:)
    * $a\in\text{Action}(s)\iff s\vDash\text{Precond}(a)$
* 规划搜索算法
  * 前向状态空间搜索
  * 后向相关状态搜索
  * 启发式
    * 规划图算法
* 资源约束：Resources, Use
* 时间约束：偏序关系，持续时间
  * 关键路径