---
title: Decision Tree
date: 2019-04-14
weight: 3
---

## **决策树算法**

- 当前节点包含样本全部同类：标记为该类
- 当前样本属性值为空/取值相同：标记为最多一类
- 属性划分选择
- 为属性每个值分配一个结点继续执行算法
  - 若某属性值上为空则标记为当前最多一类

## 划分选择

| 指标名称         | 指标                                                                                                | 辅助函数                                                                                                  | 例子 | Remark                                                             |
| ---------------- | --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | ---- | ------------------------------------------------------------------ |
| Information Gain | $\text{Gain}(D,a)=\text{Ent}(D)-\sum_{v=1}^{V}\frac{\vert D^v\vert }{\vert D\vert }\text{Ent}(D^v)$ | $\text{Ent}(D)=-\sum_{k=1}^{ \vert Y \vert }p_k\log_2p_k$                                                 | ID3  | 对可取值数目较多的属性有偏好                                       |
| Gain ratio       | $\text{Gain-ratio}(D,a)=\frac{\text{Gain}(D,a)}{\text{IV}(a)}$                                      | $\text{IV}(a)=-\sum_{v=1}^{V}\frac{\vert D^v\vert}{\vert D\vert}log_2\frac{\vert D^v\vert}{\vert D\vert}$ | C4.5 | 从候选划分中找出信息增益高于平均水平的属性，再从中选择增益率最高的 |
| Gini ratio       | $\text{Gini-index}(D,a)=\sum_{v=1}^V\frac{\vert D^v\vert}{\vert D\vert}\text{Gini}(D^v)$            | $\text{Gini}(D)=1-\sum_{k=1}^{\vert Y\vert}p_k^2$                                                         | CART | Gini 指数为随机抽取两个样本类别标记不一致的概率,越小纯度越高       |

## 剪枝处理

| 方法   | 指标      | 过拟合         | 欠拟合       | 训练时间 |
| ------ | --------- | -------------- | ------------ | -------- |
| 预剪枝 | Precision | 降低过拟合风险 | 有欠拟合风险 | 较小     |
| 后剪枝 | Precision | 降低过拟合风险 | 欠拟合风险小 | 较长     |

## 连续与缺失值

- 连续属性离散化（二分法）
  - $T_a=\{\frac{a^i+a^{i+1}}{2}|1\leq i\leq n-1\}$
  - $\text{Gain}(D,a,t)$
- 缺失值
  - $\tilde{D}$: $D$在属性 $a$ 上没有缺失值的样本子集
  - $\tilde{D}^v$: $\tilde{D}$ 中属性 $a$ 上取值为 $a^v$ 的样本子集
  - $\tilde{D}_k$: $\tilde{D}$ 中类别为 $k$ 的样本子集
  - $\omega_x$: 每个样本的权重
  - $\rho=\frac{\sum_{x\in\tilde{D}}\omega_x}{\sum_{x\in D}\omega_x}$ 属性 $a$ 无缺失样本所占比例
  - $\tilde{p}_k=\frac{\sum_{x\in\tilde{D}_k}\omega_x}{\sum_{x\in D}\omega_x}$ 无缺失样本中第 $k$ 类占比
  - $\tilde{r}_v=\frac{\sum_{x\in\tilde{D}^v}\omega_x}{\sum_{x\in D}\omega_x}$ 无缺失样本中属性 a 取值 $a^v$ 占比
  - $\text{Ent}(\tilde{D})=-\sum_{k=1}^{|Y|}\tilde{p}_k\log_2\tilde{p}_k$
  - $\text{Gain}(D,a)=\rho*\text{Gain}(\tilde{D},a)=\rho*(\text{Ent}(\tilde{D})-\sum_{v=1}^V\tilde{r}_v\text{Ent}(\tilde{D}^v))$

## 多变量决策树

- 每个叶节点用 $\sum_{i=1}^dw_ia_i=t$ 的线性分类器
- 特征预处理
