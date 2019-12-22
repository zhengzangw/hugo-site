---
title: Object Oriented Programming
date: 2019-03-29
tags: [java]
---

# 五大原则: S.O.L.I.D

## SRP: 单一职责原则

> A class should have one and only one reason to change, meaning that a class should have only one job.

## OCP: 开放封闭原则

> the open/closed principle states that software entities (classes, modules, functions, etc.) should be open for extensions, but closed for modification.

## LSP: LISKZOV 替换法则

> if S is a subtype of T, then objects of type T may be replaced (or substituted) with objects of type S.

## ISP: 接口隔离

> no client should be forced to depend on methods it does not use

* Do not add additional functionality to an existing interface by adding new methods
* create a new interface and let your class implement multiple interfaces if needed

## DIP: 依赖倒置原则

> High-level modules should not depend on low-level modules. Both should depend on abstractions
> Abstractions should not depend on details. Details should depend on abstractions.

<!--more-->

# Examples

* [C#](https://itnext.io/solid-principles-explanation-and-examples-715b975dcad4)