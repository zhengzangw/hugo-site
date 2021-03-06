---
title: Domain Adapation 综述
date: 2020-07-05
---

## Adversial

- GAN: $\min_G\max_D V(D,G)=E_{x\sim p_{\text{data}(x)}}[\log D(x)]+E_{z\sim p_z(z)}[\log (1-D(x))]$
- cGAN: $\min_G\max_D V(D,G)=E_{x\sim p_{\text{data}(x|y)}}[\log D(x)]+E_{z\sim p_z(z)}[\log (1-D(x|y))]$
  - paired data generate
- BicycleGAN: diverse output
- Cycle GAN: no need of paired data
- 泛化性：所有模型都是需要先用有限的训练样本来训练的，那么由这些有限样本训练得到的模型可不可以从这些有限训练样本中生成出新的样本，而非简单地记着训练集
- GAN 的问题
  - 训练过程难以收敛，经常出现震荡；实验结果随机，难以复现；
  - mode collapse：只生成某一模式
  - 生成了一些没有意义、或者现实中不可能出现的图片

## Graphical models

![Graphical models](https://pic2.zhimg.com/80/v2-714c1843f78b6aecdb0c57cdd08e1c6a_720w.jpg)

## DA Dataset

- Digital Recognition
  - MNIST
  - USPS
  - SVHM
- Autodriving
  - SYNTHIA: 1280x760
  - GTA5: 1914x1052
  - CityScapes
  - BDD100K
  - Mapillary

## Leading results in DA

GTA5->CitySpaces, VGG16-FCN8s, mIoU

- CyDADA: 35.4%
  - Cycle loss
  - Semantic consistency loss
  - Feature-level loss
- BDL: 41.3%
  - self-training
- PyCDA: 37.2%
  - Non adaptation
  - self-training: pixel level
  - curriculum domain adaptation: high level self-training
- DRPC: 36.1%
  - Domain Randomization: intepolation to cover all domain adaptation
  - images/domain pyramid consistency: high level semantic consistency
- MADAN(GTA5+SYNTHIA): 41.4%
  - directly make different adapt domains indistinguishable
- IMLE: diverse image generation
  - IMLE method
- Oracle: 60.3%

### Possible Points

- self-training in DR
- IMLE
- better DR
