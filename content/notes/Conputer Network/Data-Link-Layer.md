---
title: Data Link Layer
date: 2019-01-28
tags: [notes, network]
weight: 4
---

# 随机接入协议

## ALOHA

发送$\rightarrow$等待确认$\rightarrow$超时$p$ 概率重传

* 信道最大利用率约 18%
  * $Np(1-p)^{2(N-1)}$
* 时隙 ALOHA：所有传输只允许在时隙的边界处开始，37%
  * $Np(1-p)^{N-1}$
* 无法利用局域网和分组无线网的一个重要性质：帧的传播时延小于传输时延
  * 小的传播时延提供更好的网络状态反馈信息

## CSMA (载波监听多点接入)

监听信道$\rightarrow$发送$\rightarrow$等待确认$\rightarrow$超时重传

* CS(载波检测)：判断是否有AM/FM信号
* LBT: Listen Before Talk
* 监听算法
  * 非持续CSMA：忙则等待一段时间，该时间长度从一个概率分布中获得
  * $1$ 持续协议：忙则持续监听，空闲立即传输
  * $p$ 持续CSMA：空闲则有$p$概率直接传输，否则等待一段时间
* 缺点：两个被破坏帧的传输时间内信道无法使用

## CSMA/CD (带冲突检测的载波监听多点接入)

* $1$ 持续 CSMA + 二进制指数退避
* 干扰信号，帧间最小间隔
* 检测冲突的时间不超过端到端传播时延两倍
* CSMA/CD 效率：当有大量的活跃结点，且每个节点有大量帧要发送时，帧在信道中无碰撞传输的那部分时间在长期运行时间中所占比例
  * $d_{\text{prop}}$: 信号能量在任意两个适配器间传播的最大时间
  * $d_{\text{trans}}$: 传输一个最大长度的以太帧的时间
  * 效率 $=\frac{1}{1+5\frac{d_{\text{prop}}}{d_{\text{trans}}}}$

### 二进制指数退避(BEB)

检测到冲突后，节点停止传输，发送干扰序列（JAM序列），之后进行backoff，完成之后可以尝试再次重传

1. 基本退避时间一般为端到端的往返时间 $2t$(冲突窗口或争用期)
2. $k=\min($冲突次数$，10)$
3. 从离散的整数集合$\{0,1,2，……，(2^k-1)\}$中随机的取出一个数$r$，等待时延$2tr$
4. 当冲突次数超过$16$次后，发送失败，丢弃传输的帧，发送错误报告。

## CSMA/CA (带冲突回避的载波监听多点接入)

* IFS(帧间间隔): SIFS,PIFS,DIFS
* 物理载波监听：信道忙则等待 IFS 时间
  * 能量检测
  * 载波侦听
* 虚拟载波监听：NAV>0则NAV减一
* 算法
  * CSMA: 若空闲则等待 IFS 时间后再次检测频道是否空闲
  * CA: 进行二进制随机退避，退避过程中若发现信道忙则认为产生冲突，为0则发送
  * ALOHA: 发送完成后 SIFS 收到 ACK，否则超时，等待 EIFS 再次接入信道

# IEEE 802.3(以太网)

## 以太网规约

| 前同步码   | 帧开始定界符(SFD) | 目的地址 | 源地址 | 长度/类型 | MAC客户数据(包含填充码)  | 帧检验序列 | 扩展 |
| ---------- | ----------------- | -------- | ------ | --------- | ------------------------ | ---------- | ---- |
| $7*8$      | $1*8$             | $6*8$    | $6*8$  | $2*8$     | $46\sim1500/1540/1982*8$ | $4*8$      |      |
| 01交替序列 | 10101011          |          |        |           | 基础帧，Q标志帧，包装帧  |            |      |

数据率(Mbps)|信号编码方式|最大网段长度(百米)

| 10Mbps                       | 100Mbps                  | 1000Mbps               | 10Gbps                      |
| ---------------------------- | ------------------------ | ---------------------- | --------------------------- |
| 10BASE5 同轴电缆($50\Omega$) | 100BASE-TX 2对STP/5类UTP | 1000BASE-SX 多模光纤   | 10GBASE-S 多模光纤(300m)    |
| 10BASE2 同轴电缆($50\Omega$) | 100BASE-FX 2根光纤       | 1000BASE-LX 多模光纤   | 10GBASE-L 单模光纤(10km)    |
| 10BASE-T 无屏蔽双绞线        | 100BASE-T4 4对3/4/5类UTP | 1000BASE-CX 屏蔽双绞线 | 10GBASE-E 单模光纤(40km)    |
| 10BASE-FP 850nm光纤对        |                          | 1000BASE-T 4对5类UTP   | 10GBASE-LX4 单模/多模(10km) |

### IEEE 802.3 100Gbps 规约

* 多通道分发：物理链路多条并行
* 物理媒体附件子层(PMA)：物理层上，数据链路层下
* 虚通道：物理媒体附件子层的通信通道

## IEEE 802.1Q VLAN 标准

* VID: 1~4094
* TCI(标签控制信息)：802.3 MAC帧长度/类型=0x8100，则有两个八位组的 TCI字段

| 用户优先级 | 规范格式指示 | VLAN标识符 |
| ---------- | ------------ | ---------- |
| 3bit       | 1bit         | 12bit      |

## 局域网数字信号编码

|            | 运用                   | 编码方式                                   | Remark                                             |
| ---------- | ---------------------- | ------------------------------------------ | -------------------------------------------------- |
| 4B/5B-NRZI | 100BASE-X              | 4比特编码为5个码比特+NRZI                  | 光纤上高效，双绞线上信号能量太过集中，产生不利辐射 |
| MLT-3      | 100BASE-TX             | 4B/5B+NRZ+扰码+扰码后的比特流用 MLT-3 编码 |                                                    |
| 8B6T       | 100BASE-T4             | 每个8比特映射到6个三进制符号上             |                                                    |
| 8B/10B     | 光纤通道与千兆位以太网 |                                            |                                                    |
| 64B/66B    | 10Gbps 100Gbps         |                                            |                                                    |

# 链路层

成帧，链路接入，可靠交付，差错检验和纠正

* [差错检测和纠正技术](https://blog.zhengzangw.com/2019/03/21/Data-Communication-1/#%E5%B7%AE%E9%94%99%E6%A3%80%E9%AA%8C%E5%92%8C%E7%BA%A0%E6%AD%A3)
  * Parity Checking
  * Cyclic Redundancy Check
  * Checksum
* 点对点链路
  * HDLC: Bit-Oriented Protocols
  * PPP: Byte-Oriented Protocols
* 广播链路
  * 以太网
  * 无线局域网
* 多路访问协议
  * [信道划分协议](https://blog.zhengzangw.com/2019/03/21/Data-Communication-1/#%E5%A4%8D%E7%94%A8)
    * TDM
    * FDM
    * CDMA
  * [随机接入协议](https://blog.zhengzangw.com/2019/06/28/Data-Communicatino-2/#%E9%9A%8F%E6%9C%BA%E6%8E%A5%E5%85%A5%E5%8D%8F%E8%AE%AE)
    * 时隙 ALOHA
    * ALOHA
    * CSMA
    * CSMA/CD
  * 轮流协议
    * 轮询协议：主节点
      * 轮询时延
      * 主节点故障
    * 令牌传递协议
* DOCSIS
* 交换局域网
  * [ARP](https://blog.zhengzangw.com/2019/06/28/Data-Communicatino-2/#ARP-%E5%9C%B0%E5%9D%80%E8%A7%A3%E6%9E%90%E5%8D%8F%E8%AE%AE)
  * [以太网](https://blog.zhengzangw.com/2019/06/28/Data-Communicatino-2/#IEEE-802-3-%E4%BB%A5%E5%A4%AA%E7%BD%91)
  * [链路层交换机](https://blog.zhengzangw.com/2019/06/28/Data-Communicatino-2/#%E7%BD%91%E7%BB%9C%E8%AE%BE%E5%A4%87)
  * [VLAN](https://blog.zhengzangw.com/2019/06/28/Data-Communicatino-2/#%E8%99%9A%E6%8B%9F%E5%B1%80%E5%9F%9F%E7%BD%91-VLAN)
* [MPLS](https://blog.zhengzangw.com/2019/06/28/Data-Communicatino-2/#MPLS-%E5%A4%9A%E5%8D%8F%E8%AE%AE%E6%A0%87%E8%AE%B0%E4%BA%A4%E6%8D%A2)
* 数据中心网络
