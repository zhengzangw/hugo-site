---
title: 5. Outlier Analysis
date: 2020-02-06
weight: 5
---

## Outlier analysis

- Outliers
  - Global: deviates from the rest of the data set
  - Contextual: deviates significantly with respect to a specific context of the object
  - Collective: objects as a whole deviate significantly from the entire data set
- Categorization based on supervision
  - Supervised
  - Unsupervised
  - Semi-supervised
- Mining contextual outliers
  - transforming contextual to conventional
  - Modeling normal behavior
- Mining collective outliers
  - Exploring the structure of the data
- high dimensional data
  - dimensionality reduction
  - partiion the original feature space into small region

### Statistical

- Parametric approaches
  - Univariate
    - mean + standard deviation: $\mu\pm3\sigma$
    - median $\pm$ 1.5 \* IQR (inter-quatile range)
    - Brubb's test: Z score + t-distribution
  - Multivariate
    - Trainsform to univariate: univarate set $\{d(o,\overline{o})|o\in D\}$
    - 卡方分析
    - modeling the data with multiple parametric distribution
- Non-parametric
  - histogram
  - kernel density estimation

### Proximity-based approaches

the proximity of an outlier object to its nearest neighbors significantly deviates from the proximity of the object to most of the other objects in the data set

- Distance-based: global view
  - $\text{DB}(r,\pi)$-outlier: $\frac{\|\{o'|\text{dist}(o,o')\leq r\}\|}{\|D\|}\leq\pi$
  - CELL (Grid-base)
- Density-based
  - LOF
    - K-distance neighborhood: $N_k(o)=\{o'|o'\in D,d(o,o')\leq d_k(o)\}$
  - Reachability distance: $\text{reachdist}_k(o\leftarrow o')=\max\{d_k(o),d(o,o')\}$
  - Local reachability density: $\text{lrd}_k(o)=\frac{\|N_k(o)\|}{\sum_{o'\in N_k(o)}\text{reachdist}_k(o'\leftarrow o)}$
  - Local outlier factor(the larger, the more abnormal): $\text{LOF}_k(o)=\sum_{o'\in N_k(o)}\sum_{o'\in N_k(o)}\text{reachdist}_k(o'\leftarrow o)$

### Clustering-based

- basic ideas
  - outlier does not belong to any clusters
  - the distance between an outlier and the cluster to which it is closest to is large
  - all objects in a small and sparse cluster can be considered as outliers
- CBLOF
  - Find clusters and sort according to decreasing size
  - Identify “large” cluster using a preset percentage of the entire data
  - for points in large cluster: CBLOF= size of the cluster $\times$ similarity between the point and the cluster
  - for points in small cluster: CBLOF= size of the cluster $\times$ similarity between the point and the closest large cluster

### Classification-based

- outlier v.s. normal: severely imbalanced distribution
- One-class SVM
  - v-SVM: Separating the “normal” data from the origin with a margin in
    a feature space
  - SVDD: Constraining ”normal” data in a ball with relative small radius

### Isoation-based

- iForest: Outliers are few and different. Thus, when randomly split the space into small region, an outlier is more likely to be ISOLATED
