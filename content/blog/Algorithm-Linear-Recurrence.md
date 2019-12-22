---
title: Linear Recurrence
date: 2018-08-26
tags: [math, algorithm, oj]
---

# 常系数齐次线性递推式

快速幂: $O(k^3logn)$
黑科技：$O(klogklogn+k)$
虽然过了洛谷的数据，但是常数还没压下来，N=10^9,K=32000要3.5s。标程可以进1s。以后再压常数。

## 幻想三步走

设转移矩阵为A，初始值向量为v

<!--more-->

### 异想天开之空降序列

倘若我们捡到了一个序列c使得
$$A^n = \sum_{i=0}^{k-1}c_iA^i $$
你会发现两边都不同次。所以才叫“捡到的”。有了c，我们有：
$$v*A^n = v*\sum_{i=0}^{k-1}c_iA^i = \sum_{i=0}^{k-1}c_i*v_i$$
同时取向量的第一项：
$$Ans = \sum_{i=0}^{k-1}c_ia_i$$ 
其中$a_i$是第i项。
如此可O(k)求出Ans

### 奥秘重重之多项式取模

我们希望能够看到c的影子。先用多项式取模给$A^n$降降次：
$$A^n = Q(A)G(A) + R(A) = Q(A)G(A) + \sum_{i=0}^{k-1}A^i$$ 
这里，G是k次多项式。
倘若我们的运气足够好，选到了一个G使得G(A)=0，那么“空降序列”就可以通过多项式除法算出。于是目标变换为寻找序列g，使得
$$\sum_{i=0}^{k}g_iA^i = 0$$

### 伪·实在太烦之记住结论

前面的推导对所有矩阵都成立。但是序列g难找。对于本问题，有如下结论：
> 递推系数是$a_1,...,a_k$，则$g_k=1,g_{k-i}=-a_i$

### 昏睡数学之Cayley-Hamilton定理

记矩阵A的特征多项式为$g(\lambda)$则g(A)=0。  
故我们考察g的系数。  
结论：
$$g(\lambda)=(-1)^n(\lambda^n-\sum_{i=1}^{n}a_i\lambda^{n-i})$$

## 算法实现

需计算 $A^n mod G(x)$  
直接用多项式取模 $O(n\log n)$  
快速幂 $O(k\log k\log n)$

## Code

```C++
LL TG[MAXN],TR[MAXN];
void poly_mult_mod(int m, LL *A, LL *B,LL *MOD,int opt)
{
    opt = min(opt,m<<1);
    memset(TG,0,sizeof(TG)); memset(TR,0,sizeof(TR));
    poly_mult(m,m,A,B,A);
    if (opt>m){
        poly_div(opt,m,mod,A,MOD,TG,TR);
        for (int i=m;i<=m<<1;++i) A[i] = 0;
        for (int i=0;i<m;++i) A[i] = TR[i];
    }
}

//A^n % MOD
void poly_FM(LL *A,int n,LL *ans,LL *MOD,int m){
    for (int i=1;n;n>>=1,poly_mult_mod(m,A,A,MOD,2<<i),++i){
        if (n&1) poly_mult_mod(m,ans,A,MOD,m<<1);
        if((1<<(i-1))>=(m<<1))--i;
    }
}
```