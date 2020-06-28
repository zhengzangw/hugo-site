---
title: Deep Learning
date: 2018-09-02
tags: [ml, notes]
---

> *Deep Learning*
> [李宏毅课程](https://www.bilibili.com/video/av9770302/?p=5)
> [李宏毅的主页](http://speech.ee.ntu.edu.tw/~tlkagk/courses_MLDS17.html)

## 第六章

Input -> FL -> FL -> FL -> Softmax ->

### 输出单元

* 高斯输出分布线性单元
* Bernoulli输出分布sigmoid单元
* Multinoulli输出分布softmax单元

<!--more-->

### 隐藏单元

* 线性整流单元
* logistic & tanh
* maxout
* RBF

## 第七章：正则化

* 岭回归
* L1正则化
* 约束的范数惩罚
* 提前终止
* 参数共享
* Dropout
* 滑动平均

## 第八章：优化

* 批量与小批量算法
* 一阶
  * 动量
  * Nesterov 动量
  * AdaGrad
  * RMSProp
  * Adam
* 二阶
  * 牛顿法
  * 共轭梯度
  * BFGS
* 批标准化

## 第九章：CNN

* CNN的三个关键优势：稀疏交互、参数共享、平移等变
* 池化
* 无限强的先验
* 有效卷积、同卷积、全卷积
* 非共享卷积
* Inception 系列
* LeNet-5

input -> Conv -> pool -> Conv -> pool -> FC -> FC -> Softmax ->

## 第十章：RNN

* Deep RNN

技术：Target Delay

* Bidirectional RNN

* Pyramid RNN
* Stack RNN
* 门控RNN
  * LSTM
  $$c^t = z^t * c^{t-1} + z^{i} * z$$
  $$h^t = z^0 * tanh(c^t)$$
  * GRU
  $$h^t = z * h^t + (1-z)*h'$$
* 一片论文用遗传算法得到的好结构

### 语言模型

* n gram
Matrix Factorization: $R = V^T*W$
* LIST的语言预测
word2vec -> LSTM(300*2) -> FC -> Softmax
word2vec和FC可以参数共享

## 第十一章：实践方法

### 设计流程

* 确定目标
* 尽快建立一个端到端的工作流程，包括估计合适的性能度量
* 确定性能瓶颈
* 增量式改动

### 超参数选择

* 手动选择
* 自动选择

隐层单元数量、学习率、卷积核宽度、隐式零填充、权重衰减系数、Dropout比率

# Spatial Transformer Layer

## 变换

缩放 [2, 0; 0, 2]  
旋转 [cos, -sin; sin, cos]  
Spatial Transformer Layer:  
$[x'\ y'] = [a\ b; c\ d][x\ y] + [e\ f]$

## 模型

INPUT - ST - CNN - ST - CNN - ST - CNN - OUTPUT
在TensorFlow图像处理节中，我们通过人工预处理。此处使用了NN代替了人工的处理

# HighWay Network & Grid RNN

将RNN竖起来当NN用，增加层数

## Highway Network

可看成由GRU改来。自动学习是否要使用某一层。

* $h' = \sigma(Wa^{t-1})$ forget gate
* $z = \sigma(W'a^{t-1})$ z:操控a update比率
* $a^t = z*a^{t-1} + (1-z)*h'$

## Residual Network

可train 150层

* $a^{t-1}$ -> layer -> layer -> h'
* $a^{t} = h' + a^{t-1}$

## Grid LSTM

两个维度，同时扩展深度和时间  
3D Grid LSTM

# Recursive Network

Recurrent Network 是其特例  
利用先验知识，比如语句结构分析，然后构建

## Recursive Neural Tensor Network

## Matrix-Vector Recursive Network

## Tree LSTM

# Conditional Generation

## Seq2Seq

    ----------------X   Y   Z   EOS
                    |   |   |   |
    f - f - f - f - f - f - f - f
    |   |   |   |   |   |   |   |
    A   B   C   D   SOS X   Y   Z

## Generation

Naive RNN: for sequence, image, etc.  
3D-LSTM: Better for image

## Conditional Generation

Condition as the first input  
Condition as all the input  
(Communication) Two layer RNN for input

## 常见神经网络

- RBF 网络（Radial Basis Function）
  - 径向基函数
    - 高斯径向基函数：$e^{-\frac{(x-c)^2}{r^2}}$
  - 三层神经网络
    - 隐层激活函数为径向基函数
- 竞争性网络
  - 稳定性/可塑性二难问题
- ART 网络（Adaptive Resonance Theory）
  - 内星：可以被训练来识别矢量
  - 外星：可以被训练来产生矢量
  - ART I 型网络
- SOM 网络（Self-Organizing Map）
- 级联相关网络
- Elman 网络
- Boltzmann 机
- 深度学习

- 网络模型
  - M-P 神经元模型： $y=f(\sum_{i=1}^m\omega_i-\theta)$
  - Perceptron： 两层神经网络
  - 多层前馈网络：全连接且无跨层连接
- **误差逆传播算法**(Back Propagation)
  - 前向计算
    - Layer1: $b_h=f(\beta_h-\gamma_h),\beta_h=\sum_{i=1}^dv_{ih}x_i$
    - Layer2: $\hat y_j=f(\alpha_j-\theta_j),\alpha_h=\sum_{i=1}^qw_{ih}b_i$
    - Loss: $E_k=\frac{1}{2}\sum_{j=1}^l(\hat y_j^k-y_j^k)^2$
  - 参数数⽬
    - 权重 $v_{ih},w_{hj}$
    - 阈值 $\theta_j,\gamma_h(i=1\cdots d,h=1\cdots q,j=1\cdots l)$
    - 共需要 $(d+l+1)q+1$ 个参数
  - 标准 BP 算法
    - 每次针对单个训练样例更新权值与阈值
    - 参数更新频繁，不同样例可能抵消，需要多次迭代
  - 累计 BP 算法
    - 其优化的⽬标是最⼩化 $E=\frac{1}{m}\sum_{k=1}^mE_k$
    - 读取整个训练集一遍才对参数进行更新
- 缓解过拟合
  - 早停
  - 正则化
- 跳出局部最小的策略
  - 多组不同的初始参数优化神经网络, 选取误差最小的解作为最终参数
  - 模拟退火技术
  - 随机梯度下降
  - 遗传算法


