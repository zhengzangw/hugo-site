---
title: 注意力机制与外部记忆
date: 2020-06-16
---

## 注意力机制

- 认知神经科学中的注意力
  - 聚焦式注意力
  - 基于显著性的注意力
  - 鸡尾酒会效应
- 基于显著性的注意力机制：最大汇聚、门控
- 注意力分布：
  - 输入变量：$[x_1,\cdots,x_N]$
  - 查询变量：$q$
  - 注意力变量：$z=n$ 选择第 $n$ 个输入变量
  - 注意力打分函数：$s(x,q)$
    - 加性模型：$s(x,q)=v^\top \tanh(Wx+Uq)$
    - 点积模型：$s(x,q)=x^\top q$
    - 缩放点积模型：$s(x,q)=\frac{x^\top q}{\sqrt{D}}$
    - 双线性模型：$s(x,q)=x^\top Wq$
  - 注意力分布：$\alpha_n=p(z=n|X,q)=\text{softmax}(s(x_n,q))$
- 软性注意力机制：$\text{att}(X,q)=\sum_{n=1}^N\alpha_nx_n$
- 硬性注意力机制：无法使用反向转播，通常用强化学习训练
  - $\text{att}=x_{\hat n},\hat n=\argmax\alpha_n$
  - 随机采样
- 键值对注意力
  - 输入信息：$[(k_1,v_1),\cdots,(k_N,v_N)]$
  - 注意力函数：$\sum_{n=1}^N\frac{\exp(s(k_n,q))}{\sum_j\exp(s(k_j,q))}v_n$
- 多头注意力：$\text{att}((K,V),Q)=\oplus\text{att}((K,V),q_i)$
- 结构化注意力
- 指针网络（2015）：序列到序列模型，输出下标
  - $p(c_{1:M}|x_{1:N})=\prod_{m=1}^M p(c_m|c_{1:(m-1)},x_{1:N})\approx\prod_{m=1}^Mp(c_m|x_{c1:c_{m-1}},x_{1:N})$
  - $p(c_m|c_{1:{(m-1)},x_{1:N}})=\text{softmax}(s_{m,n})$
  - $s_{m,n}=v^\top\tanh(Wx_n+Uh_m)$

### 自注意力模型

- 变长向量序列
  - 卷积网络或循环网络编码
  - 自注意力模型（内部注意力模型）
- 如果要建立输入序列之间的长距离依赖关系，可以使用以下两种方法：一种方法是增加网络的层数，通过一个深层网络来获取远距离的信息交互，另一种方法是使用全连接网络
- QKV 模式
  - 输入序列：$X=[x_1,\cdots,x_N]\in\mathbb{R}^{D_x\times N}$
  - 输出序列：$H=[h_1,\cdots,h_N]\in\mathbb{R}^{D_v\times N}$
  - 查询向量：$q_i\in\mathbb{R}^{D_k},Q=W_qX$
  - 键向量：$k_i,Q=W_qX\in\mathbb{R}^{D_k\times N}$
  - 值向量：$v_i,V=W_vX\in\mathbb{R}^{D_v\times N}$
  - $h_n=\text{att}((K,V),q_n)$

## 记忆

- 人脑记忆
  - 整体效应储存（分布式）
  - 周期性
    - 长期记忆（结构记忆，知识）
    - 短期记忆
    - 工作记忆（约 4 组项目）
  - 联想记忆：基于联想检索

### 记忆增强神经网络（MANN/MN）

- 基本模块
  - 主网络（控制器）
  - 外部记忆单元：分为多个记忆片段 $M=[m_1,\cdots,m_N]$
  - 读取模块：根据主网络的查询向量 $q_r$，读取 $r=R(M,q_r)$
  - 写入模块：根据主网络的查询向量 $q_\omega$ 和需写入信息 $a$ 更新 $M=W(M,q_\omega,a)$
- 按内容寻址：注意力机制
  - $r=\sum_{n=1}^N\alpha_n m_n$
  - $\alpha=\text{softmax}(s(m_n,q_r))$
- 端到端记忆网络（MemN2N,2015）：外部记忆只读
  - $m_{1:N}=\{m_1,\cdots,m_N\}$
  - 转换成两组记忆片段 $A,C$ 分别用来寻址和输出
  - $r=\sum_{n=1}^N\text{softmax}(a_n^\top q)c_n$
  - $y=f(q+r)$
  - 多跳操作：$q^{(k)}=r^{(k-1)}+q^{(k-1)}$
- 神经图灵机（2014）
  - 外部记忆：$M\in\mathbb{R}^{D\times N}$
  - 控制器：神经网络
  - 每个时刻 $t$，接受 $x_t,h_{t-1},r_{t-1}$ 输出 $h_t$，生成查询向量 $q_t$，删除向量 $e_t$ 和增加向量 $a_t$
  - 读操作：$\alpha_{t,n}=\text{softmax}(s(m_{t,n},q_t))$
    - 读向量：$r_t=\sum_{n=1}^N\alpha_{t,n}m_{t,n}$
  - 写操作：$m_{t+1,n}=m_{t,n}(1-\alpha_{t,n}e_t)+\alpha_{t,n}\alpha_t$

### 基于神经动力学的联想记忆

- Hopfield 网络
  - 状态：$\{+1,-1\}$
  - 更新规则：$s_i=s_i+\text{sgn}(\sum_{j=1}^M\omega_{ij}s_j+b_i)$
  - 能量函数：$E=-\frac{1}{2}\sum_{i,j}\omega_{ij}s_is_j-\sum_ib_is_i$
  - 权重对称：$\omega_{ii}=0,\omega_{ij}=\omega_{ji}$
  - 稳定性：能量函数多次迭代后收敛
  - 吸引点：稳定状态，局部最优点，有限，网络储存的模式
  - 信息储存（学习规则）：赫布规则 $\omega_{ij}=\frac{1}{N}\sum_{n=1}^Nx_i^{(n)}x_j^{(n)}$
  - 储存容量：数量为 $M$ 的二值神经元网络，总状态数为 $2^M$，有效稳定点状态数即储存容量
    - Hopfield: 0.14 $M$
    - 玻尔兹曼机: 0.6 $M$，收敛较慢
