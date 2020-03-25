---
title: Introduction
date: 2019-02-12
weight: 1
---

## Rendering

- Rendering: The process of generating an image from a model, by means of a computer program

  Model -> Rendering -> Image -> Display

  - image + model - comp = painting, photography
  - model + comp - image = 3D printing, hydrographic printing, sound rendering
  - image + comp - model = abstract graphics

- Realism
  - Shadows
  - Reflections
  - Transparency
  - Translucency
  - Textures
  - Complex illumination
  - Realistic Materials
- Components
  - Scene geometry
  - Camera
  - Light sources
  - Materials
  - Light propagation
- Application
  - 影视特效
  - 动画
  - 三维游戏（Performance，速度要快）
  - 工业设计
  - 文化遗产保护
  - 虚拟现实（Performance）

### Ray Casting (Appel, 1968)

- a simple version version of ray tracing
- 发射光线 -> 获得交点 -> 计算光源贡献

```cpp
ray = rayThruPixel(cam, i, j)
hit = Intersect(ray, scene) //瓶颈
image[i][j] = findColor(hit)
```

- 不考虑阴影，反射
- 只考虑 direct illumination

## 前沿进展

### GradNet (2019 SIGGRAPH)

- 去噪
- Gradient-domain Rendering: Off-path 计算梯度
- 主图+两张梯度图去噪：优化方程
- 增加约束项：速度慢 -> 用网络模拟过程
- Deep learning based, unsupervised, fast to reconstruct high-quality image

### Deep Shading (EGST 2007)

- Convolutional Neural Networks
- U-net

### Deep Illumination (arXiv)

- GAN

### 2019 年图灵奖

- Edwin Catmull
  - Z-buffering
  - Texture mapping
  - Catmull-Clark subdivision
- Patrick Hanrahan
  - Volume rendering
  - Subsurface scattering
  - Light Field rendering
  - Tableau
- 1995 玩具总动员
- RenderMan