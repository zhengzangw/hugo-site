---
title: 3-CNN
date: 2020-06-14
weight: 3
---

## 卷积

- 卷积：$Y=W*X,y_{ij}=\sum_{u=1}^U\sum_{v=1}^V\omega_{uv}x_{i-u+1,j-v+1}$
- 互相关：$Y=W\otimes X=\text{rot180}(W)*X$
  - $Y\in\mathbb{R}^{M-U+1,N-V+1}$
  - 深度学习中常用互相关代替卷积
- 卷积层输出长度（神经元数量）：$\frac{M-K+2P}{S}+1$
  - 输入神经元 $M$
  - 步长 $S$
  - 卷积大小 $K$
  - 零填充：输入向量两端补 $P$ 个零
- 卷积分类
  - 窄卷积：$S=1,P=0$
  - 宽卷积：$S=1,P=K-1,W\tilde\otimes X=W\otimes\tilde{X}$
  - 等宽卷积：$S=1,P=\frac{(K-1)}{2}$
- 卷积数学性质 $Y=W\otimes X$
  - $\text{rot180}(W)\tilde{\otimes}X=\text{rot180}(X)\tilde{\otimes}W$
  - $\frac{\partial f(Y)}{\partial W}=\frac{\partial f(Y)}{\partial Y}\otimes X$
  - $\frac{f(Y)}{\partial X}=\text{rot180}(W)\tilde{\otimes}\frac{\partial f(Y)}{\partial Y}$
- 其它卷积方式
  - 转置卷积（反卷积）：从低维到高维的映射
  - 微步卷积：$S<1$ 或在每两个向量元素间插入 $D$ 个 0，可得 $(D+1)\times(M-1)+K$ 维的向量
  - 空洞卷积（卷积膨胀）：卷积核间增加空洞，增大感受野

## CNN

- FNN 处理图像信息
  - 参数过多
    - $100\times100\times3$ 则第一隐藏层每个神经元有 $30000$ 参数
    - 权重矩阵有 $M_l\times M_{l-1}$ 个参数
  - 局部不变性特征
- 卷积层：$z^{(l)}=\omega^{(l)}\otimes a^{(l-1)}+b^{(l)}$
  - 局部连接：卷积层中每个神经元只和前一层中某个局部窗口内的神经元相连构成局部连接网络
  - 权重共享：$\omega^{(l)}$ 对所有神经元相同，一个卷积核只捕捉输入数据中的一种特定的局部特征
  - 共 $K+1$ 个参数
- 卷积层
  - 输入特征映射组：$\mathcal{X}\in\mathbb{R}^{M\times N\times D}$ 三维张量，切片 $X^d\in\mathbb{R}^{M\times N}$ 为一个输入特征映射
  - 输出状态映射组：$\mathcal{Y}\in\mathbb{R}^{M'\times N'\times P}$ 三维张量，切片 $Y^p\in\mathbb{R}^{M'\times N'}$
  - 卷积核：$\mathcal{W}\in\mathbb{R}^{U\times V\times P\times D}$，切片 $W^{p,d}\in\mathbb{R}^{U\times V}$ 为一个二维卷积核
  - $Z^p=W^p\otimes X+b^p=\sum_{d=1}^DW^{p,d}\otimes X^d+b^p$
  - $Y^p=f(Z^p)$
- 汇聚层
  - 最大汇聚：$y_{m,n}^d=\max_{i\in R_{m,n}^d}x_i$
  - 平均汇聚：$y_{m,n}^d=\frac{1}{|R_{m,n}^d|}\sum_{i\in R_{m,n}^d}x_i$
- 反向传播算法
  - $\delta^{(l,p)}=\frac{\partial L}{\partial Z^{(l,p)}}$
  - 汇聚层：$\delta^{(l,p)}=\frac{\partial L}{\partial Z^{(l,p)}}=f'_l(Z^{(l,p)}\odot\text{up}(\delta^{(l+1,p)})$
  - 聚集层：$\delta^{(l,d)}=f'_l(Z^{(l,d)})\cdot\sum_{P=1}^P(\text{rot180}(W^{(l+1,p,d)}\tilde\otimes\delta^{(l+1,p)}))$

## Backbones

- LeNet-5(1998)
  - 连接表
  - 输出层为 RBF 函数
- AlexNet(2012)
  - GPU 训练
  - 局部响应归一
- Inception
  - Inception 模块：不同卷积核得到结果再深度上堆叠作为输出
  - Inception v1 (GoogLeNet, 2015)
  - Inception v3 (2016)
- ResNet
  - 残差连接：$h(x)=x+(h(x)-x)$
  - ResNet-50
- VGG
