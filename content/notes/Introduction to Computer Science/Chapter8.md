---
title: Chapter 8 
date: 2018-11-13
tags: [ics, notes]
weight: 
---

## I/O子系统

* runtime system(runtime environment/runtime)
* I/O子系统
  * 用户空间I/O软件（用户I/O软件）
    * I/O请求
    * 运行时系统
  * 内核空间I/O软件（系统I/O软件）
    * 与设备无关的I/O软件
    * 设备驱动程序
    * 中断服务程序
  * I/O硬件
    * I/O总线结构
    * I/O接口（设备管理器，I/O端口）
    * I/O设备
* 用户程序中I/O函数
  * C标准I/O库函数
    * 文件I/O函数
    * 控制台I/O函数
    * 缓冲
      * _IOFBF: fully buffered
      * _IOLBF: line buffered
      * _IO_NBF: no buffering  
  * 系统调用封装函数
    * 头文件unistd.h
    * int creat(char *name, mode_t perms);
      * perms:访问权限：文件拥有者+拥有者所在组成员+其它用户的读、写、执行权限
    * int open(char *name, int flags, mode_t perms);
      * perms = 0: 非创建方式
      * flags: 定义在 fcntl.h(System V UNIX)或sys/file.h(BSD) 中
        * O_RDONLY
        * O_WRONLY
        * O_RDWR
        * O_WRONLY | O_APPEND
        * O_RDWR | O_CREAT
        * O_WRONLY | O_CREAT | O_TRUNC
        * 返回值：成功为文件描述符，失败为-1
      * ssize_t read(int fd, void *buf, size_t n);
      * ssize_t write(int fd, const void*buf, size_t n);
      * long lseek(int fd, long offset, int origin)
        * origin 0头1当前2末
      * int stat(const *name, struct stat *buf); 获得metadata
      * int fstat(int fd, struct stat *buf);
        * stat 结构
          * st_dev 设备ID
          * st_ino 节点编号
          * st_mode 文件访问权限和类型
          * st_nlink 连接链的数目
          * st_uid 文件拥有者ID
          * st_gid 文件拥有者组ID
          * st_rdev
          * st_size 文件大小
          * st_blksize 块大小
          * st_blocks 块数
          * st_atime 最近一次访问时间
          * st_mtime 最近一次修改时间
          * st_ctime 最近一次修改文件状态的时间
      * void close(int fd)
      * int unlink(const char* pathname)
* terminal: 键盘+显示器
* 文本文件(ASCII文件)：每行以'\n'结束

## I/O硬件与软件接口

* 机械部分
  * I/O设备本身（外围设备）
    * 字符设备
    * 机-机通信设备部
  * 块设备
    * 外部存储器
  * 电子部分
    * 设备控制器（I/O配适器）
* 北桥芯片：MCH, Memory Controller Hubb, 主存控制器集线器，本质是DMA控制器
* 南桥芯片：ICH, I/O Controller Hub
* FSB: Front Side Bus, 前端总线，处理器总线，处理器和北桥芯片信息交换
  * 传输速率单位：MT/s(MHz)
* QPI: Quick Path Inter-connect
* 储存器总线
* I/O总线  
  * PCI-Express
* I/O接口
* I/O编址
  * 统一编址方式（储存器映射方式）
  * 独立编址方式

## I/O控制方式

* 程序之间控制I/O方式(polling)
* 中断控制I/O方式
  * 处理器调度程序
    * 进程三状态：运行态、就绪态（就绪队列）、阻塞态（被挂起）
  * PIC: Programmable Interrupt Controller
  * IRQ线连到PIC的IRQ引脚
  * 中断响应优先级--中断查询程序/硬件判优电路
  * 中断处理优先级
* DMA控制I/O方式

## I/O内核空间软件

* 与设备无关的I/O软件
  * 设备驱动程序统一接口
    * 设备文件名（e.g. i节点）
  * 缓冲区处理
  * 错误处理
  * 打开关闭文件
  * 逻辑块大小处理
* 设备驱动程序
* 中断服务程序