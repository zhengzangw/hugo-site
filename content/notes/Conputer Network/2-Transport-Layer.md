---
title: Transport Layer
date: 2019-01-28
tags: [notes, network]
weight: 2
---

## 提供服务

* 多路复用与多路分解：主机间的交付扩展到进程间交付
* 完整性检验
* 可靠数据传输 (TCP)
  * 可靠：面向连接的LLC服务的局域网，面向连接的分组交换网络
  * 不可靠：使用IP的网际互联，无确认LLC服务的局域网
* 流量控制 (TCP)
* 拥塞控制 (TCP)

## 多路复用与多路分解

* 套接字：源端口号，目的端口号，源IP，目的IP
  * 不同套接字创建进程/线程
* 端口号 0-65535
  * 0-1023 周知端口号
* UDP 套接字：由(目的IP, 目的端口号)标识
* TCP 套接字：由(源端口号，目的端口号，源IP，目的IP)标识

## UDP

RFC 768

* UDP 优势
  * 防止 TCP 的拥塞控制，应用层 进行拥塞控制
  * 无需连接建立
  * 无连接状态
  * 分组首部开销小
* 完整性检验：因特网检验和
  * 基于端到端原则

UDP 报文段首部

| Source Port | Destination Port | Length | Checksum |
| ----------- | ---------------- | ------ | -------- |
| 16 bits     | 16               | 16     | 16       |

## 可靠数据传输

* 经完全可靠信道的可靠数据传输 rdt1.0
* 经具有比特差错信道的可导数据传输
  * rdt2.0: stop-and-wait
  * rdt2.1: stop-and-wait 01
* 经具有比特差错的丢包信道的可导数据传输
  * rdt3.0: stop-and-wait 01 ARQ
* 流水线可靠数据协议
  * Go-Back-N ARQ
  * Selective Reject ARQ

## TCP

### 面向连接

* 三次握手
  * C->S: SYN 1, seq i
  * S->C: SYN 1, seq j, ack i+1
  * C->S: SYN 0, seq i+1, ack j+1
* 结束连接
  * C->S: FIN
  * S->C: ACK
  * S->C: FIN
  * C->S: ACK
* 发送缓存：三次握手期间建立
* 最大报文段长度(MSS, Maximum Segment Size) e.g 1460
* 最大传输单元(MTU, Maximum Transmit Unit) = MSS + 报文段首部 + 数据报首部(通常为40字节) e.g 1500

### TCP 首部格式

| Source Port               | Destination Port | Seqence Number                          | Acknowledgement Number | Data Offset      | Reserved | Flags       | Window      | Checksum     | Urgent Pointer         | Options         |
| ------------------------- | ---------------- | --------------------------------------- | ---------------------- | ---------------- | -------- | ----------- | ----------- | ------------ | ---------------------- | --------------- |
| 16 bits                   | 16               | 32                                      | 32                     | 4                | 4        | 8           | 16          | 16           | 16                     | option,variable |
| Telnet=13,HTTP=80,TFTP=69 |                  | 第一个数据八位组的序号（SYN置位则加一） | 希望接受的序号（累积确认）         | 首部32位字的数量 |          | 置1含义见下 | 信用量分配W | 因特网检验和 | 紧急数据最后一个八位组 |                 |

| Flags | Function                 |
| ----- | ------------------------ |
| CWR   | 拥塞窗口减少             |
| ECE   | ECN-Echo                 |
| URG   | urgent point 字段有效    |
| ACK   | acknowledegment 字段有效 |
| PSH   | 推送功能                 |
| PST   | 连接复位                 |
| SYN   | 序号同步                 |
| FIN   | 发送者无其它数据         |

### 重传计时器管理

* $\text{RTT}(i)$ = SampleRTT: 实际往返时延,对第$i$个传输的报文段所观察到的往返时间
* 将重传计时器的值设置的比估计值大一点
  * 超时间隔 = EstimateRTT + 4 DevRTT
* 简单平均：$\text{ARTT}(K+1)=\frac{K}{K+1}\sum_i{\text{RTT}(i)}$
* 指数平均
  * EstimateRTT = $(1-\alpha)$ EstimateRTT + $\alpha$ SampleRTT
  * DevRTT = $(1-\beta)$ DevRTT + $\beta$ |SampleRTT - EstimateRTT|
  * RFC 793
    * $\text{RTO}(K+1)=\min(\text{UPBOUND},\max(\text{LBOUND},\beta\text{EstimateRTT}(K+1)))$
* RTT 方差估计 (Jacobson 算法)
  * 指数平均不能很好处理方差较高的情况
  * $\text{SRTT}(K+1)=(1-g)\text{SRTT}(K)+g\text{RTT}(K+1)$
  * $\text{SERR}(K+1)=\text{RTT}(K+1)-\text{SRTT}(K)$
  * $\text{SDEV}(K+1)=(1-h)\text{SDEV}(K)|\text{SERR}(K+1)|$
  * 重传计时器 $\text{RTO}(K+1)=\text{SRTT}(K+1)+f\text{SDEV}(K+1)$
* 指数RTO退避：重传时 $\text{RTO}=q\text{RTO}$
* Karn 算法
  * 报文超时重传后，收到确认既可能是第一次的 ACK，也可能是第二次的 ACK
  * 不对重传报文测得的 $\text{RTT}$ 更新
  * 发送重传后用指数RTO退避
  * 对后续报文使用 RTO 退避知道收到一个队未重传的报文段的确认为止

## 流量控制

* 丢弃溢出报文（可靠网络下很不合适）
* 反压机制
* 滑动窗口协议
* 信用量机制
  * 窗口(W): W = Buffer - (LastByteRcvd - LastByteRead)

## TCP 拥塞控制

* 丢失的报文说明拥塞
* 确认报文说明可增速
* 带宽探测

### TCP 拥塞控制算法

* 慢启动
  * cwnd(拥塞窗口) 初始化微较小 MSS
  * 每收到一个确认增加 1个MSS （指数增长）
  * 结束状态
    * 超时事件：ssthresh = cwnd/2, cwnd = 1, 慢启动
    * cwnd $\geq$ sstresh: 拥塞避免模式
    * 3个冗余 ACK：快速重传（在定时器过期前重传丢失的报文段），sstresh = cwnd/2,  快速恢复
* 拥塞避免模式（加性增，乘性减）
  * 每过一个往返时延将 cwnd 加一
  * 结束状态
    * 超时事件：ssthresh = cwnd/2, cwnd = 1, 慢启动
    * 3个冗余 ACK: sstresh = cwnd/2, 快速恢复
* 快速恢复
  * TCP Taheo: cwnd = 1, 慢启动
  * TCP Reneo: cwnd = sstresh + 3, 线性增长

### TCP 吞吐量

* 平均吞吐量
  * $B=\frac{0.75W}{\text{RTT}}$
  * $B=\frac{1.22\text{MSS}}{\text{RTT}\sqrt{L}}$

### 显示拥塞通知

* ECN(Explicit Congestion Notification)
  * 00:无能力
  * 01/10:有能力
  * 11:已遇到堵塞
* 发送方设置 ECN=01/10
* 路由器检测到堵塞，准备丢弃的分组 ECN=01/10，则将该分组IP首部中 ECN 设为11并转发
* 接收方收到 11，则恢复时在 TCP ACK 中将 ECN-Echo 置位
* 发送方在下一个发送到接收方的分组中，将 CWR 置位

## 数据报拥塞控制协议 (DCCP)

* 拥塞崩溃：各行其道的流量过多且互不考虑
* TCP友好(TCP 兼容)：非TCP协议在遇到拥塞时可以产生与TCP类似行为
  * $T\leq\frac{1.22B}{R\sqrt{q}}$
  * 发送速率 $T$
  * 最大分组长度 $B$
  * 连接上的往返时延 $R$
  * 分组丢弃率 $p$
* DCCP 运行在 IP 上，原本使用 UDP 的应用程序作为可替代的运输协议
  * 不存在重传，确认字号为收到的最大序列号
  * 三次握手

| 分组类型      |             |
| ------------- | ----------- |
| DCCP-Request  | 握手第一次  |
| DCCP-Response | 握手第二次  |
| DCCP-Data     |             |
| DCCP-ACK      | 无Data时ACK |
| DCCP-DataAck  |             |
| DCCP-CloseReq | 关闭请求    |
| DCCP-Close    | 关闭连接    |
| DCCP-Reset    | 终止连接    |
| DCCP-Sync     |             |
| DCCP-SyncAck  |             |

| 源端口 | 目标端口 | 数据偏移           | CCVal                  | CsCov(检验范围) | 检验和       | RES | 类型     | 扩展序列号 | RES | 序列号 | 可选 |
| ------ | -------- | ------------------ | ---------------------- | --------------- | ------------ | --- | -------- | ---------- | --- | ------ | ---- |
| 16bits | 16       | 8                  | 4                      | 4               | 16           | 3   | 4        | 1          | 8   | 48/28  |      |
|        |          | 应用数据开始偏移量 | 发送方拥塞控制机制使用 | 检验和检验范围  | 因特网检验和 |     | 分组类型 | 1则48bits  |     |        |      |

* DCCP 拥塞控制
  * 类TCP拥塞控制 CCID 2：宽带利用率最大化
  * TCP 友好性速率控制 TFRC/CCID 3: 平滑性