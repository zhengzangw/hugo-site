---
title: 3-推理（演算）
date: 2019-09-10
weight: 3
---

## 推理

- 推理规则
  - 完备性 completeness
  - 可靠性 soundness
- 推理算法 = 推理规则 + 搜索算法
  - 完备的推理算法 = 完备推理规则 + 完备搜索算法
- 反证法：证明 $a\vDash b$，只需证 $a\wedge\neg b$ 不可满足
- 单元归结：$\frac{l_1\vee\cdots\vee l_k, m}{l_1\vee\cdots\vee l_{i-1}\vee l_{j+1}\vee\cdots\vee l_k}$
  - $l_k$ 与 $m$ 为互补文字
- 全归结：$\frac{l_1\vee\cdots\vee l_k, m_1\vee\cdots\vee m_k}{l_1\vee\cdots\vee l_{i-1}\vee l_{j+1}\vee\cdots\vee l_k\vee m_1\cdots}$
  - 归并：去除文字的多余副本
- 归结推理：$\frac{l_1\vee\cdots\vee l_k, m_1\vee\cdots\vee m_k}{l_1\vee\cdots\vee l_{i-1}\vee l_{j+1}\vee\cdots\vee l_k\vee m_1\cdots[x/\theta]},\text{UNIFY}(l_i,\neg m_j)=\theta$
- 基本归结定理：如果子句集是不可满足的，那么这些子句的归纳闭包包含空子句
- Horn 子句：至多只有一个正文字的子句
  - 限定子句：恰有一个正文字的子句
    - 每个限定子句可以写成蕴含式
  - 目标子句：没有正文字的子句
  - Horn 子句在归结下封闭
- 转为和取反式(CNF)
  - 命题逻辑处理
    - 消去 $\Leftrightarrow,\Rightarrow$
    - 否定内移
  - 变量标准化，量词左移
  - Skolem 化：消除存在量词 $(\exists x)(A(x))$ 置换为 $A(c)$
  - 删除全称量词
  - 将$\wedge$分配到$\vee$中
- 一阶逻辑的命题化技术 (1960s)
  - $\forall$ 消除 + Skolem 化（$\exists$ 消除）
    - 有限：可满足时等价
    - 无限：Jacques Herbrand 存在最大嵌套深度
  - 一阶逻辑的蕴含问题是半可判定的
    - 不存在算法否定蕴含不成立的语句
- 置换：$\theta=\{t_1/x_1,t_2/x_2,\cdots,t_n/x_n\}$
  - 置换的复合：$\theta\circ\lambda$
- 数据库语义：没提到的为假
- 画面问题：作为动作的结果，什么变什么不变

### 规约（消解，归结，resolution）

使用最少的合一次数在一个子句数据库中发现矛盾

- 归结算法：
  - 将 $\text{KB}\wedge\neg \alpha$ 转换为 CNF
  - 对含有互补文字的子句进行归结产生新子句
  - 归结出空子句则蕴含，否则不蕴含
- 用 Horn 子句判定蕴含需要的时间与知识库大小呈线性关系
  - 前向链接 $O(nm)$
  - 反向链接
- 搜索策略
  - 宽度优先：时空开销大，保证能发现最短的解路径
  - 成组支持策略
    - 对于输入的子句集$S$，定义一个$S$的子集$T$，称为成组支持。本策略要求每次归结的归结式之一有一个祖先在成组支持中
    - 可以证明，如果$S$是不可满足的并且$S-T$是可满足 的，那么成组支持策略是反驳完备的
  - 单个优先策略
    - 只要存在个体子句就用其归结
    - 可以与成组支持策略一起使用

### 合一（Unification）

找到使不同的逻辑表示变得相同的置换

- 一般化假言推理规则：$\forall i,p_i[x/\theta]=p_i'[x/\theta],\frac{p_1',\cdots,p_n',(\bigvee_{i=1}^n p_i\Rightarrow q)}{q[x/\theta]}$
- $\text{UNIFY}(p,q)=\theta,p[x/\theta]=q[x/\theta]$
  - $\{E_1,\cdots,E_n\}$ 可合一：存在置换 $\theta$ 使 $E_1\theta=\cdots=E_n\theta$
  - unifier: 使合一的置换
  - most general unifier(MGU): 最一般的合一
- 标准化分离：重命名解决冲突
- Skolem 范式化
  - 去掉所有的存在量词
  - 如果谓词中含有多个参数，而$\exists$约束变元在$\forall$约束变元的约束 范围内，则$\exists$约束变元必须是那些其他变元的函数
- 合一算法

```python
def unify(E1,E2):
  if E1,E2 is all constant or all empty:
    if E1 = E2: return {}
    else: return FAIL
  elif E1 is variable:
    if E1 in E2: return FAIL
    else: return {E2/E1}
  elif E2 is variable:
    if E2 in E1: return FAIL
    else: return {E1/E2}
  else:
    ret = unify(E1[0], E2[0])
    if (ret == FAIL): return FAIL
    E1 = apply(ret, E1[1:])
    E2 = apply(ret, E2[1:])
    ret2 = unify(E1, E2)
    if (ret2 == FAIL): return FAIL
    else: return ret+ret2
```

### 前向链接

- 一阶确定子句：文字析取且恰有一个正文字
- 数据日志类知识库：无函词
  - 有函词的子句蕴含半可判定
- For-FC-Ask：对每个规则 $p_1,\cdots,p_n\Rightarrow q$，遍历所有可能的替换使其 $p_i$ 都成立
  - 模式匹配：将规则的前提与知识库中的合式过程进行合一
  - 每次迭代对所有规则重新检查
  - 算法可能生成与目标无关的事实
- 合取排序：对规则前提的合取项进行排序，使总成本最小
  - NP-hard

### 反向链接

- Fol-BC-Ask: 与或搜索树，深度搜索
- Prolog: 深度优先反向链接

## 不确定性推理

- 限制
  - 惰性
  - 理论的无知
  - 实践的无知
- 决策理论 = 概率理论+效用理论

### 反绎推理

溯因推理：$P\rightarrow Q,Q$ 可能推出 $P$

#### 非单调推理逻辑

- 模态操作符
  - unless：缺省推理
    - $p(x)$ unless $q(x) \rightarrow r(x)$: $p(W)$ 成立且 $q(W)$ 未知则 $r(W)$；若 $q(W)$ 为真，则 $r(W)$ 需撤回
    - 默认规则：$p(x)$ unless ab $p(x)\rightarrow r(x)$ 除非 $p$ 有反常实例
  - is consistent with
    - $A(x)\wedge \text{M} B(x)\rightarrow C(x)$
- 默认逻辑
  - $A(x)\wedge : B(x)\rightarrow C(x)$: $A$ 可被证实，且它与对 $B$ 的假设相一致，则 ...

#### 真值维护系统（TMS）

- 目标：维持推理系统的逻辑完整性
- 原理：通过存储每条推理的理由，再重新推断根据新的信念所得出的结论的支持情况
- 方法
  - 时序回溯：从死状态或者末状态返回，系统的遍历所有可能路径
  - 相关性指导回溯：直接回溯到出问题的点，并在那个状态对解进行修正
- 实现
  - 关联机制：每条结论和理由联系在一起
  - 定位机制：当给定矛盾和理由时，直接定位错误假设
  - 回收机制：收回错误的假设
  - 追溯机制：收回错误的假设的结论
- 理由网络 JTMS
  - 结点：知识库中的信念
  - 理由：知识结点结点上的信念
  - 联系
    - IN: 支持结点成立的信念集合
    - OUT: 不支持结点成立的信念集合

#### 基于最小模型

- 模型：对所有变量赋值均满足谓词表达式集合 $S$ 的解释
- 最小模型：对所有变量赋值满足谓词表达式 $S$ 的模型中，最小的那个模型
- 封闭世界假设：求解所需的谓词会被创建，不知道则为假

#### 集合覆盖

- 寻找现象的最小集合覆盖

### 确信度理论

- Stanford 确信度理论
  - $\text{MB}(H|E)$ 给定 $E$ 时，$H$ 的可信度量
    - $=1$ if $P(H)=1$
    - $=\frac{\max\{P(H|E),P(H)\}-P(H)}{1-P(H)}$ o.w.
    - $\text{MB}(H|E)>0,P(H|E)>P(H)$
  - $\text{MD}(H|E)$ 给定 $E$ 时，$H$ 的不可信度量
    - $=1$ if $P(H)=0$
    - $=\frac{\min\{P(H|E),P(H)\}-P(H)}{-P(H)}$ o.w.
    - $\text{MD}(H|E)<0,P(H|E)<P(H)$
  - 互斥性：$\text{MB}(H|E),\text{MD}(H|E)$ 间有一个为 $0$
- 知识的确信度：$\text{CF}(H|E)=\text{MB}(H|E)-\text{MD}(H|E)$
  - 不确定性知识的产生式规则表达：IF E THEN H (CF(H|E))
  - 实际由专家给出
- 证据不确定性：$\text{CF}(E)$
  - $\text{CF}(\neg E)=-\text{CF}(E)$
  - $\text{CF}(E_1\wedge\cdots\wedge E_n)=\min\{\text{CF}(E_1),\cdots,\text{CF}(E_n)\}$
  - $\text{CF}(E_1\vee\cdots\vee E_n)=\max\{\text{CF}(E_1),\cdots,\text{CF}(E_n)\}$
- 不确定性的更新：$\text{CF}(H)=\text{CF}(H|E)\times\max\{0,\text{CF}(E)\}$
- 结论不确定性的合成

$$
\begin{cases}
\text{CF}_1(H)+\text{CF}_2(H)-\text{CF}_1(H)\text{CF}_2(H) & \text{CF}_1(H)\geq 0,\text{CF}_2(H)\geq0\\
\text{CF}_1(H)+\text{CF}_2(H)+\text{CF}_1(H)\text{CF}_2(H) & \text{CF}_1(H)<0,\text{CF}_2(H)<0\\
\frac{\text{CF}_1(H)+\text{CF}_2(H)}{1-\min\{|\text{CF}_1(H)|,|\text{CF}_2(H)|\}}
\end{cases}
$$

### D-S 证据理论

Dempster-Shafer 理论

- 概率密度函数 $m:2^\Omega\rightarrow[0,1],m(\emptyset)=0,\sum_{A\subseteq\Omega}m(A)=1$
- 信任函数：$\text{Bel}:2^\Omega\rightarrow[0,1],\text{Bel}(A)=\sum_{B\subseteq A}m(B)$
  - 对 $A$ 的总信任度
- 似然函数：$\text{Pl}:2^\Omega\rightarrow[0,1],\text{Pl}(A)=1-\text{Bel}(\neg A)$
  - 对 $A$ 非假的信任度
- $A$ 信任程度的上下限：$A[\text{Bel}(A),\text{Pl}(A)]$
  - $\text{Pl}(A)-\text{Bel}(A)$: 描述不知道的情况
- 不信任：识别框架
- Dempster 证据合并规则
  - $m_1\oplus m_2(A)=\frac{\sum_{B\cap C=A}m_1(B)m_2(C)}{\sum_{B\cap C\not=\emptyset}m_1(B)m_2(C)}$
  - 证据相互独立

### 模糊集

- 模糊谓词：$T(x)\in[0,1]$
- 模糊逻辑
  - $T(A\wedge B)=\min(T(A),T(B))$
  - $T(A\vee B)=\max(T(A),T(B))$
  - $T(\neg A)=1-T(A)$
- 问题：$T(A\wedge\neg A)$
- 模糊控制
