---
title: 4-线性算子
date: 2018-11-25
tags: [math, notes]
weight: 4
---

* 线性算子（线性变换）$\mathbb{A}: V\rightarrow V$

## 特征值与特征向量

* 相似: 存在可逆阵$Q$, $B=Q^{-1}AQ$
* 特征值与特征向量
* 特征多项式：$P(\lambda) = \det(\lambda I-A)$
* $\sum(\lambda)=tr(A)$, $\prod(\lambda)=\det(A)$
* 特征子空间：$V_{\lambda_i}=\{\lambda_i的特征向量\}\cup\{0\}$
* $\lambda$为$A$的特征值，$X$为$A$属于$\lambda$的特征向量。$f(t)=\sum_{j=0}^ka_jt^j$, $f(\lambda)$为$f(A)$的特征值，$X$为属于$f(\lambda)$的特征向量
* **求特征值与特征向量**
  * $P(\lambda)=0$求特征值
  * 检验
  * 对每个特征值，高斯消元求解基础解系，得特征子空间L()

## 对角化

* 可对角化：$\exist Q,Q^{-1}AQ=diag(\lambda_1,\dots,\lambda_n)$
* $Q^{-1}AQ=diag\{\lambda_1,\dots,\lambda_n\}$ iff $\forall i$, $A\alpha_i=\lambda_i\alpha_i$
* 属于不同特征值的特征向量线性无关
* 代数重数：$P(\lambda)=(\lambda-\lambda_1)^{n_1}\dots(\lambda-\lambda_k)^{n_k}$, $n_i$ 为$i$的代数重数
* 几何重数：$\dim{V_{\lambda_i}}$
* $1\leq$几何重数$\leq$代数重数
* $A$可对角化$\iff$所有特征值代数重数等于几何重数
* **对角化**
  * $P(\lambda)=0$求特征值与其代数重数
  * 检验
  * 对每个特征值，高斯消元求解基础解系，得特征子空间的基和几何重数
  * 判断几何重数=代数重数
  * 若可对角化，令Q=[$e_1,\dots,e_n$], $Q^{-1}AQ=diag\{\lambda_1,\dots,\lambda_n\}$
* 已知$\lambda,|\lambda I-A|$; 已知$X$，$AX=\lambda X$
* $A\sim B\iff (A+I)\sim (B+I)$

## 二次型

* 二次型：$\mathbb{F}^n$上的二次齐次n元多项式$f(x_1,\dots,x_n)=\sum_{i=1}^{n}a_{ii}x_i^2+\sum_{i<j}2a_{ij}x_ix_j$为二次型。
* 对称矩阵：$A=A^T$ 
* 令$X=[x_1,\dots,x_n]^T$, 则$f(x_1,\dots,x_n)=X^TAX$
* $A$对称，$C$可逆，则$A$与$C^TAC$合同
* 合同规范型: 
  $$ \left[\begin{matrix} I_k & 0 & 0\\ 0 & -I_s & 0\\ 0 & 0 & 0 \end{matrix}\right] $$
* **化为合同规范型**
  * 做矩阵,其中D为对角阵
      $$\left[ \begin{matrix} A\\I \end{matrix}\right] \rightarrow \left[ \begin{matrix} D\\C_1 \end{matrix}\right]$$
  * 分三类考虑
    * 第一行与第一列均为0, 则考虑下一层
    * $a_{11}=0$, $\exist j, a_{1j}=a_{j1}\not= 0$
      * $a_{jj}\not=0$ 做变换$r_1\leftrightarrow r_j,c_1\leftrightarrow c_j$
      * $a_{jj}=0$ 做变换 $r_1+r_j\rightarrow r_1,c_1+c_j\rightarrow c_1$
    * $a_{11}\not= 0$, 做行高斯消元与列高斯消元，用$a_{11}$将$j>1$的$a_{1j},a_{j1}$消去（共$2*(j-1)$次）
  * 得$C_1^TAC_1=D$
  * 将对角型$D$用对换和$\frac{1}{\sqrt{|a_{ii}|}}r_i\rightarrow r_i,\frac{1}{\sqrt{|a_{ii}|}}c_i\rightarrow c_i$化为规范型，得
    $$ C^TAC=\left[\begin{matrix} I_k & 0 & 0\\ 0 & -I_s & 0\\ 0 & 0 & 0 \end{matrix}\right] $$
* $k$ 为A的正惯性指数，$s$为负惯性指数，$k-s$为符号差
* 实对称矩阵$A$的合同规范型是唯一的，进而正负惯性指数和符号差唯一，但可逆阵$C$不唯一
* $A$与$B$合同，则有相同的合同规范型
* $rank(A)=k+s$
* 令$X=CY$, 则$f(x_1,\dots,x_n)=Y^T(C^TAC)Y=g(y_1,\dots,y_n)$, g为f的规范型

## 正定

* 半正定：$\forall X\in\mathbb{R}^n$, $X^TAX\geq 0$
* 实对称矩阵正定条件：
  * $\forall X\in\mathbb{R}^n,X\not=0$, $X^TAX>0$
  * $\forall i,\lambda_i>0$
  * $\exist R,|R|\not=0,A=R^TR$
  * 顺序主子式皆为正
* 若$A$是实对称矩阵，则$A$半正定$\iff$ $-A$半负定$\iff$ $A$的负惯性指数为0， $A$正定$\iff -A$负定$\iff\ A$的合同规范性为$I$ $\iff$ $A$的顺序主子式皆为正
* $A$负定$\iff$ $A$的顺序主子式与$(-1)^k$同号
* 顺序主子式不小于0得不到半正定
* $A$与$B$合同，且为实对称矩阵，则同正定或半正定
* $k$阶顺序主子阵：$A_k$
* $k$阶顺序主子式：$\det(A_k)$
* Hesse阵：$f$在$p$处的黑塞阵为$H(f,p)=(\frac{\partial^2f}{\partial x_i\partial x_j}(p))$
  * $H(f,p)$正定，则$p$为极小值点
  * $H(f,p)$可逆但既不正定又不负定，则$p$不是极值点
* 正定矩阵与半正定矩阵之和为正定矩阵

## 欧式空间

* 内积
  * $<a,b>=<b,a>$
  * $<a_1+a_2,b>=<a_1,b>+<a_2,b>$
  * $<ka,b>=k<a,b>$
  * $<a,a>\geq0$
* 范数: $||\alpha||=\sqrt{<\alpha,\alpha>}$
  * $||k\alpha||=k||\alpha||$
* Cauchy-Sohwarz Inequality: $|<\alpha, \beta>|\leq||\alpha||||\beta||$
  * 等号成立：$\alpha,\beta$线性相关
  * 三角不等式： $||\alpha+\beta||\leq||\alpha||+||\beta||$
  * 等号成立当且仅当同向
* 余弦定理：$||X-Y||^2=||X||^2+||Y||^2-2||X||||Y||\cos\theta$
  * $<X,Y>=||X||||Y||\cos\theta$
  * $\cos\theta=\frac{<\alpha,\beta>}{||\alpha||||\beta||}\in(0,\pi)$
* 正交：$\alpha\in V,\beta\in V, <\alpha, \beta>=0$
* 勾股定理：$||\sum_{i=1}^k\alpha_i||^2=\sum_{i=1}^k||\alpha_i||^2$
* 度量矩阵：$A=(<e_i, e_j>)\in M_{n*n}$ 关于$e_1,\dots,e_n$的度量矩阵, 对称正定
* $<\alpha, \beta>=X^TAY$
* 正交向量组线性无关
* 向量$\alpha$的单位化：$\frac{\alpha}{||\alpha||}$
* 正规基：正交基$e_1,\dots,e_n$有$||e_i||=1$
* 正交基度量矩阵为对角阵，对角元为正
* 正规基度量矩阵为I
* Schmidt正交化
  * $\beta_k=\alpha_k-\sum_{i=1}^{k-1}\frac{\langle\alpha_k,\beta_i\rangle}{\langle\beta_i,\beta_i\rangle}\beta_i$
  * $e_k=\frac{\beta_k}{||\beta_k||}$
* 正交算子（正交变化、保距变换）： 线性算子$\mathbb{A}$, $\langle\mathbb{A}\alpha,\mathbb{A}\beta\rangle=\langle\alpha,\beta\rangle$
* 正交$\iff$ $||\mathbb{A}\alpha||=||\alpha||$ $\iff$ 正规基在$\mathbb{A}$下仍是正规基
* 正交阵：$A^T=A^{-1}$
* $\mathbb{A}$在正规基下的表示矩阵为$A$，则$\mathbb{A}$为正交算子$\iff$正交阵
* 正交阵$A,B$，$A^T(A+B)B^T=(A+B)^T$

## 实对称阵

* $A^{*}=\overline{A}^\top$
  * $(A+B)^{*} = A^{*} + B^{*}$
  * $(kA)^{*} = \overline{k}A^{*}$
  * $(AB)^* = B^*A^*$
  * $(A^*)^* = A$
  * $X^*X\geq0$
* 实对称阵的特征值$\lambda\in\mathbb{R}^n$
* 实对称阵可对角化
* 实对称阵$A$不同特征值$\lambda_1,\lambda_2$，则其属特征向量$X_1\perp X_2$
* 正交对角化：$A^T=A$则存在正交阵$Q$，$Q^{-1}AQ=Q^{T}AQ=D$，$D$为对角阵
* *正交对角化*：
  * 解得特征值
  * 特征值对应特征向量的基
  * Schmidt正交化，$Q=[e_1,\dots,e_n]$
