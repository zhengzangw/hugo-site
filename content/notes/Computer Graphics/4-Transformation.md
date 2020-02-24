---
title: 4.变换
date: 2020-02-15
weight: 4
---

## 基本几何变换

- 二维齐次坐标 $(x,y,h)$
- 二维变换

| 变换 | 变换矩阵                                                                                              |
| ---- | ----------------------------------------------------------------------------------------------------- |
| 平移 | $\begin{bmatrix} 1 & 0 & t_x\\0 & 1 & t_y\\0 & 0 & 1\\\end{bmatrix}$                                  |
| 旋转 | $\begin{bmatrix} \cos\theta & -\sin\theta & 0\\\sin\theta & \cos\theta & 0\\0 & 0 & 1\\\end{bmatrix}$ |
| 缩放 | $\begin{bmatrix} s_x & 0 & 1 \\0 & s_y & 1\\0 & 0 & 1\\\end{bmatrix}$                                 |
| 错切 | $\begin{bmatrix} 1 & sh_x & -sh_xy_{ref}\\0 & 1 & 0\\0 & 0 & 1\\\end{bmatrix}$                        |

- 三维齐次坐标 $(x,y,z,h)$

| 变换          | 变换矩阵                                                                                                                       |
| ------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| 平移          | $\begin{bmatrix} 1 & 0 & 0 & t_x\\0 & 1 & 0 & t_y\\0 & 0 & 1 & t_z\\0 & 0 & 0 & 1\end{bmatrix}$                                |
| 缩放          | $\begin{bmatrix} s_x & 0 & 0 & 0\\0 & s_y & 0 & 0\\0 & 0 & s_z & 0\\0 & 0 & 0 & 1\end{bmatrix}$                                |
| 旋转 Z 轴     | $\begin{bmatrix} \cos\theta & -\sin\theta & 0 & 0\\\sin\theta & \cos\theta & 0 & 0\\0 & 0 & 1 & 0\\0 & 0 & 0 & 1\end{bmatrix}$ |
| 旋转 X 轴     | $\begin{bmatrix} 1 & 0 & 0 & 0\\0 & \cos\theta & -\sin\theta & 0\\0 & \sin\theta & \cos\theta & 0\\0 & 0 & 0 & 1\end{bmatrix}$ |
| 旋转 Y 轴     | $\begin{bmatrix} \cos\theta & 0 & \sin\theta & 0\\0 & 1 & 0 & 0\\-\sin\theta & 0 & \cos\theta & 0\\0 & 0 & 0 & 1\end{bmatrix}$ |
| $xy$ 平面反射 | $\begin{bmatrix} 1 & 0 & 0 & 0\\0 & 1 & 0 & 0\\0 & 0 & -1 & 0\\0 & 0 & 0 & 1\end{bmatrix}$                                     |
| $yz$ 平面反射 | $\begin{bmatrix} -1 & 0 & 0 & 0\\0 & 1 & 0 & 0\\0 & 0 & 1 & 0\\0 & 0 & 0 & 1\end{bmatrix}$                                     |
| $xz$ 平面反射 | $\begin{bmatrix} 1 & 0 & 0 & 0\\0 & -1 & 0 & 0\\0 & 0 & 1 & 0\\0 & 0 & 0 & 1\end{bmatrix}$                                     |
| $z$ 轴错切    | $\begin{bmatrix} 1 & 0 & sh_x & 0\\0 & 1 & sh_y & 0\\0 & 0 & 1 & 0\\0 & 0 & 0 & 1\end{bmatrix}$                                |

- 任意轴旋转和旋转角旋转变换
  - $R(\theta)=T^{-1}R^{-1}R_z(\theta)RT$
  - $R=R_y(\beta)R_x(\alpha)$ 将旋转轴与 $z$ 轴重合

## 二维观察变换

- 窗口：指定图形要显示部分的区域
- 视区：窗口指定区域映射到输出设备上的区域
- 窗口到视区变换
  - $x_v=x_{v\min}+(x_w-x_{w\min})s_x,s_x=\frac{x_{v\max}-x_{v\min}}{x_{w\max}-x_{w\min}}$
  - $y_v=y_{v\min}+(y_w-y_{w\min})s_y,s_y=\frac{y_{v\max}-y_{v\min}}{y_{w\max}-y_{w\min}}$

## 三维观察变换

- 观察/参考坐标系：指定观察位置和投影平面位置
  - 世界坐标中的景物先转换到观察坐标
  - 观察点 $P$：观察坐标原点
  - 观察坐标中的景物投影到观察/投影平面上
  - 观察轴 $z_v$ 垂直与观察平面
  - 观察向上向量 $V$：建立 $y_v$ 轴正方向
  - 观察系统即单位轴向量 $uvn$ 系统
- 观察坐标变换
  - 世界坐标到观察坐标的变化等价于运用基本几何平移选择运算将观察坐标系叠加到世界坐标系上的变化：$M=RT$
- 平行投影

  - 正投影：投影向量垂直与观察平面
    - 三视图：投影平面与坐标轴垂直
    - 正轴侧图：不垂直 $(x,y)$
  - 斜投影：不垂直
    - $\alpha$: $(x,y,z)$到$(x_p,y_p)$斜投影线与投影平面中的点$(x_p,y_p)$和$(x,y)$连线夹角
    - $\beta$: $(x_p,y_p)$和$(x,y)$连线与$x$轴夹角

    变换矩阵 $\begin{bmatrix}1&0&\frac{\cos\beta}{\tan\alpha}&0\\0&1&\frac{\cos\beta}{\tan\alpha}&0\\0&0&0&0\\0&0&0&1\end{bmatrix}$

    $\tan\alpha=1$ 斜等测投影，$\tan\alpha=2$ 斜二测投影
- 透视投影
  - 将点沿会聚到投影参考点的投影线变换
  - 灭点：物体中不与观察平面平行的任一族平行线收敛于一点
  - 主灭点：平行与某一坐标轴的平行线的灭点称为主灭点
  - 当投影点在 $z_r$ 轴 $z_{prp}$，观察平面在 $z_{vp}$ 处时
    - $d_p=z_{prp}-z_{vp}$
    - $x_p=x\lfloor \frac{d_p}{z_{prp}-z}\rfloor$
    - $y_p=y\lfloor \frac{d_p}{z_{prp}-z}\rfloor$
  - 投影参考点 $(x_{prp},y_{prp},z_{prp})$
    - 齐次因子：$h=\frac{z_{prp}-z}{d_p}$
    - 投影矩阵

    $$\begin{bmatrix}x_h\\y_h\\z_h\\h\end{bmatrix}=\begin{bmatrix}1 & 0 & 0 & 0\\0 & 1 & 0 & 0\\0 & 0 & -\frac{z_{vp}}{d_p} & z_{vp}\frac{z_{prp}}{d_p}\\0 & 0 & -\frac{1}{d} & \frac{z_{prp}}{d_p}\end{bmatrix}\begin{bmatrix}x\\y\\z\\1\end{bmatrix}$$

    - 投影坐标系：$x_p=\frac{x_h}{h},y_p=\frac{y_h}{h}$
- 观察体（观察空间）：只有在观察体内的物体才显示
  - 观察窗口
  - 前平面，后平面