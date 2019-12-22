---
title: Chapter 2
date: 2018-11-13
tags: [ics, notes]
weight: 2
---

* 进制转换
* 定点表示
  * 机器数：编码后的表示
  * 真值
  * 原码表示
  * 补码表示：$X_c=(M+X)\pmod M$
    * -：取反加一（与数据类型无关）
      * -2147483648 : 0x80000000
  * 反码表示
  * 移码：表示浮点数
* 浮点表示
  * $X=(-1)^SMR^E$
    * $M$: mantissa
    * $E$: exponent
    * $R$: radix
  * IEEE 754
    * FLOAT: 1+8+23
    * DOUBLE: 1+11+52
    * Intel FPU: 1+15+(1)+63
    * 偏置常数 B: $2^{n-1}-1$
    * 分类
      * 0: -0/+0
      * 非规格化数：$(-1)^s * 0.f *(1-B)$
      * 全1阶码全0尾数：$\infty$ 
      * 全1阶码非全0尾数：NaN（分静止的和通知的）
        * 最高有效位为1：静止的
      * 规格化数：$(-1)^s*1.f*2^{e-B}$
* 浮点运算的舍入
  * 右规时，直接截断
  * IEEE754 至少两位附加位（guard,round,sticky）
  * 就近舍入到偶数
* 整数表示  
  * 有符号: $-2^{n-1}\sim(2^{n-1}-1)$
  * 整数常量（无后缀）
    * C90 : int - $*$ - unsigned long int
    * C99 : int - $*$ - long long int
* BCD码
* 数据宽度
  * 字长 word size：指明指针数据的标称大小（决定虚拟地址空间最大大小）
  * KMGTPEZY
  * 小端：MSB在大地址中
  * `#pragma pack(n)` 设置对齐方式
  * `__attribute__((n))` 设置单独的对齐方式，大于n的数据结构按n对齐
