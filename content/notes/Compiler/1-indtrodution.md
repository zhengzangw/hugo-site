---
title: Introduction
date: 2020-02-18
---

## 编译器

- 分析部分（前端）+ 综合部分（后端）
- 字符流 -> (词法分析器) -> 符号流 -> (语法分析) -> 语法树 -> (语义分析) -> 语法树 -> (中间代码生成器) -> 中间表示形式 -> (机器无关代码优化器) -> 中间表示形式 -> (代码生成器) -> 目标机器语言 -> (机器相关代码优化器) -> 目标机器语言
  - 词法分析/扫描 (Lexical analysis/scanning)：读入字符流，输出词素（Lexeme）`<token-name, attribute-value>`
  - 语法分析/解析 (Syntax analysis/parsing)：根据此番单元的第一个分量建立树型中间表示（Syntax tree）：检查源程序是否满足语言定义的语义约束；同时收集类型信息
  - 中间代码生成：生成类机器语言的中间表示；三地址代码（每个指令最多包括三个变量）
  - 中间代码优化：通过中间代码分析，优化
  - 代码生成：将中间表示形式映射到目标语言
- 符号表管理：记录源程序中使用的变量的名字，手机各种属性
- 趟（Pass）：每趟读入一个输入文件，产生一个输出文件
- 编译器构造工具：扫描器（Lex/Flex），语法分析器（Yacc/Bison），语法制导的翻译引擎

## 程序设计语言发展历程

- 历程
  - 第一代：机器语言
  - 第二代：汇编语言（宏命令）
  - 第三代：Fortran, Cobol, Lisp, C, C++
  - 第四代：特定应用语言：NOMAD, SQL, Postscript
  - 第五代：基于逻辑和约束的语义 Prolog OPS5
- 强制式语言：指明如何完成
- 声明式语言：指明要完成哪些计算
- 静态：支持编译器静态决定问题
- 动态：只允许程序运行时做出决定
- 环境：从名字到存储位置的映射
- 状态：从存储位置到它们值的映射