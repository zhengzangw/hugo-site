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

## Concepts

### Geometry Optics

- 光的直线传播定律
- 光的反射定律
  - 法向量：$N$
  - 入射光：$L$ （归一化）
  - 反射光：$R=2(N\cdot L)N-L$
- 光的折射定律
  - Snell's law: $\eta_L\sin\theta_L=\eta_T\sin\theta_T$
  - $T=-N\sqrt{1-\frac{\eta^2_L}{\eta^2_T\sin^2\theta_L}\sin^2\theta_L}-\frac{\eta_L}{\eta_T}[L-(N\cdot L)N]=(\frac{\eta_L}{\eta_T}N\cdot L-\sqrt{1-\frac{\eta_L^2}{\eta_T^2}[1-(N\cdot L)^2]})N-\frac{\eta_L}{\eta_T}L$
  - Total Internal Reflection
- 基本假设
  - Linearity
  - Energy conservation
  - Steady state
  - No polarization
  - No fluorescence or phosphorescence

### Radiometry and Color

### BRDF and Reflection Functions

### The Rendering Equation