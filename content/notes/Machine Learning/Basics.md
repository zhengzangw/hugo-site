---
title: Performance Metric
date: 2019-04-14
tags: [ml, math, notes]
weight: 1
---


## 基本概念

* 假设空间
    * 版本空间：与训练集一致的假设空间
* 归纳偏好
    * 奥卡姆剃刀

## 评估方法

| 评估方法         | 特点                                                                                                                                                              |
| ---------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 留出法           |                                                                                                                                                                   |
| cross validation | 将数据集分层采样划分为 $k$ 个大小相似的互斥子集，每次用 $k-1$ 个子集的并集作为训练集，余下的子集作为测试集，最终返回 $k$ 个测试结果的均值，$k$ 最常用的取值是 10. |
| *LOO*            | $k=m$                                                                                                                                                             |
| bootstrapping    | 样本不被选到的概率：$\lim_{m\rightarrow\infty}(1-\frac{1}{m})^m=\frac{1}{e}=0.368$                                                                                |

## 回归

* 均方误差：$E(f;D)=\frac{1}{m}\sum_{i=1}^m(f(x_i)-y_i)^2$

## 分类

| 指标                  |                                                                                                       |
| --------------------- | ----------------------------------------------------------------------------------------------------- |
| $\text{acc}$          | $\frac{\text{TP}+\text{TN}}{m}$                                                                       |
| $\text{P}$            | $\frac{\text{TP}}{\text{TP}+\text{FP}}$                                                               |
| $\text{R}$            | $\frac{\text{TP}}{\text{TP}+\text{FN}}$                                                               |
| macro-$\text{P}$      | $\frac{1}{n}\sum_{i=1}^n\text{P}_i$                                                                   |
| macro-$\text{R}$      | $\frac{1}{n}\sum_{i=1}^n\text{R}_i$                                                                   |
| micro-$\text{P}$      | $\frac{\overline{\text{TP}}}{\overline{\text{TP}}+\overline{\text{FP}}}$                              |
| micro-$\text{R}$      | $\frac{\overline{\text{TP}}}{\overline{\text{TP}}+\overline{\text{FN}}}$                              |
| 平衡点(BEP)           | P-R 曲线上 $P=R$ 的点                                                                                 |
| $\text{F1}$           | $\frac{2\text{P}\text{R}}{\text{P}+\text{R}}$,调和平均更重视较小值                                    |
| $\text{F}_\beta$      | $\frac{1}{\text{F}_\beta}=\frac{1}{1+\beta^2}(\frac{1}{P}+\frac{\beta^2}{R})$,$\beta>1,R$ counts more |
| $\text{TPR}$          | $\text{R}$                                                                                            |
| $\text{FPR}$          | $\frac{\text{FP}}{\text{TN}+\text{FP}}$                                                               |
| ROC                   | TPR-FPR 图(Receiver Operating Characteristic)                                                         |
| AUC                   | (Area Under Curve)$\frac{1}{2}\sum_{i=1}^{m-1}(x_{i+1}-x_i)(y_i+y_{i+1})$                             |
| 排序损失$\mathcal{l}$ | $1-\text{AUC}$                                                                                        |

* $\text{T},\text{F}$: 分类正确与否
* $\text{P},\text{N}$：预测结果

## 多分类

| 方法 |                                     |
| ---- | ----------------------------------- |
| OvO  | 储存开销与测试时间偏大              |
| OvR  | 训练时间偏大                        |
| MvM  | Error Correcting Output Codes(ECOC) |

### ECOC

* 编码：二元码，三元码
* 解码：将距离最小的编码所对应的类别作为预测结果

## 类别不平衡

| 再放缩方法 |                                 |
| ---------- | ------------------------------- |
| 欠采样     |                                 |
| 过采样     |                                 |
| 阈值移动   | $\frac{y}{1-y}>\frac{m^+}{m^-}$ |

## 偏差-方差分解

* $E(f;D)=\text{bias}^2(x)+\text{var}(x)+\epsilon^2=(\overline{f}(x)-y)^2+E_D((f(x;D)-\overline{f}(x))^2)+E_D((y_D-y)^2)$
