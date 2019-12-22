---
title: Android Studio Configuration on mac
date: 2019-05-31
tags: [android, java, config]
---

# Install

## Install Java8

java 8 is suitable for android-sdk

`brew tap caskroom/versions`
`brew cask install java8`

## 开发环境

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

## AS 配置

* 设置 gradle 为本地
* 设置 sdk 为 /usr/local/share/android-sdk
* 设置 ndk
* 安装 sdk api 和 设备