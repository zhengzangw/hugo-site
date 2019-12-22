---
title: 6-知识表示
date: 2019-09-10
tags: [ml, notes]
weight: 6
---

* 数据：信息的载体和表示
* 信息：数据的语义
* 知识：信息关联后形成的信息结构（事实和规则）
  * 相对正确性
  * 可表示/利用性
  * 不确定性

## 一阶谓词表示(First Order Predicate)

* 一阶逻辑的知识工程
  * 确定任务
  * 搜集相关知识
  * 确定词汇表，包括谓词，函词和常量
  * 对邻域通用知识编码
  * 对特定问题编码
  * 提交查询给推理过程并获取答案
  * 知识库调试
* 谓词公式表示知识的步骤
  * 定义谓词及变元
  * 变元赋值
  * 连接词连接谓词，形成谓词公式
* 状态谓词
  * 初始状态
  * 终止状态
* 操作谓词
  * 条件
  * 状态改变
* 缺点：组合爆炸

## 产生式表示(Production)

* $P\rightarrow Q$ (IF P THEN Q)
  * 产生式的知识有可信度
* 常用结构
  * 原因$\rightarrow$结果
  * 条件$\rightarrow$结论
  * 前提$\rightarrow$操作
  * 事实$\rightarrow$进展
  * 情况$\rightarrow$行为
* 产生式系统：一组产生式互相配合协调
  * 规则库
  * 数据库
  * 控制系统
* 推理
  * 正向推理
  * 反向推理
  * 混合驱动和控制策略

## 语义网络表示(Semantic Network)

* 通过有向图，其顶点表示概念，边表示概念间的语义关系，来表达复杂的概念及其相互关系
* 语义网路的推理：带求解问题构造为网络判断，某些节点/边为空（询问点），进行匹配

## 框架表示(Framework) 与知识图谱(Knowledge Graph)

* 框架：描述对象属性的一种数据结构
* 框架的一般表示
  * 框架名
  * 槽名（某一方面属性）
  * 侧面（属性的某一方面）
  * 值
* 万维网(World Wide Web) Web1.0
  * URL: 统一资源定位符
  * HTML：超文本标记语言
  * HTTP：超文本传输协议
  * Web搜索引擎
* Web 2.0
  * 大众参与
  * 社会网络
* 语义万维网 Semantic Web
  * Tim Berners-Lee 1998
  * 给 Web 上的信息赋予良定的含义
* RDF 数据
  * Class
  * Property
  * Individual
* Term：固定一组用于标注的术语，并同意其含义
  * Ontology：同意一个语言用于定义新术语
    * RDFS, OWL
    * 灵活性
* 知识图谱：数据库，可看做一张巨大的图，节点表示实体或概念，边由属性或关系构成
  * DBpedia
  * YAGO
  * Freebase
  * Google

### RDF(Resource Description Framework)

```xml
<xml version="1.0">
<Class rdf:ID="Resource"
  xmlns:rdf="url"
  xmlns="url">
  <property> value </property>
</Class>
</xml>
```

* subject：resource
* predicate: property
  * 字面量(literal)：矩形
  * 资源：椭圆
* object: value
* 三元组：<subject, predicate, object>
* 聚合工具：收集关于某一资源的所有数据并整合
* 匿名资源

### RDFS(Resource Description Framework Schema)

* 资源：通过RDF描述的食物
* 核心属性
  * rdfs:resource
  * rdfs:property
  * rdfs:Class
  * rdfs:type
  * rdfs:subClassOf
* 描述能力弱
  * 局部的
  * 没有存在/数量规约
  * 传递，相反或对称属性
* 没有推理支持

### OWL(Web Ontology Language)

* 共同理解，形式化
* 邻域中重要概念的名称+邻域中的背景知识/约束
* 本体：一个本体是一个（共享）概念化的一中（形式化的显示）规约
  * Formal, explicit specification of a shared conceptualization
* OWL：W3C负责
  * OWL Lite: DL 容易实现的自己
  * OWL DL: 限制在描述逻辑
  * OWL Full: OWL + RDF
* 语义分层
  * TBox 模式层
  * ABox 实例层
* OWL 2
  * OWL 2 EL: 含有大量属性和类的本体应用
  * OWL 2 QL：大量实例数据（类数据库）
  * OWL 2 RL：基于规则的推理引擎

### 知识图谱构建

* 本体工程(ontology engineering)
  * 狭义：methods and methodologies for building ontologies
    * 定义术语和术语间联系
  * 广义：以工程化的视角考察本体的构建和管理
  * 斯坦福起步法：明确范围，考虑重用，列举术语，定义类，定义属性，定义约束，创建实例
    * 现实中是一个迭代的过程
* 知识图谱构建
  * Data acquisition
  * Semantics enrichment
  * Linking to knowledge bases
