---
title: review
date: 2019-12-25
tags: [notes, network]
weight: 8
---

## 访问 Web 页面的过程

电缆 -> 以太网交换机 -> 路由器(提供 DHCP, NAT) -> ISP(提供 DNS)

1. 获取IP: [DHCP|UDP|IP(255.255.255.255)|以太网(FF:FF:FF:FF:FF:FF)] -> 交换机 -> 路由器 分配 CIDR块 68.85.2.0/24（同时获得默认网关 IP 地址）
2. HTTP -> DNS -> ARP: IP=网关地址
3. HTTP -> DNS: 网关 -> ISP DNS 查询
4. HTTP: [HTTP|TCP|IP(DNS结果)|以太网(网关MAC地址)]