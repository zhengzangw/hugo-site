---
title: Android-Develop
date: 2019-04-11
tags: [android, tutor]
---

## Mac 开发环境配置

### Install Java8

java 8 is suitable for android-sdk

`brew tap caskroom/versions`
`brew cask install java8`

### 开发环境

`brew install ant`  
`brew install maven`  
`brew install gradle`  
`brew cask install android-sdk`
`brew cask install android-ndk`  
`brew cask install intel-haxm`  
`brew cask install android-studio`

<!--more-->

写入

```zsh
export ANT_HOME=/usr/local/opt/ant
export MAVEN_HOME=/usr/local/opt/maven
export GRADLE_HOME=/Users/<username>/.gradle/wrapper/dists/gradle-4.10.1-all/<random>/gradle-4.10.1
export GRADLE_USER_HOME=/Users/<username>/username>/.gradle
export ANDROID_HOME=/usr/local/share/android-sdk
export ANDROID_NDK_HOME=/usr/local/share/android-ndk
export INTEL_HAXM_HOME=/usr/local/Caskroom/intel-haxm
export PATH=$ANT_HOME/bin:$PATH
export PATH=$MAVEN_HOME/bin:$PATH
export PATH=$GRADLE_HOME/bin:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/build-tools/23.0.1:$PATH
```

在 .gradle/.gradle.properties 中根据 ss 配置写入

```config
systemProp.http.proxyHost=127.0.0.1
systemProp.http.proxyPort=1087
systemProp.https.proxyHost=127.0.0.1
systemProp.https.proxyPort=1087
```

### AS 配置

* 设置 gradle 为本地
* 设置 sdk 为 /usr/local/share/android-sdk
* 设置 ndk
* 安装 sdk api 和 设备

## Android 应用程序组件

* Activity
* Service
* BroadcastReceiver
* ContentProvider

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