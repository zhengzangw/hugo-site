---
title: Support Vector Machine
date: 2019-04-14
tags: [ml, math, notes]
weight: 5
---

## **SVM 基本型**

* 划分超平面：$\omega^Tx+b=0$
    * 点到超平面的距离：$\frac{|\omega^Tx+b|}{||\omega||}$

$$\begin{cases}
    \omega^Tx_i+b\geq y_i, & y_i=+1 \\
    \omega^Tx_i+b\leq y_i, & y_i=-1
\end{cases}$$

* 支持向量（support vector）：使上式成立取等的样本点
* 间隔（margin）：两个异类支持向量到超平面的距离 $\frac{2}{||\omega||}$
* SVM 基本型(Support Vector Machine)

$$\begin{aligned}
\min_{\omega,b} & \frac{1}{2}||\omega||^2 & \\
s.t. & y_i(\omega^Tx_i+b)\geq 1, &i=1,2,\cdots,m
\end{aligned}$$

* 凸优化求解：复杂度与样本维度（等于权值 $\omega$ 的维度）有关

## 对偶问题

* 复杂度与样本数量（等于拉格朗日算子$\alpha$的数量）有关
* 解的稀疏性：最终模型仅与支持向量有关
    * KKT 条件导出

### **对偶问题的转化**

* Step1: 拉格朗日函数：$L(\omega,b,\alpha)$
* Step2: 对 $\omega$ 和 $b$ 求偏导并令为零
    * $\omega=\sum_{i=1}^m\alpha_iy_ix_i$
* Step3: 回代可得

$$\begin{aligned}
\max_{\alpha} & \sum_{i=1}^m\alpha_i-\frac{1}{2}\sum_{i=1}^m\sum_{i=1}^m\alpha_i\alpha_jy_iy_jx_i^Tx_j \\
s.t. & \sum_{i=1}^m\alpha_iy_i=0 \\
& \alpha_i\geq 0
\end{aligned}$$

### 求解对偶问题

* SMO (Sequential Minimal Optimization)
    * 选取一对需要更新的变量 $\alpha_i$ 和 $\alpha_j$
        * 先选违背 KKT 条件最大者，再选使目标函数增长最快
        * 实际中启发式：选取两变量所对应样本之间间隔最大
    * 固定其它参数，更新 $\alpha_i$ 和 $\alpha_j$

## 核函数

* $f(x)=\omega^T\phi(x)$
* 核函数：$\kappa(x_i,x_j)=\langle\phi(x_i),\phi(x_j)\rangle$
    * $\kappa$ 为核函数 $\iff$ 核矩阵 $K$ 半正定
* $\kappa_1,\kappa_2$ 为核函数，则以下为核函数
    * $\gamma\kappa_1+\gamma\kappa_2$
    * $\kappa_1\otimes\kappa_2(x,z)=\kappa_1(x,z)\kappa_2(x,z)$
    * $\kappa(x,z)=g(x)\kappa_1(x,z)g(z)$

| 常用核函数 | $\kappa(x_i,x_j)$                             |
| ---------- | --------------------------------------------- |
| 线性核     | $x_i^Tx_j$                                    |
| 多项式核   | $(x_i^Tx_j)^d$                                |
| 高斯核     | $e^{-\frac{\Vert x_i-x_j\Vert^2}{2\sigma^2}}$ |
| 拉普拉斯核 | $e^{-\frac{\Vert x_i-x_j\Vert}{\sigma}}$      |
| Sigmoid 核 | $\tanh(\beta x_i^Tx_j+\theta)$                |

* 支持向量展示（利用对偶问题）：$f(x)=\omega^T\phi(x)+b=\sum_{i=1}^m\alpha_iy_i\kappa(x,x_i)+b$

## 软间隔

* 优化目标：$\min_{\omega,b}\frac{1}{2}||\omega||^2+C\sum_{i=1}^m\xi_i$
    * 松弛变量 $\xi_i=l(y_i(\omega^Tx_i+b)-1)$
* 原问题

$$\begin{aligned}
\min_{\omega,b} & \frac{1}{2}||\omega||^2+C\sum_{i=1}^m\xi_i & \\
s.t. & y_i(\omega^Tx_i+b)\geq 1-\xi_i \\
& \xi_i\geq 0
\end{aligned}$$

* 对偶问题（损失函数为 hinge）

$$\begin{aligned}
\max_{\alpha} & \sum_{i=1}^m\alpha_i-\frac{1}{2}\sum_{i=1}^m\sum_{i=1}^m\alpha_i\alpha_jy_iy_j\phi(x_i)^T\phi(x_j) \\
s.t. & \sum_{i=1}^m\alpha_iy_i=0 \\
& C\geq \alpha_i\geq 0
\end{aligned}$$

| 损失函数 | $l(z)$           | Remark                 |
| -------- | ---------------- | ---------------------- |
| 0/1      | $1,z<0$          | 不易求解               |
| hinge    | $\max(0,1-z)$    | 保持稀疏性             |
| exp      | $e^{-z}$         |                        |
| log      | $\log(1+e^{-z})$ | 几率回归模型，无稀疏性 |

* 一般形式：$\min_f\Omega(f)+C\sum_{i=1}^ml(f(x_i),y_i)$
    * 结构风险：$\Omega(f)$
    * 经验风险：$\sum_{i=1}^ml(f(x_i),y_i)$，模型与训练数据契合程度

## 支持向量回归 SVR

* $\min_{\omega,b}\frac{1}{2}||\omega||^2+C\sum_{i=1}^ml_\epsilon(f(x_i)-y_i)$
  * 落入中间 $2\epsilon$ 间隔带的样本不计算损失，

$$l_\epsilon=\begin{cases}
0, & |z|\leq\epsilon \\
|z|-\epsilon, & otherwise
\end{cases}$$

## 核方法

* 表示定理：对于任意的单调递增函数 $\Omega$ 和任意非负损失函数 $l$，优化问题 $\min_{h\in\mathbb{H}}F(h)=\Omega(||h||_\mathbb{H})+l(h(x_1),h(x_2),\cdots,h(x_m))$ 的解总可以写成 $h^*(x)=\sum_{i=1}^m\alpha_i\kappa(x,x_i)$
* KLDA
* KPCA
