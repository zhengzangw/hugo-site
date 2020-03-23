---
title: 11. Make
date: 2018-11-19
weight: 11
---

## 参数

| 参数                       |                                   |
| -------------------------- | --------------------------------- |
| -f,--file                  | 指定其它文件作为 Makefile         |
| -C,--directory             | 切换目录                          |
| -d,--debug                 | 输出 debug 信息                   |
| -s,--silent                | 不显示命令                        |
| -r, --no-builtin-rules     | 禁用内置隐含规则                  |
| -R, --no-builtin-variables | 禁用内置变量设置                  |
| -n, --just-print           | 不要实际运行任何命令;仅仅输出他们 |
| -B                         | 强制更新所有                      |
| VAR=STRING                 | 定义参数                          |

```sh
gcc -M main.c #输出用于 Make 的规则
gcc -MM \*.c #不包含系统头文件
```

## 变量

```makefile
$(var) # 使用变量
var = string # 将整个makefile展开后，再决定变量的值
var := string # 立即赋值
var += string # 追加赋值
var ?= string # 若无定义则定义
# 定义空格
nullstring :=
space := $(nullstring) # end
```

- 内置变量与常用变量

```makefile
.RECIPEPREFIX = > # 默认命令前为 \t
OUTPUT_OPTION = -o \$@
CC = cc

CC = gcc
CFLAGS = -O -g
CPPFLAGS = -Iinclude -DMAKEFILE

$(VERBOSE).SILENT # Suppress display of executed command
```

- 自动变量

| 自动变量 |                          |
| -------- | ------------------------ |
| \$@      | Target                   |
| \$<      | 规则中第一个条件         |
| \$?      | 规则中所有比目标新的条件 |
| \$^      | 规则中所有条件           |
| %        | 通配符                   |
| \$\$     | 进程号                   |

## 基础语法

- RULE:

  ```makefile
  target: prerequisite
    command1 # 对于 Makefile 中的每个以 Tab 开头的命令，make 会创建一个 Shell 进程去执行它。
    @command2 # 不显示命令
    -command3 # 错误继续执行
  %.o: %.c # 模式匹配
  ```

<!--more-->

- 更新条件

  - 目标没有生成
  - 某个条件需要更新
  - 某个条件的修改时间比目标晚

  ```makefile
  #强制更新条件
  FORCE:
  .PHONY: FORCE
  ```

- 内置目标名

| 内置目标名 |                                       |
| ---------- | ------------------------------------- |
| .PHONY     | 特殊目标(all,install,clean,distclean) |
| .ONESHELL  | 同一终端执行                          |
| .SUFFIX    | 支持的文件后缀类型                    |

- 模式规则

```makefile
COMPILE.c = $(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c
%.o: %.c
```

## 指令

```makefile
ifeq ($(CC), gcc)
  libs=$(libs_for_gcc)
else
  libs=$(normal_libs)
endif

LIST = one two three
all:
    for i in $(LIST); do \
      echo $i; \
    done

# 函数
srcfiles := $(shell echo src/{00..99}.txt)
srcfiles := $(wildcard src/*.txt) # 替换 Bash 通配符
$(subst from,to,text) # 文本替换
$(patsubst pattern,replacement,text) # 模式替换
$(var:.c=.d) # 后缀替换 patsubst 简写
```

## 常用代码

- c

```makefile
edit: main.o kbd.o command.o display.o
    cc -o edit main.o kbd.o command.o display.o

main.o: main.c defs.h
    cc -c main.c
kbd.o : kbd.c defs.h command.h
    cc -c kbd.c
command.o: command.c defs.h command.h
    cc -c command.c
display.o: display.c defs.h
    cc -c display.c

clean:
     rm edit main.o kbd.o command.o display.o

.PHONY: edit clean
```

- c++

```makefile
CC=gcc
CXX=g++
RM=rm -f
CPPFLAGS=-g $(shell root-config --cflags)
LDFLAGS=-g $(shell root-config --ldflags)
LDLIBS=$(shell root-config --libs)

SRCS=tool.cc support.cc
OBJS=$(subst .cc,.o,$(SRCS))

all: tool

tool: $(OBJS)
    $(CXX) $(LDFLAGS) -o tool $(OBJS) $(LDLIBS)

depend: .depend

.depend: $(SRCS)
    $(RM) ./.depend
    $(CXX) $(CPPFLAGS) -MM $^>>./.depend;

clean:
    $(RM) $(OBJS)

distclean: clean
    $(RM) *~ .depend

include .depend
```