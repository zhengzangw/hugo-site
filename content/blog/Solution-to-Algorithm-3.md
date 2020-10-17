---
title: 算法程序设计与分析作业三
date: 2020-10-16
---

## 9-24

4.2

- (a) $\frac{1}{2}n(n-1)$, decreasing sequence
- (b) increasing, $n-1$

4.3

- (a) 用循环不变式证明 （$E[j]$ is the maximum in $[0,j]$)
- (b) 略

4.4

- (a) 可利用 4.3(a) 的循环不变式证明
- 略
- 不影响

4.23

注意需使用 Section 2.3.2 的数据结构

4.27

- (a) 可以使用两个数组 $A,B$，基于归并时处于归并树结点深度的奇偶性，奇数时保存到 $A$，偶数时保存到 $B$（滚动数组）
- (b) $n\log n$

4.28

找中点：设置两个指针，一个步长为 1， 一个步长为 2，当快指针到达尾结点时，慢指针指向中间结点。该时间复杂度为 $O(n)$。由于 merge 也是 $O(n)$，时间复杂度不变为 $O(n\log n)$。空间复杂度 $O(n\log n)$，有 garbage collection 为 $O(n)$

## 9-28

1.27

$n\leq 25$ 算法一快

1.28

略

1.31

用符号之前应说明一下，$<$ 和 $=$ 都是在渐进复杂度关系下比较。最后一项可查阅斯特林公式

$\lg\lg n<\lg n=\ln n<(\lg n)^2<\sqrt{n}<n<n\lg n<n^{1+\epsilon}<n^2=n^2+\lg n<n^3<n-n^3+7n^5<2^{n-1}=2^n<e^n=n!$

1.32

反例：$2^n,n!$

1.33

证明思路：$\forall f\in o(f),f\in O(f)-\Theta(f)$ and $\forall f\in O(f)-\Theta(f),f\in o(f)$

3.7

- (a) $O(n\log n)$
- (b) $M(n)=n\log_2n-n+1$

3.8

$O(n)$

3.10

Tips: 部分使用 Master Theorem 更加简单，但要相差至少 $n^{\epsilon}$ 才能用

- (a) $O(\lg^2 n)$
- (b) $O(n)$
- (c) $O(n\lg n)$
- (d) $O(n(\lg n)^2)$
- (e) $O(n^2)$

大整数乘法

$T(n)=3T(\frac{m}{2})$，$T(n)=O(n^{\log_23})$

## 9-30

6.3

略

6.7

破坏黑高

6.8

略

6.9

15 个节点高位 4 的满二叉树

例：8 4 12 14 10 6 2 15 13 11 9 7 5 3 1
