---
title: 8-强化学习
date: 2019-09-10
weight: 8
---

* 本质 Trial and Error
* 交互学习：通过交互学习一个目标
* 状态/奖励的分布式策略依赖的
* model-base: $V$ 根据已知数据计算，如动态规划
* model-free: 取样试验得到
* 在线学习：如 Sarsa
* 离线学习：如 Q Learning

## Markov Decision Process

* $S$: 状态集合
* $A$: 动作集合
* $R:S\times A\rightarrow\mathbb{R}$: 即时奖励函数
* $\delta:S\times A\times S\rightarrow \mathbb{R}$: 状态转移概率
* 轨迹：经验/情节(episode)
* 策略：$\pi:S\rightarrow A$
  * 最优策略 $\pi^*$：必然存在一个确定性最优策略，从任一状态出发，返回值都最大
* 单状态学习，最大化期望即时奖励
* 多状态学习：最大化期望返回函数 $V$
  * Finite Horizon: $\sum_{1\leq i\leq N}R(s_i,a_i)$
  * Infinite Horizon
    * 有折扣：$\sum_{i=0}^\infty\gamma^iR(s_i,a_i)$
    * 无折扣：$\lim_{N\rightarrow\infty}\frac{1}{N}\sum_{i=0}^{N-1}R(s_i,a_i)$

## 动态规划方法

* 值函数
  * $V^\pi(s)=\mathbb{E}_\pi[R_t|s_t=s]$
  * $Q^\pi(s,a)=\mathbb{E}_\pi[R_t|s_t=s,a_t=a]$
  * $V^*(s)=V^{\pi^*}(s),Q^*{s,a}$
  * $\pi$ 为最优策略 $\iff\forall s,V^*(s)=\max_\pi V^{\pi}(s)=\max_a Q^{\pi}(s,a)$
* 策略评估（Policy Evaluation）：MDP已知，给定一个策略 $\pi$，评估返回值
  * Bellman 等式：$V^{\pi}(s)=\mathbb{E}[R_{t}+\gamma V^\pi(S_{t+1})|S_t=s]$
    * 有折扣无限窗口：$V^\pi(s)=\mathbb{E}[R(s,\pi(s))]+\gamma\sum_{s'}\delta(s,\pi(s),s')V^{\pi}(s')$
  * 线性规划求解
* 最优控制（Optiomal Control）：MDP已知，寻找一个最优策略 $\pi^*$
  * $Q^\pi(s,a)=\mathbb{E}(R(s,a))+\gamma\sum_{s'}\delta(s,a,s')V^\pi(s')$
  * 策略迭代方法
    * 贪心策略：$\pi(s)=\arg\max_a Q^{\pi}(s,a)$
    * $\epsilon$-贪心策略：
      * $1-\epsilon$ 概率: $\pi(s)=\argmax_a Q^{\pi}(s,a)$
      * $\epsilon$ 概率: 其它
  * 计算最优策略
    * 值迭代方法：$V^{i+1}(s)\leftarrow\max_a(R(s,a)+\gamma\sum_{s'}\delta(s,a,s')V^i(s')))$
    * 策略迭代

## Morte Carlo Method

* 使用条件
  * 环境可模拟
  * 有限步骤
* 策略评估迭代
  * 探索：选择一个状态 $s$
  * 模拟：使用 $\pi$ 进行一次模拟，从当前状态到结束，产生一段轨迹
  * 抽样：获得轨迹上的 $R(s,a)$, 获得集合 $T$
  * 估值： Learned value $R_t=\text{avg}(T)$
* 策略优化：$V(s_t)\leftarrow V(s_t)+\alpha(R_t-V(s_t))$, 优化 $\pi(s)$
* Exploring Starts 假设：有探索起点的环境
* first-visit：只计算一个状态第一次的值
* every-visit: 计算每次访问的值
* on-policy method: 评估和优化的策略和模拟的策略是同一个
* off-policy method: 评估和优化的策略和模拟的策略是不同的两个

## 时差方法 (Temporal Difference)

* 蒙特卡洛的方法可看做是最大步数的时序差分学习
* Bootstraps: 通过一个估计值进行更新
  * 动态规划中采用
  * 蒙特卡洛算法不采用
* 采用
  * 蒙特卡洛算法采用
  * 动态规范不采用
* 单步时差方法：$V(s_t)\leftarrow V(s_t)+\alpha(r_t+\gamma V(s_{t+1})-V(s_t))$
  * $R_t^{(2)}=r_t+\gamma V(s_{t+1})$
* $N$ 步时差方法: $R_t^{(n)}=\sum_{i=0}^{n-1}\gamma^ir_{t+i}+\gamma^nV(s_{t+n})$
* $N$ 步回退方法：$R_t=\frac{1}{2}R_t^{(2)}+\frac{1}{2}R_t^{(4)}$
* $\lambda$ 返回方法：$R^{(\lambda)}_t=(1-\lambda)\sum_{n=1}^\infty\lambda^{t-1}R_t^{(n)}$

```python
initial V(s), e(s)=0
for each episode:
  initial s
  repeat until s is final state
    a = epsilon贪心策略()
    r,s2 = Agent.action(a)
    delta = r + gamma * V(s2) - V(s)
    e(s) = e(s) + 1
    for all s
      V(s) = V(s) + alpha * delta * e(s)
      e(s) = gamma * delta * e(s)
    s = s2
```

## Q Algorithm

* 计算 $Q$ 函数
* $R_t=r_t+\gamma\max_a Q(s_{t+1},a)$
* $Q(s_t,a_t)\leftarrow (1-\alpha)Q(s_t,a_t)+\alpha R_t$
* 储存 $Q$ 值：$s$-$a$ 矩阵
* 维度灾难
  * Atari Game: 210*150 像素，每个像素 256，可能状态有 $256^{210\times 160}$

## Deep Q Network

* 价值函数近似：$Q(s,a)=f(s,a)$
  * $Q(s,a)\approx f(s,a,w)$
  * $Q(s)=[Q(s,a_1),Q(s,a_2),\cdots]\approx f(s,w)$
* Q 网络训练目标损失：$L(w)=\mathbb{E}[(r+\gamma\max_{a'}Q(s',a',w)-Q(s,a,w))^2]$
  * 以 $R_t$ 为目标值

## 学习分类系统(LCS)

利用遗传算法实现强化学习

* 历史发展
  * 1971 Holland 首次提出分类系统
  * 1978 Holland 正式提出 Learning Classifer System
  * 1988 Holland 定义 LCS 标准框架，过于复杂
  * 1994 Wilson ZCS
  * 1999 Wilson XCS
* Rule Representation：Use ternary alphabet $\{0,1,\sharp\}$ to represent rule conditions
* Credit assignment
* Rule discovery
