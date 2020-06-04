---
title: Monte Carlo Integration
date: 2020-05-11
weight: 7
---

## 数值积分

- Limitation
  - 对于 $d$ 维函数 $f$，一维情况下 $O(n^{-r})$ 收敛，则高维仅 $O(n^{-\frac{r}{s}})$ 收敛
  - 不连续：$O(n^{-\frac{r}{s}})$
- Monte Carlo Method: $\int_0^1f(x)dx =\frac{1}{N}\sum_{i=1}^Nf(x_i)$
  - Adavantage
    - Easy to implement
    - Robust
    - efficient for high dimensional integrals
  - Disadvantages
    - noisy: 按概率采样
    - slow
- Monte Carlo estimator: $F_N=\frac{b-a}{N}\sum_{i=1}^Nf(X_i)$
  - $E[F_N]=\int_a^bf(x)dx$
- sample
  - $F_N=\frac{1}{N}\sum_{i=1}^N\frac{f(X_i)}{p(X_i)}$
  - 最理想：$p(x)=\frac{f(x)}{\int f(x)dx}$
- 采样
  - inversion
    - 求 CDF
    - 逆函数 CDF$^{-1}$
    - 均匀采样
  - rejection
    - accept $U_1$ if $U_2<f(U_1)$
    - 一般方法
      - find $q(x)$, $p(x)<Mq(x)$
      - Dart throwing $\xi < p(X)/Mq(X)$
    - efficiency = area / area of rectangle
  - transform
    - $Y=y(X)$
    - $P_y(y(x))=P_x(x)$
    - $p_y(y)=(\frac{dy}{dx})^{-1}p_x(x)$
    - $p_y(T(x))=|J_T(x)|^{-1}p_x(x)$
- Multidimensional sampling: sample with $p(x)$ and $p(y|x)$
