---
title: Domain Adapation 相关
date: 23 March 2020
---

## Transfer Learning

$D_S=\{X_S,f_S\},T_S$  
$D_T=\{X_T,f_T\},T_T$

### Inductive Trasfer Learning

Target Labels are all available

- Multi-task Learning: Source Domain Labels are available
  - 同时学好 Source 和 Task
- Self-taught Learning: Source Domain Labels are unavailable
  - pre-trained model: 通过大型数据集学到的网络特征用于一个图片分类
  - Catastrophic Forgetting: 神经网络之前学习到的特征将灾难性遗忘
    - Progressive Neural Networks: 通过 Lateral Connection 的方式将一学习好的模型参数通过另一层网络教给一个新的任务，效率较低

### Transductive Transfer Learning

Target Labels are unavailable

- Domain Adaptation：学习 domain-invariant feature 使得学习到的特征不受限于 Source Domain 而导致 over-fitting，缩小 co-variant shift

### Unsupervised Transfer Learning

Source Labels are unavailable

## Adversial

- GAN: $\min_G\max_D V(D,G)=E_{x\sim p_{\text{data}(x)}[\log D(x)]}+E_{p\sim p_z(z)}[\log (1-D(x))]$ 
- cGAN: $\min_G\max_D V(D,G)=E_{x\sim p_{\text{data}(x|y)}[\log D(x)]}+E_{p\sim p_z(z)}[\log (1-D(x|y))]$
  - paired data generate
- BicycleGAN: diverse output
- Cycle GAN: no need of paired data
- 泛化性：所有模型都是需要先用有限的训练样本来训练的，那么由这些有限样本训练得到的模型可不可以从这些有限训练样本中生成出新的样本，而非简单地记着训练集
- GAN 的问题
  - 训练过程难以收敛，经常出现震荡；实验结果随机，难以复现；
  - mode collapse：只生成某一模式
  - 生成了一些没有意义、或者现实中不可能出现的图片

## Semantic Segmentation

- $p_{ij}$: 被预测为 $j$ 类样本的 $i$ 类样本 
- Pixel Accuarcy: $\text{PA}=\frac{\sum_{i=0}^kp_{ii}}{\sum_{i=0}^k\sum_{j=0}^kp_{ij}}$
- Mean Pixel Accuracy: $\text{MPA}=\frac{1}{k}\sum_{i=0}^k\frac{p_{ii}}{\sum_{j=0}^kp_{ij}}$
- Mean Intersection over Union: $\text{MIoU}=\frac{1}{k}\sum_{i=0}^k\frac{p_{ii}}{\sum_{j=0}^kp_{ij}+\sum_{j=0}^kp_{ji}-p_{ii}}$
- Frequency Weighted Intersection over Union: $\text{FWIoU}=\frac{1}{\sum_{i=0}^k\sum_{j=0}^kp_{ij}}\sum_{i=0}\frac{p_{ii}\sum_{j=0}^kp_{ij}}{\sum_{j=0}^kp_{ij}+\sum_{j=0}^kp_{ji}-p_{ii}}$

## Dataset

- Digital Recognition
  - MNIST
  - USPS
  - SVHM
- Autodriving
  - SYNTHIA
  - GTA5
  - CityScapes