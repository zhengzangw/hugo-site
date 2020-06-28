---
title: 8-博弈论
date: 2019-09-10
weight: 8
---

## 博弈论

### 策略

- 囚徒困境
- 布雷斯悖论（Braess's paradox）
- 最优策略
  - 帕里托优(Pareto Efficiency)
    - 不存在另一个方案 $x'$, $\exists t,\text{UTILITY}_{x'}(t)>\text{UTILITY}_{x}(t),\forall t,\text{UTILITY}_{x'}(t)\geq\text{UTILITY}_{x}(t)$
  - 社会福利：和最优
  - Nash 均衡：没有参与者可以独自行动而增加收益
    - 无纯策略纳什均衡解
    - 多纳什均衡解
  - 优超(Dominant)：不依赖其它参与者

### 投票

- 投票
  - $A$: Agent 集合
  - $O$: 投票结果集合
  - 投票结果：$\succ_i\subseteq O\times O$
  - 社会偏序：$\succ^*$
    - 对任意 $o,o'\in O$ 有定义
    - 非对称且传递
    - 帕里托优：$\forall i,o\succ_io'\Rightarrow o\succ^*o'$
    - 投票方案对不相关的候选人是独立的
    - 没有 Agent 可以独裁
  - 阿罗不可能定理
- 投票方案：使结果帕里托优
  - 多数投票：所有候选人同时进行比较，得票最高者获胜
    - 不满足无关方案独立原则
  - 二叉投票
    - 不满足无关方案独立原则
    - 与序相关
  - 计分投票：排名第一的得 $|O|$ 分，排名第二的得 $|O|-1$ 分，以此类推
    - 不满足无关方案独立原则

### 拍卖

- 拍卖方案：使拍卖者增加自己的利益
  - 英格兰拍卖：first-price open-cry
  - 密封拍卖：first-price sealed-bid
  - Vickery 拍卖：second-price sealed-bid
  - 荷兰式拍卖：减价式拍卖

### 谈判

- 谈判方案
  - 公理谈判机制：不变性、对称性、无关性、帕里托优
  - 策略谈判机制
    - 物品的折扣因素: $\pi_1=\frac{1-\delta_2}{1-\delta_1\delta_2}$
    - 谈判的代价因素
