---
title: REVIEW
date: 2019-12-25
tags: [notes, network]
weight: 9
---

## 访问 Web 页面的过程

电缆 -> 以太网交换机 -> 路由器(提供 DHCP, NAT) -> ISP(提供 DNS)

1. 获取IP: [DHCP|UDP|IP(255.255.255.255)|以太网(FF:FF:FF:FF:FF:FF)] -> 交换机 -> 路由器 分配 CIDR块 68.85.2.0/24（同时获得默认网关 IP 地址）
2. HTTP -> DNS -> ARP: IP=网关地址
3. HTTP -> DNS: 网关 -> ISP DNS 查询
4. HTTP: [HTTP|TCP|IP(DNS结果)|以太网(网关MAC地址)]

## 知识提纲

* 接入网络
  * 网络边缘
  * 接入方法
  * ISP 组织方式
* 运输层：提供逻辑链路
  * 多路复用与多路分解
  * 完整性检验
  * 可靠数据传输
  * 拥塞控制
* 网络层
  * 尽力而为服务
  * 分片与重组
  * 路由服务
* 链路层
  * 成帧
  * 链路接入
  * 差错检验与纠正

## 算法

* TCP 拥塞传输算法
* DV 路由选择
* LS 路由选择
* CSMA/CD 随机接入
* CSMA/CA 随机接入