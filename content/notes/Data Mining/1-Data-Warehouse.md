---
title: 1. Data Warehouse
date: 2020-02-02
weight: 1
---

## Big Data

- GB: $2^{30}$ B
- TB, PB, EB, ZB
- data newly generated globally
  - 2006: 180 EB
  - 2001: 1.8 ZB
  - 2020: 35 ZB
- Data Mining Examples:
  - supermarket transactions
  - valuable customers
  - network instrusion
  - gene data
  - medical data
  - web
  - financial data
  - software data
  - usage data
  - data from sensors
  - data of arts
  - audio generation
- Data mining: non-trivial process of identifying **valid, novel, potentially useful, and ultimately understandable** patterns from huge volume of data
- KDD: Knowledge Discovery in Data
  - 狭义：Data mining is a core step of KDD
  - 广义：KDD = DM
- data mining tasks: descriptive or predictive
  - characterization
  - discrimination
  - association
  - clustering
  - classification
  - regression
  - outlier analysis
  - trend and evolution analysis

## 数据仓库概念

- Property
  - Subject-Oriented
  - Integrated
  - Time-variant
  - Nonvolatile
- Data Cube: lattice of cuboids (not a paradigm of actual physical storage)
- Multidimensional Data Model
  - fact table: contains the facts as well as keys to each of the related dimension tables
  - schema
    - star schema: 事实表+维表
    - snowflake schema
    - fact constalleation schema
- concept hierarchy
  - schema hierarchy: Total or partial order
  - set-grouping hierarchy

## OLAP

OnLine Analysis Process

- OLAM architecture
  - Layer 4: User Interface
  - Layer 3: OLAP
  - Layer 2: Data Cube
  - Layer 1: Databases or Data Warehouse
- OLAP
  - roll-up: climbing up a concept hierarchy
  - drill-down: step down hierarchy
  - slice: selection on one dimension
  - dice: select on multiple dimension
  - pivot: rotate the data axes in view
- Measure (度量)
  - 分布的：设数据被划分为 n 个集合，函数在每一部分上的计算得到一个聚集值。如果将函数用于 n 个聚集值得到的结果，与将函数用于所有数据得到的结果一样
  - 代数的：具有 $M$ 个分布聚集函数的代数函数
  - 整体的
- OLAP server
  - ROLAP 关系型
    - Optimization technique
    - Operational DBMS
  - MOLAP 多维
  - HOLAP 混合

![OLTP](/images/content/OLTPOLAP.png)

### 分块技术

- $n$ 维数据立方体，每维有 $L_i$ 概念分层

  $$T=\prod_{i=1}^n(L_i+1)$$

- 多路数组聚集: dimensions should be sorted according to their sizes in ascending order

### 数据仓库使用

- 信息处理：支持查询和基本的统计分析，并使用交叉表、表、图表或图进行报告。数据仓库信息处理的当前趋势是构造低代价的基于网络的存取工具，然后与网络浏览器集成在一起
- 分析处理：支持基本的 OLAP 操作，包括切片与切块、下钻、上卷和转轴。一般地，它在汇总的 和细节的历史数据上操作。与信息处理相比，联机分析处理的主要优势是它支持数据仓库的多维数据分析
- 数据挖掘：支持知识发现，包括找出隐藏的模式和关联，构造分析模型，进行分类和预测，并用可视化工具提供挖掘结果

## Attribute-oriented induction

- Data generalization: a process which abstracts a large set of task- relevant data in a database from a relatively low conceptual level to higher conceptual levels
- control generalization: how high an attribute should be generalized
