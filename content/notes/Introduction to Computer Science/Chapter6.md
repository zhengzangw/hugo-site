---
title: Chapter 6
date: 2018-11-13
tags: [ics, notes]
weight: 6
---

## 储存器分类

* 储存元件
  * 半导体储存器
  * 磁表面储存器
  * 光盘储存器（光介质）
    * 基板，记录层，反射层，保护层，印刷层
    * CD(Compact disc) 1.2mm 700MB
    * DVD(digital versatile disc) 0.6mm+0.6mm 4.7GB
    * Blue-ray Disc
* 存取方式
  * RAM (Random Access Memory)
  * SAM (Sequential Access Memory)
  * DAM (Direct Access Memory)
  * CAM (Content Addressed Memory) or AM (Associative Memory) : TLB
* 可更改性
  * ROM (Readly Only Memory)
    * Flash ROM 闪存 U盘，BIOS 
  * RWM
    * SRAM: Static RAM 6个晶体管一个二进制位，cache
    * DRAM: Dynamic RAM 一个晶体管一个二进制位，主存
* 断电后可保存性
  * Nonvolatile Memory
  * Volatile Memory
* 功能
  * 寄存器(1ns, <1KB) <- cache(2ns, 4MB) <- 主存储器(10ns, 500MB-4GB) <- 辅助存储器(辅存)(10ms, 40GB-500GB) <- 海量后备储存器 (10s, 10TB-100TB)(与辅存合称外部存储器) 
* 储存器指标
  * 访问时间：
    * 读出时间：从存储器接到读命令开始至信息被送到数据线上所需的世界
    * 读入时间：从存储器接到写命令开始至信息被写入存储器的时间
  * 存储周期：存储器进行一次读写操作所需全部时间
  * 带宽B：存储器被连续访问时可以提供的数据传送速率，位每秒
  
## 主存

* SDRAM: Synchronous DRAM
  * DRAM芯片技术
    * 位片式芯片：二维双译码
    * 地址引脚复用技术
    * RAS：行地址选通信号
    * CAS：列地址选通信号
    * 异步
  * SDRAM芯片技术
    * 突发传输(burst)：只要第一次存取是给出首地址，以后按地址顺序读写计科，无需地址建立时间和预充电时间
    * 工作方式寄存器（模式寄存器）：设置传送数据的长度(Burst Length, BL)和CAS Latency(CL,CAS潜伏期，从收到读命令道开始传送数据的延迟时间，又称Read Latency,RL)
  * DDR SDRAM芯片技术(Double Data Rate)
    * I/O Buffer 数据两位预取
    * 经典值 3.2GB/s
  * DDR2 SDRAM芯片技术
    * 四位预取
  * DDR3 SDRAM 八位预取
* 主存与CPU连接
  * 相同颜色：多通道
  * 位扩展 4K\*1 -> 4K\*8
  * 字扩展 4K\*1 -> 16K\*1
  * $2^n*b$ DRAM芯片储存阵列为 $r*c=2^n, r\leq c, |r-c|\leq 1$，地址位数为n，行地址位数为$log_2r$，列地址位数$log_2c$。
  * supercell: 8位

* ECC: 纠错位

## 磁盘储存器

* 结构
  * 磁盘存储器：磁记录介质、磁盘驱动器、磁盘控制器
  * 磁盘驱动器：
    * 磁头，磁道track，柱面cylinder，扇区sector
    * 盘地址 = 柱面号+磁头号+扇区号
      * 寻道，旋转等待（清零后累加），读写
    * Winchester Disc(温盘)
      * 定长
      * 扇区组成
        * 17: 头空间隙，全1
        * 7: ID域 同步字节+磁道号+磁头号+扇段号+CRC
        * 41: 间隙
        * 515: 数据域
        * 20: 尾空间隙
* 指标
  * 记录密度
    * 位密度，道密度
    * 低密度存储，高密度存储
  * 存储容量
    * 未格式化容量 = 记录面数\*理论柱面数\*内圈周长\*最内道位密度
    * 柱面数 = (有效记录区外径-有效记录区内径)/2*道密度
    * 扇区大小 512字节，4KB扇区
  * data transfer rate (internal tranfer rate/sustained transfer rate) = 每分钟转速/60\*内圈周长*最内道位密度
  * external transfer rate (burst data transfer rate)
  * 平均存取时间
    * 响应时间 = 排队延迟 + 控制器时间 + (寻道时间5-10ms + 旋转等待时间4-6ms + 数据传输时间0.01ms/sector)  （后三个为存取时间）
* 连接
  * 逻辑块
  * ATA接口(IDE)，SCSI接口
  * DMA(Direct Memory Access), DMA控制器
* SSD(Solid State Disk,电子硬盘)
  * NAND闪存
  * 100000次重复写
  * 随机访问读写 10$\mu s$，写100$\mu s$

## Cache

### 程序访问的局部性

* 时间局部性：被访问的某个储存单元在一个较短的时间间隔内很可能又被访问
* 空间局部性：被访问的某个储存单元的邻近单元杂一个较短的时间间隔内很可能被访问

### Cache工作原理

* SRAM
* block: 主存每512字节，主存块
* line/slot: 存放一个主存块
* valid bit
* hit: cache命中
  * hit rate:p, hit time
  * miss rate, 主存访问时间+cache访问时间=miss penalty
  * $T = p*hit\_time + (1-p)*(hit\_time+cache\_time)$

### Cache 映射

cache_line:$2^c$, 主存_block:$2^m$, 块大小:$2^b$,  
cache:$2^{c+b}$， 主存:$2^{m+b}$

#### direct 模映射

  cache_line = block % total_cache_line  
  主存地址 = 标记(m-c)cache_line(c)块内地址(b)

#### full associate

  主存地址 = 标记(m)块内地址(b)

#### set associate

  分为$2^q$组  
  cache_group = block % total_cache_group  
  主存地址 = 标记(m-q)cache_group(q)块内地址(b)  
  一组$2^{c-q}$行

### Cache 替换算法

* FIFO
* LRU: 增加LRU位，记录近期使用状况
* LFU: 替换到引用次数最少的块
* 随机
  
### Cache 一致性问题

* write through
  * 写命中，则同时写主存和cache
  * 不命中
    * write allocate
    * not write allocate
  * 可添加write buffer
* write back
  * dirty bit

### Cache 性能

* 关联度： 一个主存块对应的cache行个数
* 多级Cache
* 分离Cache: 数据cache, code cache
* 连接结构： 窄型，宽型，交叉型

## 虚拟存储器

* MMU: Memory Management Unit
* VA: 逻辑地址/虚拟地址
* PA: 物理地址
* 虚拟地址空间
  * kernel space 0xc0000000
  * user space 
    * user stack
    * shared library 0x40000000
    * heap
    * 可读写数据
    * 只读数据和代码 0x08048000

### 分页式虚拟储存器

* page: VP, PF/PP 经典大小：4KB
* 未分配页， 已分配页（=缓存页+未缓存页）
* 主存页框和虚拟页采取全相联，write back
* page table
  * 页表项： 存放位置，valid，dirty，使用位，访问权限为，禁止缓存位
  * 每个进程对于一个页表，初始全0
  * 位于内核空间，属于进程控制信息
  * 页表基址寄存器：页表在主存的首地址
* address translating
  * 虚拟页号+页内偏移地址 -> 物理页号+页内偏移地址
* Translation Lookaside Buffer, 快表
  * TLB标记字段：取自页表中哪个虚拟页对应的页表项
  * 虚拟页号 = 标记 + 组索引
  * 慢表： 页目录索引 + 页表索引
  * TLB经典大小： 16-512项，块大小1-2项
* cache缺失：硬件， TLB缺失：软件

### 分段式虚拟存储器

* 段表
* 段表项
* 虚拟地址 = 段号+段内地址

### 储存保护

* 访问权限保护
* 储存区域保护
  * 加界重定位
  * 键保护
  * 环保护

### IA-32地址转换

  * 保护模式下，段页式
  
#### 逻辑地址（48位）-> 线性地址(32位)

* 逻辑地址： 段选择符16+段偏移量32
* 段选择符
  * 2: RPL 特权等级
  * 1: TI 0->GDT, 1->LDT
  * 13: 索引
* 段寄存器
  * CS(code), SS(stack), DS(data), ES, FS, GS
  * CPR: CS的RPL字段
* 段描述符（段表项）
  * 基地址(32 bits) + 限界(20 bits) + 访问权限 + 特征位 G粒度 D位宽 P是否在主存 DPL特权
  * 代码段或数据段描述符
  * 系统控制段描述符
    * 特殊的系统状态描述符
      * LDT 局部描述符
      * TSS 任务状态描述符  
    * 控制转移描述符
      * 门描述符，任务门描述符，中断门描述符，陷阱门描述符
* 段描述符表（段表）
  * GDT
  * LDT
  * IDT
* 不可见寄存器
  * 描述符cache
  * GDTR, IDTR
  * LDTR, LDT描述符cache
  * TR, TSS, TSS描述符cache

#### 线性地址(32位) -> 物理地址

* 控制寄存器
  * CR0控制寄存器
  * CR2页故障线性地址寄存器
  * CR3页目录基址寄存器
* 线性地址 = 页目录索引 + 页表索引 + 页内偏移量
* 页目录项，页表项
