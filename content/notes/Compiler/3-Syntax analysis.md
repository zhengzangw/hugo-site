---
title: 语法分析
date: 2020-02-27
---

## 上下文无关文法

- 语法描述
  - 上下文无关文法 CFG
  - BNF
- 上下文无关文法
  - 终结符号
  - 非终结符号
  - 开始符号
  - 产生式
- 推导：$A\rightarrow\gamma$，则 $\alpha A\beta\Rightarrow \alpha\gamma\beta$
  - 最左推导：$\alpha$ 中不包含终结符 $\overset{*}{\Rightarrow}_{\text{lm}}$
  - 零步或多步推导：$\overset{*}{\Rightarrow}$
  - 一步或多步推导：$\overset{+}{\Rightarrow}$
  - 句型 $\alpha$：$S\overset{*}{\Rightarrow} \alpha$
  - 句子：不包含非终结符号的句型
  - 语言：$L(G)=\{\omega|S\overset{*}{\Rightarrow}\omega\}$
- 上下文无关语言强于正则表达式
- 二义性：如果一个文法可以为某个句子生成多棵语法分析数，则该文法二义
- 设计文法
  - 消除二义性：无较好方法；优先级，结合性消除
  - 消除左递归：$A\overset{+}{\Rightarrow} A\alpha$
    - 立即左递归：$A\rightarrow A\alpha$
  - 提取左公因子
- 消除左递归

  - 立即左递归的消除

    如果有 $A\rightarrow A\alpha_1|\cdots|A\alpha_m|\beta_1|\cdots|\beta_n$

    变换为 $A\rightarrow \beta_1 A'|\cdots|\beta_n A'$ 和 $A'\rightarrow \alpha_1 A'|\cdots|\alpha_m A'|\epsilon$

  - 左递归消除算法

    输入：无环和$\epsilon$产生式的文法 $G$
    输出：等价的无左递归的文法
    算法：非终结符号排序 $A_1,\cdots,A_n$

    ```cpp
    for i = 1 to n do{
      for j = i - 1 do {
        将 Ai -> Aj t 替换为 Ai -> s1 t | s2 t | ... | sk t, 其中 Aj -> s1 | s2 | ... | sk
      }
      消除 Ai 立即左递归
    }
    ```

    问题：很难找到新文法和旧文法之间的对应关系，很难进行语义分析

- 预测分析法：当两个产生式具有相同前缀时无法预测
  - 提取左公因子

## 语法分析技术

### 自顶向下语法分析器

处理 LL 文法

- 关键问题：确定对最左边的非终结符号应用哪个产生式
- 不能处理左递归
- 递归下降语法分析
  - 每个非终结符对应一个过程，描述终结符的结构。程序执行从开始符号对应的过程开始
  - 发现错误时，进行回溯
- 预测分析法

  - $\text{FIRST}(\alpha)$: 可以从 $\alpha$ 推到的首符号的集合
  - $\text{FOLLOW}(A)$: 可能在某些句型中紧跟在 $A$ 右边的终结符号的集合

    - 将结束标记 \$ 放入 FOLLOW 中，按以下规则迭代直到不增长

      $A\rightarrow \alpha B\beta$: FIRST($\beta$) 中所有非 $\epsilon$ 符号加入 FOLLOW(B)

      如果 $A\rightarrow \alpha B$ 或 $A\rightarrow \alpha B\beta$ 且 FIRST($\beta$) 包含 $\epsilon$，则 FOLLOW(A) 中所有符号加入 FOLLOW(B)

- LL(1) 文法：从左到右，最左推导，向后看一个符号

  - 定义：对文法的任意两个产生式 $A\rightarrow\alpha|\beta$ （保证唯一无二义）

    不存在终结符号 $a$ 使得 $\alpha$ 和 $\beta$ 都可以推导出以 $a$ 开头的串

    $\alpha$ 和 $\beta$ 最多只有一个可推导出空串

    如果 $\beta$ 可推导出空串，则 $\alpha$ 不能推导出以 FOLLOW(A) 中任意终结符号开头的串

  - 等价定义：$\text{FIRST}(\alpha)\cap\text{FIRST}(\beta)=\emptyset$, $\epsilon\in\text{FIRST}(\beta)\Leftrightarrow\text{FIRST}(\alpha)\cap\text{FOLLOW}(A)=\emptyset$

- 预测分析表

  输入：文法 $G$
  输出：预测分析表 $M$
  算法：

  对于每个产生式 $A\rightarrow \alpha$，将 $A\rightarrow \alpha,a\in \text{FIRST}(\alpha)$ 为终结符号加入 $M[A,a]$ 中；若 $\epsilon\in\text{FIRST}(\alpha)$ 则对 $\text{FOLLOW}(b)$ 中每个符号，将 $A\rightarrow \alpha$ 加入 $M[A,b]$ 中

  最后所有空白条目填入 error

- 预测分析算法

  - 输入：串 $\omega$，预测分析表 $M$
  - 输出：正确输出最左推导，否则报错
  - 初始化：输入缓冲区为 $\omega\$$，栈中为 $S\$$，ip 指向 $\omega$ 的第一个符号

    - 不断执行（栈顶符号 $X$，ip 指向当前输入符号 $a$）

    if $X$ == $a$: $X$ 出栈，ip 向前移动

    else if $X$ 终结符号: error()

    else if M[$X$,$a$] 是报错条目: error()

    else if M[$X$, $a$] = $X\rightarrow Y_1Y_2\cdots Y_k$: 输出产生式，弹出 $X$，$Y_i$ 入栈

### 自底向上语法分析器

处理 LR 文法

- 移入（shift）：将下一个输入符号移入栈顶
- 归约（reduce）：将句柄归约为相应的非终结符
  - 何时归约
  - 归约到哪个非终结符
- 句柄：如果 $S\overset{*}{\Rightarrow}_{rm}\alpha A\omega\Rightarrow_{rm}\alpha\beta\omega$，则紧跟在 $\alpha$ 之后的 $\beta$ 是 $A\rightarrow\beta$ 的一个句柄
- 移入归约冲突
- 归约归约冲突
- LR(k) 语法分析：最左扫描，反向构造最右推导，$k\leq 1$，表格驱动
- LR(0) 项：文法的一个产生式加上在其中某处的一个点
  - 增广文法：增加新开始符号 $S'$，产生式 $S'\rightarrow S$
  - 项集闭包 CLOSURE：如果 $I$ 是文法 $G$ 的一个项集
    - $I$ 中各项加入 CLOSURE(I)
    - $A\rightarrow\alpha\cdot B\beta$ 在 CLOSURE(I) 中且 $B\rightarrow\gamma$ 是一个产生式，$B\rightarrow\cdot\gamma$ 不在 CLOSURE(I) 中，则迭代加入
  - GOTO 函数：I 是项集，X 是文法符号，GOTO(I,X) 为 I 中所有形如 $[A\rightarrow\alpha\cdot X\beta]$ 的项所对应的 $[A\rightarrow\alpha X\cdot\beta]$ 项的闭包
- 计算 LR(0) 项集规范组的算法：从初始项集闭包开始，不算计算各种可能的后继，直到生成所有的项集
- LR(0) 自动机
- LR(0) 语法分析器
  - ACTION: 状态，终结符号
  - GOTO: GOTO[$I_i$,A]=$I_j$, 则 GOTO[$i$,A]=$j$
  - 格局: $(s_0s_1\cdots s_m,a_ia_{i+1}\cdots a_n\$)$，查询 ACTION[$s_m$,$a_i$]
- LR(0) 分析表
  - SLR(1) 语法分析表
    - $[A\rightarrow\alpha\cdot a\beta]$ 在 $I_i$，且 GOTO$(I_i,a)=I_j$，则 ACTION$[i,a]$=$s_j$（移入 j）
    - $[A\rightarrow\alpha\cdot]$ 在 $I_i$ 中，那么对 FOLLOW($A$) 中所有 $a$，ACTION$[i,a]$=按 $A\rightarrow\alpha$ 规约
    - 如果 $[S'\rightarrow S\cdot]$ 在 $I_i$ 中，则 ACTION[$i,\$$] 设为接受
    - GOTO($I_i,A$)=$I_j$, GOTO[i,A]=j
    - 如果 SLR 分析表没有冲突，则该文法为 SLR
  - LR 方法：将期望向前看符号加入项中（LR(1)项集，状态太多）
  - LALR 方法
- LR(1) 项：$[A\rightarrow\alpha\cdot\beta,a]$，$a$为向前看符号
  - 增广文法：$[S'\rightarrow S,\$]$
  - 闭包：存在 $[A\rightarrow\alpha\cdot B\beta,a]$，则 $[B\rightarrow\cdot \theta,b],b=$FIRST($\beta a$)
  - GOTO: $[A\rightarrow\alpha\cdot X\beta,a]$，则$[A\rightarrow\alpha X\cdot\beta,a]$
- LR(1) GOTO 图
- LR(1) 语法分析表
  - $[A\rightarrow\alpha\cdot a\beta,b]$ 在项集中，且 GOTOI($I_i$,a)=$I_j$，那么 ACTION[$i,a$]=移入 $j$
  - $[A\rightarrow\alpha\cdot,a]$ 在项集中，ACTION[i,a]=按 $A\rightarrow\alpha$ 规约
  - $[S'\rightarrow S,\$]$ 在项集中，ACTION[i,\$]=接受
- LALR(1) 语法分析
  - 原 LR(1) 中无冲突，则合并后只有归约归约冲突
  - LALR(1) 分析表构造算法：对于 LR 每个核心，合并具有该核心的项集
  - 处理正确输入时，LR 与 LALR 处理一样
  - 处理错误输入时，LALR 会多处理一些归约

## 语法错误处理

- LL 语法错误的处理：恐慌模式，短语层次恢复
  - 恐慌模式：忽略输入中的一些符号直到出现由设计者选定的某个同步词法单元
    - 非终结符：FOLLOW(A) 中所有符号放入 A 的同步集合；高层次非终结符号加入较底层；FIRST(A) 加入 A 的同步集合；A 可以推导空串，将该产生式当做默认值
    - 终结符：栈顶终结符号匹配错误，可以直接弹出该符号，并且发出消息称已经插入
  - 短语层次恢复：空白条目中插入错误处理例程
- LR 语法错误处理
  - 恐慌模式：假定当前试图规约到 A 但碰到了语法错误，因此设法扫描完包含语法错误的 A 的子串，假装找到了 A 的一个实例
  - 短语层次的恢复

## 语法分析器生成工具

- YACC/Bison
- YACC 中的冲突处理
  - 缺省处理方法
    - 规约/移入冲突：总是移入
    - 规约/规约冲突：选择列在前面的产生式
  - 确定终结符号优先级
- YACC 的错误恢复：error
