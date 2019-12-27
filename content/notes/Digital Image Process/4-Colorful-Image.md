---
title: Colorful Image Processing
date: 2019-09-02
weight: 4
---

- 全彩色：用全彩色传感器获取的真实彩色
- 伪彩色：为特定灰度或灰度范围赋予颜色
- 物理特性
  - 无色光：黑白
    - 属性：强度
    - 灰度级：表示强度的数值
  - 彩色光：400nm~700nm电磁波
    - 辐射：能量（瓦特）
    - 光强：感知的能量（流明）
    - 亮度：主观描绘
- 生物特性
  - 锥状细胞
    - 600~700万个
    - (1965) 红色(65%,575nm),绿色(33%,535nm),蓝色(2%,445nm)
    - 主颜色：RGB
      - 国际照明委员会(1931)：700nm,546.1nm,435.8nm
    - 次生色
- 颜料的主颜色（吸收）：Yellow,Magenta,Cyan
- 属性
  - 亮度 brightness：强度
  - 色调 hue：主波长
  - 饱和度 saturation：白光的比例
  - 色度 chromaticity：色调，饱和度
- 三色值：红色 X, 绿色 Y, 蓝色 Z
  - $x=\frac{X}{X+Y+Z}$
  - $y=\frac{Y}{X+Y+Z}$
  - $z=\frac{Z}{X+Y+Z}$
  - $x+y+z=1$
  - CIE 1931 XYZ色彩空间
    - 两点连线：所有可能的加性组合
    - 任意三点无法覆盖全图
    - 色域

![CIE](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/CIE1931xy_blank.svg/652px-CIE1931xy_blank.svg.png)

## 彩色模型

- RGB彩色模型（面向显示器）
  - 笛卡尔坐标系，$[0,1]$，黑色原点，白色在最远的角，中间虚线是灰色
  - 三幅分量图像
  - 全彩色图像：24比特
  - 高端设备支持24比特 RGB 图像
  - 低端设备通常只能显示 256 种彩色
    - 稳定 RGB 色（通常216颜色）：每个 RGB 只有六种取值 00,33,66,99,CC,FF
- CYM彩色模型（面向打印机）
  - $(C,M,Y)=1-(R,G,B)$
  - CYMK: 添加黑色(K)
- HSI(Intensity)/HSL(Lightness)（面向人，柱坐标系）
  - hue, saturation, intensity
  - 将亮度和颜色信息解耦合
  - intensity: 平行面与强度轴（灰色）的交点
  - satuaration: 越小白光越大，与强度轴距离
  - hue: 包含强度轴的面与强度轴的夹角
- HSB(brightness)/HSV(Value)

## 伪彩色图像处理

- 灰度分层
- 独立变换3次
- 多光谱图像处理

## 全彩色图像处理

- 方法
  - 分别处理分量图像
  - 直接处理彩色像素
- 彩色变换：$g(x,y)=T(f(x,y))$
- 补色：合成为黑色的颜色
- 彩色分层：将不感兴趣的颜色设置为中性
- 色调和彩色校正
  - CIE $L^*a^*b^*$ 模型：设备无关的颜色模型
- 直方图处理
- 平滑与锐化

## 显示器

- CRT 显示器：RGB叠加
- 可视角度
- 偏色程度 $\Delta E$: 平均（3以下难以分辨，1以内相当准确），最大
- 亮度
  - 黑暗下 $>80cd/m^2$
  - 室外 $>300cd/m^2$
- 像素密度: $>150$ PPI
- 色域覆盖
  - 色域标准
    - sRGB (Microsoft): 35% CIE
    - Adobe RGB: 50% CIE，改善青绿色覆盖
    - NTSC(1953): CRT 标准，淘汰
    - REC-709: sRGB 的影视行业名称
    - DCI-P3: 美国数字电影(2017)
    - REC-2020
  - 色彩管理
    - 操作系统仅支持 sRGB
    - Chrome 仅支持 sRGB

![色域标准](https://pic2.zhimg.com/80/dd3aad2d8d08af43e4b3555728c29b65_hd.jpg)

## 彩色图像分割

- HIS 颜色空间直观
  - 利用 $H$ 指定颜色
  - 利用 $S$ 进一步限定区域
  - $I$ 很少用来分割
- RGB 空间分割效果更好
  - 距离
  - 方形盒子：长度与标准差成比例
- 彩色边缘检测
  - $u=\frac{\partial R}{\partial x}r+\frac{\partial G}{\partial x}g+\frac{\partial B}{\partial x}b$
  - $v=\frac{\partial R}{\partial y}r+\frac{\partial G}{\partial y}g+\frac{\partial B}{\partial y}b$
  - $g_xx=u^Tu$
  - $g_yy=v^Tv$
  - $g_xy=u^Tv$
  - $\theta(x,y)$
  - $F_\theta(x,y)$