---
title: Chapter 3
date: 2018-11-13
tags: [ics, notes]
weight: 3
---

* 汇编格式
  * AT&T: op src, dst
  * Intel: op dst, src
* Intel处理器
  * 8086(16)-80286-i386(32)-i486(FPU)-Pentium-PentiumPro(P6)-Pentium/MMX-PentinumIII(SSE)-Pentium4E(x86-64)-Core2(多核)-Core i7
* i386寄存器组织
  * 定点寄存器
    * EAX,EBX,ECX,EDX,ESP,EIP,ESI,EDI
    * EIP,EFLAGS
    * CS,SS,DS,ES,FS,GS
  * 寻址模式
    * 立即寻址，寄存器寻址
    * 基址加比例变址加位移寻址：$LA=(SR)+(B)+(I)*S+A$
    * 相对寻址
  * 浮点处理架构
    * x87 FPU: ST(0)-ST(7),80位。控制寄存器、状态寄存器、标记寄存器各一个。组织为浮点寄存器栈。64位尾数。
    * MMX指令: MM0-MM7，通常借用ST(0)-ST(7)，使用64位
    * SSE指令集（兼容MMX，采用SIMD（单指令多数据）技术）: 增加8个128位SSE专用多媒体扩展通用寄存器XMM0-XMM7
    * AVX指令集：矢量扩展指令集
    * FMA指令集：fused multiply-accumulate
  * 过程调用
    * 储存传递参数
    * 保存返回地址，转移控制权
    * 被调用者保存现场，并分配空间
    * 执行函数体
    * 恢复现场，释放空间
    * 取出返回地址，转移到调用者函数 
  * 非静态局部变量的储存分配方式属于未定义行为；不同变量的地址除(!=和==)外为未定义行为
  * 缓冲区溢出防范
    * ASLR(Address Space Layout Randomization)
    * 栈破坏检测
    * 可执行代码区域限制
  * char可为signed char，也可为unsigned char，为不确定类型
  * union的存放顺序是所有成员从低地址开始，利用该特性可测试CPU的大/小端方式