---
title: 算法程序设计与分析作业二
date: 2020-09-29
---

共 13 题。不会的题不要空着，展示一些思路，都有分的。

可以不抄题目，但请装订后上交。做的好的我用星（下次用 A）打了标记，很差的用 B 打标记（暂时没有）

4.7

最好情况：已经排序，比较 n-1 次

4.8

- (a) $n-1+\log_2[(n-1)!]=\Theta(n\log n)$
- (b) $\frac{(n-1)n}{2}$
- (d) 链表可以减少移动次数，但无法进行二分查找（不能直接索引）

4.9

平均复杂度变低（相同 key 取同一个）/ 渐进平均复杂度不变

4.11

时间复杂度 $\Theta(n^2)$，无垃圾回收空间复杂度 $\Theta(n^2)$，有垃圾回收 $\Theta(n)$

4.14

| before i | left-end | right-end | vacancy |
| -------- | -------- | --------- | ------- |
| 2        | low      | high      | left    |
| 3        | low      | high      | left    |
| 4        | low      | highVac   | right   |
| 5        | lowVac   | highVac   | left    |

4.15

比较了 $\frac{n(n-1)}{2}$ 次，移动了 0 次

4.22

时间复杂度最坏情况 $O(n^2)$，平均情况分析较为复杂，不能简单认为每次都能对半分

空间复杂度：根据书写的代码计算。使用 intList 时，若认为 intList.rest() 返回的是指针不占用新空间，则在有垃圾回收机制时为 $O(\log n)$

4.34

不是堆 5<7

4.35

小根堆：CIEOLMXPTF，比较次数 11 次（调用 fixheap 时，相邻子节点比较一次，再与父节点比较一次）

大根堆： YTXPOEMICL，比较次数 14 次

4.37

heapsort 实现 increasing order，不考虑其它技巧，应使用大根堆

- (a) 9 次
- (b) n-1 次
- (c) best case

4.39

（从 $n=2^k-1$ 的堆开始考虑）令 $k=\lfloor\log_2 n\rfloor$，高度之和为 $\sum_{i=0}^{k-1}i2^{k-1-i}=2^k-1-k\leq n-1$

4.42

- (a)(b) $h=6$，hstop 变化：$3\rightarrow 1\rightarrow 0$。与 $k$ 比较了 3 次，子节点互相比较了 6 次，共 9 次。
- (c) $2*\lfloor \log_2100\rfloor = 12$ 次

  4.43

(a) $8*2+4*2+2*4+1*4=36$ 次

(b) 这题精确计算较为复杂，可以只考虑特殊情况（$n=2^k-1$），且精确计算可以有向上向下取整的偏差

每次 fixHeapFast 时，先向下移动到 $\frac{h}{2}$，再向上 bubbleHeapUp 到原处。故比较次数约为 $h$

总比较次数约为 $\sum_{h=0}^{k-1}h2^{k-1-h}=2^k-1-k$ （可以是 $n-1$）

(c) Intermedia Case:

- Best Case 应该是折中后恰好能找到，高度为 $h$ 的子树调用 fixHeapFast 比较次数为 $\frac{h}{2}$
- Worst Case 是 increasing order，子节点比较 $h$ 次，判断是否需继续向下比较需 $\lg h$ 次，故高度为 $h$ 的子树调用 fixHeapFast 比较次数为 $h+\lg h$ 次
