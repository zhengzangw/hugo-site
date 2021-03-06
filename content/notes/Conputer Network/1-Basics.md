---
title: 1. Basics
date: 2019-09-03
weight: 1
---

## 因特网

* 根据硬件和软件组件描述
  * communication link: 通信链路
  * packet switch: 分组交换机
  * packet: 分组，数据分段并加上头部
  * ISP: Internet Service Provider
    * PoP(Point of Presence)
    * 多宿(multi-home)
    * 对等(peer): IXP(Internet Exchange Point) 

![ISP](/images/content/isp.png)

* 根据基础设施向分布式应用程序提供的服务描述
  * 分布式应用程序
  * 套接字接口
* 协议：定义了在两个或多个通信实体之间交换的报文的格式和顺序，以及报文发送和/或接受一条报文或其他时间所采取的动作

## 网络边缘

* host/end system: 主机/端系统
  * 客户端：client
  * 服务器：server
    * 数据中心: data center

### 接入网

* 家庭接入
  * DSL(Digital Subscriber Line, 数字用户线)：本地电话公司(CO)为 ISP
    * DSLAM
    * 高速下行 50kHz - 1MHz
    * 中速上行 4kHz - 50kHz
    * 普通的双向电话信道 0 - 4kHz
  * 电缆(cable Internet access)：利用有线电视公司现有的有线电视基础设施
    * CMTS(Cable Modem Termination System)
    * HFS
  * FTTH(Fiber To The Home)
    * AON(Active Optical Network)
    * PON(Passive Optical Network)
  * 卫星链路
  * 拨号接入
* 企业接入
  * 以太网
  * WiFi
* 广域无线接入
  * 蜂窝网络

## 网络核心

### 分组交换

* 储存转发传输：交换机能够输出第一个比特前，必须接受整个分组
* 节点时延
  * 节点处理时延
  * 排队时延
    * 流量强度：$\frac{La}{R}$
    * 丢包
  * 传输时延
  * 传播时延
* 端到端时延 = $N$ (处理时延+ 传输时延 + 传播时延 )
* 吞吐量：$\frac{F}{T}$ bps，瓶颈链路的传输速率
* 最大聚合带宽：设备所有接口的速率之和

### 集线器 (hub)

工作在物理层，多接口中继器

* 用星型拓扑实现逻辑上的总线形
* 每个端口相当于一个中继器，只对物理电信号放大中继
* 首位集线器(HHUB)->中间集线器(IHUB)

### 网桥

工作在 MAC 层

* 连接使用相同 MAC 协议的局域网
  * 不改变帧的内容与格式
  * 需要足够缓存空间
  * 具有寻址能力和路由选择功能
  * 一个网桥可以连接多个局域网
* 路由选择
  * 固定路由选择
  * 生成树算法 (IEEE 802.1)
    * 帧转发：为每个端口维护转发数据库
    * 地址探索
    * 生成树算法
  * 源站路由 (IEEE 802.5)

### 交换机 (link-layer switch)

工作在 MAC 层

* 集线器的全双工版本
* 与网桥的区别
  * 网桥软件处理，交换机硬件处理
  * 网桥一次一帧，交换机并行处理
  * 除了缓存（存储转发交换机），还有直通式交换机
* 过滤：决定一个帧应该转发还是丢弃
* 转发：帧导向哪个接口
* 交换机表：从交换机口 $x$ 到达
  * 没有地址：广播
  * 与 $x$ 联系：过滤
  * 与 $y\neq x$ 联系：转发到 $y$
* 自学习
  * 初始为空
  * 入帧：记录(MAC,到达接口,时间)
  * 老化期后没有接到该地址为源地址的帧，删除该地址
  * 即插即用

### 路由器 (router)

工作在 IP 层

* 输入端口：线路端接 -> 数据链路处理 -> 查找，转发，排队
  * 最长前缀匹配规则
  * 线路前部阻塞 HOL：输入排队
* 交换结构
  * 内存交换
  * 总线交换
  * 互联网络交换
* 输出端口：排队 -> 数据链路处理 -> 线路端接
  * 输出排队
  * 分组调度
    * 先进先出
    * 优先权排队
    * 循环排队
    * 加权公平排队
* 路由选择处理器

## History

### 1961~1972 分组交换

* 电话网占统治地位：电路交换
* 分组交换
  * MIT -> ARPA
    * 1969 四个结点
    * 1972 15个结点，第一个电子邮件程序
  * 兰德公司
  * NPL实验室

### 1972~1980 专用网络和网络互联

* 20世纪70年代早期中期
  * ALOHnet 微波网络
  * Telenet BBN商用网络
  * Cyclades 法国分组交换网络
* 网络互联（网络的网络）
  * TCP的早期实验
  * TCP,UDP,IP 概念的产生

### 1980~1990 网络激增

* 100000台主机与 ARPAnet 相连
* 1983.1.1 TCP/IP 作为 ARPAnet 新的标准主机协议，代替了 NCP 协议
* 法国 Minitel 项目

### 20世纪90年代 因特网爆炸

* 万维网应用程序的出现：搜索、商务、社交
* 2000年末：电子邮件，Web，即时讯息，MP3的对等文件共享

## 组织机构

* ITU (International Telecommunication Union)
  * 分支字母.数字
* IEEE (Institute of Electrical and Electronics Engineers)
  * IEEE Computer Society 学会 -> LMSC Committee 802委员会 -> 802.11 工作组-> 802.11a 任务组
* IETF (Internet Engineering Task Force)
  * Internet standard
  * RFC(Request For Comments)

| 国家 | 物理设备架设公司 |
| ---- | ---------------- |
| 中   | 移动，电信       |
| 日   | NTT              |
| 美   | AT&T             |

### 媒体

* 传输媒介
* 拓扑结构

### 物理层

* 信号编码/解码
* 前同步序列生成/去除
* 比特传输/接受

## 协议层次

| OSI        | TCP/IP         | IEEE 802 协议层   | 信息名称         | 功能                         |
| ---------- | -------------- | ----------------- | ---------------- | ---------------------------- |
| 应用层     |                |                   |                  |                              |
| 表示层     |                |                   |                  |                              |
| 对话层     | 应用层         |                   | 报文(message)    | 提供应用程序交换信息         |
| 运输层     | 传输层(TCP)    |                   | 报文段(segment)  | 应用程序端点间传送，逻辑通信 |
| 网络层     | 网际互联层(IP) | 高层协议          | 数据报(datagram) | 主机到主机                   |
| 数据链路层 | 数据链路层     | 逻辑链路控制(LLC) | 帧(frame)        | 节点到节点                   |
|            |                | 媒体接入控制(MAC) |                  | 比特传输                     |
| 物理层     | 物理层         | 物理层            |                  |                              |
| 媒体       | 媒体           | 媒体              |                  |                              |

封装：附加信息  
分组字段：首部字段 + 有效载荷字段

### 媒体接入控制(MAC)

* 传输时将数据、地址、差错检测字段组帧
* 接受时，分解帧并执行地址识别和差错检测
* 监管局域网传输媒体的接入
* 控制方式
  * 集中式
  * 分布式
* 处理方法
  * 同步
  * 异步
    * 循环
    * 预约
    * 争用

| MAC 控制 | 目的 MAC 地址 | 源 MAC 地址 | LLC PDU | CRC |
| -------- | ------------- | ----------- | ------- | --- |
|          |               |             | 变长    |     |

### 逻辑链路控制(LLC)

* 向高层提供接口并执行流量控制和差错检测
* LLC 寻址
  * LLC 用户：通常为一个高层协议
  * 服务访问点 (SAP)：用户地址
* LLC 服务
  * 不确认的无连接服务
  * 连接模式服务
  * 确认的无连接服务
* LLC 协议

| DSAP | SSAP | LLC 控制 | 信息 |
| ---- | ---- | -------- | ---- |
| 1+7  | 1+7  | 8/16     | 变长 |

## 历史产物

* X.25
  第三层协议，面向连接，被淘汰
* 帧中继 (Frame Relay)
  * X.25 去掉校验就是帧中继
  * 使用光纤作为传输介质
  * 帧长度可变，允许最大帧长度在1600B以上

## kernel bypass

* DPDK (Intel)
* RDMA

## 其它

* 优化：Probability(Workload)+HW+SW(Schedule)
* cross layer: App-System-Storage+Network
* 三大小强
  * PCIe
  * Ethernet
  * TCP/IP