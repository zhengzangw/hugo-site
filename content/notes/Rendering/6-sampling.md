---
title: Sampling & Reconstruction
date: 2020-04-14
---

## Math

- Fourier Series: 任意周期为 $1$ 的函数可表示为 $\frac{a_0}{2}+\sum_{n=1}^N(a_n\cos(2\pi nt)+b_n\sin(2\pi nt))$
- $f(x)=\sum_{n=-N}^Nc_ne^{2\pi int},c_n=\int_0^1e^{-2\pi int}f(t)dt$
- $(f*g)(t)=\int_{-\infty}^{\infty} g(t-x)f(x)dx$
- $\Pi(x)=[|x|\leq 1]$
- $(\Pi*\Pi)(x)=\Lambda(x)$
- Radical Inverse
  - $n=a_k\cdots a_2a_1$
  - $\Phi_b(n)=0.a_1a_2\cdots a_k$
- Van der Corput Sequence: $x_i=\Phi_2(i)$
- Halton Sequence: $x_i=(\Phi_2(i),\Phi_3(i),\Phi_5(i),\dots,\Phi_{p_d}(i))$
- Hammersley Sequence: $x_i=(\frac{i-\frac{1}{2}}{N},\Phi_2(i),\Phi_3(i),\Phi_5(i),\dots,\Phi_{p_{d-1}}(i))$

## Reconstruction

- 时间域
  - 冲激串 $\delta_T$
  - 重建 $\widetilde f(x)=(\delta f)\otimes r$
  - 重构核 $r$
    - sinc
    - 高斯
    - 三角
- 频率域
  - $\widetilde F=(F(\omega)\otimes \delta_{1/T})\Pi_T(\omega)$
- reconstruction filter
  - ideal ones not exist
  - Box Filter
  - Triangle Filter
  - Gaussian Filter
  - Mitchell Filter
  - Windowed Sinc Filter
- Denoising

## Aliasing

- Small triangles
- Stairstepping(jaggies)
- Moire Patterns
- 车轮倒转

## Source of High Frequencies

- Geometry
  - Edges, Vertices, sharp boundaries
  - silhouettes
- Texture
- Illumination

## Antialiasing Techiques

- Nonuniform sampling: $\sum_{i=-\infty}^{\infty}\delta(x-(i+\frac{1}{2}-\xi)T)$
  - noise better than aliasing
- Adaptive sampling: Taking more samples in high-frequency regions
- Prefiltering: mipmap

## Evaluating

- Blue noise property
  - 白噪：完全随机采样，处处有能量
  - 蓝噪：低频无能量，低频完美重构，高频转化为噪声
- gittered grid
- Poisson Disk Sampling
  - Dart Throwing: keep throwing darts into a domain with minimum distance constrain
  - Lloyd's Relaxation
    - construct voronoi
    - move to centroid
  - Tiled
- Discrepany: how "uniform" the sampling pattern is
  - $D_N(B,P)=|\sum_{b\in B}\frac{\#\{x_i\in b\}}{N}-\text{Vol}(b)|$

## 采样方法

- Uniform Sampling
- Random Sampling
- Blue noise Sampling
- Stratified Sampling
  - Uniform sample + random perturbation (jittering)
- Low-Discrepancy Sampling(quasi-random sampling)
  - Sample with Van der Corput Sequence $D^*_N(P)=O(\frac{\log N}{N})$
  - Sample with Halton Sequence: $D^*_N(P)=O(\frac{(\log N)^d}{N})$
