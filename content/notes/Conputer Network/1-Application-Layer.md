---
title: Application Layer
date: 2019-01-28
tags: [notes, network]
weight: 1
---

## 可供使用的运输服务

* 可靠数据传输/容忍丢失
* 吞吐量
* 定时
* 安全性

## HTTP

HyperText Transfer Protocol

端口 80/8080/3128/8081/9080, TCP

| 术语                   |                                         |
| ---------------------- | --------------------------------------- |
| 无状态                 | 每个事务都独立进行                      |
| 用户代理进程           | 发起请求的客户进程                      |
| 源服务器               | 期望得到资源的所在服务器（如Web服务器） |
| 代理服务器（Web 缓存） | 转发的代理：安全中介，不同版本的HTTP    |
| 网关                   | 安全中介，非HTTP服务器                  |
| 隧道                   |                                         |
| 非持续连接             | 每个请求/响应单独发送                   |
| 持续连接               | 单独 TCP 连接                           |

### 请求报文

```http
GET /somedir/page.html HTTP/1.1
Host: www.someschool.edu
Connection: close
User-agent: Mozilla/5.0
Accept-language: fr

[Entity-Body]
```

请求行(get, head, post, delete, put)  
通用首部  
请求首部  
实体首部  
实体主体 = Transfer-Encoding(Content-Encoding(Content-Type(Data)))

条件 GET：更新 Web 缓存

### 响应报文

```http
HTTP/1.1 200 OK
Connection: close
Date: Tue, 24 Dec 2019 18:10:05 CST
Server: Apache/2.2.3 (CentOS)
Last-Modified: Tue, 24 Dec 2019 18:05:05 CST
Content-Length: 6821
Content-Type: text/html

[Entity-Body]
```

状态行  
通用首部  
响应首部  
实体首部  
实体主体

| 状态码分类    |                                          |
| ------------- | ---------------------------------------- |
| Informational | 请求已被接受，响应无伴随实体             |
| Successful    | 请求成功接受，有实体  (300)              |
| Redirection   | 要完成这个请求，需要执行进一步动作 (301) |
| Client Error  | 请求无法被实现或有语法错误 (400,404)     |
| Server Error  | (505)                                    |

### 通用首部

* Cache-Control：缓存机制
* Connection
* Date: 数据生成的日期和时间
* Forworded
* Keep-alive
* MIME-version
* Pragma
* Upgrade

### Cookie

RFC 6265

* 响应报文中 cookie 首部行
* 请求报文中 cookie 首部行
* 用户端系统 cookie 文件
* Web 站点的后端数据库

## 电子邮件

### 因特网邮件体系结构(RFC 5598)

* MUA(Message User Agents)
  * Alice 调用邮件代理程序提供 Bob 邮件地址，发送报文
* MSA(Message Submission Agent)
  * 邮件代理发给邮件服务器，放在报文队列中
* MTA(Message Transfer Agent)
  * SMTP 客户端发现报文，建立到 Bob 邮件服务器的 TCP 连接
* MTA(Message Transfer Agent)
  * 连接成功，发送报文
* MDA(Message Delivery Agent)
  * 放入邮箱中  
* MS(Message Store)
  * 通过 POP/IMAP 阅读报文
* MUA

### SMTP 

RFC 821, RFC 5321, 简单邮件协议

* 端口 25, TCP
* 报文
  * 报文首部： RFC 822/ RFC 5322 首部（报文的一部分）
  * 不能传输二进制对象，不能传输各国语言文本，可能拒绝超过一定长度的报文

```STMP
Date: Mon, 10 Mar 2008 10:37:17(EDT)
From: "William Stallings"<ws@host.com>
Subject: xxxx
To: Simith@Other-host.com
Cc: Jones@Yet-Another-Host.com

Hello, World!
```

实验

```bash
telnet smtp.163.com 25
HELO 163.com
auth login
MAIL FROM <xxx@163.com>
RCPT TO <xxx@xx.com>
DATA
QUIT
```

#### MIME

Multipurpose Internet Mail Extensions

添加5个在 RFC 822 首部中出现的报文首部字段
 
| 首部字段                  |      |                        |
| ------------------------- | ---- | ---------------------- |
| MIME-Version              | 必选 | 1.0                    |
| Content-Type              | 必选 | 报文主题包含的数据     |
| Content-Transfer-Encoding | 必选 | 报文主体的转换类型     |
| Content-ID                | 可选 | 唯一标识 MIME 报文实体 |
| Content-Description       | 可选 | 主体对象的简单描述     |

| 传送编码         |                                                 |
| ---------------- | ----------------------------------------------- |
| 7比特            | 所有数据都是短行ASCII字符                       |
| 8比特            | 每一行都短，但可能是非ASCII                     |
| 二进制           |                                                 |
| x-token          | 非标准编码                                      |
| quoted-printable | 如果编码的数据大多数是ASCII文本，编码后基本可读 |
| base64           |                                                 |

* quoted-printable
  * 普通的8比特标识法：字符使用等号加两位数字
  * 文字表示法：除=，33~126内字符都使用 ASCII 字符形式表示
  * 空白：除行尾空格，9，32的八位组表示制表符和空格；行尾空白用普通的8比特标识法表示，解码时删除
  * 换行：RFC 822换行（即回车+换行组合）
  * 软换行：编码后行大于76，在第75个位置或此前插入一个软换行（3D0D0A 等于加回车换行符）
* base64(radix-64)
  * 65个可打印字符组成，其中之一用于填充，共64有效字符
  * 每6比特为一组，映射到一个字符

### POP3 

Post Office Protocol - Version 3, RFC 1939

* 端口 110，TCP
* 认证状态->事务状态->更新状态
* 实验

```bash
telnet pop3.163.com
user xxx
pass xxx
list
retr x
```

### IMAP

Internet Mail Access Protocol, IMAP4,RFC 3501

* 端口 143, TCP
* 客户端可以有多个远程邮箱，可以检索
* 可以为邮件下载指定规则
* 可以将副本复制到客户端

## DNS

Domain Name System, RFC 1034,1035

* 端口 53, UDP
* DNS
  * 一个分层的 DNS 服务器(运行BIND软件)实现的分布式数据库
  * 一个是主机可以查询分布式数据库的应用层协议
* 域名：从右到左，从顶向下
  * 根 DNS 服务器
  * Top-Level Domain DNS 服务器
    * 互联网名称与数字地址分配机构(ICANN)：顶级名管理
    * Educause: edu
    * Verisign Global Registry Services: com
  * 权威 DNS 服务器
    * 登记注册机构(registrar)
      * Nework Solution (1999)
  * 本地 DNS 服务器：ISP
* 资源记录(RR)格式

| 域名(Name) | 类型(Value) | 类别(Type)   | 生存时间(TTL) | Rdata字段长度 | Rdata    |
| ---------- | ----------- | ------------ | ------------- | ------------- | -------- |
|            |             | 资源记录类型 |               |               | 描述资源 |

| 资源记录类型 | 描述                                      |
| ------------ | ----------------------------------------- |
| A            | 一个主机地址，将一个系统名字映射为 IP     |
| AAAA         | 同A，用于 IPv6                            |
| CNAME        | 指定一个主机的别名，将其映射为其规范名字  |
| HINFO        | 主机信息                                  |
| MINFO        | 将一个邮箱或邮件列表名映射为主机名        |
| MX           | 邮件交换，使邮件和Web服务器使用相同主机名 |
| NS           | 域名服务器                                |
| PTR          | 域名指针                                  |
| SOA          |                                           |
| SRV          |                                           |
| TXT          |                                           |
| WKS          |                                           |

* 域名查询
  * 用户程序请求某个域名的 IP 地址
  * 本地主机汇总的解析模块箱同一个域中的本地域名服务器提出请求
  * 若在则返回，否则查询其它可用域名服务器，得到后保存在高速缓存
  * 用户程序得到 IP 地址或出错警告报文
* 服务器等级：根级，顶级域，二级域，子域
  * 根级 .
    * [IPv4](https://en.wikipedia.org/wiki/Root_name_server): A~M 13个
    * IPv6: 25个（雪人计划）
* 服务器类别
  * 权威DNS：保存相应域名信息
  * 递归DNS(local DNS)：缓存+递归的查询根、顶级域、二级域直到获得结果返回用户
    * [公共DNS](https://www.iplaysoft.com/public-dns.html)：对外一个IP，为所有用户提供公共的递归查询服务
  * 转发DNS：如果本地的缓存记录中没有相应域名结果时，其将查询请求转发给另外一台DNS服务器
* 查询方式
  * 递归查询
  * 迭代查询
* DNS 报文
  * 首部区 (12 bytes)
    * 标识符
    * Query/Response
    * Opcode
    * Authoritative Answer
    * Truncated：若是，则使用TCP重新请求
    * Recursion Desired
    * Recursion Avabilable
    * Response Code
    * QDcount: 询问区中表项数
    * ANcount: 回答区中表项数
    * NScount: 管理机构区中表项数
    * ARcount: 附加记录表项数
  * 询问区
    * 域名
    * 查询类型
    * 查询类别
  * 回答区：包含回答的资源记录
  * 管理机构区：指向一个权威域名服务器
  * 附加记录区

## BitTorrent

P2P协议

* 洪流(torrent): 参与一个特定文件分发的所有对等放
* 追踪器(tracker)
* 最稀缺优先技术：针对没有的块在邻居中决定最稀缺的块
* 疏通(unchoked): 最高速流入的4个邻居
* 分布式散列表 DHT

## 视频流

* DASH (Dynamic Adaptive Streaming over HTTP)
  * 视频编码为多个版本，对于不同质量水平
  * 告示文件
* CDN(Content Distribution Network，内容分发网)
  * 安置原则
    * 深入
    * 邀请做客
  * CDN 操作：DNS 截获和重定向请求
  * 集群选择策略
    * 地理上最为邻近
    * 实时测量

## 因特网电话

* 时延抖动：一次会话汇总分组经历的时延变化的最大值
* 常见的实时通信量
  * 连续的数据源
  * 断续源：具有沉默间隙的话音源
  * 变化的分组尺寸：压缩的视频源
* 软实时应用：容忍部分数据的丢失
* 硬实时应用：不允许丢失
* VoIP：基于 IP 的网络传输话音

### SIP 会话发起协议 (RFC 3261)

* 客户：发送 SIP 请求，接受 SIP 响应的网络元素
* 服务器：接受请求，提供服务的网络元素
* SDP 会话描述协议：描述会话内容
  * 媒体流
  * 地址
  * 端口
  * 载荷类型
  * 开始和结束时间
  * 发起者

### RTP 实时运输协议 (RFC 3550)

* 实时分布式应用：一个源点以恒定速率生成数据流，而在一个或多个终点上必须以相同恒定速率想某个应用交付该数据
* 适用于软实时通信
* 应用级组帧
* 综合层处理
  * 相邻层可以紧耦合，实现这可以通过此在这些层之间自由地实现特定的功能

#### RTP 数据传输协议

* 一次会话由以下元素定义：RTR端口号，RTCP端口号，参与者的IP地址
* RTR 中继类型
  * 混合器
  * 转换器

| Version | Padding        *     | Extension      | CSRC Count | Marker | Payload Type       | Sequence Number | Timestamp | Synchronization Source Identifier | Contributing Source Identifier   |
| ------- | -------------------- | -------------- | ---------- | ------ | ------------------ | --------------- | --------- | --------------------------------- | -------------------------------- |
| 2bits   | 1                    | 1              | 4          | 1      | 7                  | 16              | 32        | 32                                | 32n                              |
| 2       | 尾部是否有填充八位组 | 是否有扩展首部 | CSRC 数量  |        | RTP 格式(RFC 3551) |                 |           | 唯一标识符                        | 标识出载荷的贡献源，由混合器提供 |

#### RTCP RTP控制协议

* 功能
  * QoS 和拥塞控制
  * 标识
  * 会话大小的预估和裁剪
  * 会话控制
* 分组类型
  * 发送方报告
  * 接收方报告
  * 源描述
  * BYE
  * 特定于应用的分组
