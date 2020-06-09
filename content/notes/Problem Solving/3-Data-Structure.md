---
title: 数据结构
date: 2020-05-18
weight: 3
---

## Dynamic sets

- operations
  - Search(S, k)
  - Insert(S, x)
  - Delete(S, x)
  - Min/Max(S)
  - Successor(S, x)
  - Precessor(S, x)
- data structure augmentation
  - choose an underlying data structure
  - determine addtional information to maintain
  - verify it can be maintained
  - develop new operations

## 优先队列

- operation
  - Insert(S, x)
  - Max(S)
  - extract_max(S)
  - increase_key(S, x, k)
  - not good for Search

## 线性数据结构

- Stack
- Queue
- Linked list

## 堆

- property
  - max-heap property: A[Parent(i)]$\geq$A[i]
- procedure
  - max-heapify $O(\lg n)$
  - build-max-heap $O(n)$
  - max-heap-insert/extract/increase $O(\lg n)$

```python
def max_heapify(A, i):
    # l, r are already max-heaps
    l = 2 * i
    r = 2 * i + 1
    if l <= A.size and A[l] > A[i]:
        largest = l
    else:
        largest = i
    if r <= A.size and A[r] > A[largest]:
        largest = r
    if largest != i:
        swap(A[i], A[largest])
        mex_heapify(A, largest)
```

## 哈希表

- m slots store n elements
- hash function: simple uniform hashing
  - $h(k)=\lfloor km\rfloor$
  - $h(k)=k\bmod m$
  - $h(k)=\lfloor m(kA\bmod 1)\rceil$
  - universal hashing: $P(h(k)=h(l))\leq\frac{|\mathcal{H}|}{m}$
    - $h_{ab}(k)=((ak+b)\bmod p)\bmod m,\mathcal{H}=\{h_{ab}:a\in\mathbb{Z}^*_p,b\in\mathbb{Z}_p\}$
- collision resolution
  - chaining $O(1+\frac{n}{m})$ (worst case $\Theta(n)$)
  - open addressing
    - linear probing
    - quadratic probing: $h(k,i)=(h'(k)+c_1i+c_2i^2)\bmod m$
    - double hashing: $h(k,i)=(h_1(k)+ih_2(k))\bmod m$
- perfect hashing: two level hashing, $O(1)$

## 二叉搜索树

- property: left < root < right
- search, min/max, succ/pre: $O(h)$

```c++
void bst_insert(T, z){
  y = NULL
  x = T.root
  while (x){
    y = x;
    if z.key < x.key
      x = x.left
    else x = x.right
  }
  z.p = y;
  if (!y) T.root = z;
  else if (z.key < y.key) T.left = z;
  else y.right = z;
}
void bst_delete(T, z){
  if (!z.left) transplant(T, z, z.right);
  else if (!z.right) transplant(T, z, z.left);
  else {
    y = bst_min(z.right);
    if (y.parent != z){
      transplant(T, y, y.right);
      y.right = z.right;
      y.right.parent = y;
    }
    transplant(T, z, y);
    y.left = z.left;
    y.left.parent = y;
  }
}
```

- randomly built BST has expected $h=O(\lg n)$

## 红黑树

- $h\leq 2\log_2 (n+1)$
- red-black properties
  - node is red(R) or black(B)
  - root is black
  - leaf(NIL) is black
  - red node has black children
  - all simple paths from the node to descendant leaves contain the same number of black nodes
- rotation

```c++
void left_rotate(T, x){
  y = x.right;
  x.right = y.left;
  if y.left != T.nil
    y.left.p = x
  y.p = x.p
  if x.p == T.nil
    T.root = y
  else if x == x.p.left
    x.p.left = y
  else x.p.right = y
  y.left = x
  x.p = y
}
```

- Insertion: insert red + fixup(以下父亲为祖父左结点)
  - case1: uncle is red
  - case2: uncle is black and self is left
  - case3: uncle is black and self is right
- Delete: delete + (black) fixup
  - case1: sibling is red
  - case2: sibling black and has black children
  - case3: sibling black and has left red, right black
  - case4: sibling black and has right red
- order-static tree: maintain size
  - retrieve with a given rank $O(\lg n)$
  - determine rank $O(\lg n)$

## B 树

- $h\leq \log_t\frac{n+1}{2}$ with minimum degree $t\geq 2$ and $n$ keys
  - same examining times for keys
  - $\lg t$ less examining times for nodes
- properties
  - $k_1\leq x.k_1\leq k_2\leq \cdots\leq x.k_{x.n}\leq k_{x.n}$
  - All leaves have the same depth
  - Every node other than root has at least $t-1$ keys($t$ children). Every node may have at most $2t$ children. Root has at least 1 key.
- split: $O(t)$
- search/insert/delete: $O(th)$
- B+ tree: 索引仅出现在 leaf，容纳更多索引项

## Fibonacci 堆

- Mergeable heaps (amortized)
  - Insert $\Theta(1)$
  - Decrease $\Theta(1)$
  - Union $\Theta(1)$
  - Other same to heap
- Fibonacci heap: min-heap ordered (k-ary)
- $\Phi(H)=t(H)+2m(H)$
  - $t(H)$: number of trees
  - $m(H)$: number of marked nodes (lost a child since the last time it was made the child of another node)
- consolidate: $O(D(n))$
  - find two roots of same degree, link the more one to another, until every root has a distinct degree value
  - auxiliary array $A[0..D(H.n)]$
- $D(H)=\lfloor\log_\phi n\rfloor=O(\lg n)$
  - node with root degree $k$ has size $\geq F_{k+2}$

## van Emde Boas Tree (vEB tree)

- dynamic set with values from universe $\mathbb{Z}_u$
- direct addressing
  - insert, delete, member: $O(1)$
  - min/max, pre/succ: $\Theta(u)$
- superimposing a tree of constrant height: $O(\sqrt{u})$
- shrink with $\sqrt{u}$ gets $O(\lg\lg n)$ (shrink with $2$ gets $O(\lg n)$)
  - $T(n)=T(\sqrt{n})+O(1)$ yields $T(n)=O(\lg\lg n)$
  - $T(n)=2T(\sqrt{n})+O(1)$ yields $T(n)=O(\lg n\lg\lg n)$
- vEB node
  - u: number of elements
  - min, max
  - summary: point to a vEB($\sqrt{u}$) node keeping bit vector
  - cluster: point to $\sqrt{u}$ vEB($\sqrt{u}$)
- vEB tree
  - create empty tree: $O(u)$
  - operations: $O(\lg \lg n)$
  - space: $O(u)$

## 并查集

- linked-list: $\Theta(n^2)$ for union
- Disjoint-set forests: $O(m\alpha(n)),\alpha(7)=2,\alpha(2047)=3,\alpha(16^{512})=4$
  - union by rank
  - path compression

## TBD

- 可持久
- AVL
- Treaps
- 线段树
- Dynamic trees
- Splay trees
