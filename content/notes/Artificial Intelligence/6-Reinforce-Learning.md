---
title: 5-强化学习
date: 2019-09-10
weight: 5
---

## 强化学习

- 交互学习：通过交互学习一个目标，Trial and Error
  - 状态/奖励的分布式是策略依赖的
- model-base: $V$ 根据已知数据计算，如动态规划
- model-free: 取样试验得到
- 在线学习：如 Sarsa
- 离线学习：如 Q Learning

### Markov Decision Process

- $S$: 状态集合
- $A$: 动作集合
- $R:S\times A\rightarrow\mathbb{R}$: 即时奖励函数
- $\delta:S\times A\times S\rightarrow \mathbb{R}$: 状态转移概率
- 轨迹：经验/情节(episode)
- 策略
  - $\pi:S\rightarrow A$
  - $\pi:S\times A\rightarrow\mathbb{R}$
- 单状态学习，$\pi^*(s)=\argmin_\pi R(s,\pi(s))$
- 多状态学习：$\pi^*(s)=\argmin_\pi V^\pi(s)$
  - 有限状态：$R_t=\sum_{1\leq i\leq N}R(s_i,a_i)$
  - 无限状态
    - 有折扣：$\sum_{i=0}^\infty\gamma^iR(s_i,a_i)$
    - 无折扣：$\lim_{N\rightarrow\infty}\frac{1}{N}\sum_{i=0}^{N-1}R(s_i,a_i)$
- 值函数
  - $V^\pi(s)=\mathbb{E}_\pi[R_t|s_t=s]$
  - $Q^\pi(s,a)=\mathbb{E}_\pi[R_t|s_t=s,a_t=a]$
- $\pi$ 为最优策略 $\iff\forall s,V^*(s)=V^{\pi^*}(s)=\max_\pi V^{\pi}(s)=\max_a Q^{\pi}(s,a)$
- Bellman 等式：$V^{\pi}(s)=\mathbb{E}_\pi[R_t+\gamma V^\pi(s_{t+1})|s_t=s]$
  - $V^\pi(s)=\sum_{a\in A}\pi(a|s)[R(s,a)+\gamma\sum_{s'}\delta(s,\pi(s),s')V^{\pi}(s')]$
  - $Q^\pi(s,a)=R(s,a)+\gamma\sum_{s'}\delta(s,a,s')V^\pi(s')$

### 动态规划方法

- 策略评估（Policy Evaluation）：MDP 已知，给定一个策略 $\pi$，评估返回值
  - 有限状态：求解方程组
  - 策略迭代：初始 $V^\pi(s)$ 后根据 Bellman 等式更新迭代
- 最优控制（Optiomal Control）：MDP 已知，寻找一个最优策略 $\pi^*$
  - 策略迭代算法
    - 值迭代：$V^{i+1}(s)\leftarrow\max_a Q^\pi(s,a)$
    - 策略迭代  
      贪心策略：$\pi(s)=\arg\max_a Q^{\pi}(s,a)$  
      $\epsilon$-贪心策略：以 $\epsilon$ 概率选择其它

### Morte Carlo Method

- 使用条件
  - 环境可模拟
  - 有限步骤
- 策略评估迭代
  - 探索：选择一个状态 $s$
  - 模拟：使用 $\pi$ 进行若干次模拟，从当前状态到结束，产生一段轨迹
  - 抽样：获得轨迹上的 $R(s,a)$, 获得集合 $T$
  - 估值： Learned value $R_t=\text{avg}(T)$
- 策略优化：$V(s_t)\leftarrow V(s_t)+\alpha(R_t-V(s_t))$, 优化 $\pi(s)$
  - Exploring Starts 假设：有探索起点的环境
  - first-visit：只计算一个状态第一次的值
  - every-visit: 计算每次访问的值

### 时差方法 (Temporal Difference)

- 单步时差方法：$V(s_t)\leftarrow V(s_t)+\alpha(r_t+\gamma V(s_{t+1})-V(s_t))$
  - TD(0) 误差：$R_t^{(2)}=r_t+\gamma V(s_{t+1})$
- $N$ 步时差方法: $R_t^{(n)}=\sum_{i=0}^{n-1}\gamma^ir_{t+i}+\gamma^nV(s_{t+n})$
- $N$ 步回退方法：$R_t=\frac{1}{2}R_t^{(2)}+\frac{1}{2}R_t^{(4)}$
- $\lambda$ 返回方法：$R^{(\lambda)}_t=(1-\lambda)\sum_{n=1}^\infty\lambda^{t-1}R_t^{(n)}$
- 蒙特卡洛的方法可看做是最大步数的时序差分学习

### Sarsa Algorithm

- $Q(s_t,a_t)\leftarrow Q(s_t,a_t)+\alpha[R_{t+1}+\gamma Q(s_{t+1},a_{t+1})-Q(s_t,a_t)]$
  - choose $a_t$: $\epsilon$-Greedy
  - choose $a_{t+1}$: $\epsilon$-Greedy
- on-policy: 评估和优化的策略和模拟的策略是同一个

### Q Algorithm

- $Q(s_t,a_t)\leftarrow Q(s_t,a_t)+\alpha[R_{t+1}+\gamma \max_aQ(s_{t+1},a)-Q(s_t,a_t)]$
  - choose $a_t$: $\epsilon$-Greedy
  - choose $a_{t+1}$: Greedy
- off-policy: 评估和优化的策略和模拟的策略是不同的两个
- 储存 $Q$ 值：$s$-$a$ 矩阵
- 维度灾难
  - Atari Game: 210\*150 像素，每个像素 256，可能状态有 $256^{210\times 160}$

#### Deep Q Network

- 价值函数近似：$Q(s,a)=f(s,a)$
  - $Q(s,a)\approx f(s,a,w)$
  - $Q(s)=[Q(s,a_1),Q(s,a_2),\cdots]\approx f(s,w)$
- Q 网络训练目标损失：$L(w)=\mathbb{E}[(r+\gamma\max_{a'}Q(s',a',w)-Q(s,a,w))^2]$
  - 以 $R_t$ 为目标值

### 学习分类系统(LCS)

利用遗传算法实现强化学习

- 历史发展
  - 1971 Holland 首次提出分类系统
  - 1978 Holland 正式提出 Learning Classifer System
  - 1988 Holland 定义 LCS 标准框架，过于复杂
  - 1994 Wilson ZCS
  - 1999 Wilson XCS
- Rule Representation：Use ternary alphabet $\{0,1,\sharp\}$ to represent rule conditions
- Credit assignment
- Rule discovery
