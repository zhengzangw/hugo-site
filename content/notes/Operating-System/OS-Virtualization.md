---
title: Virtualization
date: 2019-01-21
tags: [os, notes]
---

> Operating System: Three Easy Pieces
> [讲义](http://ics.nju.edu.cn/~jyywiki)
> NJU: 操作系统 - 蒋炎岩

## Process

* 单个程序$\rightarrow$ 状态机$(M,R)$
  * 分时复用处理器：利用中断$(M,R)$到状态机上
  * 分时复用寄存器
    * $(M_1,R_1)\rightarrow(M_2,R_2)\rightarrow\cdots$
* 系统调用
  * 操作系统为用户进程提供的一组API，通常在内核空间中实现，实现用户进程对操作系统对象/物理硬件访问的请求
  * 查看系统调用: strace/dtruss(macos)
* File descriptor: 指向操作系统内对象的指针
* terminal
  * The processes belonging to a single command are called a process group or job
  * A session is a larger group of processes
  * session leader

<!--more-->

### API

| Name                   | Feature                                       | Example                        |
| ---------------------- | --------------------------------------------- | ------------------------------ |
| 进程状态               | Running,Ready,Blocked                         |                                |
| fork                   | 写时复制(COW)                                 | `:(){:|:&};:`                  |
| exec                   | 不变：pid,fd,DIR,permission,附属终端,信号掩码 | `execve(filename, argv, enpv)` |
| wait                   |                                               |                                |
| exit                   |                                               |                                |
| spawn(not exists)      | fork代价低、共享中间结果、提供管道            | `spawn(path, argv, envp)`      |
| dup(int oldfd)         | 复制oldfd                                     |                                |
| dup2(int old, int new) | 关闭newfd, 复制 oldfd 到 newfd                | dup2=dup+close+ATOM            |
| pipe(int pipefd[2])    | pipefd[0] 读口 pipefd[1] 写口                 |                                |

```C
if (pipe(fds) != 0) { perror("pipe"); exit(1); }
pid = fork();
if (pid < 0) { perror("fork"); exit(1); }
if (pid == 0) { // child: father out -> child in
  dup2(fds[0], STDIN_FILENO);
  close(fds[0]); close(fds[1]);
  ...
} else {
  dup2(fds[1], STDOUT_FILENO);
  close(fds[0]); close(fds[1]);
  ...
}
```

## Scheduling

| metric                  | Description                                |
| ----------------------- | ------------------------------------------ |
| $T_{\text{turnaround}}$ | $T_{\text{completion}}-T_{\text{arrival}}$ |
| $T_{\text{response}}$   | $T_{\text{firstrun}}-T_{\text{arrival}}$   |
| Fairness                |                                            |

* Strategy
  * $T_{\text{turnaround}}$
    * FIFO(FCFS)
    * SJF (Shortest Job First)
    * STCF (Shortest Time to Complete First)
  * $T_{\text{response}}$
    * Round Robin
  * **Multi-Level Feedback Queue**(MLFQ)
    * Rule 1: Priority(A)>Priority(B) then A runs
    * Rule 2: Priority(A)=Priority(B) then A & B runs in round-robin fashion using the time slice
    * Rule 3: When a job A enters the system, Priority(A):=MAX
      * I/O
    * Rule 4: Once a job uses up its time allotment at a given level, its priority is reduced
      * avoid gaming
    * Rule 5: After some time period S, move all the jobs in the system to the topmost queue
      * starvation
  * **Proportional Share**
    * lottery scheduling
      * Each process has some tickets
        * more tickets, higher chance
      * ramdomly choose a ticket to run
    * stride scheduling: deterministic
      * Each process has value stride and pass
        * smaller stride, higher chance
      * choose process with least pass to run
        * update pass by adding its stride
    * Completely Fair Scheduler(CFS in Linux)
      * Select one with minimum vruntime
        * vruntime = 实际运行时间*1024/权重
        * vruntime's Fair
      * 权重(由nice值决定)
        * nice 差1，权重相差10%
        * -20: 88761
        * 19: 15
          * 很nice，允许其他任务享有更多CPU时间
          * 优先级低
  * Multiprocessor Scheduling
    * Single-queue multiprocessor scheduling (SQMS)
      * put all jobs that need to be scheduled into a single queue
    * MQMS

## Memory

* Goal: Transparency, Efficiency, Protection
* 虚拟储存 $f(x)\in[0,M)$
  * 程序访问虚拟地址 $x$
  * 访问物理地址 $f(x)$
  * 若 $f(x)=\perp$ 出发 Segmentation Fault
* 实现 $f(x)$
  * segmentation
    * fine-grained vs. coarse-grained: whether the block is large or not
    * external fragmentation prolem: physical memory quickly be- comes full of little holes of free space
  * paging
    * TLB: translation-lookaside buffer
      * manage TLB on a context switch
        * flush(empty) it
        * ASID(address space identifier)
      * replacement policy
    * cr3: the current page table
      * 每个进程维护自己的页表
    * Smaller Tables

| Method                        | Description               |
| ----------------------------- | ------------------------- |
| Bigger Pages                  | Internal fragmentation    |
| Paging and Segments           |                           |
| Multi-level Pages Tables(PML) | PDE->PTE                  |
| Inverted Page Table(IPT)      |                           |
| Swapping page tables to disk  | 全局维护 $f(\text{id},x)$ |

### API

| API      | Remarks                                                                                                                                                                 |
| -------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| malloc   | returns a pointer to type void （需要额外记录分配信息）                                                                                                                 |
|          | `malloc(strlen(s)+1)`                                                                                                                                                   |
| calloc   | `void* calloc (size_t num, size_t size);` Allocates a block of memory for an array of num elements, each of them size bytes long, and initializes all its bits to zero. |
| realloc  | `void *realloc( void *ptr, size_t new_size );`                                                                                                                          |
| brk/sbrk | manage heap                                                                                                                                                             |
| mmap     | `void *mmap(void *addr, size_t length, int prot, int flags, int fd, off_t offset);`                                                                                     |
|          | 操作系统只需要记下这一次mmap操作，并将页面标记为“不存在”                                                                                                                |
|          | `malloc`大于`M_MMAP_THRESHOLD`则使用`mmap`                                                                                                                              |
| munmap   |                                                                                                                                                                         |
| dlopen   |                                                                                                                                                                         |

### 进程空间

| 地址空间         | 内容                             |
| ---------------- | -------------------------------- |
| 内核地址空间     |                                  |
| vsyscall         | 用户空间系统调用,被vdso+vvar替代 |
| vdso             | 3pages,ro,内核数据               |
| vvar             | 2pages,rx,调用代码               |
| stack            | [anon]                           |
| 共享库和内存映射 |                                  |
| heap             | [anon],可不连续                  |
| bss              | [anon]                           |
| data             | rw-:a.out                        |
| text             | r-x:a.out                        |

* ASLR: Address Space Layout Randomization
  * /proc/kallsyms

### free-space management

* best-fit
* worst-fit
* first-fit
* next-fit
* segregated lists
  * Slab Allocator
* Binary Buddy Allocator

### 动态链接

* [启动过程](http://www.dbp-consulting.com/tutorials/debugging/linuxProgramStartup.html)：loader->_start->__libc_start_main->main
  * main 之前：->__libc_csu_init->_init
  * main 之后：->exit
* GOT: Global Offset Table (Table中存的是地址)
* PLT: Procedure Linkage Table (Table中存的是代码)
  * For lazy linking
* `lld`
