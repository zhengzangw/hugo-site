---
title: History
date: 2019-04-14
tags: [ml, math, notes]
weight: 0.1
---

## 技术浪潮

|            | 神经网络 | 支持向量机           | 神经网络 |
| ---------- | -------- | -------------------- | -------- |
| 年份       | 89-94    | 95-05                | 06-      |
| 代表性技术 | BP 算法  | 核方法，统计学习理论 | 深度学习 |

## 生成式与判别式

|                | 判别式(discriminative)                    | 生成式(generative)                         |
| -------------- | ----------------------------------------- | ------------------------------------------ |
|                | 对 $P(c\vert x)$ 建模                     | 对 $P(c \vert x)=\frac{P(x,c)}{P(x)}$ 建模 |
| 实例           | 决策树，BP 神经网络，SVM                  | 贝叶斯分类器                               |
| 实际环境中问题 | i.i.d. 改变，concept driven，后验概率不变 |                                            |
|                | 没有做“多余”工作                          | 做了“多余”工作                             |

## 神经网络发展史

- 第一阶段
  - 1943 年, McCulloch 和 Pitts 提出第一个神经元数学模型, 即 M-P 模型, 并从原理上证明了**人工神经网络能够计算任何算数和逻辑函数**
  - 1949 年, Hebb 发表《The Organization of Behavior》一书, 提出生物神经元学习的机理, 即 **Hebb 学习规则**
  - 1958 年, Rosenblatt 提出**感知机网络**(Perceptron)模型和其学习规则
  - 1960 年, Widrow 和 Hoff 提出**自适应线性神经元**(Adaline)模型和最小均方学习算法
  - 1969 年, Minsky 和 Papert 发表《Perceptrons》一书, 指出单层神经网路不能解决非线性问题, 多层网络的训练算法尚无希望. 这个论断导致神经网络进入**低谷**
- 第二阶段
  - 1982 年, 物理学家 Hopfield 提出了一种具有联想记忆、优化计算能力的递归网络模型, 即 **Hopfield 网络**
  - 1986 年, Rumelhart 等编辑的著作《Parallel Distributed Proceesing: Explorations in the Microstructures of Cognition》报告了**反向传播算法**
  - 1987 年, IEEE 在美国加州圣地亚哥召开第一届神经网络国际会议(ICNN)
  - 90 年代初, 伴随统计学习理论和 SVM 的兴起, 神经网络由于理论不够清楚, 试错性强, 难以训练, 再次进入**低谷**
- 第三阶段
  - 2006 年, Hinton 提出了**深度信念网络**(DBN), 通过“预训练+微调”使得深度模型的最优化变得相对容易
  - 2012 年, Hinton 组参加 ImageNet 竞赛, 使用 **CNN 模型**以超过第二名 10 个百分点的成绩夺得当年竞赛的冠军
  - 伴随云计算、大数据时代的到来，计算能力的大幅提升，使得深度学习模型在计算机视觉、自然语言处理、语音识别等众多领域都取得了较大的成功 |

## [完整机器学习项目流程](https://www.jianshu.com/p/ecb89148ed64)

1. 理解问题
   - 理解实际业务场景
   - 可以获得什么数据
   - 目标为分类、回归还是聚类
   - 转换为能处理的数学/机器学习模型
2. 获取数据
   - 获取原始数据
   - 通过特征工程提取数据
   - 数据偏斜不能过于严重，不同类别的数据数量不要有数个数量级的差距。
   - 评估数据（样本数量、特征数量）的量级，估算出其对内存的消耗程度
   - 数据决定机器学习结果的上限，而算法只是尽可能的逼近这个上限
3. 特征工程
   - 特征构建
   - 特征提取
   - 特征选择
   - 数据预处理、数据清洗
     - 归一化、离散化、因子化、缺失值处理、去除共线性
   - 筛选出显著特征、摒弃非显著特征
     - 相关系数、卡方检验、平均互信息、条件熵、后验概率、逻辑回归权重
4. 选择模型与调参
   - 选择模型
   - 调整参数
   - 过拟合、欠拟合的模型状态判断
     - 过拟合的基本调优思路是增加训练的数据量，降低模型复杂度。欠拟合的基本调优思路是提高特征数量和质量，增加模型复杂度
5. 模型检验与误差分析
6. 模型融合
   - 模型的前端（特征工程、清洗、预处理、采样）和后端的模型融合
   - 统一融合，线性融合和堆融合
7. 上线运行
   - 工程上是结果导向，模型在线上运行的效果直接决定模型的成败

## 机器学习任务

### Methodology

- Representation Learning
  - Word Embeddings
  - Entity Embedding
- Transfer Learning
  - Self-taught Learning (target labeled, source unlabeled)
  - Multi-task Learning (target labeled, source labeled)
  - Domain Adaptation (target unlabeled, source labeled)
  - Unsupervised Transfer Learning (target unlabeled, source unlabeled)
- Meta-Learning
- AutoML
  - Neural Architecture Search
- Few-Shot Learning
  - Zero-Shot Learning
  - One-Shot Learning
- Anomaly Detection
  - Outlier Detection
- Data Augmentation
- Bayesian Inference
- Quantization
- Dimensinality Reduction
- Density Estimation
- Metric Learning
- Active Learning
- Optimization
  - Stochastic Optimization
  - Combinatorial Optimization
  - Bayesian Optimization
- Feature Engineering
  - Feature Selection
  - Feature Importance
- Model Selection
- Model Compression
  - Network Pruning
- Structured Prediction
- Latent Variable Models
- Continual Learning
- interdisciplinary
  - EEG(Electorencephalography)
  - Computed Tomography
  - Electorcardiography
- Multi-Label Classification
- Matrix Completion
- Dictionary Leanring
- Interpretable Machine Learning
- Multiple Instance Learning
- Quantum Machine Learning
- Multi-Label Learning
- Reinforce Learning
  - Gaussian Process
  - Point Process
  - Decision Makeing Under Uncertainty
  - Q-Learning
  - Imitation Learning
  - Multi-agent Reinforcement Learning
  - Policy Gradient Methods
  - Efficient Exploration
  - Hierarchical Reinforcement Learning

### Domain

- CV
  - Classification
  - Detection
  - Segmentation
  - Generation
  - Anomaly Detection
  - Retrieval
  - Pose Estimation
  - Super-Resolution
  - Denoising
  - Autonomous Vehicles
  - Video
  - Facial Recognition and Modelling
  - Depth Estimation
  - Action Localization
  - Quantization
  - Optical Flow Estimation
  - 3D
  - Scene Parsing
  - Style Transfer
  - Image Captioning
  - Person Re-Identification
- NLP
  - Machine Translation
  - Language Modelling
  - Question Answering
  - Sentiment Analysis
  - Text Classification
- Speech
  - Speech Recognition
  - Speech Synthesis
  - Speech Enhancement
  - Speaker Verification
  - Speech Separation
- Music
- Audio
- Computer Code
  - Dimensionality Reduction
  - Activity Recognition
  - Feature Selection
  - Program Synthesis
  - Code Generation
  - Text-To-Sql
  - Code Summarization
- Playing Games
  - Atari Games
  - Continuous Control
  - Starcraft
  - Real-Time Strtegy Games
- Medical
  - Medical Image Segmentation
    - Lesion
    - Tumor
    - Brain
  - Drug Discovery

### Others

- Graphs
  - Link Prediction
  - Node Classification
  - Graph Embedding
  - Graph Classification
  - Community Detection
- Time Series
  - Classifcation
  - Forecasting
  - Imputation
  - Gesture Recognition
- Miscellaneous
  - Recommendation Systems
  - Topic Models
  - Continual Learning
  - Causal Inference
  - Multi-Armed Bandits
- Adversarial
- Reasoning
- Knowledge Base
- Robots
