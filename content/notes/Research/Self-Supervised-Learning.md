---
title: Self-Supervised Learning
date: 2020-06-18
---

## Imagenet

- PASCAL VOC: 20 classes, $3\times10^4$
- Imagenet-40
- ILSVRC (Imagenet-1K): 1000 classes, $1.28\times 10^6$
- IMAGENET: 20000 classes, $1.5\times10^7$

## pretext tasks

- Crop
- Resize
- Flip
- Rotate
- Color distort
  - drop
  - jitter
- Gaussian noise
- Gaussian blur
- Sobel filtering

## Contrastive Learning Framework

- 特点
  - 在 feature space 上构建度量距离
  - 通过特征不变性，得到多种预测结果
  - 使用 Siamese Network
  - 无需 pixel-level 重建

## Generative Methods

- AE
- VAE
- GAN
