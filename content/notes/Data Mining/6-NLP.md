---
title: 4. NLP
date: 2020-02-09
weight: 4
---

## Text

- NLP 预处理
  - （网页）确定 main block
  - 去除标点与特殊符号
  - （网页）去除标签
  - （中文）分词
  - （英文）小写化
  - 去除停用词
  - （英文）stemming + lemmatization
- Representation
  - bag of words
    - Binary
    - Frequency
    - TF-IDF = $\text{tf}(t,d)\log\frac{|C|}{n_t}$
  - N-gram
    - 第 $N$ 个词的出现只与前 $N-1$ 个词相关，整句概率为各词出现概率乘积
  - Distributed representation: 将词语用多个维度表示
  - word2vec
    - 只有一个隐层的神经元网络，输入 one-hot 编码词汇表向量，输出 one-hot 编码词汇表向量
    - 词向量：输入层到隐藏层权重第 $i$ 行
    - CBOW: 上下文预测单词
    - Skip-gram: 单词预测上下文
- Document Clustering
  - partition-based
    - distance: cosine similarity
    - centroid: topical words
  - Probabilistic
    - $p(\omega_j|G_m)=\frac{\sum_{\overline{X}}P(G_m|\overline{X})I(\overline{X},\omega_j)}{\sum_{\overline{X}}P(G_m|\overline{X})}$
- Document and words co-clustering
  - Bipartite graph partioning
- Topic Model
  - LSA
  - Probalistic LSA
- Classification
  - Instance-based
    - Cosine similarity
    - LSA + Cosine similarity
    - Centroid-based classification (clustering + cosine similarity)
  - Naive Bayes
    - Bernoulli NB
    - Multinomial NB
  - Linear SVM
