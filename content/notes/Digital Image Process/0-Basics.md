---
title: Basics
date: 2019-09-02
weight: 0
---

## 数字图像

* 数字图像：$f(x,y),f$ 为灰度或强度，皆离散
* 电磁波谱：伽马射线，X 射线，紫外线，可见光，红外线，微波，无线电波
    * 单色光（无色光）
        * 强度：灰度级
    * 彩色光：430nm(紫)~790nm(红)
        * 发光强度：能量总量 W
        * 光通量：观察者从光源感受到的能量 lm(流明数)
        * 亮度：光感知的主观描绘

## 采样

用有限的样本数目去近似无限的现实物理信号（有限近似无限）

* 空间分辨度
* 像素数：每单位距离点数
  * 1 inch = 2.54 cm
  * dpi: 每英寸点数

## 量化

用离散计算机表示去近似连续的现实物理信号（离散近似连续）

* 灰度分辨率
  * $Q=2^b$: $b$ bit量化，$Q$ 级灰度
* 伪轮廓
* 最佳量化：量化误差最小（均方误差）

$$\delta^2=\sum_{k=1}^K\int_{Z_k}^{Z_{k+1}}(Z-q_k)^2p(Z)dZ$$

## 前沿学术期刊

* TPAMI《IEEE Transactions on Pattern Analysis and Machine Intelligence》
* TIP《IEEE Transactions on Image Processing》
* CVIU《Computer Vision and Image Understanding
》
* TSMCB《IEEE Transactions on Systems, Man and
Cybernetics》

## 前沿学术会议

* CVPR (IEEE Conference on Computer Vision and Pattern Recognition)
* ICCV (International Conference on Computer Vision)
* ECCV (European Conference on Computer Vision)