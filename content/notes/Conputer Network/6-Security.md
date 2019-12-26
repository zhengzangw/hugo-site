---
title: Security
date: 2019-01-28
tags: [notes, network]
weight: 6
---

## 安全通信要求

* CIA triad
  * Confidentiality
    * Data confidentiality
    * Privacy
  * Integrity
    * Data Integrity
    * System integrity
  * Availability
* Authenticity
* Accountability
* operational security

## Threats

| Threat consequence      | Thread Action                             |
| ----------------------- | ----------------------------------------- |
| Unauthorized Disclosure | Exposure,Interception,inference,Intrusion |
| Deception               | Masquerade,Falsification,repudiation      |
| Disrupction             | Incapacitation,Corruption,Obstruction     |
| Usurpation              | Misappropriation,Misuse                   |

|                     | Availability       | Confidentiality               | Integrity                            |
| ------------------- | ------------------ | ----------------------------- | ------------------------------------ |
| Hardware            | denying service    |                               |                                      |
| Software            | Programs deleted   | unauthorized copy of software | working program modified             |
| Data                | Files deleted      | unauthorized read             | files modified, new files fabricated |
| Communication Lines | Messages destroyed | Messages read                 | Messages modified                    |

### Intruders

* Masquerader: An individual who is not authorized to use the computer and who penetrates a system's access controls to exploit legitimate user's account
* Misfeasor: A legitimate user access authorized data or programs
* Clandestine user: An individual seizes supervisory control of the system

### Malicious software(malware)

| Name             | Description                                                                                                                                                                                       |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Virus            | Malware that, when executed, tries to replicate itself into other executable code; when it succeeds the code is said to be infected. When the infected code is executed, the virus also executes. |
| Worm             | A computer program that can run independently and can propagate a complete working version of itself onto other hosts on a network.                                                               |
| Logic bomb       | A program inserted into software by an intruder. A logic bomb lies dormant until a predefined condition is met; the program then triggers an unauthorized act.                                    |
| Trojan horse     | A computer program that appears to have a useful function, but also has a hidden and potentially malicious function that evades security mechanisms                                               |
| Backdoor         | ANy mechanisms that bypasses a normal security check                                                                                                                                              |
| Mobile code      | Software that can be shipped unchanged to a heteorgeneous collection of planforms                                                                                                                 |
| Spammer programs | Used to send large volumes of unwanted e-mail                                                                                                                                                     |
| Flooders         | Used to attack networked computer systems with a large volume of traffic to carry out a DoS attact                                                                                                |
| Keyloggers       |                                                                                                                                                                                                   |
| RootKit          |                                                                                                                                                                                                   |
| Zombie, bot      | Program activated on an infected machine that is activated to launch attacks on other machines.                                                                                                   |
| Spyware          |                                                                                                                                                                                                   |
| Adware           |                                                                                                                                                                                                   |

## 密码学

* 对称秘钥密码体制
  * 块密码：DES, 3DES, AES
  * 密码块连接（CBC）：仅第一个报文发送一个随机值，然后双方使用计算的编码块代替后续随机数
  * 攻击方法
    * 唯密文攻击
    * 已知明文攻击
    * 选择明文攻击
* 公开秘钥加密
  * RSA
  * 会话秘钥
    * Diffe-Hellman 算法
      * large prime $p$, integer $g$ is a generator of $Z^*_p$
      * Alice: $a\in Z_{p-1},A=g^a\bmod p$
      * Bob: $b\in Z_{p-1},B=g^b\bmod p$
      * share $A,B$, $K=A^b=B^a=g^{ab}\bmod p$
      * 离散对数问题
* 密码散列函数：找到任意两个 $x,y,H(x)=H(y)$ 在计算上不可能
  * MD5
  * SHA-1 (160 bits)
* 报文鉴别码(MAC) $H(m+s)$
  * 鉴别秘钥 $s$
  * Alice 发送报文 $(m,H(m+s))$
  * Bob 验证 $m=H(m+s)$
* 数字签名：$K_B^-(m)$
* 公钥认证
  * 认证中心(CA)：验证真实身份，颁发证书
    * 主流机构：Symantec,GeoTrust,TrustAsia,Comodo,DigiCert,GlobalSign,Let's Encrypt
  * 证书：$K_{CA}^-((K_B^+,B))$
    * SSL 证书验证级别
      * DVSSL 域名型证书
      * OVSSL 企业型证书
      * EVSSL 增强型证书

## 应用层

* 安全电子邮件 PGP(Pretty Good Privacy) 协议
* SSH

## 运输层

SSL and TLS: provide a reliable end-to-end secure service

### SSL Record Protocol

* Confidentiality: Handshake Protocol defines a shared secret key used for symmetric encryption of SSL payloads
* Message integrity: Handshake Protocol defines a shared secret key used to form a message authentication code (MAC)
* Process: fragmentation -> compression -> add MAC -> Encrypt -> Append SSL Record Header

| Content Type          | Major Version                      | Minor Version | Compressed Length  |
| --------------------- | ---------------------------------- | ------------- | ------------------ |
| 8 bits                | 8                                  | 8             | 16                 |
| higher-layer protocol | major version of SSL (3 for SSLv3) | (0 for SSLv3) | max is $2^14+2048$ |

### Handshake Protocol

* Phase 1: ClientHello
  * Version
  * 1st Random: 32-bit timestap + 28 bytes generated random number
  * Session ID
  * CipherSuite: a list that contains the combinations of crytographic algorithms supported by the client, in decreasing order of preference
  * Compression method: a list of the compression methods that client supports
* Phase 2: SeverHello
  * send certificate from CA
  * send 2nd Random
  * wait for a client response
* Phase 3: Certificate Verify
  * verify server's certificate
  * 第三个随机数，该随机数用服务器公钥加密，防止被窃听
  * 编码改变通知，表示随后的信息都将用双方商定的加密方法和密钥发送
  * 客户端握手结束通知，表示客户端的握手阶段已经结束。这一项同时也是前面发送的所有内容的hash值，用来供服务器校验
  * ChangeCipherSpec
* Phase 4: Server Finish

## 网络层

IPSec 协议族

* AH 协议（Authentication Header, 鉴别首部）
  * 源鉴别服务
  * 数据完整性服务
* ESP 协议 (Encapsulation Security Payload, 封装安全性载荷)
  * 源鉴别
  * 数据完整性
  * 机密性
* 安全关联（SA）：一个单工逻辑连接
  * 安全参数索引(SPI)：32 bits
  * SA 初始接口和 SA 目的接口
  * 加密类型，加密秘钥，完整性检查类型，鉴别秘钥
* IPSec 数据报  
  * 隧道模式
    * 初始IPv4后附上 ESP 尾部 (填充 + 填充长度 + 下一首部)
    * 加密上述结果，在之前附上 ESP 首部 (SPI + 序号)
    * 以上算法生成鉴别 MAC
    * 以上结果为载荷，增加新 IP 首部（隧道端点的 IP 地址，协议号 50）
  * 运输模式
* IKE 协议（Internet Key Exchange, RFC 5996）：交换秘钥
* VPN(虚拟专用网络)：通过相对而言不太安全的网络互相连接在一起

## 链路层

* WEP (Wired Equivalent Privacy, 有线等价保密)
* IEEE 802.11i

## 防火墙

* 目标
  * 内外进出流量都通过防火墙
  * 仅被授权的流量允许tongg
  * 防火墙免于渗透
* 分类
  * 传统分组过滤器
  * 状态过滤器
  * 应用程序网关

## 入侵检测系统

* IDS: Intrusion Detection System
* IPS: Intrusion Prevention System
* E.g.
  * Snort: 检测 nmap 的 ping 扫描
  * GFW