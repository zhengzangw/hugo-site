---
title: TensorFlow Picture Handle
date: 2018-08-31
tags: [ml, tensorflow]
---

# 图片的基础知识

像素值只有0，1： 二值图  
0-255：256级灰度图  
图像位数通常是8位。简单可认为一张单通道8位彩色图有三通道RGB  
转换为灰度公式很多，如：
$$Gray = R*30%+G*59%+B*11%$$

## 亮度

RGB颜色空间本身就是源于物体发光，每个通道上的值表示的是该通道上的光强，调整光强即是调整亮度。可以有如下公式：
$$亮度＝R*0.299+G*0.587+B*0.114$$
$$l = (max(rgb) + min(rgb)) / 2$$

## 对比度

对比度反应了图片上亮区域和暗区域的层次感。而反应到图像编辑上，调整对比度就是在保证平均亮度不变的情况下，扩大或缩小亮的点和暗的点的差异

$$Out = Average + (In – Average) * ( 1 + percent)$$

其中In表示原始像素点亮度，Average表示整张图片的平均亮度，Out表示调整后的亮度，而percent即调整范围[-1,1]

<!--more-->

## 色相与饱和度

* HSB（HSV） 为 色相，饱和度，明度，
* HSL 为 色相，饱和度，亮度，
* Hue and Saturation
* S(saturation)分量，指的是色彩的饱和度，它用0%至100%的值描述了相同色相、明度下色彩纯度的变化。数值越大，颜色中的灰色越少，颜色越鲜艳，呈现一种从理性(灰度)到感性(纯色)的变化。
* L(lightness)分量，指的是色彩的明度，作用是控制色彩的明暗变化。它同样使用了0%至100%的取值范围。数值越小，色彩越暗，越接近于黑色；数值越大，色彩越亮，越接近于白色。

## TensorFlow 调整函数

* img = (下同)tf.image.adjust_brightness(img_data,-0.5)
* tf.image.random_brigntness(img_data,max_delta) 在(-delta,delta)范围内调整亮度
* tf.image.adujust_contrast(img_data,0.5)
* tf.image.random_contrast(img_data,lower,upper)
* tf.image.image_adjust_hue(img_data,0.1)
* tf.image.image_random_hue(img_data,max_delta)
* tf.image.image_adjust_saturation(img_data,-5)
* tf.image.image_random_saturation(image,lower,upper)
* tf.image.per_image_standardization(img_data) 亮度均值为0方差为1

# TensorFlow 调整图片

## 大小调整

tf.image.resize_images(img_data,[300,300],method=0)

### 0:双线性插值法

双线性插值，顾名思义就是两个方向的线性插值加起来。分别在x轴和y轴都做一遍，就是双线性插值了。

### 1:最近邻居法

找到原始图像中的4个像素点，取距离该像素点最近的一个原始像素值作为该点的值。

### 2:双三次插值法

选取的是最近的16个像素点作为计算目标图像，有点复杂
[参考](https://blog.csdn.net/qq_29058565/article/details/52769497)

### 3:面积插值法

没什么资料，不过效果不错

## 剪裁

    tf.image.resize_image_with_crop_or_pad(img_data,1000,1000)
    tf.image.centrol_crop(img_data,0.5)

## 翻转

    tf.image.flip_up_down
    tf.image.flip_left_right
    tf.image.transpose_image
加random则以0.5概率进行翻转

## 标注框

    tf.expand_dims(tf.image.convert_image_dtype(img_data,tf.float32),0)
    boxes = tf.constant([[[0.05,0.05,0.9,0.7]]])
    result = tf.image.draw_bounding_boxes(batch,boxes)