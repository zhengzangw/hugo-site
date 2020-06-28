---
title: Introduction
date: 2019-04-14
weight: 1
---

## 机器学习

- 机器学习要素
  - 模型
  - 学习准则
  - 优化算法
- 数据集：$D=\{x_1,x_2,\cdots,x_m\}$
  - 通常假设全体样本服从一个未知分布 $\mathcal{D}$，且采样 i.i.d
- 归纳偏好
  - No Free Lunch Theorem
  - Occam's Razor
  - Ugly Duckling Theorem
- all vectors are assumed to be column vectors
- $N$ number of input, $p$ number of features
- 训练集 $\bf{X}_{N\times p}$
  - $i$-th row $x_i^T$: length $p$
  - $j$-th column $\bf{x}_j$: length $N$
  - input vector: $X_{p\times 1}$
  - $X^T=(X_1,X_2,\cdots,X_p)$, $X_i$ is a scalar
- $\bf{y}_{N\times 1}$
  - $Y\in\mathbb{R}$
  - $\bf{Y}_{N\times l}$, each row has one 1
- $(X_1,X_2 )$ : 行并列
- $(X_1^T;X_2^T)$ : 列并列
- 偏差-方差分解：$E(f;D)=\text{bias}^2(x)+\text{var}(x)+\epsilon^2=(\overline{f}(x)-y)^2+E_D((f(x;D)-\overline{f}(x))^2)+E_D((y_D-y)^2)$

## 评估方法

- 留出法
- cross validation
  - 将数据集分层采样划分为 $k$ 个大小相似的互斥子集，每次用 $k-1$ 个子集的并集作为训练集，余下的子集作为测试集，最终返回 $k$ 个测试结果的均值
  - $k$ 最常用的取值是 10.
  - LOO: $k=1$
- bootstrapping: 样本不被选到的概率$=\lim_{m\rightarrow\infty}(1-\frac{1}{m})^m=\frac{1}{e}=0.368$

## 模型评估指标

- $\text{T},\text{F}$: 分类正确与否
- $\text{P},\text{N}$: 预测结果

### Regression

- 均方误差: $E(f;D)=\frac{1}{m}\sum_{i=1}^m(f(x_i)-y_i)^2$

### Classification

| 指标             |                                                                                                       |
| ---------------- | ----------------------------------------------------------------------------------------------------- |
| accuracy         | $\frac{\text{TP}+\text{TN}}{m}$                                                                       |
| precision        | $\frac{\text{TP}}{\text{TP}+\text{FP}}$                                                               |
| recall           | $\frac{\text{TP}}{\text{TP}+\text{FN}}$                                                               |
| macro-$\text{P}$ | $\frac{1}{n}\sum_{i=1}^n\text{P}_i$                                                                   |
| macro-$\text{R}$ | $\frac{1}{n}\sum_{i=1}^n\text{R}_i$                                                                   |
| micro-$\text{P}$ | $\frac{\overline{\text{TP}}}{\overline{\text{TP}}+\overline{\text{FP}}}$                              |
| micro-$\text{R}$ | $\frac{\overline{\text{TP}}}{\overline{\text{TP}}+\overline{\text{FN}}}$                              |
| 平衡点(BEP)      | P-R 曲线上 $P=R$ 的点                                                                                 |
| $\text{F1}$      | $\frac{2\text{P}\text{R}}{\text{P}+\text{R}}$,调和平均更重视较小值                                    |
| $\text{F}_\beta$ | $\frac{1}{\text{F}_\beta}=\frac{1}{1+\beta^2}(\frac{1}{P}+\frac{\beta^2}{R})$,$\beta>1,R$ counts more |
| $\text{TPR}$     | $\text{R}$                                                                                            |
| $\text{FPR}$     | $\frac{\text{FP}}{\text{TN}+\text{FP}}$                                                               |
| ROC              | TPR-FPR 图(Receiver Operating Characteristic)                                                         |
| AUC              | (Area Under Curve)$\frac{1}{2}\sum_{i=1}^{m-1}(x_{i+1}-x_i)(y_i+y_{i+1})$                             |
| $\text{FPR}$     | $1-\text{TPR}$                                                                                        |
| cost curve       | 横轴为正例概率代价，纵轴归一化代价                                                                    |
| Ranking Loss     | $\mathcal{l}=1-\text{AUC}$                                                                            |

### Ranking

- One query $r\rightarrow$ One permutation $\pi$
- One query $r\rightarrow$ retrieved documents $R(r)$
- precision: $\text{precision}=P=\frac{|C(r)\cap R(r)|}{|R(r)|}$
  - $\text{precision}@k$
    - $|R(r)|=k$
    - $\frac{\sum_{t\leq k}l(\pi(t))}{k}$
- recall: $\text{recall}=\frac{|C(r)\cap R(r)|}{|R(r)|}$
  - $\text{recall}@k, |R(r)|=k$
- AP(AveP, Average precision): $\text{AP}=\frac{\sum_{k=1}^{|C(r)|}P@k}{|R(r)|}$
- mAP(Mean average precision): $\text{MAP}=\frac{\sum_{q=1}^Q\text{AP}(q)}{Q}$
- CG(Cumulative Gain): $\text{CG}@k=\sum_{i=1}^k \text{rel}(i)$
- DCG(Discounted cumulative gain): $\text{DCG}@k=\sum_{i=1}^k\text{rel}(i)\eta(i)$
  - 折扣因子 $\eta(i)$: $\frac{1}{\log(i+1)}$
- IDCG(Ideal DCG): $\text{IDCG}@k=\max_{\pi}\text{DCG}@k(\pi)$
- nDCG(Normalized DCG): $\text{IDCG}@k=\frac{\text{DCG}_p}{\text{IDCG}_p}$
- RR(reciprocal rank): $\text{rank}_i$ 第一个正确答案的排名
- MRR(Mean reciprocal rank): $\text{MRR}=\frac{1}{|Q|}\sum_{i=1}^{|Q|}\frac{1}{\text{rank}_i}$
- Cascade Models: 用户在位置 $k$ 需求满足的概率 $\text{PP}(k)=\prod_{i=1}^{k-1}(1-R(i))R(k)$
  - 该文档满足需求的概率：$R(t)=\frac{2^{\text{rel(t)}}-1}{2^{l_{\max}}}$
- ERR(Expected reciprocal rank): 用户需求满足时停止位置的倒数的期望 $\text{ERR}=\sum_{r=1}^n\frac{1}{r}\text{PP}_r$

## 多分类

- OvO: 储存开销与测试时间偏大
- OvR: 训练时间偏大
- MvM:
  - Error Correcting Output Codes(ECOC)
    - 编码：二元码，三元码
    - 解码：将距离最小的编码所对应的类别作为预测结果
- argmax: $y=\argmax_{c=1}^Cf_c(x;\omega_c)$

## 类别不平衡

- 欠采样
- 过采样
- 阈值移动：$\frac{y}{1-y}>\frac{m^+}{m^-}$

## 假设检验

- 二项检验
  - 二项分布：$P(\hat \epsilon;\epsilon)=\binom{m}{\hat\epsilon m}\epsilon^{\hat \epsilon m}(1-\epsilon)^{m-\hat \epsilon m}$
  - 假设：$\epsilon\leq\epsilon_0$
  - 临界值 $\overline{\epsilon}=\max\epsilon$ s.t. $\sum_{i=\epsilon_0 m+1}^m\binom{m}{i}\epsilon^i(1-\epsilon)^{m-i}$
- t 检验
  - 检验值：$\tau_t=\frac{\sqrt{k}(\mu-\epsilon_0)}{\sigma}$
- 交叉验证 $t$ 检验
  - 差值：$\Delta_i=\epsilon_i^A-\epsilon_i^B$
  - $\tau_t=|\frac{\sqrt{k}\mu}{\sigma}|$
  - 假设检验前提：测试错误率为泛化错误率独立采样
    - $5\times 2$ 交叉验证
- McNemar 检验
  - $e_{ij}$: $i$ 指示算法 $A$ 预测正确与否，$j$ 指示算法 $B$ 预测正确与否
  - 假设：$e_{01}=e_{10}$
  - $|e_{01}-e_{10}|\sim N(1,e_{01}+e_{10})$
  - 统计检验量：$\tau=\frac{(|e_{01}-e_{10}|-1)^2}{e_{01}+e_{10}}\sim \chi^2(1)$
- Friedman 检验：多个数据集对多个算法比较
  - 根据测试性能赋予序值，求得平均序值
  - 假设：算法性能全部相同
  - $\tau_\chi^2=\frac{12N}{k(k+1)}(\sum_{i=1}^kr_i^2-\frac{k(k+1)^2}{4})$，当 $k,N$ 较大时，服从 $\chi^2(k-1)$
  - $\tau_F=\frac{(N-1)\tau_{\chi^2}}{N(k-1)-\tau_{\chi^2}}\sim F(k-1,(k-1)(N-1))$
- Nemenyi 检验：算法性能全部相同假设被拒绝后进一步区分各算法
  - $\text{CD}=q_\alpha\sqrt{\frac{k(k+1)}{6N}},q_\alpha$ 为 Tukey 分布临界值
  - 若两个算法平均序值之差超出临界值域 $\text{CD}$，则以相应置信度拒绝两个算法性能相同
