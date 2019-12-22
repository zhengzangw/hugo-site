---
title: Chapter 7
date: 2018-11-13
tags: [ics, notes]
weight: 7
---

## 基本概念

* CPU控制流：CPU所执行的地址序列
* 正常控制流：按指令存放顺序或转移类指令指示地址得到的控制流
* ECF: Excptional Control of Flow
* process descriptor: 结构类型task_structure
* task_list: 双向循环列表，每个元素为进程描述符
* TSS: Task State Segment
* 逻辑控制流：进程确定的指令执行地址序列
* 物理控制流：多个逻辑控制流组成
* concurrency: 并发，不同进程的逻辑控制流在时间上交错
* parallelism: 并行，并发的特例，同时进行的两个进程
* time slice: 连续执行同一个进程的时间段
* 时间片轮转处理器调度

## context switching

  实现班班通进程中指令交替执行的机制

* 进程的上下文：物理实体和支持进程运行的环境
* 用户堆栈：运行时堆和用户栈
* 用户级上下文：程序块、数据块、用户堆栈等组成的用户空间信息
* 系统级上下文：进程标识信息、进程现场信息、进程控制信息（各种内核数据结构）和系统内核栈组成的内核空间信息
* 硬件/寄存器上下文
* 上下文切换
  * 将寄存器上下文保存到当前进程的系统级上下文中
  * 将新进程系统级上下文中的现场信息恢复到寄存器中
  * 将控制转移到新进程

### memory mapping

  将进程虚拟地址空间中的一个区域与硬盘上一个对象关联，初始化一个vm_area_struct结构  
  mmap函数
  * `void *mmap(void *start, size_t length, int prot, int flags, int fd, off_t offset`
  * 返回值 MAP_FAILED(-1), 成功则为指向映射区域的指针
  * prot 访问权限 PROT_EXE/READ/WRITE/NONE
  * flags 对象类型
    * 普通文件
      * MAP_PRIVATE: 只读代码和已初始化数据，私有对象，写时拷贝
        * 私有的写时拷贝页
      * MAP_SHARED: 共享对象
    * 匿名文件：MAP_ANON 内核创建，全部由0组成。对应区域页面称为demand-zero page

### loader

* execve() 启动加载器
* `int execve(char *filename, char *argv[], *envp[])`
* 失败 -1
* 成功 _start(定义于crtl.o)->__libc_init_first, _init -> atexit() 登记终止处理函数 -> exit(main()) -> _exit()
* 加载执行 fork() -> execve()

## Exception and Interrupt

### 异常

#### fault

* page fault
* div by 0
* segmentation fault

#### trap

* 陷阱指令, programmed exception
* 系统调用
* 断点设置：int 3, CCH
* into(溢出检查), INT n（软中断）, bound(地址越界检查)

#### abort

### 中断

* 中断请求信号线
* maskable interrupt & nonmaskable interrupt, NMI

### 处理过程

  保护断点和程序状态 -> 关中断（中断允许位置0） -> 识别事件(irq_handle) -> 转到相应处理程序执行(操作系统)

* PSWR:程序状态字寄存器，保存PSW (IA-32中为EFLAGS)。 也需保存
* 软件识别（程序）/硬件识别（向量中断方式）
* 中断向量表：保存中断向量，每个中断和异常有一个中断类型号

### IA-32+Linux

* 中断向量（256种），前32个保留给处理器
* 向量号（中断类型号）
* INT n： CPU跳转到中断服务程序
* 实地址模式(Real Mode)，8086兼容模式，20位储存器寻址空间(1MB), 中断向量表为00000 - 003FF, 256\*4=1KB
* 19个确定类型。Linux 128为系统调用， Windows 46为系统调用
* 保护模式，使用中断描述附表（IDT, Interrupt Descriptor Table）, 256\*8=2KB
* 中断门（中断），陷阱门（异常）
  * 31-16： 偏移地址
  * P(段存在), DPL(最低特权等级), 0, 段选择符（中断门1110，陷阱门1111，任务门0101）,00000000
  * 段选择符：GDT和LDT中的位置
  * 15-0：偏移地址，异常或中断服务程序第一条指令所在偏移量
* 任务门：只包含TSS选择段，指向GDT中的一个TSS段描述符
  * 双重故障#DF 通过任务门实现的唯一异常

#### IA-32 处理异常和中断

* 确定类型号i，从IDTR指向的IDT中取出第i个表项IDTi
* 根据IDTi中的段选择符，从GDTR指向的GDT中取得相应的段描述符，得到服务程序所在段DPL、基地址（Linux中为0）
* 比较CPL与DPL
* 检查特权级变化。从用户栈转换到内核栈：
  * 读TR寄存器，访问TSS段
  * 将TSS段中的内核栈段选择符和栈指针写入SS和ESP，在内核中保存原来的用户栈SS和ESP
* 若发生的是故障，将逻辑地址写入CS和EIP
* 栈中保存EFLAGS,CS,EIP。若是中断门，IF清0
* 若产生硬件出错码，保存在内核栈中
* 将IDTi中的段选择符载入CS，偏移地址装入EIP
* *处理异常和中断，结束后由IRET返回*
  * 从内核栈中弹出EIP,CS,EFLAGS
  * 检测特权级别
  * 从内核栈中弹出SS,ESP
  * 检查DS,ES,FS,GS

#### Linux 处理异常和中断

* IDT初始化：完成GDT,GDTR,IDT,IDTR设置
  * interrupt gate: DPL=0, TYPE=1110
  * system interrupt gate: DPL=3, TYPE=1110, int3
  * system gate: DPL=3, TYPE=1111, into,bound,int $0x80
  * trap gate: DPL=0, TYPE=1111, INT n(n!=3,128)
  * task gate: DPL=0, TYPE=0101
* 异常处理
  * 准备阶段:内核栈中保存现场信息
  * 处理阶段：若发送信号给当前进程，若有对于的信号处理程序，则执行，否则调用abort例程终止进程
  * 恢复阶段
* 信号处理
  * 定义信号处理函数替换默认信号处理函数，并通过signal函数将自定义信号处理函数注册到系统中
  * `typedef void (*sighandler_t)(int);`
  * `sighandler_t signal (int signum, sighandler_t handler);`
  * nonlocal jump：
    * sigsetjmp: 第一次调用返回0，而后返回非0
    * siglongjmp: sigsetjmp一次后，返回到sigsetjmp函数
* 中断处理
  * I/O中断
    * IRQ线连接到PIC(programmable interrupt controller)
    * IRQ引脚：PIC上，都有编号
  * 时钟中断
  * 处理器中断
  * 中断服务程序
    * 准备阶段
    * 处理阶段：ISR(Interrupt Server Routine)
    * 恢复阶段
* 系统调用
  * 系统级函数：系统调用及其对应的封装函数
  * 系统调用处理程序：system_call
