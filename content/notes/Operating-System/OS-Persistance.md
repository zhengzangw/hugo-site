---
title: Persistance
date: 2019-01-21
tags: [os, notes]
---

> Operating System: Three Easy Pieces
> [讲义](http://ics.nju.edu.cn/~jyywiki)
> NJU: 操作系统 - 蒋炎岩>

## 储存介质 (Non-Volatile Memory)

| Name              | Year | 原理                         | Remarks                                |
| ----------------- | ---- | ---------------------------- | -------------------------------------- |
| Magnetic Tape     | 1928 | 磁比特数组                   | 无法进行高效的随机读写                 |
| Magnetic Drum     | 1932 | 并行版磁带                   |                                        |
| Hard Disk         | 1956 | 二维并行版磁带               | 柱面(platter)+磁道(track)+扇区(sector) |
| Floppy Disk       | 1971 | 读写头与盘片分离             | floppy drive 每个电脑一份              |
| Compact Disk      | 1980 | 1bit = 挖坑/填坑             | CD-ReWritable: 激光改变反射率          |
| Solid State Drive | 1991 | NAND Flash                   | NAND(x,y)=$!(x\&y)$                    |
|                   |      | FTL(Flash translation layer) | 运行操作系统和闪存管理程序             |
| USB Flash Disk    | 1999 |                              | 放电做不到100%干净                     |

<!--more-->

### Hard Disk Time

* RPM: rotations per minute
* 外部半径大
  * track skew
  * multi-zoned
* cache (track buffer)

| Name                | Description                                                | 经典数值                      |
| ------------------- | ---------------------------------------------------------- | ----------------------------- |
| rotation delay      | rotate on track                                            | 2ms                           |
| seek time           | acceleration+coasting+deceleration+settling(most, 0.5-2ms) | 4ms                           |
| transfer time       | read/write data                                            | 30 ms                         |
| tatol delay         | rotation delay + seek time(0.5-2ms) + transfer time        |                               |
| I/O rate Random     | Transfer size/total delay                                  | 0.66MB/s(SCSI) 0.31MB/s(SATA) |
| I/O rate Sequential |                                                            | 125MB/s(SCSI) 105MB/s(SATA)   |

### disk scheduler

| Name                                  | Remarks                                                                              |
| ------------------------------------- | ------------------------------------------------------------------------------------ |
| SJF                                   | length of each job is usually unknown                                                |
| SSTF(Shortest Seek Time First)        | Disk infomation may not be known to host                                             |
| NBF(nearest block first)              |                                                                                      |
| SCAN(elevator algorithm)              | moves back and forth across the disk servicing re- quests in order across the tracks |
| SPTF(shortest positioning time first) | seek time + rotation delay                                                           |

## IO设备与驱动

### 访问指令

| Name                     | Description                                                                                |
| ------------------------ | ------------------------------------------------------------------------------------------ |
| Port IO (PIO)            | 为I/O设备提供了一个单独的地址空间，通过读/写端口的方式实现设备控制(状态、控制、数据寄存器) |
| Memory-Mapped I/O (MMIO) | 给特定的内存地址赋予特殊的含义，从而读/写内存地址就能实现设备的访问                        |

### 设备管理

| Method    | Description                                                          |
| --------- | -------------------------------------------------------------------- |
| Polling   | polling and wait device read->send->polling and wait device finished |
| interrupt | send data->do sth else->receive ITR->run ISR                         |
| DMA       | send info to DMA->do sth else->receive ITR->run ISR                  |

* coalescing: an interrupt-based optimzation
  * a device which needs to raise an interrupt first waits for a bit before deliv- ering the interrupt to the CPU
  * multiple interrupts can be coalesced into a single interrupt delivery
* ISR: interrupt service routine(interrupt handler)

### 设备驱动程序

为每一类设备统一接口访问

| Category | Examples               |
| -------- | ---------------------- |
| 字符设备 | 键盘、鼠标、终端、显卡 |
| 块设备   | 存储设备(磁盘、SSD)    |
| 网络设备 | 网卡                   |

### 设备举例

| Name       | Description                                    |
| ---------- | ---------------------------------------------- |
| 键盘控制器 | 缓冲区                                         |
| 磁盘控制器 | 通过状态、控制、数据访问，可配置为中断模式     |
| 显卡(GPU)  | 协处理器；有专门的核心、指令等用于图像显示     |
| DMA        | 实现 `memcpy()` 的I/O设备;通过总线占用内存宽带 |
| 网卡       | 网络设备：内存，DMA，中断                      |

* DMA(Direct Memery Access)
  * 没有DMA时的运行顺序
    * CPU 给设备发送少量命令（快）
    * CPU 传送数据（慢）
    * CPU 等待设备完成（并行）
  * 有DMA时的运行
    * 给 DMA 发送命令（快）
    * DMA 传送数据（DMA 与 CPU 并行）
    * DMA 等待设备完成 (DMA 与设备并行)
    * CPU 等待 DMA 完成（DMA 与 CPU 并行）
* 网络设备驱动
  * send(): 发送包
    * TX：发送数据
    * RX：接受数据
  * poll(): 询问是否收到包
  * bufctl(): 设置 ring buffer
* 每当需要做一件耗费CPU太多时间的专有工作，就可以增加一个I/O设备
  * 图形渲染->GPU
  * 大规模数据传送->DMA

### 设备总线 (I/O bus)

| Category           | Name | Description |
| ------------------ | ---- | ----------- |
| General I/O Bus    | PCI  |             |
| Peripheral I/O Bus | SCSI |             |
|                    | SATA |             |
|                    | USB  |             |

## 文件系统

文件系统是

* 储存设备虚拟化(Virtualization)
* 保存在持久储存上的数据结构
* 管理操作系统内部对象的中间层
  * 文件描述符 = 指向对象的指针
  * read/write/ioctl系统调用 = 对象访问

### 文件系统实现

* 文件系统的设计
  * balloc/bfree 的实现
  * 虚拟磁盘的数据结构
  * inode 的表示和储存
  * 目录文件的数据结构
* 文件系统的实现 = 实现数据结构的查询/修改操作
* 虚拟文件系统 VFS
* 文件系统缓存
  * static partitioning: approx 10%
  * dynamic partition

### API

| Category   | Name                   | Description                                                     |
| ---------- | ---------------------- | --------------------------------------------------------------- |
| 管理文件   | inode number           | low-level name of a file                                        |
|            | `open()`/`openat()`    | `int fd=open("foo", O_CREAT|O_WRONLY|O_TRUNC,S_IRUSR|S_IWUSR);` |
|            | `fsync()`              | fsync:所有数据；fdatasync:数据；mync                            |
|            | `fstat()`              |                                                                 |
| 管理目录   | `isdir()`              |                                                                 |
|            | `opendir`/`closedir()` | `DIR *dp = opendir(".")`                                        |
|            | `readdir()`            | `struct dirent *d = readdir(dp)`                                |
|            | `fchmod()`/`fchown()`  |                                                                 |
|            | `rmdir() `             |                                                                 |
| Link       | hard link              | same inode                                                      |
|            | soft link              | symbolic link,dangling reference,`ln -s`                        |
| Filesystem | `mkfs`                 |                                                                 |
|            | `mount`                |                                                                 |

### Filesystem List

| Category               | Name       | Intro                                       |
| ---------------------- | ---------- | ------------------------------------------- |
| Windows                | FAT        | File Allocation Table, FAT12,FAT16,FAT32    |
|                        | exFAT      |                                             |
|                        | NTFS       | New Technology File System                  |
|                        | ReFS       | B+-tree, CoW(Copy-on-Write)                 |
| macOS                  | HFS+       |                                             |
|                        | APFS       | B-Tree                                      |
| Linux                  | Ext4       | Ext2, Ext3                                  |
|                        | ReiserFS   | storing a huge number of small files        |
|                        | XFS        |                                             |
|                        | JFS        | JSF1, JSF2, also for clustered file systems |
|                        | Btrfs      | B-tree                                      |
| Unix                   | JFS        |                                             |
| Solaris                | ZFS        | also for clusterd file systems, COW         |
| Clustered file systems | GFS        | Gobal File System of Red Hat Linux          |
|                        | VMFS       | Virtual Machine File System of VMware       |
|                        | Apple Xsan |                                             |
| NetApp                 | WAFL       | snapshots                                   |
| Others                 | LFS        | Log-structured File SYstems                 |

### [Filesystem Hierarchy Standard](http://refspecs.linuxfoundation.org/FHS_3.0/fhs/index.html)

| Name   | Function                                    |
| ------ | ------------------------------------------- |
| /boot  | 系统启动数据                                |
| /dev   | 设备文件                                    |
| /sbin  | 系统程序                                    |
| /etc   | 配置文件                                    |
| /home  | 用户目录                                    |
| /lib   | 库文件                                      |
| /media | 可移动设备                                  |
| /var   | 可变文件 (logs, snapshots)                  |
| /tmp   | 临时文件                                    |
| /usr   | 用户程序 (/usr/bin/, /usr/lib/, /usr/local/ |

## 可靠性

* 硬件：a disk fails；a block fails
* 软件：一致性

### RAID (Redundant Arrays of inexpensive disks)

Fail-stop model: a disk can be working or failed

| RAIN Level       | RAID-0     | RAIN-1    | RAID-4               | RAID-5         |
| ---------------- | ---------- | --------- | -------------------- | -------------- |
| Realization      | striping   | mirroring | parity-based         | rotate parity  |
| Remark           | chunk size |           | additive/subtractive |                |
| **Capacibility** | $N*B$      | $(N*B)/2$ | $(N-1)*B$            | $(N-1)*B$      |
| **Reliability**  | 0          | 1         | 1                    | 1              |
| Best case        |            | $N/2$     |                      |                |
| **Throught**     |            |           |                      |                |
| Sequential Read  | $N*S$      | $(N/2)*S$ | $(N-1)*S$            | $(N-1)*S$      |
| Sequential Write | $N*S$      | $(N/2)*S$ | $(N-1)*S$            | $(N-1)*S$      |
| Random Read      | $N*R$      | $N*R$     | $(N-1)*S$            | $N*R$          |
| Random Write     | $N*R$      | $(N/2)*R$ | $\frac{1}{2}R$       | $\frac{N}{4}R$ |
| **Latency**      |            |           |                      |                |
| Read             | $T$        | $T$       | $T$                  | $T$            |
| Write            | $T$        | $T$       | $2T$                 | $2T$           |

### 完整性

single-block failures

| Errors                     | Description                          | Frequency(Cheap/Costly) | Detection                           |
| -------------------------- | ------------------------------------ | ----------------------- | ----------------------------------- |
| LSEs(latent-sector errors) | sector(s) damaged                    | 9.40%/1.40%             | error correcting code(ECC)          |
| Corruption                 | silent faults like misdirected write | 0.50%/0.05%             | checksum (say a 4KB block)          |
| Lost Writes                |                                      |                         | read-after-write/checksum elsewhere |

### 一致性

* 持久化：原子性丧失
  * FAT: FAT[b]=EOF,data[b]=DATA,FAT[f]=b
  * ext2: DMAP,inode,DATA 都需要更新
* 恢复文件系统一致性：FSCK(Filesystem Checking)
* 崩溃一致性：Journaling
  * 利用 sync() 保证顺序性：磁盘会优化写入顺序
  * ext3 journaling (data journaling)
    * journal write: physical logging
      * TxB,I[v2],B[v2],Db->Journal
      * sync()
    * journal commit
      * TxD->Journal
      * sync()
    * Checkpoint
      * I[v2],B[v2],Db->Disk
  * Metadata Journaling (ordered journaling)
    * Data write
      * Db->Disk
      * sync()
    * Journal metadata write: logical logging
      * TxB,I[v2],B[v2]->Journal
      * sync()
    * Journal commit
      * TxE->Journal
      * sync()
    * Checkpoint metadata
      * I[v2],B[v2]->Disk
    * Free
      * mark the transaction free in journal superblock
  * 崩溃恢复
    * 用一个额外的指针维护journal完成的时刻
    * 从指针开始，向后重做journal中记录的操作
* 其它方法
  * Soft Updates: orders all writes to the file sys- tem to ensure that the on-disk structures are never left in an inconsis- tent state
  * copy on write(COW): never overwrites files or directories in place
* LFS: writing to disk sequentially
  * write buffering
  * $D=\frac{F}{1-F}*R_{peak}*T_{position}$
  * Checkpoint Region->Inode Map->Inode->[SS,D]
  * recursive update problem
  * garbage collection problem
