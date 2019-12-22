---
title: 问求第三学期
date: 2019-01-05
tags: [algorithm, notes]
---

# 动归与贪心

## 动态规划

### 动归模型

* 1D subproblem (array,sequence,string->prefix/suffix,O(n))
  * Rod cutting：$f(n)=\max_{1\leq i\leq n}(p_i+f(n-i))$
  * Longest increasing subsequence：$L(n)=1+\max_{j<i\wedge A[j]\leq A[i]}L(j)$
    * $E(l)=\min(ending), O(nlogn)$
  * Printing Neatly
* 2D subproblem
  * Edit distance
  * Longest common subsequence
  * Matrix chain multiplication：$f(i,j)=\min_{i\leq k<j}(f(i,k)+f(k,j)+p_{i-1}p_kp_j)$
  * Optimal BST
  * Knapsack Problem
* 3D subproblem
  * Floyed-Warshall algorithm
* Graph
  * rooted subtrees
  * nodes after/before in the topo order

### 原理与证明

* optimal substructure: 问题的最优解由相关问题的最优解组合而成，而这些子问题可以独立求解
  * make a decision
  * suppose the first step to be optimal
  * consider the subproblem and problem space
  * cut-and-paste to prove (注意子问题需无关)
* overlapping subproblem: 问题的递归算法会反复地求解相同的子问题
* 动态规划过程
  * Define subproblem
  * Set the goal
  * Identify the recurrence -> make choice(binary/multi-way)
    * from small to large
    * init condition
  * Write pseudo-code
  * Analyze the time complexity
  * Extract the optimal solution
* 动态规划方法
  * top-down with memorization
  * bottom-up method
* 子问题图
  * vertex: number of subproblem
  * edge: choices to be considered

## 贪心算法

### 贪心模型

### 原理

* Greedy-Choice Property
  * Exchange Argument

# 其它

## 用于不相交集合的数据结构

## 矩阵计算