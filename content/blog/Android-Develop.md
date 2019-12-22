---
title: Android-Develop
date: 2019-04-11
tags: [android, tutor]
---

## Android 应用程序组件

* Activity
* Service
* BroadcastReceiver
* ContentProvider

<!--more-->

## View

* TextView
  * id="@+id/name"

## 布局

* LinearLayout(线性布局)
* RelativeLayout(相对布局)
* TableLayout(表格布局)
* FrameLayout(帧布局)
* AbsoluteLayout(绝对布局)
* GridLayout(网格布局)
* wrap_content/match_parent
  * n = 1 - number-of-fillparent
  * 比例为 $p_1,p_2,\cdots$
  * 先到先得: $1-n*p_i$

## 资源

<!--more-->

* 9图
* 原型设计
* 使用资源

| 资源 | Java | xml |
| ---- | ---- | --- |
| 文字 | txtName.setText(getResources().getText(R.string.name)) | @string/name |
| 图片 | imgIcon.setBackgroundDrawableResource(R.drawable.icon) | @drawable/name|
| 颜色 | txtName.setTextColor(getResources().getColor(R.color.red)) | |
| 布局 | setContentView(R.layout.main) | |
| 组件 | findViewById(id) | |

## 传感器