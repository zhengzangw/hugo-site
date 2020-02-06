---
title: Combination Logic Design
date: 2020-02-01
weight: 7
---

## 竞争与冒险

- 竞争：某一输入量经不同路径传输后，到达电路某一汇合点的时间有先有后
- 冒险：由于竞争是电路输出发生瞬间错误
- 通过卡诺图消除竞争：增加冗余项

## Combinational PLDs

- PLD: Programmable Logic Arrays, two-level AND-OR device that can be programmed to realize any sum-of-products logic expression
- PAL: Programmable Array Logic, a special case of PLA, fixed OR array

## 编码器

二进制电平转换为二进制编码

优先编码器

## 译码器

二进制代码转换为对应高低电平

## 数据选择器(MUX, multiplexer)

$2^n$ 位地址输入、$2^n$ 位数据输入、1位输出，每次在地址输入的控制下，从多路输入数据中选择一路输出

## 数据分配器(DEMUX, demultiplexer)

将输入数据按地址送到输出端上

## 计算

- 数据比较器
- 加法器
- ALU(arithmetic and logic unit)
- Combinational Multipliers