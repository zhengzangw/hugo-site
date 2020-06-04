---
title: 排序与数字统计
date: 2020-05-18
weight: 2
---

## 排序

### 插入排序

```cpp
for (int j=2; j<A.size(); ++j){
    auto key = A[j];
    for (int i = j-1; i>0 && A[i]>key; --i)
        A[i + 1] = A[i];
    A[i + 1] = key;
}
```

- 循环不变量：每次循环开始前，子数组 A[1..j-1] 有序
- worst: $\Theta(n^2)$
- average: $\Theta(n^2)$

### 归并排序

```cpp
void merge_sort(vector<int>& A, int l, int r){
    if (l < r){
        int mid = (l+r)/2;
        merge_sort(vector<int>& A, l, mid);
        merge_sort(vector<int>& A, mid, r);
        merge(A, l, mid, r); // O(r-l)
    }
}
```

- worst case: $\Theta(n\lg n)$
- avaerage case: $\Theta(n\lg n)$

### 堆排序

```python
build_max_heap(A)
for i in range(A.length, 1, -1):
    swap(A[1], A[i])
    A.size -= 1
    max_heapify(A, 1)
```

- worst case: $O(n\lg n)$
- not stable

### 快速排序

```python
def partition(A, p, r):
    x = A[r]
    while (1):
        while (a[i] < x) i+=1
        while (a[j] > x) j-=1
        if (i>=j) break
        swap(a[i], a[j])
    swap(A[r], A[j])
    return j

def quicksort(A, p, r):
    if p<r:
        q = Partition(A, p, r)
        quicksort(A, p, q-1)
        quicksort(A, q+1, r)
```

- worst case: $\Theta(n^2)$
- average: any split of constant yields $O(n\lg n)$
- expected: $\Theta(n\lg n)$
  - $X_{ij}=[z_i \text{ compared to } z_j]$
  - $P(z_i \text{ compared to } z_j)=\frac{2}{j-i+1}$
- not stable

### 线性排序

- Counting sort: $\Theta(k+n)$ (range 0 to k)
- Radix sort: $\Theta(d(n+k))$ (d digits up to k values)
- Bucket sort: worst $\Theta(n^2)$, average $O(n)$ (distributed uniformly and independently over [0,1))

## Order statics

### 快排修改

```python
def random_select(A, p, r, i):
    if p==r:
        return A[p]
    q = random_partion(A, p, r)
    k = q - p + 1
    if i==k:
        return A[q]
    elif i<k:
        return random_select(A,p,q-1,i)
    else
        return random_select(A,q+1,r,i-k)
```

- worst: $\Theta(n^2)$
- expected: $O(n)$
  - $X_k = [|A[p..q]|=k]$

### 方法二

```python
def select(A, p, r, i):
    if p==r:
        return A[p]
    # Get divide point
    A_m = []
    for i in range(p, r, 5):
        A_m += [median(A, p, r)]
    q = select(A_m, 0, len(A_m), (r-q+1)/2)
    # Partiion on q
    k = partion_on_q(A, p, r, q)
    if i == k:
        return x
    elif i < k:
        select(A, p, k-1, i)
    else:
        select(A, k+1, r, i-k)
```

- worst: $O(n)$
  - $T(n)\leq T(\lceil\frac{n}{5}\rceil)+T(3(\lceil\frac{1}{2}\lceil\frac{n}{5}\rceil\rceil - 2))+ O(n)$
