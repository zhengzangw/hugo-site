---
title: Pointer-Analysis
date: 2020-04-26
weight: 4
---

## Pointer-Analysis

- Program -> Points-to relations
- Pointer Analysis: which objects a pointer can point to
- Alias analysis: can two pointers point to the same object
- Pointer-Analysis Application
  - Fundamental information
  - Compiler optimization
  - Bug detection
  - Security analysis

| Factor              | Problem                                   | Choice                        |
| ------------------- | ----------------------------------------- | ----------------------------- |
| Heap abstraction    | How to model heap memory                  | Allocation-site/storeless     |
| Context sensitivity | How to model calling contexts             | Context-sensitive/insensitive |
| Flow sensitivity    | How to model control flow                 | Flow-sensitive/insensitive    |
| Analysis scope      | which parts of program should be analyzed | whole-program/demand-driven   |

- allocation-site abstraction: one abstract object per allocation site

## Concerned Statements

- pointer-affecting statements
  - New: x = new T()
  - Assign: x = y
  - Store: x.f = y
  - Load: y = x.f
  - Call: r = x.k(a, ...)
    - Static Call
    - Special Call
    - Virtual Call
- Pointers in Java
  - Local variable: x
  - static field: f
  - Instance field: x.f
  - Array element: array[i]
    - ignore indexes

## Rules

- Notations
  - Variables: $x,y\in V$
  - Fields: $f,g\in F$
  - Objects: $o_i,o_j\in O$
  - Instance fields: $o_i.f,o_j.f\in O\times F$
  - Pointers: Pointer = $V\cup (O\times F)$
  - Points-to relations: $pt$ = Pointer $\rightarrow \mathcal{P}(O)$（幂集）
- Rules
  - x = new T(): $\frac{}{o_i \in pt(x)}$
  - x = y: $\frac{o_i\in pt(y)}{o_i\in pt(x)}$
  - x.f = y: $\frac{o_i\in pt(x), o_j\in pt(y)}{o_j\in pt(o_i.f)}$
  - y = x.f: $\frac{o_i\in pt(x), o_j\in pt(o_i.f)}{o_j\in pt(y)}$

## Algorithms
