---
title: Field-Theory
date: 2018-11-15
tags: [math, physics, notes]
---

# Coordinate system

* Cartesian system $(\vec i,\vec j,\vec k)$
  * orthogonal: $\vec i\cdot\vec j=\vec j\cdot\vec k=\vec k\cdot\vec i=0$
  * right-handed screw relation: $\vec i\times\vec j=\vec k$, $\vec j\times\vec k=\vec i$, $\vec k\times \vec i=\vec j$
  * $A\cdot B = A_1B_1+A_2B_2+A_3B_3$
  * $$A\times B=\det(\left[
    \begin{matrix}
      \vec i & \vec j & \vec k\\
      A_1 & A_2 & A_3\\
      B_1 & B_2 & B_3
    \end{matrix}
    \right])$$
* polar coordinate systems $(\vec e_\rho, \vec e_\phi)$
  * moving frames
  * position vector $\vec\rho=\rho\vec e_\rho$
  * $\vec e_\rho=cos\varphi\vec i+sin\varphi\vec j$
  * $\frac{d\vec e_\rho}{dt}=\dot{\varphi}\vec e_\varphi$
  * $\frac{d\vec e_\varphi}{dt}=-\dot{\varphi}\vec e_\rho$
* Spherical systems $(\vec e_\rho, \vec e_\phi, \vec k)$
* Cylindrical systems
* intrinsic system

<!--more-->

# temp

* In sperical coordinate system: $\nabla^2=\frac{1}{r^2}\frac{\partial}{\partial r}(r^2\frac{\partial}{\partial r})+\frac{1}{r^2}[\frac{1}{sin\theta}\frac{\partial}{\partial \theta}(sin\theta\frac{\partial}{\partial \theta})+\frac{1}{sin^2\theta}\frac{\partial^2}{\partial \varphi^2}]$

# 场论

* $\nabla\times(\nabla\times A) = \nabla(\nabla\cdot A) - \nabla^2 A$
* 柱坐标系： $\nabla = \frac{\partial}{\partial\rho}+\frac{1}{\rho}\cdot\frac{\partial}{\partial\phi}+\frac{\partial}{\partial z}$
