---
title: Google ML Camp 总结 
date: 2019-01-20
tags: [project, ml]
---

# 项目

三天内和两个队友合作完成了一个项目，基本是零基础，最后还能有展示的Demo，感觉很棒。总结这次项目(NLP)的开发流程如下

## 开发流程

* 选题+创意构想（头脑风暴）
* 数据集分析+数据可视化
* 数据清理
* 模型构建（先有个baseline，后面可以大家一起构想；baseline应该先满足end2end）
* Tuning （这个可以一直进行，但是要保证其它部分有充足时间）
* Demo （手机App>=网页>电脑App）
* Poster + PPT
* Presentation

<!--more-->

## 时间顺序

* Prepare
  * 选题+创意构想
  * 创建Github仓库
  * 创建Google文档
  * 数据集分析+数据可视化
* Preprocessing
  * 数据清理
  * Baseline模型
  * 完成end2end
* Model
  * Model设计
  * Demo设计
* Tuning
  * Model优化
  * Demo上线
* Presentation
  * Poster制作
  * PPT制作
  * Presentation准备

# 讲座笔记

## Day 1

### Innovation

#### Demo

* 每个词做classification->颜色
* 生成
* PCA降低维度-分析四个维度的合理性/新标准
* 社交网站分析
* Demo-你说我猜

#### Model

* Classification
* 颜文字

#### Conclusion

* How to use gcp
* Design the project
* pandas data cleaning
* tensorflow keras API
* cnn and rnn model for end2end

## Day 2

### machine learning review

* Size
  * training set should be 10 size of trainable parameter
* Practical advice
  * look into outliers and understand why
  * inspect raw examples instead of aggregation
  * checking slices of data
  * be careful about any filtering
  * don't re-use hashing function
* What else can we do
  * Shuffle data
  * Normalize data, maybe
  * Sample your data i.i.d.
* Overfitting/underfitting: model capacity v.s. data set size
* model validation
* popular metrics
  * accuracy
  * Logarithmic loss
  * precision & recall
  * TPR & FPR
  * P-R/ROC AUC
  * F1
* avoiding overfitting
  * drop-out
    * Adam optimizer doesn't work
  * early stopping
  * regularization
  * moer training data or smaller model
* gradient clipping
* smart initialization

### AutoML

* bottelneck
  * data? --NO
  * computation? --NO
    * AI computations doubled every 3.5 months
  * ML expertisee
    * -> AutoML

### Semantic Scene and Object Segmentation

* automatically interpret the contents of an image or video
  * annotations for the entire image
  * annotations from a predefined set of class labels
    * Boundary
    * Object
    * Relations
* to describe many aspects of the scene

#### Semantic scene segmentation

* Image->(bottom up) Interpretation <-(top down) prior knowledge
* Deep ConvNets (Deep network for image classification)
* Label representation
* Upsampling

#### Semantic instance segmentation

## Day 4

### Pose Estimation, 3D Vision, and Deep RNN

* materials: [ppt](http://mvig.sjtu.edu.cn/research/PRCV2019.html)
* PR->AI
  * 2012 recognition
  * 2014 position detection
  * 2015 sliping
  * 2017 parsing

#### 3D Vision

* Essay: Segmentation on Point Clouds
  * 3D CNN? Huge computation work
  * Point Net
    * Order Invariance (max/mean)
    * (x,y,z)->TNET->feature for single->merge
  * Point Net++
  * SIFT算子
* Problem: Rotation
  * Spherical Convolution

#### Mult-Person Pose Estimation

* Bottom-Up: First detect all the joints then associate them according to some edge cost functions
* Top-Down: First detect each human then do singlke person pose estimation
* AlphaPose
* CrowdPos
* PoseFlow

### NLP Processing

* NLP complete
  * 对话系统
  * 机器翻译
  * 阅读理解
  * 智能金融
    * kensho
  * 智能医疗
  * 智能司法

#### 中文分词和词性标注

* 基于匹配的方法
  * 正向最大匹配法
  * 逆向最大匹配法
  * 最少切分法
* 分词问题
  * 分词歧义
    * 交集型
    * 组合型
  * 分词标准
  * 未登录词的识别问题
* Viterbi Alogrithm
* 机器之心

### Interpretable

* Safety, Trust, Policy and Regulation
* 实际中，测试集与训练集差别大
* What I can't explain simply, I don't understand

#### Dataset Analysis

* Visualization
  * facets
* Example: 检测坦克（晴天、阴天），鲸鱼（水花），相关性的无关信息

#### Model Building

* Interpretability
  * Decision Trees
  * Linear Models
  * Case/Prototype Based
  * Sparsity

#### Model Analysis

* 深度神经网络学到了什么？
  * 基本原理：模板匹配。分层的基于余弦相似度的碎片化的模板匹配
  * 逐点模板匹配无法保证放缩和旋转的不变形，深度神经网络也不能
* Feature Visualization by Optimization
  * Regularization - Frequency Penalization/Tranmsformation Robustness/Lnearned Prior+Transformation Robustness
  * [github](http://colah.github.io/)
* Attrition/Saliency Maps
* Gradient Backpropagation
  * DeConvNet
  * Gradient
  * Guided backprop
* Class Activation Maps(CAM)
* Distill network to tree
* TFMA: Tensorflow Model Analysis

### Interactive Machine Learning

* Know the boundary of a model
* Google
  * Voice assistant
  * Translation
  * Smart reply
  * recommendation
* Insufficient Interaction Design
  * Anki
  * Lynnette
* Insufficient Model
  * DragonBox 12+
* Cost and Scalability of Undersatanding Users
  * Computer's view of users
  * Dedicated intelligent hardware
* effective mobile interfaces
  * sensing techniques
  * learning algorithms
  * interaction design
* Example
  * CourseMIRROR
    * Sample Reflection Question
    * Two Objective Phrase Summarization
  * AttentiveLearner
  * ToneWars

### Speech Technology