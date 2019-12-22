---
title: 4-多元微分
date: 2019-09-19
tags: [math, notes]
weight: 4
---

* 偏导数：$\frac{\partial f}{\partial x_i}(P_0)=g'(a_i)$
* 可微：$\exists\delta >0,U(P_0;\delta)\subseteq D_f,\exists A_i\in\mathbb{R},\forall P s.t. \lVert\Delta P\rVert<\delta$ 有 $f(P_0+\Delta P)-f(P_0)=\sum_{i=1}^nA_i\Delta x_i+R(P_0+\Delta P)$ 且 $\lim_{\Delta P\rightarrow 0}\frac{R(P_0+\delta P)}{\lVert\Delta\rVert}$
  * $\Delta f(P_0;\Delta P)=df(P_0;\Delta P)+o(\lVert\Delta P\rVert),\Delta P\rightarrow 0$
  * $\forall i,\frac{\partial f}{\partial x_i}(P_0)=A_i$
* 微分：$df(P_0)=\sum_{i=1}^n\frac{\partial f}{\partial x_i}(P_0)dx_i$
* 连续可微：各个偏导函数皆连续
  * 连续可微则可微
* 链法则：$\frac{\partial f(g_1,\cdots,g_m)}{\partial x_k}|_{P=P_0}=\sum_{i=1}^m\frac{\partial f}{\partial u_i}(Q_0)\frac{\partial g_i}{\partial x_k}(P_0)$
* 隐函数求导法
  * $F(x_1,\cdots,x_{n+1})=C$
  * 由上式决定的隐函数：$x_{n+1}=f(x_1,\cdots,x_n)$
  * $\frac{\partial x_{n+1}}{\partial x_i}(a_1,\cdots,a_{n+1})=-\frac{\frac{\partial F}{\partial x_{n+1}}(a_1,\cdots,a_{n+1})}{\frac{\partial F}{\partial x_i}(a_1,\cdots,a_{n+1})}$
* 求导换序：$\frac{\partial^2 f}{\partial x_i\partial x_j},\frac{\partial^2 f}{\partial x_j\partial x_i}$ 在 $U$ 上存在且在 $P$ 处连续，则$\frac{\partial^2 f}{\partial x_i\partial x_j}(P)=\frac{\partial^2 f}{\partial x_j\partial x_i}(P)$
  * 二阶连续可微可换序
* Fermat 定理：$P$ 为 $f$ 极值点且为 $D_f$ 内点，$f$ 在 $p$ 处可微，则 $df(P)=0$, $P$ 为临界点
* Hesse 阵
  * 二阶连续可微函数
    * $\forall k,H(f)(P)$ 的 $k$ 阶顺序主子式为正，则 $P$ 为极小值点
    * $\forall k,H(f)(P)$ 的 $k$ 阶顺序主子式皆与 $(-1)^k$ 同号，则 $P$ 为 $f$ 极大值点
    * 鞍点：$df(P)=0,|H(f)(P)|\not=0$ 且不满足上两条，则 $P$ 非极值点

$$
H(f)(P)=(\frac{\partial^2 f}{\partial x_i\partial x_j}(P))_{n\times n}=\begin{bmatrix}
\frac{\partial^2 f}{\partial x_1^2} & \frac{\partial^2 f}{\partial x_1\partial x_2} & \cdots \\
\frac{\partial^2 f}{\partial x_2\partial x_1} & \ddots & \vdots \\
\vdots & \cdots & \frac{\partial^2 f}{\partial x_n^2}
\end{bmatrix}
$$

* $f$ 在 $P_0$ 处可微：$f:E\rightarrow\mathbb{R}^m,E\subseteq\mathbb{R}^n,\exists\delta>0,U(P_0;\delta)\subseteq E,\exists A_{m\times n},\forall\Delta P\in\mathbb{R}^n,\lVert\Delta P\rVert<\delta$ 有 $f(P_0+\Delta P)-f(P_0)=A\cdot\Delta P+R(P_0+\Delta P)$ 且 $\Delta P\rightarrow 0,R(P_0+\Delta P)=o(\lVert\Delta P\rVert)$
* 映射可微 $\iff\forall i,f_i$ 可微
* Jacobi 矩阵：导数推广

$$Df(P_0) = \begin{bmatrix}
\frac{\partial f_1}{\partial x_1}(P_0) & \frac{\partial f_1}{\partial x_2}(P_0) & \cdots & \frac{\partial f_1}{\partial x_n}(P_0) \\
\frac{\partial f_2}{\partial x_1}(P_0) & \cdots & \cdots & \vdots\\
\cdots & \cdots & \cdots & \vdots\\
\frac{\partial f_m}{\partial x_1}(P_0) & \cdots & \cdots & \frac{\partial f_m}{\partial x_n}(P_0) \\
\end{bmatrix}
$$

* 微分：$\mathbf{A}:\mathbb{R}^n\rightarrow\mathbb{R}^m,\mathbf{A}(X)=Df(P_0)\cdot X$
  * $\Delta f(P_0;\Delta)=Df(P_0)\cdot\Delta P+o(\lVert\Delta P\rVert)$
  * 链法则：$D(f\circ g)(P_0)=Df(Q_0)\cdot Dg(P_0)$
* 方向导数：$n$ 元函数 $f$ 在 $P$ 处沿 $v$ 的方向导数 $d_vf(P)=Df(P)\cdot v=\langle \nabla f(P),v\rangle$
  * 梯度：$\nabla f(P)=Df(P)^T$
