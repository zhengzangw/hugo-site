---
title: 4-RNN
date: 2020-06-15
weight: 4
---

## 记忆能力

- 延时神经网络：非输出层前增加延时器
  - $h_t^{(l)}=f(h_t^{(l)},h_{t-1}^{(l-1)},\cdots,h^{(l-1)}_{t-K})$
  - 在时间维度上共享权值
- 有外部输入的非线性网络：每个时刻 $t$ 有一个外部输入，产生一个输出 $y_t$
  - 自回归模型：$y_t=\omega_0+\sum_{k=1}^K\omega_ky_{t-k}+\epsilon_t$
  - 有外部输入的非线性自回归模型：$y_t=f(x_t,x_{t-1},\cdots,x_{t-{K_x}},y_{t-1},y_{t-2},\cdots,y_{t-K_y})$
- 循环神经网络：$h_t=f(h_{t-1},x_t)$

  - 循环神经网络的通用近似定理（2009）：以任何准确率近似任何一个非线性动力系统

    $$s_t=g(s_{t-1},x_t)\\ y_t=o(s_t)$$

  - 图灵完备（1991）：所有图灵机可以被一个由使用 Sigmoid 型激活函数的神经元构成的全连接循环网络进行模拟

- 外部记忆单元

## RNN

- 简单神经网络
  - $z_t=Uh_{t-1}+Wx_{t}+b$
  - $h_t=f(z_t)$
  - $y_t=Vh_t$
- 应用模式
  - 序列到类别
    - $x_{1:T}=(x_1,\cdots,x_T)$ 按不同时刻输入到网络中
    - $y\in\{1,\cdots,C\}$
    - 序列特征：$h_T$ or $\frac{1}{T}\sum_{t=1}^Th_t$
  - 同步序列到序列（序列标注）
    - $x_{1:T}=(x_1,\cdots,x_T)$ 按不同时刻输入到网络中
    - $y_{1:T}=(y_1,\cdots,y_T)$
    - $\hat y_t=g(h_t),\forall t\in[1,T]$
  - 异步序列到序列（编码器-解码器）
    - $x_{1:T}=(x_1,\cdots,x_T)$ 按不同时刻输入到网络（编码器）中
    - $y_{1:M}=(y_1,\cdots,y_M)$ 按不同时刻输入到网络（解码器）中，初始隐状态为 $h_T$
    - $\hat y_t=g(h_{T+t})$
- 随时间反向传播（BPTT）：每层对应每个时刻
  - $\delta_{t,k}=\frac{\partial L_t}{\partial z_k}=\text{diag}(f'(z_k))U^T\delta_{t,k+1}$
  - $\frac{\partial L_t}{\partial U}=\sum_{k=1}^t\delta_{t,k}h^T_{k-1}$
  - $\frac{\partial L}{\partial U}=\sum_{t=1}^T\sum_{k=1}^t\delta_{t,k}h^T_{k-1}$
  - 在一次完整前向传播和反向计算后才能更新参数
- 实时循环学习（RTRL）
- 堆叠循环神经网络（SRNN）
  - 循环多层感知机（1991）：$h_t^{(l)}=f(U^{(l)}h_{t-1}^{(l)}+W^{(l)}h_t^{(l-1)}+b^{(l)})$
- 双向循环神经网络（Bi-RNN）

## 长程依赖问题

- 长程依赖问题
  - 梯度消失：$\frac{\partial L_t}{\partial h_k}$ 梯度消失，参数 $U$ 更新主要靠相邻状态
  - $h_t=h_{t-1}+g(x_t,h_{t-1};\theta)$: 梯度爆炸，记忆容量不足
  - 梯度爆炸：不稳定
- 长短期记忆网络（LSTM, 2000）
  - 内部状态 $c_t=f_t\odot c_{t-1}+i_t\odot \tilde{c}_t$
  - 外部状态 $h_t=o_t\odot \tanh(c_t)$
  - 门 $\{0,1\}$
  - 遗忘门 $f_t=\sigma(W_fx_t+U_fh_{t-1}+b_f)$ 控制内部状态遗忘多少信息
  - 输入门 $i_t=\sigma(W_ix_t+U_ih_{t-1}+b_i)$ 控制候选状态保存多少信息
  - 输出门 $o_t=\sigma(W_0x_t+U_0h_{t-1}+b_0)$ 控制内部状态输出多少给外部状态
  - 候选状态 $\tilde{c}_t=\tanh(Wx_t+Uh_{t-1}+b)$
- LSTM 变体
  - 无遗忘门(1997)
  - peephole 连接：三个门同时依赖于上一时刻记忆单元 $c_{t-1}$
  - 耦合输入门与遗忘门：$c_t=(1-i_t)\odot c_{t-1}+i_t\odot\tilde{c}_t$
- 门控循环网络（GRU, 2014）
  - $h_t=z_t\odot h_{t-1}+(1-z_t)\odot \tilde{h}_t$
  - 更新门 $z_t=\sigma(W_zx_t+U_zh_{t-1}+b_z)$
  - 重置门 $r_t=\sigma(W_rx_t+U_rh_{t-1}+b_r)$
  - 候选状态 $\tilde{h}_t=\tanh(W_cx_t+U_h(r_t\odot h_{t-1})+b)$

## 图结构

- 递归神经网络（RecNN）：$h_i=f(h_{\pi_i})$
  - 建模自然语言句子的语义
- 图神经网络（GNN）
  - $m_t^{(v)}=\sum_{u\in N(v)}f(h^{(v)}_{t-1},h_{t-1}^{(u)},e^{(u,v)})$
  - $h_t^{(v)}=g(h_{t-1}^{(v)},m_t^{(v)})$
  - 读出函数：$o_t=g(\{h_T^{(v)}|v\in V\})$
