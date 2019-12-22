---
title: Chapter 5
date: 2018-11-13
tags: [ics, notes]
weight: 5
---

## 基本概念

* 指令周期：CPU取出并执行一条指令的时间  
* PC: 程序计数器（IP）  
* IR: 指令寄存器  
* ID: 指令译码器  
* 地址线、数据线、控制线：不属于CPU  
* 启停控制逻辑：脉冲源（时钟脉冲）+启停控制线  
* 数据通路： 指令执行过程中数据所经过的路径（包括路径上的部件）
* execution/function unit: 数据运算的部件  
* IAS计算机：储存程序计算机 1946 分散连接结构  
* Clock-to-Q(Latch Prop): 触发沿开始到输出端改变  
* Cycle Time = Clk-to-Q + Longest Delay + 建立时间 + clock skew
* 数据通路的时序控制  
  * 早期：机器周期、节拍和脉冲三级时序  
  * 现代：时钟信号，时钟周期=节拍  

## 单总线数据通路

* 内总线
* MDR: Memory Data Register
* MAR: Memory Address Register
* 四种基本操作
  * 通用寄存器间传递数据
    * $R0_{out}, Y_{in}$
  * 算术逻辑运算  
    * $R1_{out}, Y_{in}$
    * $R2_{out}, add (Z_{in})$
    * $Z_{out}, R3_{in}$
  * 主存读取一个字
    * MFC信号: Memory Function Complete
    * WMFC控制信号
    * 异步
      * $R1_{out}, MAR_{in}$
      * $read, WMFC$
      * $MDR_{out}, R2_{in}$
    * 同步： SDRAM芯片
  * 写入主存
    * $R1_{out}, MDR_{in}$
    * $R2_{out}, MAR_{in}$
    * $write, WMFC$

## 三总线数据通路

* dual-port register file
* 三操作数指令执行可在一个时钟周期完成

## 单周期数据通路

* 单周期处理器：所以有指令的指令周期为一个时钟周期
* MIPS
* 时钟周期以最复杂指令所用的指令周期为准

## 流水线数据通路

* 指令流水线
  * IF
  * ID
  * OF: 取操作数
  * EX
  * WB
* CPI = 1
* 组合逻辑+寄存器延时
* 适合流水线的指令集特征
  * 指令长度一致
  * 指令格式规整
  * load/store型指令风格
* 流水线冒险(hazard) : 流水线阻塞(stall)
  * structural hazard (hardware resource conflict) 访存冲突。 解决方法： 哈佛结构（指令储存器和数据储存器分离）， cache
  * data hazard (data dependency) 前面指令的结果还没产生。 解决方法
    * 软件方法 nop
    * 数据转发 (forwarding) 通过bypass送到后续ALU
    * 硬件阻塞 （插入气泡） load-use数据冒险只能如此解决
    * 一个周期内特殊处理
    * (MIPS实现中)
      * RAW
      * WAR
      * WAW
  * control hazard
    * 延迟损失时间片 C
    * branch hazard
      * 插入气泡 或 插入nop， 数量为C

## 高级流水线实现技术

## super-pipelining

* 增加流水线级数，CPI仍为1，减小时钟周期

## multiple issue pipeling

* 同时启动多条命令, CPI < 1。 
* IPC: 4路多发射流水线理性IPC为4
* 前提：数据通路中有多个执行部件
* 任务一：冒险处理
* 任务二：指令打包 ： 将能够并行处理的多条指令同时发送到发射槽中
  * speculation: 猜测指令执行结果调整执行顺序
    * 软件推测： 编译器通过推测来静态重排指令，此种推测一定正确
      * 静态多发射：主要通过静态推测，指令打包后多条指令合成VLIW(Very Long Instrution Word)。 VLIW处理器，Intel称为EPIC(Explicitly Parallel Instruction Computer)
    * 硬件推测：处理器执行中通过推测动态调度指令
      * 动态多发射：super-scalar processor (超标量处理器)
        * 简单超标量处理器： 指令顺序发射，每次一条或多条
        * out-of-order execution： 使用dynamic pipeline scheduling技术， 通过指令相关性检测和动态分支预测，投机选择执行

## 指令集

* CISC: 难以使用硬连线路控制器，只能用微程序控制器
* RISC
* 控制器: 译码并产生控制信号
* 硬连线路控制器：指令执行过程中每个时钟周期所包含的控制信号为一个状态
* 微程序控制器
  * 微程序：每条指令的执行过程的表示，由微指令组成
  * 控制存储器（CS, 控存）：存储每条指令对于微程序的ROM
  * 微程序定序器：计数器法/断定法（下址字段法）
