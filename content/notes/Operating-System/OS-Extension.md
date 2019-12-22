---
title: Extension
date: 2019-03-21
tags: [os, notes]
---

> Operating System: Three Easy Pieces
> [讲义](http://ics.nju.edu.cn/~jyywiki)
> NJU: 操作系统 - 蒋炎岩

## Labs

| No. | Name     | Description                            | Knowledge Point              |
| --- | -------- | -------------------------------------- | ---------------------------- |
| M1  | pstree   | 打印进程之间的树状的父子关系           | 命令行参数；分析/proc        |
| M2  | libco    | 实现轻量级的用户态协程库               | 协程概念；内联汇编更换栈     |
| M3  | sperf    | 统计它执行的每个系统调用所占的时间     | 系统 API 使用；shell UI      |
| M4  | crepl    | C交互式shell                           | 系统 API 使用；动态加载      |
| M5  | frecov   | FAT32文件系统镜像 bmp 文件还原         | FAT32文件系统分析；数据还原  |
| M6  | libkvdb  | 实现持久、崩溃一致的key-value数据库API | 多线程、进程、崩溃一致性程序 |
| L0  | amgame   | 编写直接运行在AbstractMachine上游戏    | 类 Flappy Bird               |
| L1  | kalloc   | pmm模块                                |                              |
| L2  | kthreads | os,kmt模块                             |                              |
| L3  | vfs      | vfs模块, shell                         |                              |
| L4  | uproc    | uproc模块（未完成）                    |                              |

<!--more-->

## 操作系统安全

* Confidentiality, Integrity, Availability
* 安全漏洞
  * 错误设置访问控制策略
  * 未正确处理用户输入
    * 注入攻击
    * libpng 漏洞
  * 有缺陷的访问控制机制
    * Meltdown
  * UB
    * buffer overflow
    * use after free/dangling pointer
    * data race
      * TOCTTOU: Time of Check To Time of Use
  * 侧信道攻击 Side-Channel
    * 时间
      * Meltdown
        * 修复：用户态不映射内核
    * 能源消耗
    * 电磁信号
      * Visual Microphone
    * (一切以非算法形式泄露的信息)
* Availability
  * DoS 攻击 (Denial of Sevice)
    * DDoS 分布式

### 微内核操作系统

|               | Monolithic Kernel based OS | Microkernel OS            |
| ------------- | -------------------------- | ------------------------- |
| User Mode     |                            | Application IPC           |
|               |                            | UNIX Sever                |
|               |                            | Device Driver             |
|               | Application                | File Server               |
| Kernel Mode   | VFS                        |                           |
|               | Device Driver, Dispatcher  |                           |
|               | Schedular, Virtual Memory  | Schedular, Virtual Memory |
|               | IPC, File System           | Basic IPC                 |
| Communication | System Call                | IPC                       |

* IPC(Inter-Process Communication)
  * `send/receive(end_point, data)`: 同步通信
    * 无法高效实现 select(): 必须为每一个文件描述符创建一个线程
    * 长消息
      * `grant`: 把一个页面 grant 给另一个进程，直到另一个进程 unmap 后才能继续执行
      * `buf_alloc`: 共享缓冲区
* Exokernel
  * Programs can communicate with the hardware much more directly
  * 操作系统 API 实现为库函数

| Microkernel | Feature               |
| ----------- | --------------------- |
| seL4        | 完成形式化验证        |
| Zircon      | Handles,Tasks,IPC,VMO |
|             | Fuchsia OS            |

### 多用户

* /etc/passwd: Username:UID:GID:userinfo:homedir:shell
* /etc/shadow: 加密密码
* uid/gid: 进程身份
* su : substitue user identity
* sudo : execute a command as another user
  * 可用 VFS 实现: /dev/auth
  * pluggabble authentication modules: pam_authenticate

### 访问控制

* drwxrwxrwx: filetype User Group Other
* setuid 权限
* Access Control List (ACL)
  * setfacl
  * getfacl

## 分布式系统

* 多台物理上独立的计算机进行虚拟化(Virtualization)
  * 增加储存容量、运算力
  * 多地多副本
  * 就近服务
* 分布式系统中的机器可看做 Process
* CAP Theorem: 无法同时满足
  * Consistency: 看起来就像一个没有cache的共享内存
  * Availability: 能始终提供服务
  * Partition fault tolerance: 允许机器/网络发生故障 (几乎不能避免)
* 在不可靠的计算机上实现分布式系统
  * Hadoop Ecosystem: 多个层级抽象，提供多种服务
* 分布式系统栈
  * 底层：进程&消息
    * 分布式系统管理多个(分布)的进程(运行同一份代码)
      * 进程可以访问本机资源
      * 进程间可以互相发送消息(例如通过ssh)
  * 系统层：机器管理
    * 系统部署：Docker
    * 系统管理：Mesos, Kubernetes
  * 存储：文件系统
    * 全局可见 namespace
    * HDFS
  * 存储：数据库
    * NoSQL
    * SQL
  * 计算

## 容器与虚拟机

* 操作系统虚拟化
  * 可控的操作系统运行环境
  * Legacy Code
  * 复用硬件资源
* **虚拟机**：重量级
  * 虚拟完整的计算机硬件，可在虚拟机上运行任意操作系统，emulator/hypervisor
  * 虚拟机是解析指令的程序
    * NEMU, LiteNES, QEMU, VMWare
  * 解释执行：性能损失(100X)
  * DBT(Dynamic binary translation)： 把指令序列在 gcc 中编译优化
    * 瓶颈
      * SoftMMU：地址映射
        * 内存是性能瓶颈
      * I/O 设备
        * 经过 SoftMMU 实现
    * tcg: Tiny Code Generator
  * 硬件虚拟化
    * VT-x
      * Ring 3: 直接执行
      * Ring 0: 解释执行
      * Ring -1: Root Mode
      * VM-Exit
    * KVM
      * /dev/kvm
      * 实现一组无法硬件虚拟化的指令集
* **容器**：轻量级
  * 虚拟化操作系统 API
  * LXC C
  * Docker
  * 核心组件
    * namespaces
    * cgroups
    * capabilities/apparmor

## Debug

* Failure->Error
  * 系统测试
  * 单元测试
  * 回归测试
* Error->Fault
  * assertion
* Failure->Fault
  * log
  * backtrace
  * lock trace
  * AM API call trace

### gdb

## 名人名言

* 抛开 workload 谈 performance 就是耍流氓
* KISS: KEEP IT SIMPLE AND STUPID
* Knuth: premature optimization is the root of all evils
* HILL's law: simple and dump can be better
* Lampson: Don't generalize; generalizations are generally wrong
* TOM WEST's LAW: Not everything worth doing is worth doing well
* LIVNY’S LAW: IT ALWAYS DEPENDS
* David Wheeler: All problems in computer science can be solved by another level of indirection.
* IF 1000 SOLUTIONS EXIST, NO GREAT ONE DOES
