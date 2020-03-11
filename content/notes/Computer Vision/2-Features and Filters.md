---
title: Features and Filters
date: 2020-02-25
---

## Images and Filtering

- Digital Image
- Bayer Filer：相机滤色版每个点有三个值，一个为传感器得到，两个为插值
- Image transformation

  Use of Filtering

  - Enhance an image
  - Extract infromation
  - Detect patterns

  Three views of filtering

  - Image filters in spatial domain
  - Image filters in frequency domain
  - Templates and Image Pyramids

- Image noise and image smoothing
- Convolution operation
- Media filter

## Frequency Domain and Sampling

- Fourier Transform
- Sampling

## Template matching

- correlation: bad

  $$h[m,n]=\sum_{k,l}g[k,l]f[m+k,n+l]$$

- Zero-mean filter: fastest but not a great matcher

  $$h[m,n]=\sum_{k,l}(g[k,l]-\overline{g})f[m+k,n+l]$$

- Sum Square Difference: next fastest, sensitive to overall intensity

  $$h[m,n]=\sum_{k,l}(g[k,l]-f[m+k,n+l])^2$$

- Normalized cross-correlation: slowest, invariant to local average intensity and contrast

  $$h[m,n]=\frac{\sum_{k,l}(g[k,l]-\overline{g})(f[m+k,n+l]-\overline{f}_{m,n})^2}{(\sum_{k,l}(g[k,l]-\overline{g})^2\sum_{k,l}(f[m+k][n+l]-\overline{f}_{m,n}))^{0.5}}$$

## Image pyramids

- Gaussian Pyramids
  - Up or down sample images
  - Multi-resolution image analysis
- Laplacian Pyramids

## Filter banks and texture analysis

- Texture: a phenomenon that is widespread, easy to recognize and hard to define
- Texture-related tasks
  - shape from texture
  - segmentation/classification
  - synthesis
- Filter banks: a collection of multiple filters
  - feature vectors will be d-dimensional