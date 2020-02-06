---
title: Preprocessing
date: 2020-02-02
weight: 2
---

## 数据清理与变换

- 缺失值
  - 忽略属性
  - 手动填充
  - 使用全局量
  - 属性均值
  - 相同类属性均值
  - 最可能值
- 噪音：数据平滑技术（smooth）

  - 分箱（binning）
    - partition: equi-depth, equi-width
    - smoothing: means, median, boundaries
  - regression
  - clustering
  - data editing
  - 规范化

    - min-max

      $$ v'=\frac{v-\min_A}{\max_A-\min_A}(\text{new\_max}_A-\text{new\_min}_A)+\text{new\_min}_A$$

    - zero-mean

      $$ v'=\frac{v-\overline{A}}{\sigma_A} $$

    - decimal scaling

      $$ v'=\frac{v}{10^j} $$

- 不一致

## 数据集成

- 实体识别
- 冗余：相关分析
- 数据值冲突的检测

## 数据规约

- Data cube aggregation
  Concept hierarchy generalization analytical results
- Dimensionality reduction
  - PCA
  - LDA
  - NCA
  - ISOMAP
  - Wavelet transformation
- Feature selection(Attribute Subset selection)
  - Filter approach
    - Greedy:

      Step-wise forward selection

      Step-wise backwise selection

      Combine
    - Genetic Algorithm
    - Relevance measures: Information Gain

  - Wrapper approach

    Decision tree induction
- Numerosity reduction
  - parametric
    - Regression models

      Linear regression

      Mutiple regression
  - Non-parametric
    - histogram: Equi-depth, equi-width, maxdiff, V-optimal
    - clustering
    - sampling: random sample, bootstrap, cluster sampling, stratified sampling
- Discretization
  - entropy-based discretization
  - natural partinioning: 3-4-5 rule
- Descriptive data summarization
  - Central tendency: mean, median, mode, midrange
  - Dispersion: quartile, variance
  - graph display
    - single: box plots, histogram, quartile plot
    - pair of attributes: functionality, loess curve, quantile-quantile plot, contour plot
  - multiple attributes: scatterplot matrix, trellis plot, icons plots, parrallel coordinates plot