---
title: Python Read binary data
date: 2018-09-03
tags: [python]
---

# open

## 参数

open(name, mode, buffering)

## 打开模式

* r 只读，文件的指针将会放在文件的开头
* rb 以二进制打开
* r+ 打开一个文件用于读写。文件指针将会放在文件的开头。
* rb+

<!--more-->

* w 打开一个文件只用于写入。如果该文件已存在则打开文件，并从开头开始编辑，即原有内容会被删除。如果该文件不存在，创建新文件。
* wb
* wb+ 打开一个文件用于读写。如果该文件已存在则打开文件，并从开头开始编辑，即原有内容会被删除。如果该文件不存在，创建新文件。
* a 追加
* ab
* a+
* ab+

## 对象方法

* file.read([size])
* file.readline() 返回一行
* file.readline(size) 返回size行
* for line in f: print line
* f.write("must be str")
* f.tell() 指针移动
* f.close()

# struct包

## 主要函数

```python
    # 按照给定的格式化字符串，把数据封装成字符串(实际上是类似于c结构体的字节流)
    string = struct.pack(fmt, v1, v2, ...)

    # 按照给定的格式(fmt)解析字节流string，返回解析出来的tuple
    tuple = unpack(fmt, string)
    tuple = unpack_from(fmt, string, offset)

    # 计算给定的格式(fmt)占用多少字节的内存
    offset = calcsize(fmt)
```

## fmt格式

* B: unsigned char
* i: int
* f: float

* \>: big-endian
* \<: little-endian
* =: native
* \>iiii = \>4i

# IDX文件

二进制文件：the IDX file format is a simple format for vectors and multidimensional matrices of various numerical types.