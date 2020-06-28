---
title: Preprocessing
date: 2020-02-02
weight: 2
---

## 预处理流程

- General
  - Data cleaning
  - Data reduction
  - Data Integration
  - Data transformation

## Data cleaning

- incomplete: mainly from data collection
  - 忽略属性
  - 手动填充
  - 使用全局量
  - 属性均值
  - 相同类属性均值
  - 最可能值
- 噪音：mainly from data collection，数据平滑技术（smooth）
  - 分箱（binning）
    - partition: equi-depth, equi-width
    - smoothing: means, median, boundaries
  - regression: fit into a mathematical function
  - clustering: organize similar values into groups or clusters
  - data editing
    - exploiting local smoothness
    - exploiting global consistency with a noise tolerant model
- 不一致：mainly from data integreation
  - knowledge engineering tools

## Data Integration

- Schema Integration
  - entity identification problem: family name vs. surname
  - semantic heterogeneity problem: 175cm vs. 1.75m
- Redundancy
  - correlation analysis
- 数据值冲突的检测

## Data Transformation

- Normalization

  - min-max

    $$ v'=\frac{v-\min_A}{\max_A-\min_A}(\text{new\_max}_A-\text{new\_min}_A)+\text{new\_min}_A$$

  - zero-mean

    $$ v'=\frac{v-\overline{A}}{\sigma_A} $$

  - decimal scaling

    $$ v'=\frac{v}{10^j} $$

- Smoothing
- Aggregation
- Generalization
- Attribute construction

## Data Reduction

- Data cube aggregation
- Concept hierarchy generalization analytical results
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
    - histogram: Equi-depth, equi-width, maxdiff(least variance), V-optimal
    - clustering
    - sampling: random sample, bootstrap, cluster sampling, stratified sampling

- Discretization
  - Types of attributes
    - categorical or continuous
    - unordered or ordered
  - entropy-based discretization
  - natural partioning: 3-4-5 rule

## Data Visualization

- Quantitive characteristic rule
  - central tendency: mean, median, mode, midrange
  - dispersion: quartiles, variance, standard deviation
- single
  - pie chart
  - box plots
  - histogram/bar chart
  - quartile plot
- pair
  - scatterplot
  - Loess curve (local regression)
  - Q-Q plot (Quantile-Quantile)
  - contour plot
- multiple
  - crosstab
  - 3D cube
  - scatterplot matrix
  - trellis plot
  - icons plots
  - parrallel coordinates plot
