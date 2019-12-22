---
title: Image Restoration
date: 2019-09-02
tags: [ml, notes]
weight: 4
---

$f(x,y)$ - 退化函数 $H$ - 加性噪声 $\eta(x,y)$ - (逆过程)复原滤波器 - $\hat f(x,y)$

- $g(x,y)=h(x,y)\star f(x,y)+\eta(x,y)$

## 噪声模型

### 位置无关

均值方差估计

- 高斯噪声
  - $p(z)=\frac{1}{\sqrt{2\pi}\sigma}e^{-\frac{(z-\overline{z})^2}{2\sigma^2}}$
  - 电路噪声，传感器噪声
- 瑞利噪声
  - $p(z)=\frac{2}{b}(z-a)e^{-(z-a)^2/b},z\geq a$
  - $\overline{z}=a+\sqrt{\frac{\pi b}{4}}$
  - $\sigma^2=\frac{b(4-\pi)}{4}$
  - 范围成像
- 爱尔兰（伽马）噪声
  - $p(z)=\frac{a^bz^{b-1}}{(b-1)!}e{-az},z\geq 0$
  - $\overline{z}=\frac{b}{a}$
  - $\sigma^2=\frac{b}{a^2}$
  - 激光成像
- 指数噪声
  - $p(z)=ae^{-az},z\geq 0$
  - $b=1$ 时的爱尔兰噪声
  - 激光成像
- 均匀分布
  - $p(z)=\frac{1}{b-a},a\leq z\leq b$
- 脉冲噪声（椒盐噪声）
  - 盐：白色
  - 胡椒：黑色
  - 快速过滤

$$p(z)=\begin{cases} P_a & z=a \\ P_b & z=b \end{cases}$$

### 位置相关

频率域滤波

- 周期噪声
  - 电力或机电干扰

## 滤波器

- 算数均值滤波器：$\hat f(x,y)=\frac{1}{mn}\sum_{(s,t)\in S_{xy}}g(s,t)$
  - 不 robust: 如椒盐噪声
- 几何均值滤波器
- 谐波均值滤波器：适用于盐粒噪声，不使用胡椒噪声
- 逆谐波均值滤波器：$\hat f(x,y)=\frac{\sum g(s,t)^{Q+1}}{\sum g(s,t)^Q}$
  - $Q>0$ 消除胡椒
  - $Q=0$ 算数均值滤波器
  - $Q<0$ 消除盐粒
  - $Q=-1$ 谐波均值滤波器
- 中值滤波器
- 最大/最小值滤波器
- 中点滤波器：最大值和最小值的中点
- $\alpha$ 截断的均值滤波
  - 分别去掉 $S_{xy}$ 中灰度最高/最低的 $\frac{d}{2}$ 个像素
- 自适应局部降噪滤波器
  - 利用四个度量
    - $g(x,y)$
    - 局部平均：$m_L$
    - 全局方差：$\sigma_\eta^2$
    - 局部方差：$\sigma_L^2$
  - $\hat f(x,y)=g(x,y)-\min(\frac{\sigma_\eta^2}{\sigma_L^2},1)(g(x,y)-m_L)$
- 自适应中值滤波器
- 理想带阻/带通/陷波滤波器
- 巴特沃斯带阻/带通/陷波滤波器
- 高斯带阻/带通/陷波滤波器
- 最佳陷波滤波器：交互式

## 估计退化函数

- 冲激成像：$H=G/A$
- 大气湍流
- 运动捕捉
- 退化函数已知 $\hat F=G/H$
  - 阶段频率：只用非 $0$ 的 $H$