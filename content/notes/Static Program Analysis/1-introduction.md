---
title: Introduction
date: 2020-04-26
weight: 1
---

## Introduction

- Programming Language
  - Theory: Language Design, Type system, Semantics and logics
  - Environment: Compilers, Runtime system
  - Application: Program analysis, Program verification, Program synthesis
- Static Analysis: analyzes program $P$ to reason about its behaviors and determines whether it stisfies some properties before running $P$
- Rice's Theorem: Any non-trivial property of behavior of programs in a r.e. langugage is **undecidabel**
  - r.e. = recursively enumerable = recognizable by a Turing-machine
  - non-trivial properties $\approx$ interesting properties $\approx$ the properties related with run-time behaviors of programs
  - No Perfect static analysis: Round and Complete
- Useful static analysis
  - Compromise soundness 漏报
  - Compromise completeness 勿报：Mostly sound but not fully-precise
- sound + precise/imprecise + expensive/cheap
- Abstraction + Over-approximation

## Intermediate Representation

- soot: java 3AC IR
- invoke
  - invokespecial: super, constructor
  - invodevirtual: instance methods call (virtual dispatch)
  - invokeinterface: cannot optimization, checking interface implementation
  - invokestatic: call static methods
  - invokedynamic (Java 7): for dynamic language
- method signature
  - class name
  - return type
  - type method name (parameter types)
- BB finding algorithm
  - Determine leaders
    - the first instruction
    - target instruction of a conditional or unconditional jump
    - instruction immediately follows a conditional or unconditional jump
  - BB consists of a leader and all its subsequent instructions until the next leader
- Control Flow Graph (CFG)
  - Basic Blocks(BB): maximal sequences of consecutive three-address instructions with the properties that
    - enter only at the first instruction in the block
    - exit only at the last instruction in the block
  - edge from block A to block B iff
    - there is jump from the end of A to the start of B
    - B immediately follows A in the original order of instructions (except the last instruction is unconditional jump)
    - it is normal to replace the jumps to instruction labels by jumps to basic blocks
  - Entry
  - Exit
