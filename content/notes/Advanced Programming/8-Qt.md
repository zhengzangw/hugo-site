---
title: Qt
date: 2019-02-13
weight: 8
---

## 桌面应用开发框架

- Windows
  - C++: Qt, MFC, WTL, wxWidgets, DirectUI, Htmlayout
  - C#: WinForm, WPF
  - Java: AWT, Swing
  - Python: Tkinter, wxpython, PyQt, PythonWin
  - Pascal: Delphi
  - aardio
  - Visual Basic
- Linux
  - C++: Qt, GTK+, wxWidgets
  - Java: AWT, Swing
  - Python: Tkinter, wxpython, PyQt, PyGTK
- Mac
  - Objective-C: Cocoa
  - swift: Cocoa
  - C++: Qt
  - Python: Tkinter, wxpython, PyQt
- 基于 Web 技术桌面开发
  - 浏览器内核（渲染引擎）
    - Trident: IE
    - Gecko: Firefox
    - WebKit: Safari
    - Chromium: 基于 WebKit, Chrome
    - Blink: WebKit 精简版
    - Presto: Opera (已放弃，转为Webkit)
  - JS引擎
    - Mozilla: SpiderMonkey, TraceMonkey, JagerMonkey
    - Google: V8 (nodejs 基于 V8)
    - Microsoft: Chakra, JScript
  - NW.js (node-webkit): 基于 Chromium, node.js, 通过 HTML 和 JavaScript 编写应用程序
  - heX
  - Electron

## macdeployqt 错误

ERROR: Unexpected prefix "@loader_path"

<!--more-->

### 解决方法

which macdeployqt 确认位置  
添加 qt.conf  
内容：

    [Path]
    Plugins = PlugIns

### 生成APP

    macdeployqt new.app

### 生成dmg

    macdeployqt new.app -verbose=1 -dmg

### 知识点

Mac中的GUI应用必须以Bundle的形式运行，所谓Bundle,是一个以".app"结尾命名的文件夹，系统自动识别它为一个应用包，应用所有的东西(执行文件、链接的动态库、资源文件等等)都在里面了