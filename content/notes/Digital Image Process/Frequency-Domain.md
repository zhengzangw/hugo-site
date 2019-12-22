---
title: Frequency Domain
date: 2019-09-02
tags: [ml, notes]
weight: 3
---

傅里叶变换 - 滤波 - 傅里叶反变换

## 傅里叶变换

![傅里叶变换关系](https://pic1.zhimg.com/3b0b4443adeae9e985073c5a094d040a_r.jpg)

### (Continuous) Fourier Tranform

连续函数 $f(t)$ $\overset{\mathcal{F}}{\leftrightarrow}$ 连续函数 $F(\mu)$

-   Fourier Transform: $F(\mu)=\mathcal{F}(f)=\int_{-\infty}^{\infty}f(t)e^{-i2\pi\mu t}dt$
-   IFT: $f(t)=\mathcal{F}^{-1}(F)=\int_{-\infty}^{\infty}F(\mu)e^{i2\pi\mu t}d\mu$
-   性质
    -   $F(t)$ 的傅里叶变换为 $f(-\mu)$
    -   平移性：$\mathfrak{J}(h(t-\tau))=H(\mu)e^{-i2\pi\mu\tau}$
    -   卷积定理
        -   $\mathfrak{F}(f(t)\star h(t))=H(\mu)F(\mu)$
        -   $\mathfrak{F}(f(t)h(t))=H(\mu)\star F(\mu)$

### Discrete Time Fourier Transform

离散函数 $x[n]$ $\overset{\mathcal{DTFT}}{\leftrightarrow}$ 连续周期函数 $\widetilde F(\mu)$

-   单位冲激($0$ 处)：$\delta(t)=[t=0],\int_{-\infty}^{\infty}\delta(t)dt=1$
-   单位冲激($t_0$ 处)：$\delta(t-t_0)$
-   采样性质：$\int_{-\infty}^{\infty}f(t)\delta(t)dt=f(0)$
-   冲激串: $s_{\Delta T}(t)=\sum_{n=-\infty}^{\infty}\delta(t-n\Delta T)$
    -   $c_n=\frac{1}{\Delta T}$
    -   $s_{\Delta T}(t)=\frac{1}{\delta T}\sum_{n=-\infty}^{\infty}e^{i\frac{2\pi n}{\Delta T}t}$
    -   $S(\mu)=\frac{1}{\Delta T}\sum_{n=-\infty}^\infty\delta(\mu-\frac{n}{\Delta T})$
-   采样: $\widetilde f(t)=f(t)s_{\Delta T}(t)=\sum_{n=-\infty}^{\infty}f(n\Delta T)\delta(t-n\Delta T)$
    -   $\widetilde F(\mu) =\mathcal{F}(\widetilde f)= \frac{1}{\Delta T}\sum_{n=-\infty}^\infty F(\mu-\frac{n}{\Delta T})$
-   DTFT: $\mathcal{DTFT}(x[n]) = \widetilde F(\mu)$
    -   $x[n]=f(n\Delta T)$

#### 采样定理

带限函数 $[-\mu_{\max},\mu_{\min}]$

-   采样定理：可完全恢复的采样率 $\frac{1}{\Delta T}>2\mu$
-   奈奎斯特采样率：最高频率两倍的采样率（无限采样）

#### 混淆

带限函数有限长度采样 $f(t)h(t)$

-   方波函数 $h(t)=[0\leq t\leq T]$
    -   $H(\mu)=AW\text{sinc}(\mu W)$
        -   $\text{sinc}(m)=\frac{\sin(\pi m)}{\pi m}$
        -   $H(t)$ 有无限频率
-   一个带限函数一定是从 $-\infty$ 到 $\infty$ 的，有限长度的采样，混淆不可避免
-   抗混淆：事先防止或减轻混淆
    -   平滑输入函数：图像散焦
-   重建函数: $f(t)=\sum_{n=-\infty}^{\infty}f(n\Delta T)\text{sinc}(\frac{t-n\Delta T}{\Delta T})$

### Fourier Series

连续周期函数 $\widetilde f(t)$ $\overset{\mathcal{FS}}{\leftrightarrow}$ 离散函数 $F[k]$

-   傅里叶级数：$\widetilde f(t)=\sum_{n=-\infty}^{\infty}F[n]e^{i\frac{2\pi n}{T}t}$
-   $F[n] = \mathcal{FS}(\widetilde f)=\frac{1}{T}\int_{-T/2}^{T/2}f(t)e^{-i\frac{2\pi n}{T}t}$

## Discrete Fourier Transform

离散周期函数 $f_n$ $\overset{\mathcal{DFT}}{\leftrightarrow}$ 离散周期函数 $F_m$

-   DFT: $F_m=\sum_{n=0}^{M-1}f_n e^{\frac{-i2\pi mn}{M}},m=0,1,\cdots, M-1$
    -   $F(u)=\sum_{x=0}^{M-1}f(x)e^{-i2\pi ux/M} ,u=0,1,2,\cdots,M-1$
        -   $F(u)=F(u+kM)$
-   IDFT: $f_n=\frac{1}{M}\sum_{m=0}^{M-1}F_me^{\frac{i2\pi mn}{M}},n=0,1,\cdots,M-1$
    -   $f(x)=\frac{1}{M}\sum_{0}^{M-1}F(u)e^{i2\pi ux/M},x=0,1,\cdots,M-1$
        -   $f(x)=f(x+kM)$
-   表达式不依赖采样间隔、频率间隔
    -   时间间隔：$\Delta T$
    -   时间长度：$M\Delta T=T$
    -   频域间隔：$\frac{1}{T}$
    -   频域范围: $\frac{1}{\Delta T}$
    -   适用于任何均匀采样的有限离散样本集
-   循环卷积: $f(x)\star h(x)=\sum_{m=0}^{M-1}f(m)h(x-m)$

### 二维傅里叶变换

-   冲激：$\delta(t,z)$
-   二维冲激串：$s_{\Delta T\Delta Z}(t,z)=\sum_{m=-\infty}^{\infty}\sum_{n=-\infty}^\infty\delta(t-m\Delta T,z-n\Delta Z)$
-   二维盒状函数：$F(\mu,v)=ATZ\text{sinc}(\pi\mu T)\text{sinc}(\pi v Z)$
-   二维采样定理：$\frac{1}{\Delta T}>2\mu_{\max},\frac{1}{\Delta Z}>2v_{\max}$
-   混淆
    -   空间混淆(欠采样)：锯齿，伪高光，虚假模式
    -   时间混淆：图像系列中的时间间隔：车轮倒转
-   摩尔模式：两个等间隔的光栅产生的差拍模式
-   DFT: $F(u,v)=\sum_{x=0}^{M-1}\sum_{y=0}^{N-1}f(x,y)e^{-i2\pi(ux/M+vy/N)}$
-   IDFT: $f(x,y)=\frac{1}{MN}\sum_{u=0}^{M-1}\sum_{v=0}^{N-1}F(u,v)e^{i2\pi(ux/M+vy/N)}$
-   平移性
    -   $f(x-x_0,y-y_0)\iff F(u,v)e^{-i2\pi(x_0u/M+y_0v/N)}$
    -   $f(x,y)e^{i2\pi(u_0x/M+v_0y/N)}\iff F(u-u_0,v-v_0)$
    -   $f(x)e^{i2\pi(u_0x/M)}=f(x)(-1)^x\iff F(u-u_0)$
        -   $u_0=\frac{M}{2}x$
    -   中心化：$f(x,y)(-1)^{x+y}\iff F(u-M/2,v-N/2)$
    -   幅值不变
-   旋转性
    -   极坐标：$f(r,\theta+\theta_0)\iff F(\omega,\varphi+\theta_0)$
-   周期性
-   对称性
    -   $w_e(x,y)=\frac{w(x,y)+w(M-x,N-y)}{2}$
    -   $w_o(x,y)=\frac{w(x,y)-w(M-x,N-y)}{2}$
    -   实函数的傅里叶变换是共轭对称的
    -   虚函数的傅里叶变换是共轭反对称
-   傅里叶谱
    -   极坐标：$F(u,v)=|F(u,v)|e^{i\phi(u,v)}$
    -   幅度（傅里叶谱）：$|F(u,v)|$
        -   偶对称
        -   正弦波的幅度，携带了灰度信息
    -   功率：$P(u,v)=|F(u,v)|^2$
    -   相角 $[-\pi,\pi]$
        -   奇对称
        -   正弦波的位移，携带了定位信息
    -   $f(0,0)$: 样本求和
        -   $|f(0,0)|$ 一般为谱的最大分量（直流分量）
-   二维离散卷积
    -   $f(x,y)\star h(x,y)\iff F(u,v)H(u,v)$
    -   $f(x,y)h(x,y)\iff F(u,v)\star H(u,v)$
    -   缠绕错误
        -   二维 $0$ 填充：$P\geq A+B+1$

### FFT

## 频域率滤波

- 直观
  - 变化最慢的分量，与平均灰度成正比
  - 低频对应于图像中缓慢变化的灰度（墙）
  - 高频对应于图像剧烈变化的灰度（边缘）
- 频域滤波器：$H(u,v)$
  - $g(x,y)=\mathfrak{F}^{-1}(H(u,v)\mathfrak{F}(f)(u,v))$
  - 假设 $F(u,v)$ 中心化
- 频域滤波
  - $M\times N$ 补零成 $P=2M,Q=2N$, $f_p(x,y)$ 乘以 $(-1)^{x+y}$，变换得 $F(u,v)$
  - 生成 $P\times Q$, 中心在 $(\frac{P}{2},\frac{Q}{2})$ 处的滤波函数 $H(u,v)$，$G(u,v)=H(u,v)F(u,v)$
  - $g_p(x,y)=\text{Re}(\mathfrak{F}^{-1}(G(u,v)))(-1)^{x+y}$
  - 提取 $g_p(x,y)$ 中左下角的 $M\times N$ 的图像
- 高通滤波器：衰减低频通过高频，强化细节，对比度降低
  - 略微平移：对比度保留
- 零相角滤波器：$\mathfrak{F}^{-1}(H(u,v)F(u,v))=\mathfrak{F}^{-1}(H(u,v)R(u,v)+iH(u,v)C(u,v))$
- 对应的空间滤波器：$g(x,y)=\mathfrak{F}^{-1}(H(u,v))$
  - 构造空间滤波器来近似频率滤波器
- 一维频率域高斯滤波器 $H(u)=Ae^{-u^2/2\sigma^2}$
  - 空间域：$h(x)=\sqrt{2\pi}\sigma Ae^{-2\pi^2\sigma^2x^2}$

## 平滑图像（低通滤波）

衰减高频通过低频，模糊图像

- 理想低通滤波器(ILPF)：$H(u,v)=[D(u,v)\leq D_0]$
  - $D(u,v)=[(u-\frac{P}{2})^2+(v-\frac{Q}{2})^2]^{\frac{1}{2}}$
  - 截止频率：$D_0$
  - 半径为 $D_0$ 内的频率百分比：$100[\sum_u\sum_v{|F(u,v)|^2}/P_T]$
  - 振铃(ringring) 现象
- Butterworth 低通滤波器(BLPF)：$H(u,v)=\frac{1}{1+(D(u,v)/D_0)^{2n}}$
  - $n=2$：平滑效果较好，且无振铃
- 高斯低通滤波器(GLPF)：$H(u,v)=e^{-D^2(u,v)/2\sigma^2}$
  - $\sigma=D_0$

## 锐化图像

- 理想高通滤波器
- 布特沃斯高通滤波器
- 高斯高通滤波器
- 频率域的拉普拉斯算子
  - $H(u,v)=-4\pi^2(u^2+v^2)$
  - $\nabla^2f(x,y)=\mathfrak{F}^{-1}(H(u,v)F(u,v))$
  - $g(x,y)=\mathfrak{F}^{-1}((1+4\pi^2D^2(u,v))F(u,v))$
    - 量纲问题
- 非锐化掩蔽
  - $g(x,y)=f(x,y)+kg_{\text{mask}(x,y)}$
  - $g(x,y)=\mathfrak{F}^{-1}((1+k(1-H_{\text{LP}(u,v)}))F(u,v))$
  - 高频增强滤波：$\mathfrak{F}^{-1}((k_1+k_2H_{\text{HP}(u,v)})F(u,v))$
    - $1-H_{\text{LP}}=H_{\text{HP}}$
    - 防止图像变暗
- 同态滤波
  - 照射反射模型：$f(x,y)=i(x,y)r(x,y)$
    - 照射：$0<i(x,y)<\infty$
    - 反射：$0<r(x,y)<1$
  - $z(x,y)=\ln f(x,y)=\ln i(x,y)+\ln r(x,y)$
  - $Z(u,v)=F_i(u,v)+F_r(u,v)$
    - 低频：照射分量
    - 高频：反射分量
  - 增强对比度，压缩灰度：$H(u,v)=(\gamma_H-\gamma_L)(1-e^{-c(D^2(u,v)/D_0^2)})+\gamma_L$

## 选择性滤波

- 带阻/带通滤波器
  - 理想带阻滤波器：$H_{\text{BR}}(u,v)=1-[D_0-\frac{W}{2}\leq D\leq D_0+\frac{W}{2}]$
  - 理想带通滤波器：$H_{\text{BP}}=1-H_{\text{BR}}$
- 陷波滤波器（notch filters）
  - $H_{\text{NR}}=\prod_{k=1}^QH_k(u,v)H_{-k}(u,v)$
  - 交互式改变，不进行补0填充
  - 处理摩尔模式
