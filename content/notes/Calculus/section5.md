---
title: 5-多元积分
date: 2019-09-19
tags: [math, notes]
weight: 5
---

## 第一型

* $E\subset \mathbb{R}^n,\forall \epsilon>0,\exists\delta>0,\forall P$ 为 $E$ 分割，$\lVert P\rVert<\delta,\forall\xi$ 为 $P$ 特殊点选取，有 $|S(f,P,\xi)-I|<\epsilon$ 则 $f$ 在 $E$ 上 Riemann 可积，$I=\int_E f(x_1,x_2,\cdots,x_n)dx_1dx_2\cdots dx_n=\int_E f$
  * Riemann 可积 $\iff$ $f$ 间断点集测度为 $0$
  * 线性，单调性，非负性，三角不等式，积分域可加
* 累次积分：$\int_{[a,b]\times[c,d]}f(x,y)dxdy=\int_a^b(\int_c^df(x,y)dy)dx$
* 积分换元定理：$E$ 为 $\mathbb{R}^n$ 中的非空有界闭集，$\Phi:E\rightarrow\mathbb{R}^n$ 且为单射，$f$ 在 $\Phi(E)$ 上 Riemann 可积，则 $\int_E(f\circ \Phi)|\det(D\Phi)|=\int_{\Phi(E)}f$
  * 极坐标变换：$\Phi(r,\theta)=(r\cos\theta,r\sin\theta),\det(D\Phi)=r$
  * 柱坐标变换：$\Phi(r\cos\theta,r\sin\theta,z)=(x,y,z),\det(D\Phi)=r$
  * 球坐标变换：$\Phi(r,\varphi,\theta)=(r\sin\varphi\cos\theta,r\sin\varphi\cos\theta,r\cos\varphi)=(x,y,z),\det(D\Phi)=r^2\sin\varphi$
* 第一型曲线积分：$\gamma:[a,b]\rightarrow\mathbb{R}^n$ 连续可微，$f$ 在 $\gamma([a,b])$ 上有定义，若 $f(\gamma(t))\lVert\gamma'(t)\rVert$ 在 $[a,b]$ 上可积，则 $f$ 在 $\gamma$ 上第一型可积，$\int_\gamma fds=\int_a^bf(\gamma(t))\lVert\gamma'(t)\rVert dt$
* 第一型曲面积分：$E\subseteq\mathbb{R}^2,\Phi:E\rightarrow\mathbb{R}^3$ 为连续可微曲面，$\int_\Phi fd\sigma=\int_E f\circ\Phi\lVert\frac{\partial\Phi}{\partial u}\times\frac{\partial\Phi}{\partial v}\rVert dudv$

## 第二型

* 定向：$\mathbb{R}^n$ 有两个定向，由有序向量组 $\{X_1,\cdots,X_n\}$ 代表定向, 正向 $\det([X_1,\cdots,X_n])>0$
  * 有序标准基 $\{e_1,\cdots,e_n\}$ 正向
  * 对换改变定向
  * $\mathbb{R}^3$ 手系：以拇指为第一轴, 食指为第二轴, 中指为第三轴作标架
    * 右手系为正向
  * 映射
    * 保向：$\det(D\Phi)$ 恒正
    * 反向：$\det(D\Phi)$ 恒负
  * 曲面定向
    * 可定向：若能在 $S$ 上每一点 $P$ 处指定以一非零向量 $n(P)$ 使 $P$ 在 $S$ 上连续运动时，$n(P)$ 的方向也连续变化
  * 边界定向：$\partial D$
    * 头向读者，$D$在人左
* 外积：$dx_i\wedge dx_j$
  * 反交换律
  * $dx_1\wedge\cdots\wedge dx_n(a_1,\cdots,a_n)=\det([a_1,\cdots,a_n])$
* 微分形式
  * 零阶微分形式：$f$
    * 自变量为定向点
  * 一阶微分形式：$\omega=f_1(x_1,\cdots,x_n)dx_1+\cdots+f_n(x_1,\cdots,x_n)dx_n$
    * 自变量为 $\square(P;v)$
    * $\omega(\square(P;v))=\sum_{i=1}^nf_i(P)dx_i(v)$
  * 二阶微分形式：$\omega=\sum_{i,j}f_{ij}(x_1,\cdots,x_n)dx_i\wedge dx_j$
    * $\omega(\square(P;a,b))=f(P)dx\wedge dy(a,b)=f(P)\cdot\det([a,b])$
* 第二型积分：$f$ 在 $D$ 上 Riemann 可积
  * $\int_D\omega = \int_Df(x_1,\cdots,x_n)dx_1dx_2\cdots dx_n$
  * $\int_{-D}\omega = \int_Df(x_1,\cdots,x_n)dx_1dx_2\cdots dx_n$
* 拉回：$\Phi:U_1\rightarrow U_2$ 可微映射，$\Phi^*(f(x_1,x_2)dx_1\wedge dx_2)=(f\circ\Phi)(y_1,y_2)d\Phi_1\wedge d\Phi_2,\Phi(y_1,y_2)=(\phi_1,\phi_2)$
  * $\Phi^*(fdx_1\wedge\cdots\wedge dx_n)=(f\circ\Phi)\det(D\Phi)dy_1\wedge\cdots\wedge dy_n$
  * 链法则：$\Phi_1:U_1\rightarrow U_2,\Phi_2\rightarrow U_3,(\Phi_2\circ\Phi_1)^*\omega=\Phi_1^*(\Phi_2^*\omega)$
* 积分换元定理：$\Phi:D\rightarrow E$ 是连续可微之一一对应，且 $\det(D\Phi)$ 恒正或负，$\omega$ 可积，则 $\int_D\Phi^*\omega=\int_\Phi(D)\omega$
  * $\Phi(D)$ 定向由 $\Phi$ 诱导
* 第二型曲线积分：$\int_\gamma\omega=\int_{[a,b]}\gamma^*\omega$
* 第二型曲面积分：$\int_\Phi\omega=\int_D\Phi^*\omega$
* 外微分：$d\omega$
  * 二次连续可微：$dd\omega=0$
  * 二次连续可微：$d\Phi^*\omega=\Phi^*d\omega$

| 名称                     | 对象                   | 公式                                    | $\omega$                                                      | 向量场形式                                                                                            |
| ------------------------ | ---------------------- | --------------------------------------- | ------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| 曲线 Newton-Leibniz 公式 | $\mathbb{R}$           | $\int_Cdf=\int_{\partial C}f$           |                                                               |                                                                                                       |
| Green 公式               | $\mathbb{R}^2$区域     | $\int_Dd\omega=\int_{\partial D}\omega$ | $P(x,y)dx+Q(x,y)dy$                                           |                                                                                                       |
| Stokes 公式              | $\mathbb{R}^3$定向曲面 | $\int_Sd\omega=\int_{\partial S}\omega$ | $P(x,y,z)dx+Q(x,y,z)dy+R(x,y,z)dz$                            | $\int_S\langle\text{curl}\mathbf{X},\mathbf{n}\rangle d\sigma=\int_{\partial S}\langle X,T\rangle ds$ |
| Gauss 公式               | $\mathbb{R}^3$区域     | $\int_Dd\omega=\int_{\partial D}\omega$ | $P(x,y,z)dy\wedge dz+Q(x,y,z)dz\wedge dx+R(x,y,z)dx\wedge dy$ | $\int_D\text{div}\mathbf{X}dxdydz=\int_{\partial D}\langle\mathbf{X},\mathbf{n}\rangle d\sigma$      |
