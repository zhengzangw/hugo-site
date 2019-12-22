---
title: Makefile 教程
date: 2018-11-19
tags: [linux, notes]
---

*Makefile Manual*

# Makefile

## 基础语法

* RULE:
target: prerequisite
    command1 #对于Makefile中的每个以Tab开头的命令，make会创建一个Shell进程去执行它。
    command2
    ...

<!--more-->

* 需要更新
  * 目标没有生成
  * 某个条件需要更新
  * 某个条件的修改时间比目标晚
* 命令
  * @ ： 不显示命令
  * \- ： 错误继续执行
  * include 包含，同时作为目标更新
* 特殊目标
  * .PHONY (all,install,clean,distclean)
* 特殊符号
  * $@ : Target
  * $< : 规则中第一个条件
  * $? : 规则中所有比目标新的条件
  * $^ : 规则中所有条件
  * %  : 通配符
  * $\$ : 进程号
  * \  : 换行

## 模式规则

* OUTPUT_OPTION = -o $@
* CC = cc
* COMPILE.c = $(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c
* %.o: %.c
    $(COMPILE.c) $(OUTPUT_OPTION) $

## 变量

* $(var)
* := 立即赋值
  * 定义空格
    * nullstring :=
    * space := $(nullstring) # end
* ?= 若无定义则定义
* += 追加值
* $(var:.c=.d)

## 常见赋值

* CC = gcc
* CFLAGS = -O -g
* CPPFLAGS = -Iinclude -DMAKEFILE
* sources: 所有编译.c文件

## 其它

* gcc -M main.c
* gcc -MM *.c