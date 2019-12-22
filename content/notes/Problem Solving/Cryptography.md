---
title: Cryptography
date: 2019-07-21
tags: [math, notes]
---

# 概论

* 密码系统：$(\mathcal{K}, \mathcal{M}, \mathcal{C})$
  * $\mathcal{K}$ 所有可能秘钥组成的集合
  * $\mathcal{M}$ 所有可能明文组成的集合
  * $\mathcal{C}$ 所有可能密文组成的集合
* 密码：$(E,D)$
  * $E$: 加密算法 $\mathcal{M}\times\mathcal{K}\rightarrow\mathcal{C}$
  * $D$: 解密算法 $\mathcal{D}\times\mathcal{K}\rightarrow\mathcal{M}$
* 一致性原则：$\forall m\in M,k\in K,D(k,E(k,m))=m$
  * 通常 $E$ 是一个随机化算法
  * $D$ 一定是一个确定化算法

## OTP (One Time Pad)

* $K=\{0,1\}^n$
* $M=\{0,1\}^n$
* $C=\{0,1\}^n=\mathcal{M}$
* $E(m,k)=k\oplus m$
* $D(c,k)=k\oplus c$

## PRG 伪随机数生成器

* 高效，确定，不可预测

# 流密码

A stream cipher is a symmetric key cipher where plaintext digits are combined with a pseudorandom cipher digit stream (keystream). In a stream cipher, each plaintext digit is encrypted one at a time with the corresponding digit of the keystream, to give a digit of the ciphertext stream.

## RC4

* 初始化
  * 秘钥参与S盒的生成
* 伪随机子密码生成算法
  * 按字节操作，每次通过一定算法定位S盒中一个元素，与输入异或得到密文

## ChaCha

# 分组密码

a block cipher is a deterministic algorithm operating on fixed-length groups of bits, called a block, with an unvarying transformation that is specified by a symmetric key

## DES

## RC5

## AES/Rijndael

Rijndael是一个分组密码算法族，其分组长度包括128比特、160比特、192比特、224比特、256比特，密钥长度也包括这五种长度，但是最终AES只选取了分组长度为128比特，密钥长度为128比特、192比特和256比特的三个版本

# 密码散列函数

单向函数，极其难以由散列函数输出的结果回推输入的数据是什么

## MD-5

输出128位

## SHA-1

1995,160位，已被攻破

## SHA-2

2001, SHA-224、SHA-256、SHA-384、SHA-512、SHA-512/224、SHA-512/256

## SHA-3

2015

# 非对称加密

## RSA

## ECC

圆锥曲线