---
title: 股票--技术面
date: 2020-04-11
tags:
---

## 基本术语

- 股票分析：基本面，技术面，消息面，资金面，政策面
- 趋势行情与振荡行情

## K 线

- 柱上下：收盘价 $C_n$ 与开盘价
- 线上下：最高值 $H_n$ 和最低值 $L_n$
- 颜色
  - Red：$C_n>$ 开盘价
  - Green: $C_n<$ 开盘价

## VOL

- 成交量：单边计算，单位为手（1 手 = 100 股）
  - 缩量：成交量萎缩
- 交易量：双边计算（成交量 ×2)
- 成交额 = 成交量$\times$成交价
- 颜色：收盘价高于或等于开盘价为红色，反之绿色

## 均线

- $\text{MA}(n)=\frac{1}{n}\sum_{k=0}^{n-1}C_{n-k}$
- $\text{EMA}(n)=\frac{2}{N+1}\sum_{k=0}^\infty(\frac{N-1}{N+1})^kC_{n-k}$

## MACD

- $\text{DIF} = \text{EMA}(12)-\text{EMA}(26)$
  - $|\text{DIF}|$：长短期均线距离大小
  - $\text{DIF}>0$：股票上涨
- $\text{DEA} = \text{EMA}(\text{DIF}, 9)$
- $\text{MACD} = 2(\text{DIF}-\text{DEA})$
- 金叉：上穿
- 死叉：下穿

## RSI

- $A=\sum_{i}(C_i-C_{i-1})[C_i-C_{i-1}>0]$
- $B=\sum_{i}(C_{i-1}-C_{i})[C_i-C_{i-1}<0]$
- $\text{RSI}=100\frac{A}{A+B}$

## KDJ

- $\text{RSV}(n)=100\frac{C_t-L_t}{H_n-L_n}$
- $\text{K}(n)=\frac{2}{3}K(n-1)+\frac{1}{3}\text{RSV}(n)$
- $\text{D}(n)=\frac{2}{3}D(n-1)+\frac{1}{3}\text{K}(n)$

## W%R

- $\text{W\%R}=100\frac{H_n-C_n}{H_n-L_n}$
- 中短期

## OBV

能量潮指标

- $\text{OBV}(n)=\text{OBV}(n-1)+\text{sgn}\times V(n)$

## DMA

- $\text{AMA}=\text{AVE}(10)$
- $\text{DMA}=\text(AVE)(10)-\text{AVE}(50)$

## SAR

- $\text{SAR}(n)=\text{SAR}(n-1)+\text{AF}(n)(\text{EP}(n-1)-\text{SAR}(n-1)))$
