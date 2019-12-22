---
title: Sage 
date: 2019-02-24
tags: [sage]
---

# Table of function

<!--more-->

| Name               | Function                      | Examples                                   |
| ------------------ | ----------------------------- | ------------------------------------------ |
| var                |                               | x, y = var('x y')                          |
| solve              | solve equations exactly       | solve(x^2+3*y, x, y)                       |
| find\_root         | solve equations approximately | find\_root(cos(phi)==sin(phi), 0, pi/2)    |
| diff               | 求微分                        | diff(sin(x^2), x, 4)                       |
| .diff()            | 偏微分                        | f = x^2 + 17*y^2; f.diff(x)                |
| integral           | （不定）积分                  | integral(x*sin(x^2), x, 0, 1)              |
| .partial\_fraction | 部分分式分解                  | f=1/((1+x)\*(x-1)); f.partial\_fraction(x) |
| function           |                               | x = function('x', t)                       |
| desolve            | 求解微分方程                  | DE = diff(x,t) + x - 1; desolve(DE, [x,t]) |
| .laplace()         | 拉普拉斯变换                  | f = t; f.laplace(t,s)                      |
| circle             | 绘制圆形                      | circle((0,0), 1, rgbcolor=(1,1,0))         |
