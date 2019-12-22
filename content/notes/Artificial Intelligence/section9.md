---
title: 9-符号学习
date: 2019-09-10
tags: [ml, notes]
weight: 9
---

样例学习，概念学习，归纳推理

* 实例集合：$X$
* 目标概念：$c:X\rightarrow\{0,1\}$
* 假设空间 $H$: $h:X\rightarrow\{0,1\}$
* 概念学习：寻找假设 $h$，使得 $\forall x\in X,h(x)=c(x)$
* 归纳学习假设：任一假设如果在足够大的训练样例集合中能很好的逼近目标概 念函数，它也能在未见实例中很好的逼近目标概念
* $h_j\geq h_k\iff (\forall x\in X)(h_k(x)=1\rightarrow h_j(x)=1)$
* 一致：$\text{consistent}(h,D)=(\forall\langle x,c(x)\rangle\in D)h(x)=c(x)$
* 变型空间（版本空间 version space）：$\text{VS}_{H,D}=\{h\in H|\text{consistent}(h,D)\}$
* 极大泛化：$G=\{g\in H|\text{consistent}(g,D)\wedge(\neg\exists g'\in H)(g'>g\wedge \text{consistent}(g',D))\}$
* 极大特化：$S=\{s\in H|\text{consistent}(s,D)\wedge(\neg\exists s'\in H)(s'>s\wedge \text{consistent}(s',D))\}$
* 表示定理：$\text{VS}_{H,D}=\{h\in H|(\exists s\in S)(\exists g\in G)(g\geq h\geq s)\}$
* 归纳推理/机器学习的根本问题
  * 目标概念假设不在假设空间怎么办?
  * 能设计包含所有假设的空间吗?
  * 假设空间大小对未见实例的泛化能力有什么影响? 
  * 假设空间大小对所需训练样例数量有什么影响?

## 有偏学习

作为搜索的概念学习，假设空间为合取式表示

* Find-S 算法（寻找极大特殊假设）
  * $h(a_1,\cdots,a_n)=$最特殊的假设
  * for $x\in X,c(x)=1$
    * for $a_i$
      * if $x$ 不满足 $a_i$ 则将 $h$ 中的 $a_i$ 替换为 $x$ 满足的另一个最一般的约束
* 列表消除算法
  * for $\langle x,c(x)\rangle\in D$
    * $H=H\backslash\{h\in H|h(x)\not=c(x)\}$
* 候选消除算法：正例搜索 $S$，反例缩小 $G$
  * 如果 $d$ 是一正例
    * 从 $G$ 中移去所有与 $d$ 不一致的假设
    * 对 $S$ 中每个与 $d$ 不一致的假设 $s$
      * 从 $S$ 中移去 $s$
      * 把 $s$ 的所有的极小泛化式 $h$ 加入到 $S$ 中，其中 $h$ 满足 $h$ 与 $d$ 一致，而且 $G$ 的某个成员比 $h$ 更一般
    * 从 $S$ 中移去所有这样的假设：它比 $S$ 中另一假设更一般
  * 如果 $d$ 是一个反例
    * 从 $S$ 中移去所有与 $d$ 不一致的假设
    * 对 $G$ 中每个与 $d$ 不一致的假设 $g$
      * 从 $G$ 中移去 $g$
      * 把 $g$ 的所有的极小特化式 $h$ 加入到 $G$ 中，其中 $h$ 满足 $h$ 与 $d$ 一致，而且 $S$ 的某个成员比 $h$ 更特殊
    * 从 $G$ 中移去所有这样的假设：它比 $G$ 中另一假设更特殊

## 无偏学习

析取表示，幂集

* 无偏学习的无用性：$S:\{\bigvee_{c(x_i)=1}x_i\},G:\{\neg(\bigvee_{c(x_i)=0}x_i)\}$
  * 必须给定 $X$ 中的所有实例作为训练样例
  * 故必须给定某种形式的预先假设（归纳偏置）
* inductive bias: 学习器从训练样例中泛化并推断新实例分类过程中所采用的策略
  * $(B\wedge D_c\wedge x')\vdash L(x',D_c)$
  * 优先偏置
  * 限定偏置
* 有偏性越强，学习器的归纳能力越强
* 学习析取表达式：决策树
* 奥卡姆剃刀(1324)
  * 如果对于同一现象有两种不同的假说，应该采取比较简单的那一种
  * 优先选择拟合数据的最简单假设
  * 简单：可证伪的假设的数目更少，而非最简化的假设
* 决策树学习中的归纳偏置
  * 优先选择信息增益高的属性更接近根结点的树
  * 较短的树比较长的树优先
  * 不回溯的搜索，假设空间中局部最优

## 神经网络

* 信用分配：如何修正隐藏层的权重
