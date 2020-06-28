---
title: Essemble Learning
date: 2019-04-14
weight: 6
---

## 集成学习

- 个体学习器
  - 同质：基学习器，基学习算法
  - 异质：组件学习器
  - 准确性，多样性
- 学习器结合可能带来的好处
  - 统计：学习任务假设空间大，多个假设在训练集上达到同等性能，使用单学习器可能因误选而导致泛化性能不佳
  - 计算：降低陷入糟糕局部极小点的风险
  - 表示：某些学习任务的真实假设可能不在当前算法所考虑的假设空间中，使用多学习器可能学得较好的近似

## 序列化方法

- Boosting
  - Train a weak learner $h_t$ from distribution $D_t$
  - Evaluate the error $\epsilon_t$ of $h_t$
  - $D_{t+1}=\text{Adjust\_Distribution}(D_t,\epsilon_t)$

### **AdaBoost**

- 加性模型(additive model): $H(x)=\sum_{t=1}^T\alpha_th_t(x)$
- exponential loss funciton: $l_{exp}(H|D)=E_{x\sim D}(e^{-f(x)H(x)})$
  - 指数损失函数最小化，分类错误率也将最小化（与 0/1 损失函数一致）
- 分类器权重更新公式: $\alpha_t=\frac{1}{2}\ln\frac{1-\epsilon_t}{\epsilon_t}$
- 调整样本分布: $D_{t+1}(x)=\frac{D_t(x)e^{-\alpha_tf(x)h_t(x)}}{Z_t}$

## 并行化方法

### Bagging

- 采样 $T$ 次，训练 $T$ 个学习器，分类简单投票，回归简单平均
- out-of-bag estimate: $H^{oob}(x)$ 为未使用 $x$ 训练的基学习器在 $x$ 上的预测
  - $H^{oob}(x)=\arg_{y\in Y}\max\sum_{t=1}^T[h_t(x)=y][x\not\in D_t]$
  - $\epsilon^{oob}=\frac{1}{|D|}\sum_{(x,y)\in D}[H^{oob}(x)\not=y]$

### 随机森林

- Bagging + 在随机选择的 $k$ 个属性中选择最优属性
  - 推荐值 $k=\log_2d$

## 结合策略

### 平均法

- 简单平均法: $H(x)=\frac{1}{T}\sum_{i=1}^Th_i(x)$
- 加权平均法: $H(x)=\frac{1}{T}\sum_{i=1}^Tw_ih_i(x)$

### 投票法

- 绝对多数投票法
  - 可能拒绝预测
- 相对多数投票法
- 加权投票法
- $h(x)$ 输出不同
  - hard voting: 类标记投票
  - soft voting: 类概率投票
  - 基学习器类型不同，其概率值不能直接进行比较

### 学习法

- Stacking
  - 初级学习器（个体学习器）
  - 次级学习器（元学习器）
- BMA(贝叶斯模型平均)

## 多样性

### 误差-分歧分解

- $E=\overline{E}-\overline{A}$
  - $h_i$ 的分歧：$A(h_i|x)=(h_i(x)-H(x))^2$
  - 集成的分歧：$\overline{A}(h|x)=\sum_{i=1}^T\omega_iA(h_i|x))$
  - $E(h_i|x)=(f(x)-h_i(x))^2$
  - $\overline{E}(h|x)=\sum_{i=1}^T\omega_iE(h_i|x)$

### 多样性度量

- 预测结果列联表(contingency table), $m=a+b+c+d$

|          | $h_i=+1$ | $h_i=-1$ |
| -------- | -------- | -------- |
| $h_j=+1$ | a        | c        |
| $h_j=-1$ | b        | d        |

| 指标                           |                                                       |
| ------------------------------ | ----------------------------------------------------- |
| 不合度量(disagreement measure) | $\text{dis}_{ij}=\frac{b+c}{m}$                       |
| 相关系数                       | $\rho_{ij}=\frac{ad-bc}{\sqrt{(a+b)(a+c)(c+d)(b+d)}}$ |
| $Q$-statistic                    | $Q_{ij}=\frac{ad-bc}{ad+bc}$                          |
| $\kappa$-statistic             | $\kappa=\frac{p_1-p_2}{1-p_2}$                        |
| $\kappa$ 图                    | $\kappa$-平均误差图                                   |

- 取得一致的概率：$p_1=\frac{a+d}{m}$
- 偶然取得一致的概率：$p_2=\frac{(a+b)(a+c)+(c+d)(b+d)}{m^2}$

### 多样性增强

- 数据样本扰动
  - Bootstrap
  - 对不稳定基学习器（决策树，神经网络）有效
- 输入属性扰动
  - random subspace 算法
- 输出表示扰动
  - Flipping Output
  - Output Smearing
  - ECOC
- 算法参数扰动
  - 负相关法
  - 不同增强机制同时使用
