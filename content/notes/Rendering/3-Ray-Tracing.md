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