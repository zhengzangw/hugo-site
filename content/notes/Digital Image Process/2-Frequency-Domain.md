---
title: Frequency Domain
date: 2019-09-02
weight: 3
---

## 傅里叶变换

![傅里叶变换关系](https://pic1.zhimg.com/3b0b4443adeae9e985073c5a094d040a_r.jpg)

### 冲激

* 冲激
  * 单位冲激($0$ 处)：$\delta(t)=[t=0]\infty,\int_{-\infty}^{\infty}\delta(t)dt=1$
  * 单位冲激($t_0$ 处)：$\delta(t-t_0)\infty$
  * 采样性质：$\int_{-\infty}^{\infty}f(t)\delta(t)dt=f(0)$
* 离散冲激
  * 离散单位冲激：$\delta(x-x_0)=[t=0]$
  * 采样性质：$\sum_{x=-\infty}^\infty f(x)\delta(x-x_0)=f(x_0)$
* 冲激串: $s_{\Delta T}(t)=\sum_{n=-\infty}^{\infty}\delta(t-n\Delta T)$
    * $S_{\Delta T}(\mu)=\frac{1}{\Delta T}s_{\frac{1}{\Delta T}}$
* 采样: $f(t)s_{\Delta T}(t)=\sum_{n=-\infty}^{\infty}f(t)\delta(t-n\Delta T)$
* 周期化：$f(t)\star s_{\Delta T}(t)$

### (Continuous) Fourier Tranform

连续函数 $f(t)$ $\overset{\mathcal{F}}{\leftrightarrow}$ 连续函数 $F(\mu)$

* FT

$$F(\mu)=\mathcal{F}(f)=\int_{-\infty}^{\infty}f(t)e^{-i2\pi\mu t}dt=\int_{-\infty}^\infty f(t)[\cos(2\pi\mu t)-i\sin(2\pi\mu t)]dt$$

* IFT

$$f(t)=\mathcal{F}^{-1}(F)=\int_{-\infty}^{\infty}F(\mu)e^{i2\pi\mu t}d\mu$$

* 性质
  * 对称性：$\mathcal{F}(F(t))=f(-\mu)$
  * 线性: $\mathcal{F}(\alpha f+\beta g)=\alpha\mathcal{F}(f)+\beta\mathcal{F}(g)$
  * 平移性：
    * $\mathcal{F}(f(t-\tau))=F(\mu)e^{-i2\pi\mu\tau}$
  * 微分关系：$\mathcal{F}(f'(x))i\mu=\mathcal{F}(f(x))$
  * 卷积定理
    * $(f(t)\star h(t))(x)=\int_{-\infty}^\infty f(x-t)h(t)dt$
    * $\mathcal{F}(f(t)\star h(t))=H(\mu)F(\mu)$
    * $\mathcal{F}(f(t)h(t))=H(\mu)\star F(\mu)$
* 盒状函数：$f(t)=A[|x|<=\frac{W}{2}]$
  * $F(\mu)=AW\frac{\sin(\pi\mu W)}{\pi\mu W}=AW\text{sinc}(\mu W)$

### Fourier Series

连续周期函数 $\overline{f}(t)$ $\overset{\mathcal{FS}}{\leftrightarrow}$ 离散函数 $F[k]$

* $\overline{f}(t)=f(t)\star s_{T_0}(t)$
* FS

$$ F[k] = \mathcal{FS}(\overline{f}) = \mathcal{F}(f\star s_{T_0}) =  \frac{1}{T}\int_{-T/2}^{T/2}f(t)e^{-i\frac{2\pi n}{T}t}dt$$

* IFS

$$\overline{f}(t) = \mathcal{FS}^{-1}(F) =\sum_{n=-\infty}^{\infty}F[n]e^{i\frac{2\pi n}{T}t}$$

### Discrete Time Fourier Transform

离散函数 $x[n]$ $\overset{\mathcal{DTFT}}{\leftrightarrow}$ 连续周期函数 $\widetilde F(\mu)$

* $x[n]=\widetilde f(t)=f(t)s_{\Delta T}$
* DTFT

$$\widetilde F(\mu) = \mathcal{DTFT}(x[n]) = \mathcal{F}(f(t)s_{\Delta T})$$

* 采样定理：可完全恢复的采样率 $\frac{1}{\Delta T}>2\mu_{\max}$
  * 带限函数：傅里叶变换后非零频率属于 $[-\mu_{\max},\mu_{\max}]$
  * 奈奎斯特采样率：$2\mu$（无限采样）
* 混淆：带限函数必须在 $(-\infty,\infty)$ 有值，有限长度的采样，混淆不可避免
  * 带限函数**有限**长度采样 $f(t)[0\leq t\leq T]$
  * 抗混淆：事先防止或减轻混淆
      * 平滑输入函数：图像散焦，减少高频分量
* 由样本恢复原函数
  * 内插: $f(t)=\sum_{n=-\infty}^{\infty}f(n\Delta T)\text{sinc}(\frac{t-n\Delta T}{\Delta T})$

### Discrete Fourier Transform

离散周期函数 $f_n$ $\overset{\mathcal{DFT}}{\leftrightarrow}$ 离散周期函数 $F_m$

* DFT:
  
$$F(u)=\mathcal{DFT}(f)=\sum_{x=0}^{M-1}f(x)e^{-i2\pi ux/M} ,u=0,1,2,\cdots,M-1$$

* IDFT:

$$f(x)=\mathcal{IDFT}(f)=\frac{1}{M}\sum_{0}^{M-1}F(u)e^{i2\pi ux/M},x=0,1,\cdots,M-1$$

* 适用于任何均匀采样的有限离散样本集
  * 采样数：$M$
  * 时间间隔：$\Delta T$
  * 时间长度：$T=M\Delta T$
  * 频域间隔：$\Delta u=\frac{1}{T}$
  * 频域范围: $\Omega=\frac{1}{\Delta T}$
* 循环卷积: $f(x)\star h(x)=\sum_{m=0}^{M-1}f(m)h(x-m)$

## 二维傅里叶变换

### 冲激

* 冲激：$\delta(t,z)$
* 二维冲激串：$s_{\Delta T\Delta Z}(t,z)=\sum_{m=-\infty}^{\infty}\sum_{n=-\infty}^\infty\delta(t-m\Delta T,z-n\Delta Z)$
* 二维盒状函数：$F(\mu,v)=ATZ\text{sinc}(\pi\mu T)\text{sinc}(\pi v Z)$
* 二维采样定理：$\frac{1}{\Delta T}>2\mu_{\max},\frac{1}{\Delta Z}>2v_{\max}$
* 混淆
    * 空间混淆(欠采样)：锯齿，伪高光，虚假模式
      * 图像放大：过采样
      * 图像缩小：欠采样
    * 时间混淆：图像系列中的时间间隔：车轮倒转
  * 摩尔模式：两个等间隔的光栅产生的差拍模式

### 离散傅里叶变换

* DFT

$$F(u,v)=\sum_{x=0}^{M-1}\sum_{y=0}^{N-1}f(x,y)e^{-i2\pi(ux/M+vy/N)}$$

* IDFT

$$f(x,y)=\frac{1}{MN}\sum_{u=0}^{M-1}\sum_{v=0}^{N-1}F(u,v)e^{i2\pi(ux/M+vy/N)}$$

* 平移性
    * $f(x-x_0,y-y_0)\iff F(u,v)e^{-i2\pi(x_0u/M+y_0v/N)}$
    * $f(x,y)e^{i2\pi(u_0x/M+v_0y/N)}\iff F(u-u_0,v-v_0)$
    * 中心化：$f(x,y)(-1)^{x+y}\iff F(u-M/2,v-N/2)$
    * 幅值不变
* 旋转性
    * 极坐标：$f(r,\theta+\theta_0)\iff F(\omega,\varphi+\theta_0)$
* 对称性
  * 偶函数：$w_e(x,y)=w_e(M-x,N-y)$
  * 奇函数：$w_o(x,y)=-w_o(M-x,N-y)$
  * $w_e(x,y)=\frac{w(x,y)+w(M-x,N-y)}{2}$
  * $w_o(x,y)=\frac{w(x,y)-w(M-x,N-y)}{2}$
  * 实函数的傅里叶变换是共轭对称的：$F^*(u,v)=F(-u,-v)$
  * 虚函数的傅里叶变换是共轭反对称：$F^*(u,v)=-F(-u,-v)$

### 傅里叶谱
    
* 极坐标：$F(u,v)=|F(u,v)|e^{i\phi(u,v)}$
* 幅度（傅里叶谱）：$|F(u,v)|$
    * 偶对称
    * 正弦波的幅度，携带了灰度信息
* 相角：$\phi(u,v)\in[-\pi,\pi]$
    * 奇对称
    * 正弦波的位移，携带了定位信息
* 功率：$P(u,v)=|F(u,v)|^2$
* $F(0,0)$: 直流分量
    * $|F(0,0)|=MN|\overline{f}(x,y)|$

### 二维离散卷积

* $f(x,y)\star h(x,y)=\sum_{m=0}^{M-1}\sum_{n=0}^{N-1}f(m,n)h(x-m,y-n)$
* $f(x,y)\star h(x,y)\iff F(u,v)H(u,v)$
* $f(x,y)h(x,y)\iff F(u,v)\star H(u,v)$
* 缠绕错误
  * 样本数：$A,B$
  * $0$ 填充：$P\geq A+B-1$

## 频域滤波

- 直观
  - 变化最慢的分量，与平均灰度成正比
  - 低频对应于图像中缓慢变化的灰度（墙）
  - 高频对应于图像剧烈变化的灰度（边缘）
- 频域滤波器：$H(u,v)$
  - $g(x,y)=\mathcal{F}^{-1}(H(u,v)F(u,v))$
  - $F(u,v)$ 中心化: $F(u,v)=\mathcal{F}(f(x,y)(-1)^{x+y})$
- **频域滤波流程**
  - 补零：$M\times N$ 补零成 $P=2M,Q=2N$ 的图像 $f_p(x,y)$
  - 频域中心化：$f_p(x,y)(-1)^{x+y}$
  - DFT: $F(u,v)$
  - 滤波函数 $H(u,v)$生成： $P\times Q$, 中心在 $(\frac{P}{2},\frac{Q}{2})$
  - $G(u,v)=H(u,v)F(u,v)$
  - 得到处理后函数：$g_p(x,y)=\text{Re}(\mathfrak{F}^{-1}(G(u,v)))(-1)^{x+y}$
  - 提取 $g_p(x,y)$ 中左上角的 $M\times N$ 的图像
- 对应的空间滤波器：$g(x,y)=\mathfrak{F}^{-1}(H(u,v))$
  - 构造空间滤波器来近似频率滤波器
- 零相角滤波器：$\mathcal{F}^{-1}(H(u,v)F(u,v))=\mathcal{F}^{-1}(H(u,v)R(u,v)+iH(u,v)C(u,v))$


### 平滑图像（低通滤波）

衰减高频通过低频，模糊图像

- 理想低通滤波器(ILPF)：$H(u,v)=[D(u,v)\leq D_0]$
  - $D(u,v)=[(u-\frac{P}{2})^2+(v-\frac{Q}{2})^2]^{\frac{1}{2}}$
  - 截止频率：$D_0$
  - 振铃(ringring) 现象
- Butterworth 低通滤波器(BLPF)：$H(u,v)=\frac{1}{1+(D(u,v)/D_0)^{2n}}$
  - $n=2$：平滑效果较好，且无振铃
- 高斯低通滤波器(GLPF)：$H(u,v)=e^{-D^2(u,v)/2D_0^2}$

### 锐化图像

- 高通滤波器：衰减低频通过高频，强化细节，对比度降低
  - 略微平移保留对比度
  - 理想高通滤波器
  - 布特沃斯高通滤波器
  - 高斯高通滤波器
- 频率域的拉普拉斯算子
  - $H(u,v)=-4\pi^2(u^2+v^2)$
  - $\nabla^2f(x,y)=\mathcal{F}^{-1}(H(u,v)F(u,v))$
  - 图像锐化
    - $g(x,y)=f(x,y)+c\nabla^2f(x,y)$
    - $g(x,y)=\mathcal{F}^{-1}((1+4\pi^2D^2(u,v))F(u,v))$
      - 量纲问题
- 非锐化掩蔽
  - $g(x,y)=f(x,y)+kg_{\text{mask}(x,y)}$
  - $g(x,y)=\mathcal{F}^{-1}((1+k(1-H_{\text{LP}(u,v)}))F(u,v))$
  - 高频增强滤波：$\mathcal{F}^{-1}((k_1+k_2H_{\text{HP}(u,v)})F(u,v))$
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

### 选择性滤波

- 带阻/带通滤波器
  - 理想带阻滤波器：$H_{\text{BR}}(u,v)=1-[D_0-\frac{W}{2}\leq D\leq D_0+\frac{W}{2}]$
  - 理想带通滤波器：$H_{\text{BP}}=1-H_{\text{BR}}$
- 陷波滤波器（notch filters）
  - $H_{\text{NR}}=\prod_{k=1}^QH_k(u,v)H_{-k}(u,v)$
  - $H_k(u,v)$ 是中心在 $(u_k,v_k)$ 的高通滤波器
  - 交互式改变，不进行补0填充
  - 处理摩尔模式
