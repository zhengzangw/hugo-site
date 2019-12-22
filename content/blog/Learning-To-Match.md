---
title: Learning to Match
date: 2019-09-24
tags: [ml]
---

# Problem

| Name                   | Description |
| ---------------------- | ----------- |
| QA (Question Ansering) |             |
| Machine Comprehension  |             |
| Dialogue Systems       |             |
| Ad-hoc Retrieval       |             |
| Learning to Rank       |             |

<!--more-->

# Datasets

## Ad-hoc Retrieval

| Dataset    | Time |
| ---------- | ---- |
| Gov2       |      |
| Robust04   |      |
| ClueWeb 12 |      |
| ClueWeb 09 |      |

## Learning to Rank

| Dataset                                                                   | Time      | Description                      | Company   | Domain  | X nums | Y nums | pos rel nums | rel nums |
| ------------------------------------------------------------------------- | --------- | -------------------------------- | --------- | ------- | ------ | ------ | ------------ | -------- |
| LETOR3.0                                                                  | Dec. 2008 | LEarning TO Rank                 | Microsoft | IR(q-d) |        |        |              |
| [LETOR4.0](https://arxiv.org/abs/1306.2597)                               | July 2009 |                                  | Microsoft | IR(q-d) |        |        |              |
| LETOR4.0:MQ2007                                                           |           | Million Query track of TREC 2007 |           |         | 1700   |        |
| LETOR4.0:MQ2008                                                           |           | Million Query track of TREC 2008 |           |         | 800    |        |
| [MSLR-WEB10k/30k](https://www.microsoft.com/en-us/research/project/mslr/) |
| Yahoo! Learning to Rank Challenge                                         |

## Recommedation Systems

-   [MovieLens](https://grouplens.org/datasets/movielens/)
    -   MovieLens 20M
    -   MovieLens 1M
-   [Amazon product data](http://jmcauley.ucsd.edu/data/amazon/)

# Relevence Label

-   relevance level
    -   Binary: $l(t)=1,t\in C(r)$
        -   relevant documents $C(r)$
    -   $\text{rel}(t)\in[l_{\max}]$
-   pairwise preference
-   total order of docs and queries

# Metrics

-   One query $r\rightarrow$ One permutation $\pi$
-   One query $r\rightarrow$ retrieved documents $R(r)$
-   precision: $\text{precision}=P=\frac{|C(r)\cap R(r)|}{|R(r)|}$
    -   $\text{precision}@k$
        -   $|R(r)|=k$
        -   $\frac{\sum_{t\leq k}l(\pi(t))}{k}$
-   recall: $\text{recall}=\frac{|C(r)\cap R(r)|}{|R(r)|}$
    -   $\text{recall}@k, |R(r)|=k$
-   AP(AveP, Average precision): $\text{AP}=\frac{\sum_{k=1}^{|C(r)|}P@k\cdot l(\pi(k))}{|R(r)|}$
-   MAP(Mean average precision): $\text{MAP}=\frac{\sum_{q=1}^Q\text{AP}(q)}{Q}$
-   CG(Cumulative Gain): $\text{CG}@k=\sum_{i=1}^k \text{rel}(i)$
-   DCG(Discounted cumulative gain): $\text{DCG}@k=\sum_{i=1}^k\text{rel}(i)\eta(i)$
    -   折扣因子 $\eta(i)$: $\frac{1}{\log(i+1)}$
-   IDCG(Ideal DCG): $\text{IDCG}@k=\max_{\pi}\text{DCG}@k(\pi)$
-   nDCG(Normalized DCG): $\text{IDCG}@k=\frac{\text{DCG}_p}{\text{IDCG}_p}$
-   RR(reciprocal rank): $\text{rank}_i$ 第一个正确答案的排名
-   MRR(Mean reciprocal rank): $\text{MRR}=\frac{1}{|Q|}\sum_{i=1}^{|Q|}\frac{1}{\text{rank}_i}$
-   Cascade Models: 用户在位置 $k$ 需求满足的概率 $\text{PP}(k)=\prod_{i=1}^{k-1}(1-R(i))R(k)$
    -   该文档满足需求的概率：$R(t)=\frac{2^{\text{rel(t)}}-1}{2^{l_{\max}}}$
-   ERR(Expected reciprocal rank): 用户需求满足时停止位置的倒数的期望 $\text{ERR}=\sum_{r=1}^n\frac{1}{r}\text{PP}_r$

# Methods

-   pointwise
    -   Input space: vec(doc) + vec(query)
    -   Output space: $\text{rel}(\text{doc})$
    -   Hypothesis space: $f(\text{doc})$
    -   Loss: $|f(\text{doc})-\text{rel}(\text{doc})|$
    -   Method:
        -   Regression: 实值相关度
        -   Classification: 无序类别
        -   Ordinal Regression: 有序类别
-   pairwise
    -   Input space: vec(doc) + vec(doc) + vec(query)
    -   Output space: pairwise preference
    -   Hypothesis space: $f(\text{doc},\text{doc})$
    -   Loss: 预测与真实间的差异
-   listwise
    -   Input space: list(vec(doc)) + vec(query)
    -   Output space: permutation

# Data Cleaning

-   Crawling
-   Tokenize
-   Normalization
    -   Lower case
-   Stop
-   Stemming
-   Link analysis
    -   Anchor Text
    -   PageRank
    -   TrustRank
-   Indexing

# Algorithm

## Boolean Model

-   Document：关键词集合(无序)
-   Query：关键字布尔组合
-   Match: 文档满足关键字

## 概率模型

Unsuperviesd Ranking Models

-   $\text{TF-IDF}(i,d)=\text{TF}(i,d)\cdot\text{IDF}(i)$
    -   $\text{TF}(q_i,D)=\frac{n_{q_i,D}}{\sum_kn_{q_k,D}}$
    -   $\text{IDF}(q_i)=\lg\frac{N}{|\{j:q_i\in D_j\}|}$
    -   $N$: number of documents
-   $\text{BM25}(D,q_i)=\text{IDF}(q_i)\frac{n_{q_i,D}(k_1+1)}{n_{q_i,D}+k_1(1-b+b\frac{|D|}{\text{avg}(|D|)})}$
    -   $\text{IDF}(q_i)=\log\frac{N-n(q_i)+0.5}{n(q_i)+0.5}$
    -   $k_1,b$: free parameter
        -   usually: $k_1\in[1.2,2.0],b=0.75$

## Vector Space Model

Linear projection model, Inference

-   cosine-similarity$(q,d)=\frac{V(q)\cdot V(d)}{\lVert V(q)\rVert\lVert V(d)\rVert}$
-   one-hot 编码
-   TF-IDF 编码

### LSI (Latent Semantic Indexing)

1990

-   两个词的语义越相近，它们共现的概率也就越大
-   Item-Document Matrix: $A=U_{m\times r}\Sigma_{r\times r}V^T_{r\times n}$
-   PLSI
-   LDA

## Learning

### DSSM

CIKM'13

-   Deep Learning learn Latent Semantic Feature
-   Word Hashing (n-gram presentation)
    -   reduce the dimensionality f bag-of-words term vectors
    -   solve oov problems
-   CDSSM(CLSM)
-   LSTM-DSSM

### DRMM

CIKM'16

### Classification

-   McRank
-   BayesNetRank

### Ordinal Regression

-   PRanking
-   Large margin

# Tools

| Name     | Description                | Language |
| -------- | -------------------------- | -------- |
| Lemur    | 包含各种 IR 模型的实验平台 | C++      |
| SMART    | 向量空间模型工具           | C        |
| Weka     | 分类工具                   | Java     |
| Lucene   | 开源检索工具               |          |
| Larbin   | 采集工具                   | C++      |
| Firtex   | 检索平台                   | C++      |
| ntlk     | NLP 预处理工具             | Python   |
| gensim   | 检索工具                   | Python   |
| matchzoo | 文本匹配工具               | Python   |
