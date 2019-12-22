---
title: ICS PA
date: 2018-09-28
tags: [ics, project]
---

# PA0

## Article

* [Why Docker](https://www.docker.com/why-docker)
* [How To Ask Questions The Smart Way](https://github.com/ryanhanwu/How-To-Ask-Questions-The-Smart-Way/blob/master/README-zh_CN.md)
* vimtutor
* [ssh](https://blog.csdn.net/gdutxiaoxu/article/details/53573426)
* 正则表达式
  * [鸟哥的 Linux 私房菜](http://linux.vbird.org/linux_basic/0330regularex.php)
  * [检查素数](https://coolshell.cn/articles/2704.html)
* [git](https://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000)
* GDB
  * [Debugging with GDB](https://sourceware.org/gdb/current/onlinedocs/gdb/)
  * [A GDB Tutorial with Examples](https://www.cprogramming.com/gdb.html)
* [tmux](https://hackernoon.com/a-gentle-introduction-to-tmux-8d784c404340)
* [linux](http://cn.linux.vbird.org/linux_basic/linux_basic.php)
* GPG [GPG](http://www.ruanyifeng.com/blog/2013/07/gpg.html)

## 顺时针法则

* [顺时针法则](https://blog.csdn.net/mal327/article/details/6728438)

* [10]: an array 10 of ...
* (): Once you meet one of brace, then a pair of them are omitted
* \*: pointer to ...
* (params): a function which receives params and returning ...
* const(at the begining): const
* const: constant ...

# PA2

## Step 1: Opcode

### 指令名

首先查阅i386 Appendix A（利用反汇编作为辅助），找到对应的编码
**opcode_entry opcode_table 中添加**

* opcode_entry类型： 函数指针decode encode 宽度width *

0x0F: Two-byte
Group: 根据R/M code opcode 确定 

### 指令类型（解码）

实现的Codes for Addressing Method：
I, SI, r(XX,eXX), RM(E,G,C,M,R,S), O

根据配置解码，分类如下：

* unary: I, r, E
* G2E, E2G, I2E, I2r, SI2E
* 无解码 EX()

Codes for Operant Type:

* v: IDEX, EX

## Step 2: 解码

decode.h 中增加声明
decode.c 中实现

## Step 3: 执行

all-instr.h 中增加声明

在i386中相应地方查看具体实现说明

在相应c文件中利用rtl语句实现

实现没有实现的rtl语句