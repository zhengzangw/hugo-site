---
title: FFT
date: 2018-08-20
tags: [math, algorithm]
---

迭代实现，计算卷积。

<!--more-->

```C++
void FFT(int limit, complex *a, int type)
{
  complex x, y;
  for (int i = 0; i < limit; ++i)
    if (i < r[i])
      std::swap(a[i], a[r[i]]);
  for (int mid = 1; mid < limit; mid <<= 1)
  {
    complex Wn(cos(pi / mid), type * sin(pi / mid)), x, y;
    for (int j = 0; j < limit; j += (mid << 1))
    {
      complex w(1, 0);
      for (int k = 0; k < mid; ++k, w = w * Wn)
      {
        x = a[j + k];
        y = w * a[j + mid + k];
        a[j + k] = x + y;
        a[j + mid + k] = x - y;
      }
    }
  }
}

void polymulti(int n, int m, complex F[], complex G[])
{
  int limit, i,len;
  for (limit = 1,len = 0; limit <= n + m; limit <<= 1, ++len)
    ;
  for (i = 0; i < limit; ++i)
    r[i] = (r[i >> 1] >> 1) | ((i & 1) << (len - 1)); //二进制反转
  FFT(limit, F, 1);
  FFT(limit, G, 1);
  for (int i = 0; i < limit; ++i)
    F[i] = F[i] * G[i];
  FFT(limit, F, -1);
  for (i = 0; i <= n + m; ++i)
    F[i].x = (int)(F[i].x / limit + 0.5);
}
```

# NTT

模意义下运算

```C++
//998244353 = 119*2^23 + 1; g = 3;
//1004535809 = 479*2^21 + 1; g = 3;
//2281701377 = 17*2^27 + 1; g = 3;
const int P = 998244353, G = 3, Gni = 332748118;
```

加const不加const 速度两个级别。原因未知。

# 分治FFT

cdq + FFT
cdq框架

```C++
void cdq(l,r){
    cdq(l,mid);
    add effect of l--mid to mid+1--r
    cdq(mid+1,r)
}
```

# 任意模数NTT（MTT）

设模mod  
数范围m，数长度n，最大值为$nm^2$。取三个（或多个）素数乘积大于该值，再在模意义下利用中国剩余定理求解。  
为防止精度爆炸，求解三项CRT时使用如下技巧：  
$$Ans = kM+A = xm_3+a_3$$
$$kM = a_3-A (mod m_3)$$
$$k = （a_3-A）M^{-1} (m_3)$$
继而在mod意义下计算kM+A即可  
非素数模求逆不能用快速幂  
注意：使用快乘

# KWT

构造FWT(A)使FWT(A@B) = FWT(A)*FWT(B)

## xor

$$A@B = (A_0@B_0+A_1@B_1,A_1@B_0+A_0@B_1)$$
$$FWT(A) = (FWT(A_0+A_1),FWT(A_0-A_1))$$
$$DWT(A) = (DWT((A_0+A_1)/2),DWT((A_0-A_1)/2)))$$

## and

$$A@B = (A_0@B0+A_0@B_1+A_1@B_0,A_1@B_1)$$
$$FWT(A) = (FWT(A_0+A_1),FWT(A_1))$$
$$DWT(A) = (DWT(A_0-A_1),DWT(A_1))$$

## or

$$A@B = (A_0@B_0,A_0@B_1+A_1@B_0+A_1@B_1)$$
$$FWT(A) = (FWT(A_0),FWT(A_0+A_1))$$
$$DWT(A) = (DWT(A_0),DWT(A_1-A_0))$$

# KMT

利用子集和变换及其逆变换，直接相乘  
DPi(x) 为只考虑前x位的子集得到的变换  
若DPi(x+1) = DPi(x) + DPi(x\{i})  

集合意义下：
$$f_{S\cup\{i\}}^i = f_S^{i-1} + f_{S\cup\{i\}}^{i-1}$$

### and

```C++
for (int i = 0; i < n; ++i)
  for (int j = 0; j < 1 << n; j++)
    if (j >> i & 1)
      a[j] = md(a[j] + a[j ^ (1 << i)] * (type == 1 ? 1 : -1));
```

### or

```C++
for (int i=0;i<n;++i)
  for (int j=0;j<1<<n;j++)
    if (j>>i&1)
        a[j] = md(a[j]+a[j^(1<<i)]*(type==1?1:-1));
```

# 卡常技巧

* IO优化
* inline
* 取模优化

```C++
  inline int inc(int x,int v,int mod){x+=v;return x>=mod?x-mod:x;} //代替取模+
  inline int dec(int x,int v,int mod){x-=v;return x<0?x+mod:x;} //代替取模-
```

* 前置++
* bool改char
* ()?():()快于if()else
* ,快于;
* 数组在用方括号时做了一次加法才能取地址
* **多维数组大数在前**: int f[10000][1000][100]
* int 快于 long long
* STL常数可能大
* memset快
* strlen O(L)
* 位运算

# 多项式求逆

## 要求

求n-1次多项式F关于模$x^{n}$的逆$F^{-1}$

<!--more-->

## 推导

$h(x)f(x)=1 (x^n)$  
$h(x)f(x)-1 = 0 (x^n)$  
$h^2(x)f^2(x)-2*h(x)*f(x)+1 = 0 (x^{2n})$  
$h^2(x)f(x)-2h(x)+g(x) = 0 (x^{2n})$  
$g(x) = 2h(x)-h^2(x)f(x) = h(x)(2-h(x)f(x)) (x^{2n})$

### 算法

利用递归+FFT  
也可不用递归，使用递推

# 多项式除法

$$A_R(x) = x^nA(\frac{1}{x})$$
两函数满足：$A_R[i] = A[n-i]$

推导：
$$F(x) = Q(x)*G(x) + R(x)$$
$$x^nF(\frac{1}{x}) = x^{n-m}Q(\frac{1}{x})*x^mG(\frac{1}{x})+ x^{n-m+1}x^{m-1}R)\frac{1}{x})$$
$$F_R(x)=Q_R(x)*G_R(x)+x^{n-m+1}*R_R(x) (mod\ x^{n-m+1})$$
$$Q_R(x) = F_R(x)*G_R^{-1}(x) (mod x^{n-m+1})$$

继而，
$$R(x) = F(x) - G(x)*Q(x)$$

## 核心代码

```C++
//多项式除法
//O(nlogn) F(x) = Q(x)G(x) + R(x) n = m*(n-m) + (m-1)
LL G_R[MAXN],G_R_inv[MAXN],F_R[MAXN],Q_R[MAXN],G_Q[MAXN];
void poly_div(int n,int m,int mod,LL F[],LL G[],LL Q[],LL R[]){
    for (int i=0;i<=m;++i) G_R[i] = G[m-i];
    for (int i=n-m+1;i<=n;++i) G_R[i] = 0;
    poly_inv(G_R, n-m+1, mod, G_R_inv);
    for (int i=0;i<=n-m;++i) F_R[i] = F[n-i];
    poly_mult(n-m, n-m, F_R, G_R_inv, Q_R);
    for (int i=0;i<=n-m;++i) Q[i] = Q_R[n-m-i];
    poly_mult(m,n-m,G,Q,G_Q);
    for (int i=0;i<=n;++i) R[i] = md(F[i] - G_Q[i]);
}
```