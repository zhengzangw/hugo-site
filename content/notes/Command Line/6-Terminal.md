---
title: 6. Terminal
date: 2020-03-17
weight: 6
---

## 快捷键

|          | 功能                   |
| -------- | ---------------------- |
| ctrl + a | 移动到行首             |
| ctrl + e | 移动到行尾             |
| ctrl + u | 删除当前光标前面的文字 |
| ctrl + l | 清屏                   |
| ctrl + r | 搜索历史记录           |
| ctrl + z | SIGSTOP 挂起           |
| ctrl + c | SIGINT                 |
| ctrl + s | 阻止屏幕输出           |
| ctrl + q | 允许屏幕输出           |

## Bang 命令

```sh
!! #上一条命令
^foo^bar # 将上一条命令中 foo 替换为 bar
^foo # 将上一条命令中 foo 删除
!wget # 最近的以 wget 开头的命令
!$ # 上个命令最后一个参数
!* # 上个命令所有参数
!-5 # 倒数第五条
fc # Open the most recent command and edit it
```
