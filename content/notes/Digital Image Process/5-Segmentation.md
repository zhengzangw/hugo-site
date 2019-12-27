---
title: Image Segmentation
date: 2019-09-03
weight: 5
---

- $R$: 图像所占区域
- 图像分割：$R=\cup_{i=1}^n R_i$
  - $R_i$ 连通
  - $R_i\cap R_j=\emptyset$
  - $Q$: 用于划分区域的函数
    - $Q(R_i)=\text{T}$
    - $Q(R_i\cup R_j)=\text{F}$
- 分割依据
  - 灰度的不连续性
  - 灰度的相似性
- 边缘：连通的边缘像素的集合
  - 边缘像素：灰度发生剧烈变化
- 线：特殊的边缘，两侧的灰度值都很大或小
- 点：长宽只有一个像素的线
- 孤立点检测
  - 拉普拉斯算子
  - 判断响应幅度是否大于阈值
- 线检测
  - 拉普拉斯算子
  - 双线效应
  - 检测特定方向的线
- 边缘模型
  - 台阶边缘 Step Edge：1个像素距离上发生灰度级理想过渡，理想边缘
  - 斜坡边缘 Ramp Edge
  - 屋顶边缘 Roof Edge: 穿过区域的线
  - 存在噪声的边缘
    - 视觉上噪声并不明显
    - 噪声对导数影响很大
    - 二阶导更敏感

## 边缘检测

- 基本边缘检测
  - 梯度：最大变化率方向，边缘方向与梯度正交
    - 大小：$M(x,y)=\sqrt{g_x^2+g_y^2}\approx|g_x|+|g_y|$ （边缘图）
    - 方向：$\alpha(x,y)=\tan^{-1}(\frac{g_y}{g_x})$
  - 梯度算子
    - 罗伯特交叉梯度算子
    - Prewitt 算子
    - Sobel 算子
- 高级边缘检测
  - Marr-Hildreth 边缘检测器
    - $\nabla^2=\frac{\partial^2}{\partial x^2}+\frac{\partial^2}{\partial y^2}$
    - $G(x,y)=e^{-\frac{x^2+y^2}{2\sigma^2}}$
    - LoG(高斯得到拉普拉斯)：$\nabla^2 G(x,y)=[\frac{x^2+y^2-2\sigma^2}{\sigma^4}]e^{-\frac{x^2+y^2}{2\sigma^2}}$
    - 零交叉：$x^2+y^2=2\sigma^2$
    - 生成不同尺寸的模板
      - 对 $\nabla^2 G(x,y)$ 进行采样，得到 $n\times n$ 的模板
      - 与拉普拉斯模板卷积
    - 算法
      - 用 $n\times n$ 的高斯低通滤波器平滑图像
      - 计算上图的拉普拉斯
      - 寻找零交叉：检查某像素两个相对邻域像素的符号，符号相反且差异大于某阈值
  - Canny 边缘检测器
    - 高斯函数平滑输入图像
    - 计算图像梯度的大小与角度
    - 非最大抑制：把梯度生成的粗边变细
      - 四种边缘：水平，垂直，+45，-45
      - 根据梯度方向确定边缘方向 $d_k$
      - 如果 $M(x,y)$ 的值比 $(x,y)$ 在 $d_k$ 方向任意邻居小则对其抑制
    - 滞后阈值：减少伪边缘点
      - 低阈值：$T_L,g_{\text{NH}}(x,y)=g(x,y)\geq T_H$
      - 高阈值：$T_H,g_{\text{NL}}(x,y)=g(x,y)\geq T_L$
      - 比值：2:1 或 3:1
      - $g_{\text{NL}}(x,y)=g_{\text{NL}}(x,y)-g_{\text{NH}}(x,y)$
    - 连通性分析
      - 遍历 $g_{\text{NH}}$ 中每一个点 $p$，保留 $g_{\text{NL}}$ 中和 $p$ 连通的点
      - 去掉 $g_{\text{NL}}$ 剩余的点
      - 合并 $g_{\text{NH}}$ 和 $g_{\text{NL}}$

## 边缘连接

将边缘像素组合成有意义的边缘或区域边界

* 局部处理
  * 分析每个点 $(x,y)$ 邻域内像素的特点
  * 依据某准则将相似的点连接
    * 梯度大小：$|M(s,t)-M(x,y)|\leq E$
    * 梯度方向：$|\alpha(s,t)-\alpha(x,y)|\leq A$
  * 简化算法：$g(x,y)=[M(x,y)>T_M,\alpha(x,y)=A+T_A]$
* 区域处理
  * 函数近似：拟合一条二维曲线
  * 多边形近似
    * $P$：已排序，不重复的二值图像中的序列，起始点 $A,B$
    * $T$: 阈值
    * 空堆栈：OPEN, CLOSED
    * 闭合曲线：将 $B$ 放入 OPEN,CLOSED 中，$A$ 放入 OPEN 中
    * 开放曲线：将 $B$ 放入 CLOSED 中，$A$ 放入 OPEN 中
    * 计算 CLOSED 中最后一个顶点到 OPEN 中最后一个顶点的线的参数
    * 寻找与上述直线距离最大的点，若 $D>T$ 则将其放入 OPEN 中，重复上一步
    * 否则从 OPEN 中弹出顶点到 CLOSED 中，如开非空则重复
    * 否则 CLOSED 中的顶点就是多项式顶点
* 全局处理
  * 霍夫变换
    * 直线方程：$y_i=ax_i+b$
    * ab-平面：$b=-ax_i+y_i$
    * xy-平面：$x\cos\theta+y\sin\theta=\rho$
    * $\rho\theta$: $\rho=x\cos\theta+y\sin\theta$
    * 划分累加单元，统计每个单元内曲线的数目

## 边缘追踪

* [Square Tracing Algorithm](http://www.imageprocessingplace.com/downloads_V3/root_downloads/tutorials/contour_tracing_Abeer_George_Ghuneim/square.html)
* [Moore-Neighbor Tracing](http://www.imageprocessingplace.com/downloads_V3/root_downloads/tutorials/contour_tracing_Abeer_George_Ghuneim/moore.html)
  * Same to Radial Sweep
* Jacob's stopping criterion
  * Stop after visiting the start pixel n times, where n is at least 2, OR
  * Stop after entering the start pixel a second time in the same manner you entered it initially.
