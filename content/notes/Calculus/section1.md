---
title: 1-极限与连续
date: 2019-09-19
tags: [math, notes]
weight: 1
---

## 基本概念

* 上界（下界）：$\exists M\in\mathbb{R},\forall x\in E,x\leq M$
  * $\sup E(\inf E)$: 上界中最小值
  * 无上界：$\sup E=+\infty$
* $\max(\min)$：$x_0\in E,\forall x\in E,x_0\geq x$
* $x$ 的 $\delta$-邻域：$U(x;\delta)=(x-\delta,x+\delta)$
* $x$ 的 $\delta$-去心邻域：$\check{U}(x;\delta)\backslash\{x\}$
* 聚点：$E\subseteq\mathbb{R},x\in\mathbb{R},\forall\delta>0,\check{U}(x;\delta)\cap E\not=\emptyset$
* 孤立点：$E\subseteq\mathbb{R},x_0\in E,x_0$ 非 $E$ 的聚点
  * $E$ 中点为聚点或孤立点
* 内点：$E\subseteq\mathbb{R},x_0\in\mathbb{R},\exists\delta>0,U(x_0;\delta)\subseteq E$
* 开集：$E\subseteq\mathbb{R}$, $E$ 的点皆为 $E$ 的内点
* 凸性：$\forall x\in I,\forall y\in I$, 连接$x$与$y$的线段含于 $I$
* 闭集：$\mathbb{R}\backslash E$ 为开集
  * 有上界的非空闭子集有最大值
* 紧集：有界闭集（紧性）
  * $f$ 为连续函数，$\mathfrak{D}_f$ 为有界闭集，$\mathfrak{R}_f$ 为有界闭集
* 映射：$f:X\rightarrow Y$
  * 定义域：$\mathfrak{D}_f=X$
  * 上域：$Y$
  * 值域（象）：$\mathfrak{R}=f(X)$
  * 复合 $g\circ f$
  * 限制 $f|_{X_1}$
  * 延拓
* 函数 $f:E\rightarrow \mathbb{R}$
  * 图：$\mathcal{G}_f=\{(x,f(x))|x\in E\}$
  * 基本初等函数
    * 常函数
    * 指数函数
    * 对数函数
    * 三角函数
    * 反三角函数
  * 初等函数：由基本初等函数出发，有限次四则运算和复合得到
    * $x^a=e^{a\ln x}$
* 极值：$x_0\in\mathfrak{D},\exists\delta>0,\forall x\in U(x_0;\delta)\cap\mathfrak{D},f(x)\leq f(x_0)(f(x)\geq f(x_0)$
* 临界点：$x_0$ 为内点且 $f'(x_0)=0$
* 单调性
* 凸函数:$\forall x_1\in I,\forall x_2\in I,\forall\lambda\in[0,1]$ 有 $f(\lambda x_1+(1-\lambda)x_2)\leq\lambda f(x_1)+(1-\lambda)f(x_2)$
  * $f'$ 增
* Euler 公式：$e^{x+i\theta}=e^x(\cos\theta+i\sin\theta)$
* $\lim_{n\rightarrow+\infty}(1+\frac{1}{n})^n=\lim_{x\rightarrow 0}(1+x)^{\frac{1}{x}}e$
* Stirling 公式：$n!\sim \sqrt{2\pi}n^{n+\frac{1}{2}}e^{-n}$

| 反三角函数 | $\mathfrak{D}_f$ | $\mathfrak{R}_f$                 | 导数                      |
| ---------- | ---------------- | -------------------------------- | ------------------------- |
| $\arcsin$  | $[-1,1]$         | $[-\frac{\pi}{2},\frac{\pi}{2}]$ | $\frac{1}{\sqrt{1-x^2}}$  |
| $\arccos$  | $[-1,1]$         | $[0,\pi]$                        | $-\frac{1}{\sqrt{1-x^2}}$ |
| $\arctan$  | $\mathbb{R}$     | $(\frac{\pi}{2},\frac{\pi}{2})$  | $\frac{1}{1+x^2}$         |

## 定理

* 确界定理：非空有上界集合有上确界
* 单调有界定理：$\{x_n\}$ 单调增数列且有上界，则其收敛于上确界
* Cauchy 准则：$\{a_k\}$ 收敛 $\iff\forall\epsilon>0,\exists N,\forall m>N,\forall n>N,|a_m-a_n|<\epsilon$
* Heine定理：$\lim_{x\rightarrow x_0}f(x)=A\iff\forall\{x_n\}\subseteq\mathfrak{D}_f\backslash\{x_0\}$ s.t. $\lim_{x\rightarrow +\infty}x_n=x_0$ 有 $\lim_{n\rightarrow+\infty}f(x_n)=A$
* Cauchy 准则：$\lim_{x\rightarrow x_0}f(x)=A\iff\forall\epsilon>0,\exists\delta>0,\forall x_1\in\check{U}(x_0;\delta)\cap\mathfrak{D}_f,\forall x_2\in\check{U}(x_0;\delta)\cap\mathfrak{D}_f$ 有 $|f(x_1)-f(x_2)|<\epsilon$
* 单调有界定理：$f(x)$ 单调增有上界，$\lim_{x\rightarrow+\infty}f(x)=\sup f$
* 实数稠密性：$V$ 为 $\mathbb{R}$ 的非空开子集，则 $V$ 中含有无限个有理数与无限个无理数
* 介值定理：$f$ 为连续函数，$\mathfrak{D}_f$ 为区间或单电集，$A\in\mathfrak{R}_f,B\in\mathfrak{R}_f,C$ 在两者间，则 $\exists\xi\in\mathfrak{D},f(\xi)=C$
* 路连通性：$f$ 为连续函数，$\mathfrak{D}_k$ 为区间为单点集，则$\mathfrak{R}_f$ 为区间或单点集
* Fermat 定理：$x_0$ 为极值点且为内点，$f$ 在 $x_0$ 处可导，则 $x_0$ 为临界点

## 极限

* $\lim_{n\rightarrow+\infty} x_n=A$: $\{x_n\},A\in\mathbb{R},\forall\epsilon>0,\exists N\in\mathbb{R},\forall n>N$ 有 $|x_n-A|<\epsilon$
  * $\{x_n\}$ 收敛
  * 唯一性
  * 有界性：$\{x_n\}$ 收敛则 $\exists M\in\mathbb{R},|x_n|\leq M$
  * 保序性：$\lim_{n\rightarrow+\infty} x_n=A>B$ 则 $\exists N,\forall n>N,x_n>B$
  * 迫敛性：$x_n\leq y_n\leq z_n,\lim_{n\rightarrow+\infty} x_n=\lim_{n\rightarrow+\infty} z_n=A$, 则 $\lim_{n\rightarrow+\infty} y_n=A$
  * 四则运算
  * 子列收敛于相同极限
* $\lim_{n\rightarrow+\infty} x_n=+\infty$: $\{x_n\},\forall M\in\mathbb{R},\forall\epsilon>0,\exists N\in\mathbb{R},\forall n>N$ 有 $x_n\geq M$
  * $\{x_n\}$ 无穷极限
* $\lim_{x\rightarrow x_0}f(x)=A$: $x_0$ 为 $\mathfrak{D}_f$ 聚点，$A\in\mathbb{R},\forall\epsilon>0,\exists\delta>0,\forall x\in\check{U}(x_0;\delta)\cap\mathfrak{D}_f$ 有 $|f(x)-A|<\epsilon$
  * 唯一性
  * 局部性：$\lim_{x\rightarrow x_0}f(x)=A\iff\lim_{x\rightarrow x_0}f|_{U(x_0;\delta)\cap\mathfrak{D}_f}(x)=A$
  * 局部有界性
  * 局部保序性
  * 迫敛性
  * 变量代换
* $\lim_{x\rightarrow+\infty}f(x)=A$: $\forall x\in\mathfrak{D}_f\cap[N,+\infty]\not=\emptyset,A\in\mathbb{R},\forall\epsilon>0,\exists\delta>0,\exists N\in\mathbb{R},\forall x\in\mathfrak{D}_f\cap[N,+\infty]$ 有 $|f(x)-A|<\epsilon$
* $\lim_{x\rightarrow x_0}f(x)=+\infty$: $x_0$ 为聚点，$\forall M\in\mathbb{R},\exists\delta>0,\forall x\in\check{U}(x_0;\delta)\cap\mathfrak{D}_f$ 有 $f(x)>M$
* $\lim_{x\rightarrow x_0^+}f(x)=A$: $\forall\sigma>0,(x_0,x_0+\sigma)\cap\mathfrak{D}_f\not=\emptyset,A\in\mathbb{R},\forall\epsilon>0,\exists\delta>0,\forall x\in(x_0,x_0+\delta)\cap\mathfrak{D}_f$ 有 $|f(x)-A|<\epsilon$
  * $\lim_{x\rightarrow x_0^+}f(x)=\lim_{x\rightarrow x_0^-}f(x)=A\iff\lim_{x\rightarrow x_0}f(x)=A$
* $x\rightarrow x_0$ 时，$f(x)$ 为无穷小量：$\lim_{x\rightarrow x_0}f(x)=0$
* $x\rightarrow x_0$ 时，$f(x)$ 为无穷大量：$\lim_{x\rightarrow x_0}f(x)=\pm\infty$
* $f(x)=o(g(x)),(x\rightarrow x_0)$
  * $f,g$ 定义域相同，$\lim_{x\rightarrow x_0}f(x)=\lim_{x\rightarrow x_0}g(x)=0,\lim_{x\rightarrow x_0}\frac{f(x)}{g(x)}=0$，则 $x\rightarrow x_0$ 时，$f$ 为 $g$ 的高阶无穷小，$g$ 为 $f$ 的低阶无穷小
* $f(x)=O(g(x)),(x\rightarrow x_0)$
  * $f,g$ 定义域相同，$x_0$ 为定义域的聚点，$\exists M\in\mathbb{R},\exists\delta>0,\forall x\in\check{U}(x_0;\delta)\cap\mathfrak{D}_f$ 有 $|\frac{f(x)}{g(x)}|\leq M$

## 连续

* $f$ 在 $x_0$ 处连续：$x_0\in\mathfrak{D}_f,\forall\epsilon>0,\exists x\in U(x_0;\delta)\cap\mathfrak{D}_f$ 有 $|f(x)-f(x_0)|<\epsilon$
  * $x_0$ 为连续点
  * 不连续，间断，不连续点
  * 孤立点处连续
  * 聚点连续 $\iff \lim_{x\rightarrow x_0} f(x)=f(x_0)$
  * 四则运算，复合
* 在 $E$ 上一致连续：$\forall\epsilon>0,\exists\delta>0,\forall x_1\in E,\forall x_2\in E$ s.t. $|x_1-x_2|<\delta$ 有 $|f(x_1)-f(x_2)|<E$
  * 一致连续则连续
  * $f$ 连续且 $\mathfrak{D}_f$ 为有界闭集，则 $f$ 一致连续

## 线性几何

* 内积：$\langle f,g\rangle_{L^2[a,b]}=\int_a^bf(x)\overline{g(x)}dx$
  * 共轭对称性
  * 共轭双线性
  * 非负性
* 正交规范性：$\langle e^{i2n\pi x},e^{i2m\pi x}\rangle=[n=m]$
  * 正交规范族：$\{e^{i2n\pi x}|n\in\mathbb{Z}\}$
  * 线性无关性
* $X,Y\in\mathbb{R}^n,\langle X,Y\rangle=\sum_{i=1}^nx_iy_i$
  * 对称性
  * 双线性
  * 正定性
  * Cauchy-Schwarz 不等式：$|\langle X,Y\rangle|\leq\lVert X\rVert\cdot\lVert Y\rVert$
* 范数：$\lVert X\rVert=\sqrt{\langle X,X\rangle}$
  * 正定性
  * 齐次性
  * 三角不等式
* $X\perp Y$: $\langle X,Y\rangle=0$
  * 双线性，反交换律
  * $\lVert a\times b\rVert=\sqrt{\lVert a\rVert^2\lVert b\rVert^2-\langle a,b\rangle^2}$

$$
a\times b =(|\begin{matrix} a_2 & b_2\\ a_3 & b_3 \end{matrix}|,|\begin{matrix} a_3 & b_3\\ a_1 & b_1 \end{matrix}|,|\begin{matrix} a_1 & b_1\\ a_2 & b_2 \end{matrix}|)^T
$$

* 直线：$L:X(t)=P+tY$
* 超平面
  * 点法式：$\langle Q-P,\mathbf{n}\rangle=0$
  * 一般式：$\sum_kn_kx_k+b=0$
  * 参数方程：$\Pi:X(\lambda_1,\cdots,\lambda_{k-1})=\sum_{i=1}^{k-1}\lambda_iX_i+P$
* 曲线 $\gamma:I\rightarrow\mathbb{R}^n$
  * 参数方程：$\gamma(t)=(\gamma_1(t),\cdots,\gamma_n(t))^T$
  * 切向量：$\lambda\gamma'(t_0)$
  * 切线：$L:X(t)=\gamma(t_0)+t\gamma'(t_0)$
* 超曲面：$S:F(P)=0,F$ 为连续可微函数
* 切超平面：$\Pi=\{Q\in\mathbb{R}^k|\langle Q-P,\nabla F(P)\rangle=0\}$

## 多元函数

* 点列 $\{P_k\}\subset\mathbb{R}^n$
* $\lim_{k\rightarrow+\infty}P_k=P$：$\forall \epsilon>0,\exists N\in\mathbb{R},\forall k>N,\lVert P_k-P\rVert<\epsilon$
  * 唯一性
  * 点列收敛当且仅当所有坐标对应收敛
* $\delta$-邻域：$U(P;\delta)=\{Q\in\mathbb{R}^n|d(P,Q)<\delta\}$
* $\delta$-邻域去心：$\hat U(P;\delta)=U(P;\delta)\backslash\{P\}$
* 聚点：$\forall\delta>0,\hat U(P;\delta)\cap E\not=\emptyset$
* 孤立点：$P\in E$ 且 $P$ 非聚点
* 内点：$\exists\delta>0,U(P;\delta)\subseteq E$
* 边界点：$\forall\delta>0,U(P;,\delta)\cap E\not=\emptyset$ 且 $U(P;\delta)\cap(\mathbb{R}^n\backslash E)\not=\emptyset$
* 开集：$E$ 的点皆为 $E$ 的内点
* 闭集：$\mathbb{R}^n\backslash E$ 为开集
* $\lim_{P\rightarrow P_0}f(P)=A$: $\forall\epsilon>0,\exists\delta>0,\forall P\in\hat U(P_0;\delta)\cap D_f,|f(P)-A|<\epsilon$
* 连续：$\forall\epsilon>0,\exists\delta>0,\forall P\in U(P_0;\delta)\cap D_f,|f(P)-f(P_0)|<\epsilon$
  * $f$ 连续则关于自变量所有分量皆连续
* 映射：$f:E\rightarrow\mathbb{R}^m$
* 连续：$\forall\epsilon>0,\exists\delta>0,\forall P\in U(P_0;\delta)\cap D_f,|f(P)-f(P_0)|<\epsilon$
* 凸集：$\forall P\in E,\forall Q\in E,\forall t\in[0,1],tP+(1-t)Q\in E$
* 路连通集：$\forall P\in E,\forall Q\in E$，有连续映射 $\gamma:[0,1]\rightarrow E,\gamma(0)=P,\gamma(1)=Q$
* $\mathbb{R}^1$ 中非空路连通集与凸集相同，为区间或单点集
* 路连通性：$f$ 为连续映射，若$D_f$路连通，则$R_f$亦然
* 介值定理
* 紧性：$f$ 为连续映射，$D_f$ 有界闭集，$R_f$ 有界闭集
* 最值定理：$f$ 为连续函数，$D_f$ 有界闭集，则 $f$ 有最大值与最小值
* 一致连续：$\forall\epsilon>0,\exists\delta>0,\forall P_1\in E,\forall P_2\in E,\lVert P_1-P_2\rVert<\delta,\lVert f(P_1)-f(P_2)\rVert<\epsilon$
  * $f$ 为连续映射，且 $D_f$ 有界闭集，则 $f$ 一致连续
* 线性映射：$\mathbf{A}:\mathbb{R}^n\rightarrow\mathbb{R}^m,\mathbf{A}(X)=AX$
* 仿射映射：$\mathbf{L}(X)=AX+b$
  * $\mathbf{L}(Q)-\mathbf{L}(P)=A(Q-P)$
  * $\mathbf{L}(\square(P;X_1,\cdots,X_k))=\square(\mathbf{L}(P);AX_1,\cdots,AX_k))$
