---
title: Maching Learning
date: 2020-02-06
weight: 3
---

## Association

* Association rules
  * Support

    $$\text{support}(A\Rightarrow B)=\frac{\text{tuples includes }A,B}{\text{\# of total tuples}}$$

  * Confidence

    $$\text{confidence}(A\Rightarrow B)=\frac{\text{tuples includes }A,B}{\text{tuples includes }A}$$

### Apriori

* $k$-项集：包含$k$个项的项集
* 项集的出现频率：包含项集的事务数
* 频繁项集：项集出现频率大于最小支持度
* 频繁 $k$-项集集合：$L_k$
* Apriori

  Join: 用 $L_{k-1}$ 与 $L_k$ 连接产生 $C_k$

  Prune: 确定 $C_k$ 中每个候选的计数得到 $L_k$。若 $C_k$ 中一个 $(k-1)$-子集不在 $L_{k-1}$ 中，则不可能是频繁的

* AIS
* AprioriTid
* DHP
  * Any tuple useful in determining frequent (k+1)- itemsets must contain at least (k+1) candidate frequent k-itemsets
  * For any items contained in a tuple, if it is useful in determining frequent (k+1)-itemsets, it must appear in at least k candidate frequent k-itemsets
  * For any items contained in a tuple, if it is useful in determining frequent (k+1)-itemsets, it must appear in at least one (k+1)-itemset whose k-itemsets are all candidate frequent k-itemsets
* Improvement
  * partitioning
  * sampling
  * transaction reduction

### Others

* FPgrowth
* Closed frequent itemset
* Maximal frequent itemset
* Multilevel association rules
* Quantitative Association rules
* Correlation analysis
  * Lift: $\frac{P(AB)}{P(A)P(B)}$

## Prediction

* Discriminative
  * decision tree
  * neutral network
  * SVM
  * ensemble
* Generative
  * Naive Bayes
  * Bayesian network
  * K-nearest neighbor

## Cluster

* Evaluation
* partitioning method
  * k-means
  * m-medoids
* hierachical method
  * top down: AGNES
  * bottom up: DIANA
  * Link
    * Single link: closet points
    * complete link: most distant
* Density-based method: DBSCAN
  * Core object
  * Directly density-reachable
  * Density-reachable
  * Density-reachable
  * Density-connected
* Model-based method
  * GMM-based
    * data mean
    * data covariance
  * SOM

## Outlier analysis

* Outliers
  * Global
  * Contextual
  * Collective
* Statistical
  * Parametric approaches
    * Univariate
      * mean $\pm 3$ std
      * median $\pm$ 1.5IQR
      * Brubb's test: Z score + t-distribution
    * Multivariate
      * Trainsform to univariate
      * 卡方分析
  * Non-parametric
    * histogram
    * kernel density estimation
* Proximity-based approaches
  * Distance-based
  * Grid-base: CELL
  * Density-based
    * K-distance neighborhood
    * Reachability distance
    * Local reachability density
    * LOF
* Clustering-based
  * CBLOF: large, small
* Classification: Outlier v.s. normal
  * v-SVM
  * SVDD
* Isoation-based: iForest