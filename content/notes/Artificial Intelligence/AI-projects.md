---
title: AI projects
date: 2019-10-15
tags: [ai]
---

NJU: 人工智能 项目介绍

# 对抗样本

2013

* 人类大脑是非常有限的，我们没有那么多脑容量去研究所有东西的可解释性 -- LeCun
* 机器学习可解释性的问题
  * 定义不明
  * 标准不确定
  * 效果不清楚
* 共识：对抗样本不是过拟合的结果，而是没有被发现的特征（欠拟合）
* 攻击方法
  * 基于梯度
  * 限制参数变化
  * One Pixel Attack
  * 利用一个图像类别的特征
  * 基于人的感官（声屏蔽，Masking）
* 防御方法（效果都不好）
  * 对抗训练
  * 输入数据预处理
  * 改动模型

<!--more-->

# 风格迁移

* 神经风格迁移
  * 优化
    * 2016 Neural Style
  * 统计
    * 2016 AdaIN/WCT
      * 二阶统计信息
  * 匹配
    * 2016 Style Swap
      * 对内容图的每个小块，在风格图上寻找与之结构最相近的区域，替换到内容图上
  * 统计匹配结合
    * 2019 AvatarNet
      * 不同区域的迁移程度不同
      * Attention
  * 2019 WarpGAN

# Domain Adaptation

* Source Domain (Labeled)
* Target Domain (Unlabeled)
* Align the data distributions of source and target domains
* Multi-source domain adaptation
* [Large domain discrepancy](http://ai.bu.edu/visda-2019)

# 关系数据挖掘（政务数据异常检测）

* 五大任务
  * 异常检测
  * 关联规则学习
  * 聚类
  * 分类
  * 回归

# 材料与化学信息学中的深度学习应用系统