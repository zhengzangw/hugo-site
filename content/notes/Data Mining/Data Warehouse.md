---
title: Data Warehouse
date: 2020-02-02
weight: 1
---

## 数据仓库概念

- Property
  - Subject-Oriented
  - Integrated
  - Time-variant
  - Nonvolatile
- Multidimensional Data Model
  - 数据挖掘查询语言 DMQL
  - 事实：关注的中心主题，事实表
  - 维：事实的某一维度的一个实体，维表
  - 数据立方体：方体的格
  - Data Cube(The lattice of cuboids) 数据方
    - star schema: 事实表+维表
    - snowflake schema
    - fact constalleation schema
  - Hierarchy 概念分层：映射序列
    - Schema hierarchy Total or partial order
    - Concept hierarchy
    - Set-grouping hierarchy
- Measure (度量)
  - 分布的：设数据被划分为 n 个集合，函数在每一部分上的计算得到一个聚集值。如果将函数用于 n 个聚集值得到的结果，与将函数用于所有数据得到的结果一样
  - 代数的：具有 $M$ 个分布聚集函数的代数函数
  - 整体的

## OLAP (OnLine Analysis Process)

- 在线分析操作
  - Drill-down: step down hierarchy
  - slice: selection on one dimension
  - dice: select on multiple dimension
  - pivot: rotate the data axes in view
- 与 OLTP 区别

  ![OLTP](/images/content/OLTPOLAP.png)

- OLAP server
  - ROLAP 关系型
    - Optimization technique
    - Operational DBMS
  - MOLAP 多维
  - HOLAP 混合

## 分块技术

- $n$ 维数据立方体，每维有 $L_i$ 概念分层

  $$T=\prod_{i=1}^n(L_i+1)$$

- 多路数组聚集

## 数据仓库使用

- 信息处理：支持查询和基本的统计分析，并使用交叉表、表、图表或图进行报告。数据仓库信息处理的当前趋势是构造低代价的基于网络的存取工具，然后与网络浏览器集成在一起
- 分析处理：支持基本的OLAP操作，包括切片与切块、下钻、上卷和转轴。一般地，它在汇总的 和细节的历史数据上操作。与信息处理相比，联机分析处理的主要优势是它支持数据仓库的多维数据分析
- 数据挖掘：支持知识发现，包括找出隐藏的模式和关联，构造分析模型，进行分类和预测，并用可视化工具提供挖掘结果

## 数据可视化

- crosstab
- bar chart
- pie chart
- 3D cube
- Quantitive characteristic rule