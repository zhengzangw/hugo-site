---
title: 算法程序设计与分析作业五
date: 2020-10-26
---

## 10-19

### 6.1

空间上消耗可能增多，时间上摊还复杂度低（$1+\frac{4}{3}t$）。两种方法视实际情况需要使用。

### 6.2

应该使用[均摊分析](https://zhuanlan.zhihu.com/p/87355970)（有些同学写了平均分析，实际给的是一种特殊情况下的时间开销）

根据书中的 accounting scheme，在无 shrink 的情况下，push 的 amortized cost 为 $1+2t$，pop 的 amortized cost 为 $1$。这道题的处理关键在于要考虑 pop 操作的 credit

- (a) 取临界情况（栈大小 $n$，$n-1$ 次 push 后反复 push + pop）可知均摊时间复杂度非常数（均摊分析也是在最坏情况下的分析）
- (b) push: $1+2t$, pop: $1+t$

  考虑已扩展到 $4N$ 的情况

  - $2N\sim 4N$: push 的 accounting 足够
  - $N\sim2N$: push 的 accounting 保证下一次 push 时 credit 为正，pop 累积有 $Nt$ 的 accounting 用于 shrink

- (c) push: $1+2t$, pop: $1$

  与 (b) 不同在于此时可以借用 $N\sim 2N$ 间 push 的 accounting 用于 shrink

- (d) 仿照 6.1 以空间换时间，用更小的比例即可

## 10-22

### 6.21

可以考虑最坏情况，$n-1$ (Union) + $(m-n+1)n$ (Find) $\leq mn+n$

### 6.22

- (a) 略
- (b) 不同，举反例即可
- (c) $O(n+m\log n)$

### 6.23

略

### 6.24

略
