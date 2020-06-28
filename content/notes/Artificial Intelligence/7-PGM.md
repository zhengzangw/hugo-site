---
title: 7-概率图
date: 2019-09-10
weight: 7
---

## 图模型

- $p(x)=\prod_{k=1}^{K}p(x_k|x_1,\cdots,x_{k-1})$
- 联合概率表：需要 $2^K-1$ 个参数
- 图模型基本问题
  - 表示问题：如何用图结构描述变量间的依赖关系
  - 学习问题：结构学习，参数学习
  - 推断问题：已知部分变量，求其它变量条件分布概率
- 有向图模型：贝叶斯网(信念网, Judea Pearl)
- 无向图模型：马尔可夫网

## 有向图模型

- $B=\langle G,\Theta\rangle$
  - $G$: 有向无环图 (DAG)
  - $\Theta$: 条件概率表 (CPT)
    - $\theta_{x_i|\pi_i}=P_B(x_i|\pi_i)$
- 联合分布：$P(x_1,\cdots,x_n)=\prod_{i=1}^nP(x_i|\text{Parent}(x_i))$

### 独立性判断

- 三变量间的典型依赖关系
  - 同父结构: $x_3\perp x_4|x_1$
  - 顺序结构：$y\perp z|x$
  - 冲撞结构(V-structure): $x$&#10987;$y|z$
    - marginal independece: $z$ 完全未知则独立，给定 $z$ 则不独立
- 有向分离 (D-seperation，或道德化)
  - 转化为无向图 (moral graph)
    - 有向边改无向边
    - V 型结构两个父节点之间加边
  - $x$ 与 $y$ 有向分离：$\exists Z$, $x,y$ 在 $G\backslash Z$ 中分属两个连通分支则 $x\perp y|Z$
- 马尔科夫覆盖

### 常见有向图模型

- Sigmoid 信念网络
  - 变量取值为 $\{0,1\}$
  - $p(x_k=1|x_{\pi_k};\theta)=\sigma(\theta_0+\sum_{x_i\in x_{\pi_k}}\theta_ix_i)$
  - $M$ 个父节点
    - 表格记录：$2^M$ 参数
    - 参数化模型：$M+1$ 参数
- 朴素贝叶斯分类器: 条件独立性假设
- 隐马尔科夫网

### 结构学习

- 搜索最优贝叶斯网络结构: $\text{NP}$-hard
- 评分搜索：$G^*=\argmax_G g(G:D)$
  - MDL(最小描述长度)：综合编码长度最短的网络
    - $s(B|D)=f(\theta)|B|-\text{LL}(B|D)$
    - $\text{LL}(B|D)=\sum_{i=1}^m\log P_B(x_i)$
    - AIC 准则: $f(\theta)=1$
    - BIC 准则: $f(\theta)=\frac{\log m}{2}$
- 常用策略
  - 贪心法
  - 网络结构约束

## 无向图模型

- 马尔科夫网：
  - $V$: 随机变量
  - $E$: 变量间的依赖关系
  - $x_{\{k\}}$: 第$k$个团随机变量
- 无向图为马尔科夫网络 $\iff$ 满足以下三条性质之一
  - Pairwise Markov Property: $X_u\perp X_v|X_{V\backslash\{u,v\}},\{u,v\}\not\in E$
  - Local Markov Property: $X_v\perp X_{V\backslash\text{ne}(v)}|X_{\text{ne}(v)}$
    - $\text{ne}(v)$: 邻居，马尔科夫毯
  - Global Markov Property: $X_A \perp X_B|X_S$，$A,B$ 两个子集间任何一条路径都经过子集$S$，则给定 $S$ 后，$A,B$ 两个子集相互条件独立
- 构造
  - 如果满足 $P\not\vDash(X\perp Y|V-\{X,Y\})$，则 $X,Y$ 加边
  - 给定 $X$ 的马尔可夫毯，$X$ 独立于余下的变量
- Hammersley-Clifford 定理：$p(x)>0$ 满足局部马尔科夫性质当且仅当可表为马尔科夫网上的吉布斯分布
  - 吉布斯分布：$p(x)=\frac{1}{Z}\prod_{c\in\mathcal{C}}\phi_c(x_c)$
  - 势函数：$\phi_k(x_{\{k\}})$
  - 配分函数：$Z=\sum_{x\in \mathcal{X}}\prod_{c\in\mathcal{C}}\phi_c(x_c)$
  - 势函数：$f_k(x_{\{k\}})=e^{\omega_k^T\phi_k(x_{\{k\}})}$
- 一般定义为玻尔兹曼分布
  - $\phi_c(x_c)=\exp(-E_c(x_c))$

### 常见无向图模型

- 对数线性模型（最大熵模型）
  - $\phi_c(x_c|\phi_c)=\exp(\theta_c^Tf_c(x_c))$
  - $\log p(x;\theta)=\sum_{c\in\mathcal{C}}\theta_c^Tf_c(x_c)-\log Z(\theta)$
  - 条件最大熵模型（Softmax 回归模型）：$p(y|x;\theta)=\frac{\exp(\theta^Tf(x,y))}{\sum_{y}\exp(\theta^Tf_y(x,y))}$
- 条件随机场（CRF）：$p(y|x;\theta)=\frac{1}{Z(x;\theta)}\exp(\sum_{c\in\mathcal{C}}\theta_c^Tf_c(x,y_c))$
  - 线性链条件随机场
- 马尔科夫逻辑网 (MLN) = Markov Net + 一阶逻辑
  - 判断一个知识库中是否包含公式 $F$，$F$ 在所有满足知识库的世界中恒真
    - 公式附加权值的一阶逻辑知识库
    - 基本思想：将一阶逻辑的限制放松，即一个可能世界违反公式越多，其发生的概率越小
  - $L$：$\{(F_i,w_i)\}$
    - $F_i$: 一阶逻辑闭规则（无变元）
    - $w_i$: 实数表示权重
    - $C$: 有限常数集
  - 马尔科夫逻辑网 $M_{L,C}$
    - $L$ 中的任意闭原子对应一个二值结点，真为 $1$，假为 $0$
    - $L$ 任意闭规则对应一个特征值，若规则为真，特征值为 $1$ 否则为 $0$。权重为 $\omega_i$
    - $P(X=x)=\frac{1}{Z}\text{exp}(\sum_{i=1}^F\omega_in_i(x))$
      - $n_i$: $F_i$ 在 $X$ 中所有取真值的公式的数量

## 参数学习

### 无隐变量

- 有向图：$L(D,\theta)=\frac{1}{N}\sum_{n=1}^N\sum_{k=1}^K\log p(x_k^{(n)}|x_{\pi_k}^{(n)};\theta_k)$
- 无向图：$L(D,\theta)=\frac{1}{N}\sum_{n=1}^N\log p(\sum_{c\in\mathbb{C}}\theta_c^Tf_c(x_c^{(n)}))-\log Z(\theta)=E_{x\sim\tilde p(x)}f_c(x_c)-E_{x\sim p(x;\theta)}f_c(x_c)=\frac{1}{N}\sum_{n=1}^Nf_c(x_c^{(n)})-\sum_xp(x;\theta)f_c(x_c)$
  - 采样近似第二个期望
  - 坐标上升法：固定其它参数，优化一个参数

### 有隐变量

- EM 算法

## 推断

- 条件概率查询：$p(q|e)=\frac{\sum_z p(q,e,z)}{\sum_{q,z}p(q,e,z)}$
- 因果推理
  - 已知网络中的祖先节点而计算后代节点的条件概率
- 诊断推理
  - 已知后代节点计算祖先节点，贝叶斯定理
- 支持推理
  - 原因间的相互影响

### 精确推断

- 精确推断：NP-hard
- 变量消除法
- 信念传播算法（BP, 合积算法，消息传递算法）
  - 链上的 BP 算法
    - $p(x_t)=\frac{1}{Z}\prod_{t=1}^{T-1}\phi(x_t,x_{t+1})$
    - $p(x_t)=\frac{1}{Z}\sum_{x_1}\cdots\sum_{x_{t-1}}\sum_{x_{t+1}}\cdots\sum_{x_T}\prod_{t=1}^{T-1}\phi(x_t,x_{t+1})$
    - $p(x_t)=\frac{1}{Z}\mu_{t-1,t}(x_t)\mu_{t+1,t}(x_t)$
    - $\mu_{t-1,t}(x_t)=\sum_{x_{t-1}}\phi(x_{t-1},x_t)\mu_{t-2,t-1}(x_{t-1})$
    - $\mu_{t+1,t}(x_t)=\sum_{x_{t+1}}\phi(x_t,x_{t+1})\mu_{t+2,t+1}(x_{t+1})$
  - 树结构上的 BP 算法
  - 图结构上的 BP 算法：联合树算法

### 近似推断

- 环路信念传播：使用信念传播算法在含环图上获得近似解

#### 变分推断

- 变分推断（变分贝叶斯）：寻找简单分布 $q^*(z)$ 近似条件概率密度 $p(z|x)$
- 泛函优化问题：$q^*(z)=\argmin_{q(z)\in Q}\text{KL}(q(z)\|p(z|x))=\argmax_{q(z)\in Q}\text{ELBO}(q,x)$
- 候选分布族 $Q$
  - 平均场分布族：$q(z)=\prod_{m=1}^Mq_m(z_m),z_m\subseteq Z$
  - 神经网络拟合 $p(z|x)$
- $\text{ELBO}(q,x)=\int \prod_{m=1}^Mq_m(z_m)(\log p(x,z)-\sum_{m=1}^M\log q_m(z_m))dz=\int q_j(\int\prod_{m\neq j}q_m\log p(x,z)dz_m)dz_j-\int q_j\log q_j dz_j+C$
  - $\text{ELBO}(q,x)=\int q_j\log \tilde p(x,z_j)dz_j-\int q_j\log q_j dz_j+C$
  - $\log \tilde p(x,z_j)=E_{q(z_{\backslash j})}\log p(x,z) + C$ 关于 $z_j$ 未归一化分布
  - 最优化 $q_j^*(z_j)=\tilde p(x,z_j)$
- 坐标上升法：迭代优化 $q_j^*(z_j),j=1,\cdots,M$，使其收敛到局部最优解

#### 采样法

- 随机采样：cdf 递增，则在 cdf 逆函数上进行均匀采样
- 拒绝采样
  - 未归一化分布 $\hat p(x)$
  - 采样样本 $\hat x$
  - 提议分布（参考分布） $q(x),\exists k,\forall x,kq(x)\geq \hat p(x)$
  - 接受概率：$\alpha(\hat x)=\frac{\hat p(\hat x)}{kq(\hat x)}$
- 重要性采样：从参考分布中采样
  - $E_p[f(x)]=\int_x f(x)p(x)dx=E_q(f(x)\omega(x)]$
  - 重要性权重：$\omega(x)=\frac{p(x)}{q(x)}$
  - 未归一：$E_p(f(x))=\frac{\int_x\hat p(x)f(x)dx}{\int_x\hat p(x)dx}\approx\frac{\sum_{n=1}^Nf(x^{(n)}\hat\omega(x^{(n)}))}{\sum_{n=1}^N\hat\omega(x^{(n)})}$
- 拒绝采样和重要性采样的效率随空间维数的增加而指数降低
- MCMC 方法采样
  - 预烧期（Burn-in Period）
  - 相邻样本高度相关：每间隔 $M$ 次随机游走取一个样本
- Metropolis-Hastings 算法
  - 根据 $q(x|x_t)$ 采样 $\hat x$
  - 以如下概率接受：$A(\hat x,x_t)=\min(1,\frac{p(\hat x)q(x_t|\hat x)}{p(x_t)q(\hat x|x_t)})$
- Metropolis 算法：MH 算法中提议分布对称
  - $A(\hat x,x_t)=\min(1,\frac{p(\hat x)}{p(x_t)})$
- Gibbs Sampling：使用全条件概率作为提议分布，$A=1$
  - $p(x_m|x_{\backslash m})=p(x_n|x_1,\cdots,x_{m-1},x_{m+1},\cdots,x_M)$
  - 按下标顺次采样
