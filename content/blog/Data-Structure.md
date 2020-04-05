---
title: Data Structures
date: 2020-03-29
---

存储 $n$ 个数据，默认为最坏情况。遍历一般都是 $O(n)$

Average Time Complexity: averaged over all possible inputs

Expected Time Complexity: averaged over results given an adversarial input distribution

| Data Structures   | 插入                          | 查询                        | 删除                       | 空间         | 特性       |
| ----------------- | ----------------------------- | --------------------------- | -------------------------- | ------------ | ---------- |
| Array             | x                             | $O(n)$<br/>sort.$O(\log n)$ | x                          | $O(n)$       |            |
| ArrayList         | amortized.$O(1)$              | $O(n)$                      | $O(n)$                     | $O(n)$       |            |
| Stack/Queue/Deque | fixed.$O(1)$                  | $O(n)$                      | fixed.$O(1)$               | $O(n)$       |            |
| List              | $O(1)$                        | $O(n)$                      | $O(1)$                     | $O(n)$       |            |
| BST               | $O(n)$<br/>Ave.$O(\log n)$    | $O(n)$<br/>Ave.$O(\log n)$  | $O(n)$<br/>Ave.$O(\log n)$ | $O(n)$       |            |
| AVL/RBT           | $O(\log n)$                   | $O(\log n)$                 | $O(\log n)$                | $O(n)$       |            |
| Heap              | $O(\log n)$                   | $O(n)$<br/>max.$O(1)$       | $O(n)$                     | $O(n)$       |            |
| Treap             | $O(n)$<br/>Exp.$O(\log n)$    | $O(n)$<br/>Exp.$O(\log n)$  | $O(n)$<br/>Exp.$O(\log n)$ | $O(n)$       |            |
| HashTable         | $O(n)$<br/>Good Design.$O(1)$ | $O(1)$                      | $O(1)$                     | $O(n\log n)$ | Fixed Size |
| Universal Hash    | $O(1)$                        | $O(1)$                      | $O(1)$                     |

其它数据结构

- Union-Find Set: (path compression, rank)
  - Find: $O(\alpha(n))$
  - Union: $O(\alpha(n))$
