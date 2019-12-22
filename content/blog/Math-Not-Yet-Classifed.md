---
title: Math 未分类
date: 2018-11-15
tags: [math, physics, cs, notes]
---

# 特殊函数

## Gamma Function

* Gamma Function: $\Gamma(x)=\int^\infty_0e^{-t}t^{x-1}dt$
* 性质
  * $\Gamma(x+1)=x\Gamma(x)$
  * $\Gamma(n+1)=n!$
  * $\Gamma(\frac{1}{2})=\sqrt{\pi}$
  * $\Gamma(n+\frac{1}{2})=\frac{\sqrt\pi}{2^n}(2n-1)!!$
  * $\Gamma(\frac{1}{2}-n)=(-1)^n\frac{2^n\sqrt{\pi}}{(2n-1)}!!$
* $I_n=\int^\infty_0x^ne^{-x^2}dx=\frac{1}{2}\Gamma(\frac{n+1}{2})$
* Guassian Integral: $\int_{-\infty}^{\infty}ae^{\frac{-(x-b)^2}{c^2}}=ac\sqrt{\pi}$

<!--more-->

## Riemann Zeta Function

* $\zeta(z)=\sum_{n=1}^{\infty}\frac{1}{n^z}, Re(z)>1$
* $\zeta(z)=\frac{1}{1-2^{1-z}}\sum_{n=1}^\infty(-1)^{n+1}\frac{1}{n^z}, Re(z)>0$
* $\int^\infty_0\frac{x^{z-1}}{e^x\pm0}dx=\Gamma(z),z>1$
* $\int^\infty_0\frac{x^{z-1}}{e^x-1}dx=\Gamma(z)\zeta(z),z>1$ 
* $\int^\infty_0\frac{x^{z-1}}{e^x+1}dx=(1-2^{1-z})\Gamma(z)\zeta(z),z>0$
* $\zeta(0)=-\frac{1}{2}$
* $\zeta(2)=\frac{\pi^2}{6}$

# 等价类

* disjoint union: $\bigsqcup$
* Cartesian product: $A\times B = \{(a,b)|a\in A,b\in B\}$
* Equivalence relation:
  * $a\in A\rightarrow a\sim a$
  * $a\sim b\rightarrow b\sim a$
  * $a\sim b, b\sim c\rightarrow a\sim c$
* Equivalence class: $[a]=\{b\in A|b\sim a\}$, $A=\bigsqcup_{a\in A}[a]$


# 区间互素

对于a，在区间(1,n)中有多少与其互素的数？

令$A_i$表示(1..n)中素因子$p_i$的倍数。不互素的数即为$| \cup_iA_i |$

使用mask穷举所有可能，使用唯一1串判断存在元素

## 关键代码

```C++
    LL work(int a,int n){
        split(a,prime_of_n,len);
        LL mask = 1<<len,ans=0;
        for (int i=1;i<mask;++i){
            LL cnt =0, v=1;
            for (int j=0;j<len;++j)
                if (i&(1<<j)){
                    cnt ++;
                    v *= prime_of_n[j+1];
                }
            if (cnt&1) ans+=n/v;
            else ans-=n/v;
        }
        return n-ans;
    }
```

## 莫比乌斯反演

令f(k)= Num(gcd(x,y)==k),F(k) = Num(k|gcd(x,y)) = [A/d]*[B/d]
F(k) = $\sum_{k|d}f(d)$
得 f(k) = $\sum_{k|d}\mu(d/k)F(d)$

### 关键代码

```C++
    for (int i=1;i<=b;++i) ans += (LL)mu[i] * (b/i) * (d/i);
```

# 不定方程的解

$$x_1+x_2+...+x_n = m$$

## 正整数解

$$C_{m-1}^{n-1}$$

## 非负整数

$$C_{m+n-1}^{n-1}$$

## 最小限制

$$C_{m+n-\sum_{i=1}^{n}a_i-1}^{n-1}$$

## 最大限制

当$b_i>=m-n+1$时，解数为
$$C_{m-1}^{n-1}$$
当$b_i<=m-n$时，解数为
$$C_{n+m+\sum_{i=1}^{n-1}b_i-1}^{n-1}$$

# 最大值

* 无穷大: 0x7fffffff 32-bit int 最大值 2147483647 1e9
* 大值: 0x3f3f3f3f 1061109567 1e9
* 赋值无穷大: memset(a,0x3f,sizeof(a))

# 生成函数

称函数$G(x) = a_0 + a_1x + a_2x + ...$ 为数列$\{a_n\}$的生成函数。

## 用途

* 把组合问题的加法法则和幂级数的乘幂对应起来

通用表达式为

<!--more-->

$$(x^{v[0]*n1[0]}+x^{v[0]*(n_1[0]+1)}+x^{v[0]*(n_1[0]+2)}+...+x^{v[0]*n_2[0])}$$
$$(x^{v[1]*n1[1]}+x^{v[1]*(n_1[1]+1)}+x^{v[1]*(n_1[1]+2)}+...+x^{v[1]*n_2[1])}$$
$$...$$
$$(x^{v[K]*n1[K]}+x^{v[K]*(n_1[K]+1)}+x^{v[K]*(n_1[K]+2)}+...+x^{v[K]*n_2[K])}$$

$K$对应具体问题中物品的种类数。  
$v[i]$表示该乘积表达式第i个因子的权重，对应于具体问题的每个物品的价值或者权重。  
$n_1[i]$表示该乘积表达式第i个因子的起始系数，对应于具体问题中的每个物品的最少个数，即最少要取多少个。  
$n_2[i]$表示该乘积表达式第i个因子的终止系数，对应于具体问题中的每个物品的最多个数，即最多要取多少个。  
系数1表示方案的贡献数

## 多项式与生成函数

多项式可以看作是一个在其次数模意义下的生成函数。数列的卷积可以看作是多项式的乘法，继而使用多项式求逆等算法。

# 积性函数

1. [n/ab] = [[n/a]/n]; [n/ab] = [[n/a]/n]
2. [n/i] 只有$O(\sqrt{n})$种取值
3. 狄利克雷卷积 $f*g$
4. 积性函数
$e(x); I(x); id(x); \phi(x)$; $\mu(x)$  
$f_k(x) = \prod_ip_i^{[\frac{a_i}{k}]}$

<!--more-->

## 积性函数求值

1. 满足$i<n,gcd(i,n)=d$的i共$\phi(n/i)$个
2. 利用质因数分解，f(p^k)求f(n)
3. 利用狄利克雷卷积的交换律和结合律化简
4. 积性函数前缀和：在欧拉筛过程中推出*O(n)求积性函数点值*

## 低于线性时间求和

1. [n/i] 只有$O(\sqrt{n})$种取值 （两个数组，一个存f(1)-f($\sqrt n$),一个存f(n/1)-f(n/$\sqrt n$)）
以下为O($\sqrt n$)的穷举
    for (int i=2;i<=n;i=j+1){
        j = n/(n/i);
    }

<!--more-->

# 莫比乌斯反演

## ****莫比乌斯函数与容斥原理

* $I*\phi = id$
* $I*\mu = e$
* $\mu * (1/n) = \phi/n$
* $F = I*f \rightarrow f = \mu*F$
* $I * f = \sum_{d|n}f(d)$
* $\phi = I*\mu * \phi = \sum_{d|n}(\mu*\phi)$
* $\sum_{d|gcd(a,b)} = \sum_{d|a,d|b}$

# 杜教筛

求$S(n) = \sum_{i=1}^{n}f(i)$  
性质：h=f\*g,则$\sum_{i=1}^{n}h(i)=\sum_i^ng(i)S([n/i])$  
得: g(1)S(n) = $\sum_{i=1}^nh(i)-\sum_2^ng(i)S([n/i])$  
O(1)计算g(i)前缀和，O($\sqrt n$)计算$\sum_{i=1}^nh(i)$,时间复杂度为O($n^\frac{3}{4}$)。  
若f为积性函数，先用欧拉筛求出前$n^\frac{2}{3}$项，更后面的项再递归。*O($n^\frac{2}{3}$)求积性函数前缀和*

## 积性函数的情况

1. 莫比乌斯函数
2. 欧拉函数

# Extended Eratosthenes Sieve （或洲阁筛）

求$S(n) = \sum_{i=1}^{n}f(i)$, f(p)为关于p的多项式。*O($\frac{n^\frac{3}{4}}{logn}$)求积性函数前缀和*

和分两部分，是否有>$\sqrt n$的质因子
$\sum_{i=1}^{n}F(i) = \sum_{1<=1<=n\\no\ factors>\sqrt n}F(i)(1+\sum_{\sqrt n<=j<=[\frac{n}{i}]\\j\ is\ prime}F(j)$

## 第一部分

$g_k(i,j)$: 前i个质数互质的数的k次幂和
$g_k(i,j)=g_k(i-1,j)-p^kg_k(i-1,[\frac{j}{p_i}])$
当$p_i^2>j$时,$g_k(i,j)=g_k(i-1,j)-p^k$

## 第二部分

f(i,j): 小于$\sqrt n$的后i个质数的和
$f(i,j)=f(i-1,j)+\sum_{c>=1}F(p_i^c)f(i-1,[\frac{j}{p_i^c}])$
当$p_i^2>j$时，$f(i,j)=f(i-1,j)+F(p_i)$

# rng58-clj等式

d(x)为x的约数个数
$$\sum_{i=1}^{a}\sum_{j=1}^{b}\sum_{k=1}^{c}d(ijk)=\sum_{gdc(i,j)=gcd(i,k)=gcd(j,k)=1}[\frac{a}{i}][\frac{b}{j}][\frac{c}{k}]$$

# Lucas Theorem

$$\binom{n}{m} = \prod\binom{n_i}{m_i} (mod\ p)$$
where $n = \sum_{k=0}^{k} n_kp^k$ and $m = \sum_{k=0}^{k} m_kp^k$
If $n_i<m_i$, $\binom{n_i}{m_i}$ = 0

## Proof

### Lemma

For prime m and n, if 1<=m<=n-1, n|$\binom{n}{m}$

Thus $(1+x)^p = 1+x^p (mod\ p)$

With induction:
Suppose $(1+x)^{p^i} = 1 + x^{p^i} (mod\ p)$ for i<=t then,
$(1+x)^{p^{t+1}} = (1+x^{p^i})^p = 1 + x^{p^{t+1}} (mod\ p)$

So $(1+X)^{p^i} = 1+X^{p^i} (mod\ p)$

### Theorem

$$\sum_{n=0}^{m}\binom{m}{n}x^n \\= (1+x)^m = \prod_{i=1}^{k}((1+x)^{p^i})^{m_i} \\= \prod_{i=1}^{k} (1+x^{p^i})^{m_i} \\= \prod_{i=1}^{k}(\sum_{n_i=0}^{m_i}\binom{m_i}{n_i}x^{n_ip^i}) = \prod_{i=1}^{k}(\sum_{n_i=0}^{p-1}\binom{m_i}{n_i}x^{n_ip^i}) \\= \sum_{n=0}^{m}(\prod_{i=0}^{k}\binom{m_i}{n_i})x^n$$

## Algorithm

$O(log_pN)$

## Code

```C++
//O(log_p n) C_n^m
LL lucas(LL n,LL m,LL mod){
    //mod is prime
    if (n<m) return 0;
    else if (n<p) return md(md(fac[n]*inv_fac[m])*inv_fac[n-m]);
    else return md(1ll*lucas(n/mod,m/mod,mod)*lucas(n%mod,m%mod,mod));
}
```

# 逆元线性递推

$[\frac{p}{i}]*i+(p\%i) = 0 (\bmod p)\Rightarrow i^{-1} = -[\frac{p}{i}]*inv(p\%i) (\bmod p)$

## proximal mapping

* $\text{prox}_f(x)=\arg\min_{y\in U} f(y)+\frac{1}{2}||y-x||^2$

<!--more-->

## proximal gradient

* $\min f(x)=g(x)+h(x)$, $g(x)$ 凸且可导，$h(x)$ 可得 proximal 迭代算法， $x^k=\text{prox}_{t_kh}(x^{k-1}-t_k\nabla g(x^{k-1}))$