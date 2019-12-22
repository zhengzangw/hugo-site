---
title: Security
date: 2019-01-28
tags: [notes, network]
weight: 6
---

## Requirement

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

## SSL and TLS

provide a reliable end-to-end secure service

### SSL (Secure Socket Layer)

* IP->TCP->SSL Record Protocol->SSL Handshake Protocol/SSL Change Cipher Spec Protocol/SSL Alert Protocal/HTTP
* SSL Connection: peer-to-peer relationshiops that are transient
* SSL Session
  * an association between a client and a server
  * created by the Handshake Protocal
  * define a set of cryptographic security parameters, which can be shared among mutiple connections
* Change Cipher Spec Protocol
  * cause the pending state to be copied into the current state, which updates the cipher suite to be used on this connection.

#### SSL Record Protocol

* Confidentiality: Handshake Protocol defines a shared secret key used for symmetric encryption of SSL payloads
* Message integrity: Handshake Protocol defines a shared secret key used to form a message authentication code (MAC)
* Process: fragmentation -> compression -> add MAC -> Encrypt -> Append SSL Record Header

| Content Type          | Major Version                      | Minor Version | Compressed Length  |
| --------------------- | ---------------------------------- | ------------- | ------------------ |
| 8 bits                | 8                                  | 8             | 16                 |
| higher-layer protocol | major version of SSL (3 for SSLv3) | (0 for SSLv3) | max is $2^14+2048$ |

#### Handshake Protocol

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

### TLS (Transport Layer Security, SSL3.1, RFC 2246)

* TLS Record -> TLS Handshake

### 证书

* 数字证书认证机构 Certificate Authority(CA)
  * 主流机构：Symantec,GeoTrust,TrustAsia,Comodo,DigiCert,GlobalSign,Let's Encrypt
* SSL 证书验证级别
  * DVSSL 域名型证书
  * OVSSL 企业型证书
  * EVSSL 增强型证书
