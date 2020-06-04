---
title: 算法设计
date: 2020-05-18
weight: 4
---

## brute-force

- 枚举：遍历解空间
- 倍增：保存 $2^i$ 处的解用于构造所有情况
- 递归：原问题划归到一个子问题
- 搜索：建立树/图模型，以一定次序穷举
- 模拟
- 剪枝：利用数学性质缩小解空间
- 前缀和、差分
- 打表：将不同问题的解储存

## Divide and Conquer

### 分治法

```python
def Divide_and_Conquer(A):
  if (smallenough) return Conquer()
  Divide_and_Conquer(A_left)
  Divide_and_Conquer(A_right)
  Merge(A_left, A_right)
```

Examples:

- 归并排序： $T(n)=2T(n/2)+\Theta(n)$
- 快速排序：
- 和最大子数组： $T(n)=2T(n/2)+\Theta(n)$
- 矩阵乘法：$T(n)=8T(n/2)+\Theta(n^2)$
- strassen's algorithm: $T(n)=7T(n/2)+\Theta(n^2)$

### 二分法

- 无 merge 的分治法
- 问题已有序关系

```c++
// 左闭右闭
int i_left = 0, i_right = len;
while (i_left <= i_right){
  int i = (i_left + i_right)/2;
  if (isleft(i_left, i)) // do something
  else if (isright(i, i_right)) // do somethin
  else // do something
}
```

## 动态规划

- 子问题图：顶点为子问题，边为可能选择
- 实现方法
  - top-down with memorization（记忆化搜索）
  - bottom-up method
- 动态规划过程
  - Define structure of subproblem
  - Set the goal
  - Identify the recurrence -> make choice(binary/multi-way)
    - from small to large
    - init condition
  - Write pseudo-code
  - Analyze the time complexity
  - Extract the optimal solution
- optimal substructure: 问题的最优解由子问题的最优解组合而成，而这些子问题可以独立求解
  - make a decision
  - 子问题无关
  - cut-and-paste: 任意其它子问题的方案可被最优方案替代
- overlapping subproblem: 问题的递归算法会反复地求解相同的子问题

Examples:

- 1D subproblem (array,sequence,string->prefix/suffix,O(n))
  - Rod cutting：$f(n)=\max_{1\leq i\leq n}(p_i+f(n-i))$
  - Longest increasing subsequence：$L(n)=1+\max_{j<i\wedge A[j]\leq A[i]}L(j)$
    - $E(l)=\min(ending), O(nlogn)$
  - Printing Neatly
- 2D subproblem
  - Edit distance
  - Longest common subsequence
  - Matrix chain multiplication: $f(i,j)=\min_{i\leq k<j}(f(i,k)+f(k,j)+p_{i-1}p_kp_j)$
  - Optimal BST: $\min_{i\leq r\leq j}\{e[i,r-1]+e[r+1,j]+w(i,j)\}$
  - Knapsack Problem
- 3D subproblem
  - Floyed-Warshall algorithm
- Graph
  - rooted subtrees
  - nodes after/before in the topo order

### 优化

- 空间优化：高维动归，通过改变求解问题次序，减少空间

## 贪心

- optimal substructure
  - by greedy, only one subproblem remains
- Greedy-Choice Property: 最优解可通过局部最优解构建（存在一种最优的划分子问题方案）
  - Exchange Argument
- Matroid: $M=(S,I)$
  - Definition
    - finite $S$, $I\subseteq \rho(S)$
    - hereditary $I$: $B\in I,A\subset B,A\in I$
    - exchange property: $A,B\in I,|A|< |B|,\exists x\in B-A,A\cup\{x\}\in I$
  - extension of $A$: $A\cup\{x\}\in I$
  - maximal: no extensions
  - weighted: $w(A)=\sum_{x\in A}\omega(x)$
- Finding maximum-weight independent subset in a weighted matroid
  - define independent

```python
def greedy(M, w)
  A = set()
  sort(M.S, key=w) # O(nlgn)
  for x in M.S:
    if A + {x} in M.I: # O(f(n))
      A += {x}
  return A
```

Examples:

- activity-selection problem
- fractional knapsack problem
- huffman codes
- scheduling unit-time tasks with deadline and penalties for a single processor
