---
title: Ray-Tracing
date: 2019-03-12
weight: 3
---

## Introduction

- Good at simulating specular effects
- Rays are reflected, refracted or absorbed
- 三角形法向：$N=\frac{(P_1-P_0)\times(P_2-P_0)}{\|(P_1-P_0)\times(P_2-P_0)\|}$
- 计算每个顶点法向：$N_v=\frac{\sum_{i=1}^k}{\|\sum_{i=1}^k\|}$
- Tangent Space:
  - normal vecotr $N$
  - tangent vector $T$
  - bitangent vector $B$

## 求交

- Shpere
  - Definition: $x^2+y^2+z^2-r^2=0$
  - Definition: $x=r\sin\theta\cos\phi,y=r\sin\theta\sin\phi,z=r\cos\theta$
- Cylinder
  - Definition: $\phi=u\phi_{\max},x=r\cos\phi,y=r\sin\phi,z=z_{\min}+v(z_{\max}-z_{\min})$
- Disk
  - Definition: $\phi=u\phi_{\max},x=((1-v)r_i+vr)\cos\phi,y=((1-v)r_i+vr)\sin\phi,z=h$
- Triangle Mesh

## Acceleration

- Testing each object for each ray is slow
- Fewer Rays
  - Adaptive sampling: 减少采样，内插
  - depth control
- Generalized Rays
  - beam tracing
  - cone tracing
  - pencil tracing
- Faster Intersection
  - Object subdivision approaches
    - BVH (Bounding Volumne boxes)：recursively finding bounding box of objects and split objects into two groups
  - Space subdivision approaches
    - Uniform Grid

      Find bounding box - Determine grid resolution - Place object in cell if its bounding box overlaps the cell- Check that object overlaps cell(expensive!)

      Teapot in a stadium Problem: Not adaptive to distribution of primitives

    - kd-Tree

      SAH(Surface Area Heuristic): 分割平面代价评估函数
  - Building Time: BVH < KD-Tree
  - Ray intersection test: BVH > KD-Tree

## Shading

- 计算交点的能量：the sading of each intersection point is the sum of contributions from all light sources
- Material properties: diffusion, specular, shininess, emission
- Light types: Ambient light, point light, ...
- Classic Ray Tracing
  - Perfect focus
  - Perfect reflections
  - Sharp shadow
- Distributed Ray Tracing: randomly oversampling to reduce aliasing artifacts in rendered images
  - antialiasing: super-sampling and averaging down
    - Jittering: randomly generate a ray within each grid
  - soft shadows: sample area light
  - depth-of-field: sample on Lens
  - motion blur: sample on time
  - glossy reflections: 介于漫反射与镜面反射

## Parallelization

- Threading(Pthread, OpenMP) distributes rays across cores
- MPI distributes rays across processors on different machiens (Message Passing Interface)
- OptiX/CUDA distributes rays on the GPU
- Memory coherency
