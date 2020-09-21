---
title: CNN backbones
date: 2020-07-05
---

## CNN backbones

[结构介绍](https://my.oschina.net/u/876354/blog/1637819)

- LeNet5(1998)
- AlexNet8(2012)
- VGG(2014)
  - VGG16
  - VGG19
- GoogLeNet22(2014)
  - Inception v1-v4
- ResNet(2015)
  - ResNet50
  - ResNet101
- DRN-26

## Semantic Segmentation

- $p_{ij}$: 被预测为 $j$ 类样本的 $i$ 类样本
- Pixel Accuarcy: $\text{PA}=\frac{\sum_{i=0}^kp_{ii}}{\sum_{i=0}^k\sum_{j=0}^kp_{ij}}$
- Mean Pixel Accuracy: $\text{MPA}=\frac{1}{k}\sum_{i=0}^k\frac{p_{ii}}{\sum_{j=0}^kp_{ij}}$
- Mean Intersection over Union: $\text{MIoU}=\frac{1}{k}\sum_{i=0}^k\frac{p_{ii}}{\sum_{j=0}^kp_{ij}+\sum_{j=0}^kp_{ji}-p_{ii}}$
- Frequency Weighted Intersection over Union: $\text{FWIoU}=\frac{1}{\sum_{i=0}^k\sum_{j=0}^kp_{ij}}\sum_{i=0}\frac{p_{ii}\sum_{j=0}^kp_{ij}}{\sum_{j=0}^kp_{ij}+\sum_{j=0}^kp_{ji}-p_{ii}}$

架构

- FCN-8s
- DeepLab V2
