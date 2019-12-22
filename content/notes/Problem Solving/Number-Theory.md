---
title: Number Theory
date: 2019-01-16
tags: [ps, math, notes]
---

## 背景知识

* 自然数的集合论定义：
  * $a^+:=a\cup\{a\}$
  * 归纳集
    * $\emptyset\in A$
    * $\forall a(a\in A\rightarrow a^+\in A)$
  * $\mathbb{N}$ 为所有归纳集之交
* Peano 结构
  * $e\in S$
  * $\forall a\in S,f(a)\in S$
  * $\forall b\in S,\forall c\in S,f(b)=f(c)\rightarrow b=c$
  * $\forall a\in S,f(a)\not= e$
  * $\forall A\subseteq S, (e\in A\wedge(\forall a\in A)(f(a)\in A))\rightarrow A=S$
* 良序公理与数学归纳法原理等价

## 数论基础

* 带余除法: $a=bq+r,b>0,0\leq r<b$
  * **存在性证明**：良序公理
  * **唯一性证明**
* 整除及其性质
  * $a|b,a|c\Rightarrow a|nb+mc$
* 最大公因子 (hcf/gcd)
  * 裴蜀定理：$\gcd(a,b)=ar+bs$
    * **证明**：良序公理+带余除法
  * Strong Duality for GCD: $\max\{d_i:d\in\mathbb{Z},d|a,d|b\}=\min\{ax+by:x\in\mathbb{Z},y\in\mathbb{Z},ax+by>0\}$
    * **证明**
      1. $d|s,s|d$
      2. Weak Duality + $\exists$
    * **唯一性证明**
  * $\text{lcm}(a,b)\gcd(a,b)=ab$
    * **证明**
      1. Isomorphism Theorem
      2. Unique Factorization
      3. $d|(a,b)\Leftrightarrow d|\frac{ab}{[a,b]}$
    * $(a,b,c)[a,b,c]=\frac{abc}{[(a,b),(b,c),(c,a)]}$
    * $[a,b,c]=\frac{abc(a,b,c)}{(a,b)(a,c)(b,c)}$
  * $\gcd(a,b,c)=\gcd(\gcd(a,b),c)$
* 质数
  * $\pi(x)\sim\frac{x}{\ln{x}}$
  * **无限质数证明**
    1. $P=p_1p_2\cdots p_n+1$
    2. Fermat Numer $F_n=2^{2^n}+1$ 两两互素
       * $F_n-2=\prod_{k=1}^{n-1}F_k$
    3. Mersenne Number $2^p-1$
       * $2^p\equiv 1\pmod{q}\Rightarrow p|q-1$
    * Dirichlet's Theorem: $\gcd(a,m)=1$ then there are infinitely many primes $p,p\equiv a\pmod{m}$
  * 筛法求素数
  * 算术基本定理
    * **存在性证明**：良序公理（找不满足中最小的）
    * **唯一性证明**：$1\rightarrow n$
* $\varphi(n)=n\prod_{p|n}(1-\frac{1}{p}),p$ is prime
  * $\varphi(p)=p-1$
  * $\varphi(n)>\frac{n}{e^\gamma\ln\ln n+\frac{3}{\ln\ln n}},\gamma=0.577$
* Additivie group module n: $(\mathbb{Z}_n,+_n)$
  * $\langle a\rangle=\langle (a,n)\rangle$
    * $|\langle a\rangle|=\frac{n}{(a,n)}$
* Multiplicative group module n: $(\mathbb{Z}_n^*,\cdot_n)$
  * $\text{ord}(a)$: the smallest possible integer that $a^{(t)}=e$
    * $\text{ord}(a)=|\langle a\rangle|$
    * Primitive root: $a,\text{ord}_m(a)=\varphi(m)$
      * Number: if exists, $\varphi(\varphi(m))$
  * Euler's Theorem: $a^\varphi(n)\equiv 1\pmod{n}$
    * Fermat's Theorem: $a^{p-1}\equiv1\pmod{p}$
  * Wilson Theorem: $(p-1)!\equiv -1\pmod{p}\iff p$ is prime
* quadratic residue
  * $a$ is quadratic residue $x^2=a\pmod{p}$ has a solution for $x$
  * $\frac{p-1}{2}$ quadratic residues for $p$
  * Legendre symbol $(\frac{a}{p})=1$ if $a$ is a quadratic residue otherwise $-1$
  * $(\frac{a}{p})\equiv a^{(p-1)/2}\pmod{p}$

### Modular linear equations

* $ax\equiv b\pmod{n}$
  * 有解：$d=\gcd(a,n)|b$
  * 求解：
    * $ax+bn=d$
    * $x_0=\frac{xb}{d}$
    * $x_1=x_0+i\frac{n}{d},i=0,\cdots,n-1$

### CRT (The Chinese remainder theorem)

* $n=n_1n_2\cdots n_k$, where $n_i$ are pairwise relatively prime, then we have mapping $a\leftrightarrow(a_1,a_2,\cdots,a_k)$, for $\cdot=+/-/*$, we have $(a\cdot b)\pmod{n}\leftrightarrow ((a_1\cdot b\pmod{n_1},\cdots,(a_k\cdot b_k)\pmod{n_k}))$
  * $\rightarrow$: direct
  * $\leftarrow$
    * $m_i=\frac{n}{n_i}$
    * $a\equiv(\sum_{i=1}^ka_im_i(m_i^{-1}\pmod{n_i}))\pmod{n}$
* 一般同余方程
  * 法一：
    * 有解：$a_i\equiv a_j \pmod{(n_i,n_j)}$
    * 先拆后合（相同或倍数）
    * $x\equiv a\pmod{n_i}\iff x\equiv C\pmod{[n_1,\cdots,n_k]}$
  * 法二：
    * 两两合并
* 简化计算：
  * $2^{300}\bmod 319$
  * $319=11*29$ + CRT

## 数论算法

* model: multplying two $\beta$-bit integers take $\Theta(\beta^2)$ bit operations

### Euclid Algorithm

```c
int ext_gcd(int a, int b, int &x, int &y){
    if (b==0) {
        x = 1; y = 0;
        return a;
    } else {
        int ret = ext_gcd(b,a%b,y,x);
        y -= x*(a/b);
        return ret;
    }
}
```

* $a>b\geq 1$ and Euclid(a,b) performs $k\geq 1$ recursive calls, then $a\geq F_{k+2},b\geq F_{k+1}$
  * **证明**：$a\geq b+(a\bmod b)$
  * Lame's Theorem: $k\geq 1,a>b\geq 1,b<F_{k+1}$ then Euclid makes fewer than $k$ recursive calls
  * $F_k\sim\frac{\phi^k}{\sqrt{5}},\phi=\frac{1+\sqrt{5}}{2}$
  * $O(\lg b)$

### Modular Exponentiation

```c
int fp(int a, int b, int mod){
    int c = 1;
    for (;b;b>>=1,a=1ll*a*a%mod)
        if (b&1) c=1ll*c*a%mod;
    return c%mod;
}
```

### Primality Testing

* trial division: $\Theta{\sqrt{n}}$
* Pseudoprimality testing:
  * base-$a$ pseudoprime: $a^{n-1}\equiv 1\pmod{n}$
  * Carmichael numbers: $\forall a\in\mathbb{Z}_n^*,a^{n-1}\equiv 1\pmod{n}$
  * Algorithm: return MODULAR-EXPONENTIATION(2,n-1,n)$\equiv 1\pmod{n}$
* Miller-Rabin randomized primality test
  * $x^2\equiv 1\pmod{p^e}$
  * $O(s\beta^3)$
  * $n$ is an odd composite number, then the number of witnesses to the compositeness of n is at least $\frac{n-1}{2}$
  * $P(\text{MILLER-RABIN errs})<2^{-s}$
  * $P(\text{prime}|\text{RETURN prime})>0.5$ if $s>\lg(\ln n-1)$
    * applicable: $s=50$

```c
LL multimod(LL a, LL b, LL mod) {
    a %= mod;
    b %= mod;
    LL res = 0;
    while (b) {
        if (b & 1) {
            res += a;
            if (res >= mod) res -= mod;
        }
        b >>= 1;
        a <<= 1;
        if (a >= mod) a -= mod;
    }
    return res;
}

bool witness(LL s, LL n) {
    LL u = n - 1, t = 0;
    while ((u & 1) == 0 && u != 0) u >>= 1, t++;
    LL x = fp(s, u, n), tmp;
    while (t--) {
        tmp = x;
        x = multimod(x, x, n);
        if (x == 1 && tmp != n - 1 && tmp != 1) return true;
    }

    if (x != 1)
        return true;
    else
        return false;
}

bool millerrabin(LL n, const int times = 3) {
    if (n == 2) return true;
    if ((n & 1) == 0 || n < 2) return false;
    int i = times;
    while (i--) {
        LL x = random(2, n - 1);
        if (witness(x, n)) return false;
    }
    return true;
}
```

### Integer factorization

* Trial division $R\rightarrow R^2$
* Pollard's rho heuristic $R\rightarrow R^4$
  * initial: $x_1=\text{random}(0,n-1),y=x_1,k=2$
  * Loop
    * $x_i=x_{i-1}^2\pmod{n}$
    * if $\gcd(y-x_i,n)\not=1/n$ finded
    * if $i==k$
      * $y=x_i$
      * $k=2k$

## Crypotography

### Private Key Crypotography

* affine cryptosystem: $f(p)=ap+b\pmod{n}$
* polyalphabetic crypotosystem
  * German ADFGVX Field Cipher
* Kerckhoffs's principle

### Public Key Crypotography

* $f^{-1}$ must be difficult to compute
* PKC
  * Self $P,D$
  * Others $P',D'$
  * Message $M$
  * 公钥加密
    * encoding with $P'$: $P'(M)$ -> send
    * receive -> decoding with $D'(P'(M))$
  * 数字签名
    * signing with $D$: $M'=M+D(M)$
    * (encrypt and) send -> receive (and decode)
    * verifying $M=P(D(M))$
* RSA
  * $n=pq$
  * $(E,\varphi(n))=1$
  * $DE\equiv 1\pmod{\varphi(n)}$
  * public: $(n,E)$
  * secret: $(n,D)$
  * encoding: $y=x^E\bmod n$
  * decoding: $x=y^D\bmod n$
* DH(Deffie-Hellman)
  * $a$: small prime
  * $p$: large prime
  * Agent a: $(X_a,Y_a=a^{X_a}\bmod p)$
  * Agent b: $(X_b,Y_b=a^{X_b}\bmod p)$
  * secret key: $K=Y_b^{X_a}\bmod p= Y_a^{X_b}\bmod p$
* Attack
  * Small $e$ Attack: $e=3,d$ obtained
    * Result: $p,q$ leaks
    * $ed=1+k\varphi(n),k\in\mathbb{Z},k<\min\{e,d\}$
  * Common Modulus Attack: $(e_i,e_j)=1$
    * Result: if message decoded both sent, original message can be recovered
    * $M=E^xF^y\pmod{n},e_1x+e_2y=1$