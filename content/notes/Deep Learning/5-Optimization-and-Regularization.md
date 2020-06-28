---
title: 5-Optimization and Regularization
date: 2020-06-16
weight: 5
---

## Optimization

- 高维变量非凸优化
  - 鞍点
  - 平坦最小值与尖锐最小值
  - 局部最小解等价性

### 优化算法

- 小批量梯度下降（批量，学习率，梯度估计）
  - $g_t=\frac{1}{K}\sum_{(x,y)\in S_t}\frac{\partial L(y,f(x;\theta))}{\partial\theta}$
  - $\theta\leftarrow\theta-\alpha g_t$
- 批量大小选择
  - 线性放缩规则：批量大小增加 $m$ 倍时，学习率也增加 $m$ 倍（批量大小较小时适用）
  - 批量越大，越有可能收敛到尖锐最小值;批量越小，越有可能收敛到 平坦最小值
- 学习率衰减（退火）
  - 分段常数分解：每经过 $T_1,\cdots,T_m$ 次迭代，衰减为原来的 $\beta_1,\cdots,\beta_m$ 倍
  - 逆时衰减：$\alpha_t=\alpha_0\frac{1}{1+\beta\times t}$
  - 指数衰减：$\alpha=\alpha_0\beta^t$
  - 自然指数衰减：$\alpha_0\exp(-\beta\times t)$
  - 余弦衰减：$\alpha_t=\frac{1}{2}\alpha_0(1+\cos(\frac{t\pi}{T}))$
- 学习率预热：最初几轮使用较小的学习率
  - 逐渐预热(2017)：$\alpha_t'=\frac{t}{T'}\alpha_0$
- 周期性学习率调整
  - 循环学习率
  - 带热重启的随机梯度下降
- AdaGrad(2011)：自适应调整参数学习率
  - $\Delta\delta_t=-\frac{\alpha}{\sqrt{G_t+\epsilon}}\odot g_t$
  - 梯度平方的累计值: $G_t=\sum_{\tau=1}^tg_\tau\odot g_\tau$
  - 偏导数累积比较大，其学习率相对较小; 相反，如果其偏导数累积较小，其学习率相对较大。但整体是随着迭代次数的增加，学习率逐渐缩小
- RMSProp(2012)：避免学习率过早衰减
  - $\Delta\theta_t=-\frac{\alpha}{\sqrt{G_t+\epsilon}}\odot g_t$
  - 梯度平方的指数衰减：$G_t=\beta G_{t-1}+(1-\beta)g_t\odot g_t$
- AdaDelta 算法：引入参数更新差值 $\Delta\theta$ 的平方调整学习率
  - $\Delta\theta_t=-\frac{\sqrt{\Delta X_{t-1}^2+\epsilon}}{\sqrt{G_t+\epsilon}}\odot g_t$
  - $\Delta X_{t-1}^2=\beta_1\Delta X_{t-2}^2+(1-\beta_1)\Delta\theta_{t-1}\odot\Delta\theta_{t-1}$
- 梯度估计修正
  - 动量法：$\Delta\theta_t=\rho\Delta_{t-1}-\alpha g_t$
  - Nesterov 动量法：$\Delta\theta_t=\rho\Delta_{t-1}-\alpha g_t(\theta_{t-1}+\rho\Delta\theta_{t-1})$
  - Adam 算法(2015)
    - $M_t=\beta_1 M_{t-1}+(1-\beta_1)g_t,\hat M_t=\frac{M_t}{1-\beta_1^t}$
    - $G_t=\beta_2G_{t-1}+(1-\beta_2)g_t\odot g_t,\hat G_t=\frac{G_t}{1-\beta_2^t}$
    - $\Delta\theta_t=-\frac{\alpha}{\hat G_t+\epsilon}\hat M_t$
- 梯度截断
  - 按值截断：$g_t=\max(\min(g_t,b),a)$
  - 按模截断：$g_t=\frac{b}{\|g_t\|}g_t$

### 参数初始化

- 固定方差参数初始化
  - 高斯分布初始化
  - 均匀分布初始化
- 方差放缩参数初始化
  - Xavier 初始化：方差为 $\frac{2}{M_{l-1}+M_l}$
    - 恒等函数
    - Logistic: 16
    - Tanh
  - He 初始化(Kaiming)：反差为 $\frac{2}{M_{l-1}}$
    - ReLU
- 正交初始化：范数保持性 $\|\delta^{(l-1)}\|^2=\|\delta^{(l)}\|^2$
  - 高斯分布初始化后，SVD 分解并取一个正交矩阵作为权重

### 数据预处理

- 尺度不变性：算法在缩放部分特征后不影响学习和预测
- 归一化
- 白化：降低冗余性
- 数据增强：Rotation, Flip, Zoom In/Out, Shift, Noise

### 优化地形

- ReLU 激活函数
- 残差连接
- 逐层归一化
  - 批量归一化（BN）：$\text{BN}_{\gamma,\beta}(z^{(l)})=\frac{z^{(l)}-\mu_B}{\sqrt{\sigma_B^2+\epsilon}}\odot\gamma+\beta$
    - $\mu_B=\frac{1}{K}\sum_{k=1}^Kz^{(k,l)}$
  - 层归一化（LN）：$\text{LN}_{\gamma,\beta}(z_t^{(l)})=\frac{z^{(l)}-\mu}{\sqrt{\sigma^2+\epsilon}}\odot\gamma+\beta$
    - $\mu=\frac{1}{\mathbb{M_l}}\sum_{i=1}^{M_I}z_i^{(l)}$
  - 权重归一化：通过再参数化将权重分为长度与方向
    - $W_{i,:}=\frac{g_i}{\|v_i\|}v_i$
  - 局部响应归一化（LRN）

### 超参数优化

- 超参数：网络结构、优化参数、正则化参数
- 困难
  - 组合优化问题
  - 评估一组参数配置的时间代价高
- 网格搜索
- 随机搜索
- 贝叶斯优化
- 动态资源分配
- 神经架构搜索

## 网络正则化

- $l_1$ 正则化
- $l_2$ 正则化
- 弹性网络衰减
- 权重衰减：$\theta_1\leftarrow (1-\beta)\theta_{t-1}-\alpha g_t$
  - 标准随机梯度下降中与 $l_2$ 正则化等价
- 提前停止：使用验证集错误代替期望错误
- 丢弃法
  - 训练时：$\text{mask}(x)=m\odot x, m$ 以概率为 $p$ 的伯努利分布随机生成
  - 测试时：$\text{mask}(x)=px$
  - 集成学习角度：丢弃相当于采样一个子网络
  - 贝叶斯学习角度
- 标签平滑：软目标标签，给其余 $K-1$ 个类概率 $\frac{\epsilon}{K-1}$
