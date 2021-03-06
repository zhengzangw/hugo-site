---
title: 2-搜索
date: 2019-09-10
weight: 2
---

## 无信息搜索

- 问题定义：初始状态，可能行动，转移模型，目标测试，路径耗散
- 参数
  - 分支因子 $d$：每个状态有 $d$ 个后继
  - 最优解代价 $C^*$
  - 每个行动代价至少为 $\epsilon$
  - 任一结点最大深度
- 性能度量
  - 完备性：有解则一定能找到
  - 最优性：能找到最优解
  - 时间复杂度
  - 空间复杂度

| 标准       | 宽度优先     | 一致代价                        | 深度优先 | 深度受限 | 迭代加深   | 双向           |
| ---------- | ------------ | ------------------------------- | -------- | -------- | ---------- | -------------- |
| 完备性     | $b<\infty$   | $b<\infty$                      | No       | No       | $b<\infty$ | $b<\infty$     |
| 最优性     | 单步代价相同 | Yes                             | No       | No       | Yes        | 双向为宽度优先 |
| 时间复杂度 | $O(b^d)$     | $O(n^{1+\frac{C^*}{\epsilon}})$ | $O(b^m)$ | $O(b^l)$ | $O(b^d)$   | $O(b^{d/2})$   |
| 空间复杂度 | $O(b^d)$     | $O(n^{1+\frac{C^*}{\epsilon}})$ | $O(bm)$  | $O(bl)$  | $O(bd)$    | $O(b^{d/2})$   |

## 启发式搜索

- a heuristic is a robust technique for the design of randomized algorithms for Optimziation Problems
  - not able to guarantee the efficiency and the qulity of the computed feasible solution
- 评价函数: $f(n)$
- 已花费的代价：$g(n)$
- 启发函数：$h(n)=$结点$n$到目标结点最小代价的估计值

### 贪婪优先搜索

$f(n)=h(n)$

### A$^*$ 搜索

$f(n)=g(n)+h(n)$

- 最优性条件
  - 树搜索：可采纳启发式，$h(n)$ 小于实际代价
  - 图搜索：一致性，$h(n)\leq c(n,a,n')+h(n')$
    - 一致的启发式都是可采纳的
- 内存占用大：保存所有结点
  - IDA$^*$ 搜索：截断值是 $f$
  - RBFS 递归最佳优先搜索：记录从当前结点的祖先可得到的最佳的可选路径的 $f$值，如果当前结点超过了这个限制，递归将回到可选路径上
  - SMA$^*$：内存耗尽时，删掉当前 $f$ 最差结点，将其值回填到父节点

### Ant System

- heuristic value $\eta(s_i,s_j)$
- pheromone $\tau(s_i,s_j)$
  - update
    - for all edge: $\tau=(1-\rho)\tau$
    - then for edge path: $\tau += f(\text{cost})$
- agent(ant)
- path selection: $p_{ij}=\frac{\tau_{ij}^\delta\eta_{ij}^\beta}{\sum_k\tau_{ik}^\delta\eta_{ik}^\beta}$

## 局部搜索

### 爬山法（贪婪局部搜索）

- 扩展该结点及其子节点，评估
- 选择局部最优子节点
- 缺点
  - 局部极大值
  - 山脊
  - 高原
- 随机爬山法
- 随机重启爬山
- 连续空间
  - 梯度下降
  - Newton-Raphson 方法

### 模拟退火搜索

- local search scheme
  - multistart local search
  - threshold local search
- Difference with LSS: may accept a deterioration with $e^{-\frac{E(q)-E(s)}{k_B*T}}$
  - Boltzmann distribution
- free variable
  - neighborhood choice
  - cooling schedule
    - initial temperature $T$
    - temperature reduction function $f(T,t)$
      - $T:=rT$
      - $T:=\frac{T}{\log_2(k+2)}$
    - termination condition
- asymptotic convergence
  - $M(x)$ is reachable from $\forall x\in M(x)$
  - $T$ is at least as large as the depth of the deepest local, nonglobal minimum
- Avoid following structural properties
  - spiky structure
  - deep trough
  - large plateau-like areas

### 局部束搜索

从整个后继列表中选择 $k$ 个最佳后继

- 随机束搜索：依概率选择 $k$ 个后继

### 遗传算法 (genetic algorithm)

- 算法
  - 评估种群 $P(t)$ 中每个染色体的适应度
  - 根据适应度函数选择部分染色体
  - 产生后代并替换
- 染色体设计
  - 01 串
- 适应函数设计 (fitness)：$f(h)$
  - 值越高，解越优
- 基于适应度函数的选择
  - 轮盘赌选择：与适应度成比例
  - 锦标赛选择：按预定义概率 $p$ 选择较大适应度假设
  - 排序选择
- 遗传算子 (GA operator)：对从当前群体中选择的染色体进行重组
  - 交叉：选择两个候选个体，分解一个个体，然后交换分量形成候选个体
  - 变异：选择一个候选个体，随机选择一位取反
- 模式定理(John Holland 1970s)：Short schemata with large fitness will increase their representation in the population during the evolution
  - 模式：0,1,#组成的任意串，代表一个 01 串集合
  - 轮盘赌选择：$P(h)=\frac{f(h)}{n\overline{f}(t)}$
  - $P(h\in s)=\frac{\hat u(s,t)}{n\overline{f}(t)}m(s,t)$
    - $m(s,t)$: 第 $t$ 代种群中模式 $s$ 的实例数量
    - $\hat u(s,t)$: 第 $t$ 代中模式 $s$ 的染色体平均适应度
  - 模式定理 $E(m(s,t+1))\geq\frac{\hat u(s,t)}{\overline{f}(t)}m(s,t)(1-p_c\frac{d(s)}{l-1})(1-p_m)^{o(s)}$
    - $p_c$：单点交叉概率
    - $p_m$：变异概率
    - $o(H)$：阶，模式中确定位置的个数
    - $d(H)$: 长度，模式中第一个确定位置到最后一个确定位置的距离
    - $l$: 染色体长度

### Tabu Search

- forbid any feasible solution in the last k steps
- or require local transformations do not always change the same parts of the representation
- or modify the cost function

## 不确定/部分观测搜索

解为应急规划（策略），即包含条件语句

- 不确定动作搜索
  - 转移模型输出具有不确定性
  - 与或搜索树
    - 确定条件下：或结点
    - 与结点：包含所有可能结果
    - 如果状态在路径中出现，则此路径无非循环解
- 无传感问题（相容问题）
  - 信念转态空间搜索
- 部分可感知问题
  - 与或树搜索
- 联机搜索
  - 竞争比：实际开销与最优解开销
  - 存在不可逆情况
  - 无法在状态间随意传送
  - ONLINE-DFS-Agent
  - Learning Real-time A$^*$ (LRTA$^*$)
    - 选择 $\min c(s,a,s')+H(s')$
    - 更新 $H(s)$

## 对抗搜索（零和博弈）

### 极小极大算法

$$
\text{MINIMAX}(s)= \begin{cases}
  \text{UTILITY}(s) & s\text{ Terminated}\\
  \max_{a\in A(s)} \text{MINIMAX}(\text{RESULT}(s,a)) & s\text{ is MAX}\\
  \min_{a\in A(s)} \text{MINIMAX}(\text{RESULT}(s,a)) & s\text{ is MIN}
  \end{cases}
$$

- $\alpha-\beta$ 剪枝
  - $\alpha$= 到目前为止路径上发现的 MAX 的最佳最大选择
  - $\beta$= 到目前为止路径上发现的 MIN 的最佳最小选择
  - MAX 结点中，$v\geq\beta$ 则剪枝
  - MIN 结点中，$v\leq\alpha$ 则剪枝
  - $\beta\leq v\leq\alpha$
- 行棋排序
  - 使用较好的行棋
  - 绝招：最好行棋，绝招启发式
  - 换位：不同棋序相同状态
  - 换位表：棋局的哈希表
- 前向剪枝：在某个结点上直接剪枝一些子节点
  - 柱剪枝：只考虑最好的前几种方案
  - PROBCUT 算法
- 查表优化
- 实时决策
  - 计算性局限
  - 评估函数：适用于静态棋局
  - 静态搜索：扩展非静态棋局到静态棋局
  - 地平线效应：对手招数使我方严重损失且无法避免
  - 单步延伸：对于某些招无视深度限制延伸
- 随机博弈

$$
\text{ExpectedMINIMAX}(s)=\begin{cases}
\text{UTILITY}(s) & s\text{ is Terminated}\\
\max_a\text{ExpectedMINIMAX}(\text{Result}(s,a)) & s\text{ is MAX}\\
\min_a\text{\text{ExpectedMINIMAX}}(\text{Result}(s,a)) & s\text{ is MIN}\\
\sum_rP(r)\text{ExpectedMINIMAX}(\text{Result}(s,r)) & s\text{ is CHANCE}
\end{cases}
$$

- 部分可观测博弈

### Monte Caro 树搜索

- 随机抽样+假设检验+树搜索
- 解决数空间太大的问题
- 预测值：节点上有两个数字
  - 该子树上获胜次数
  - 该子树上模拟次数
- UCT 策略：平衡 Exploration 和 Exploitation
  - UCT(node)=$\frac{W(n)}{N(n)}+(\frac{\ln(N(\text{parent node})}{N(n)})^{\frac{1}{c}}$
  - $N(n)$: 结点被访问次数
  - $W(n)$: 仿真获胜次数
- 算法
  - SELECTION：利用树策略选择节点
  - EXPANSION: 添加一个 ? 节点
  - SIMULATION(playout/rollout): 执行操作到结束状态或到阈值，基于模拟结果建立新节点值
  - BACKPROPAGATION: 利用新节点值更新之前的树

## 约束满足问题(CSP)

- 定义
  - $X$: 变量集合
  - $D$: 值域集合，离散/连续
  - $C$: 约束集合，单元/多元/全局约束
  - 解：$X$的赋值
    - 相容性：不违反约束
    - 完整赋值：每个变量都赋值
- 约束传播：使用约束缩小一个变量的合法取值范围
- 局部相容性
  - 结点相容：满足所有一元约束
  - 弧相容：满足所有二元约束
    - AC-3 算法
  - 路径相容：两个变量对另一个变量相容，则每个相容赋值，另一变量可以使其与两个中任一都相容
    - PC-2 算法(1977)
  - $k$-相容：对于任何 $k-1$ 个变量的相容赋值，第 $k$ 个变量总能被赋予一个和前 $k-1$ 个变量相容的值
    - 建立 $k$ 相容的算法最坏情况需要 $n$ 的指数级时间
  - 全局约束
    - Alldiff
    - Atmost
- CSP 回溯搜索：搜索中若不相容则回溯
  - 变量取值
    - 最少剩余值启发式（MRV）
    - 度启发式
    - 最少约束启发式
  - 运用推理
    - 前向检验：对每个与刚赋值的变量相连的变量，删去与破坏弧相容的值
    - 维护弧相容(MAC)：从相连变量调用 AC-3
  - 回溯策略
    - 时序回溯
    - 冲突集回溯
    - 冲突指导的回跳
      - 约束学习
- CSP 局部搜索
  - 最少冲突启发

## 规划

设计一个动作规划以达成目的

- PDDL(planning domain definition language)
  - 流：基元的（无变量的），无函数的原子
  - 状态：流的合取
  - 初始状态：Init
  - 目标状态：Goal
  - 动作：Action(Name(x,y),PRECOND:,EFFECT:)
    - $a\in\text{Action}(s)\iff s\vDash\text{Precond}(a)$
- 规划搜索算法
  - 前向状态空间搜索
  - 后向相关状态搜索
  - 启发式
    - 规划图算法
- 资源约束：Resources, Use
- 时间约束：偏序关系，持续时间
  - 关键路径
