---
title: macosx Qt5 release错误解决
date: 2018-02-28
tags: [mac, config]
---

# Qt 运行

## macdeployqt 错误

ERROR: Unexpected prefix "@loader_path"

<!--more-->

## 解决方法

which macdeployqt 确认位置  
添加 qt.conf  
内容：

    [Path]
    Plugins = PlugIns

## 生成APP

    macdeployqt new.app

## 生成dmg

    macdeployqt new.app -verbose=1 -dmg

## 知识点

Mac中的GUI应用必须以Bundle的形式运行，所谓Bundle,是一个以".app"结尾命名的文件夹，系统自动识别它为一个应用包，应用所有的东西(执行文件、链接的动态库、资源文件等等)都在里面了