---
title: Concurrency
date: 2019-01-21
tags: [os, notes]
---



## 概念定义

| Concept                    | Definition                                                                                                    |
| -------------------------- | ------------------------------------------------------------------------------------------------------------- |
| thread                     | separate process that 共享代码、共享数据、拥有独立栈堆                                                        |
| multi-thread               | parallelism and can avoid blocking program progress due to slow I/O                                           |
| race condition             | the results depend on the timing execution of the code                                                        |
| critical section           | a piece of code that accesses a shared resource and must not be concurrently executed by more than one thread |
| POSIX                      | Portable Operating System Interface                                                                           |
| synchronization primitives |                                                                                                               |

<!--more-->

## 并发的问题

| Lack   | Location | Reason       | Example                      | Solution    |
| ------ | -------- | ------------ | ---------------------------- | ----------- |
| 顺序性 | 编译器   | 编译器优化   | sum 累加 -O1 -O2             | `volatile`  |
|        |          |              |                              | 内存屏障    |
| 原子性 | 操作系统 | 中断随时到来 | sum 累加                     | mutual lock |
|        |          |              | 32位处理64位数(32-bit `mov`) |             |
| 可见性 | Cache    | 缓存         | 双写 x,y                     | 指令集      |
|        |          |              | 乱序执行                     |             |

* 内存屏障
  * `asm volatile("" ::: "memory")`
  * `__sync_synchronize()`

## Lock

| Spin Lock 实现方法                | 具体描述                                                     | 代码实现                                                                            |
| --------------------------------- | ------------------------------------------------------------ | ----------------------------------------------------------------------------------- |
| atomic-exchange                   | `while (atomic_xchg(&locked, 1));`                           | `asm volatile ("lock xchg %0, %1":"+m"(*addr), "=a"(result) : "1"(newval) : "cc");` |
| compare-and-exchange              | `while (comp_swap(&locked, 0, 1));`                          | `lock cmpxchg1 %2, %1`                                                              |
| load-linked and store-conditional | `while(1) { while (LL(&lock)); if (SC(&lock, 1)) return;  }` | (ARM, RISC-V, MIPS)                                                                 |
| fetch-and-add                     | `int t=fetch-add(&lock->ticket); while (t!=&lock->turn);`    |                                                                                     |

* spinlock: 持有锁时中断，其它进程等待浪费时间
  * Evaluating
    * Correctness
      * safety: 任意时刻至多一个
      * liveness: 至少一个
    * Fairness
    * Performance
* spinlock+cli: (只有其它cpu可能在同一临界区spin)
  * 中断丢失可能严重损害I/O性能
  * 互斥的代码本身就需要等待中断
* mutex lock
  * yield
  * sleeping with queue

## 并发数据结构

### counter
    
* single lock: not scalable
* approximate counter: accuracy/performance trade-off
  
### list

* hand-over-hand locking
  
### queue

### hash table

## Condition Variables

* **condition variable**: an explicit **queue** that threads can put themselves on when some condition is waiting other thread
  * wait: release the lock and put the calling thread to sleep
  * wakeup: re-acquire the lock
  * signal: wake another thread
  * broadcast: wake all other threads
* Always hold the lock while signaling

```C
//wait
lock(&m)
while (done==0) wait(&c,&m)
unlock(&m)
```

```C
//signal
lock(&m)
done=1
signal(&c)
unlock(&m)
```

| Semantics | Definition                                                                            | Signaled                                           | Signaler                                                   |
| --------- | ------------------------------------------------------------------------------------- | -------------------------------------------------- | ---------------------------------------------------------- |
| Hoare     | the signaled thread immediately takes over the monitor, and the signaler is suspended | 可认为状态不变                                     | 在 signaled thread 返回后继续                              |
| Mesa      | the signaled thread transitions back to the ready state                               | 状态可能改变：must examine the monitor state again | the signaler continues until it exits the monitor or waits |

## Semaphores

* **semaphore**: an object with an integar value that we can manipulate with two routines: `sem_wait()` and `sem_post()`
  * `sem_init(&s, 0, s)`
  * P: `sem_wait` : s--, if s<0 wait
    * the negative value equals waiting threads
  * V: `sem_post` : s++, if exists waiting threads, wake one
* semaphore as lock (binary semaphore)
  * `sem_init(&s, 0, 1)`
  * `sem_wait() ... sem_post()`
* semaphore for ordering (signal variable)
  * `sem_init(&s, 0, 0)`
* Implement of Semaphores

```C
void zem_wait(){
  lock(&s->lock);
  while (s->value<=0) wait(&s->cond, &s->lock);
  s->value--;
  unlock(&s->lock);
}
```

```C
void zem_post(){
  lock(&s->lock);
  s->value++;
  signal(&s->cond);
  unlock(&s->lock);
}
```

## 实际应用

### Producer/Consumer Problem

```C
//Lock Version
void *producer() {
  for (i=0; i<loops; ++i){
    lock(&m);
    while (count == MAX) wait(&empty, &m);
    put(i);
    signal(&fill);
    unlock(&m);
  }
}

void *consumer() {
  for (i=0; i<loops; ++i){
    lock(&m);
    while (count==0) wait(&fill, &m);
    get(i);
    signal(&empty);
    unlock(&m);
  }
}
```

```C
//Semaphore Version
void *producer(){
  for (i=0; i<loops; ++i){
    sem_wait(&emtpy); // It is atomic so it can move here
    sem_wait(&mutex);
    put(i);
    sem_post(&mutex);
    sem_post(&full);
  }
}

void *consumer(){
  for (i=0; i<loops; ++i){
    sem_wait(&full); // It is atomic so it can move here
    sem_wait(&mutex);
    put(i);
    sem_post(&mutex);
    sem_wait(&empty);
  }
}

sem_init(&empty, 0, MAX);
sem_init(&full, 0, 0);
sem_init(&mutex, 0, 1);
```

### Reader-Writer Locks

* first reader aquires writelock
* last reader releases writelock

### The Dining Philosophers

* big lock (not scalable)
* Lock Ordering
* add manager

## 并发 bug

* Deadlock: ABBA
  * Cause
    * circular dependencies
    * encapsulation
    * Live lock: harder to handle
  * Prevention: 见表格
  * Avoidance
    * Scheduling
  * detect and recover

| 必要条件                  | Description                                | prevention                                 | Remarks                                         |
| ------------------------- | ------------------------------------------ | ------------------------------------------ | ----------------------------------------------- |
| Mutual exclusion(互斥)    | 一个资源每次只能被一个进程使用             | lock-free                                  | powerful hardware instruction                   |
| Hold-and-wait(请求与保持) | 请求堵塞时不释放已获得的资源               | acquiring all lock at a time               |                                                 |
| No-preemption(不剥夺)     | 进程已获得的资源不能强行剥夺               | release aquired lock                       | may lead to livelock                            |
| Circular wait(循环等待)   | 若干进程之间形成头尾相接的循环等待资源关系 | total/partial ordering on lock acquisition | 不让外部调用，调用外部代码时释放锁              |

* 原子性违反(AV): ABA
  * Cause:
    * 临界区间忘记上锁
    * serialization violated
  * solution: lock
* 顺序违反(OV): BA
  * Cause
    * order flipped
    * use after free
  * solution: condition variables
* 数据竞争
  * 两个线程对同一个共享变量的非只读并发访问

## Event-based Concurrency

* 解决问题
  * managing concurrency correctly in multi-threaded application is challenging
  * has little control over what is scheduled at a given moment in time
* event loop

```C
while (1){
  events = getEvents();
  for (e in events)
      processEvent(e);
}
```

* select/poll
  * check whether there is any incoming I/O that should be attended to
  * `select(int nfds, fd_set *readfds, fd_set *writefds, fd_set *errorfds, struct timeval *timeout)`
  * `poll(struct pollfd fds[], nfds+t nfds, int timeout)`
* Problem: Blocking System Calls
  * solution: Asynchronous I/O
    * 轮训或signal
  * State Management
* 同步/异步：线程关系，消息通知机制
  * 同步：一次性完成
  * 异步：两次完成
* 阻塞/非阻塞：等待调用结果时的状态
  * 阻塞：做一件事
  * 非阻塞：做多件事
* cpu密集型/io密集型
* 协同式调度/抢占式调度

## Thread API (pthread.h)

### Thread

| Name                                                                                        | Description  |
| ------------------------------------------------------------------------------------------- | ------------ |
| `pthread_t`                                                                                 | 线程结构体   |
| `pthread_attr_init()`                                                                       |              |
| `pthread_create(pthread_t *, pthread_attr_t *, void * (*start_routine)(void *), void *arg)` | 创建线程     |
| `pthread_join(pthread_t thread, void **value_ptr)`                                          | 等待线程结束 |

### Lock

| Name                                            | Description                                                |
| ----------------------------------------------- | ---------------------------------------------------------- |
| `pthread_mutex_t`                               | 互斥锁结构体                                               |
| `pthread_mutex_lock(pthread_mutex_t *mutex)`    | `int rc = pthread_mutex_init(&lock, NULL); assert(rc==0);` |
| `pthread_mutex_unlock(pthread_mutex_t *mutex)`  |                                                            |
| `pthread_mutex_init(pthread_mutex_t *mutex)`    | `lock=PTHREAD_MUTEX_INITIALIZER`                           |
| `pthread_mutex_destroy(pthread_mutex_t *mutex)` |                                                            |

### Condition

| Name                                                              | Description  |
| ----------------------------------------------------------------- | ------------ |
| `pthread_cond_t`                                                  | 条件量结构体 |
| `pthread_cond_wait(pthread_cond_t *cond, pthread_mutex_t *mutex)` |              |
| `pthread_cond_signal(pthread_cond_t *cond)`                       |              |
