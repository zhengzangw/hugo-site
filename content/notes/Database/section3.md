---
title: 数据库的安全性与完整性
date: 2019-05-26
tags: [database]
weight: 3
---

## 安全性保护 (security)

* 防止非法使用数据库
  * 要求用户通过规定的访问途径
  * 要求按照规定的访问规则

| Term                     |                                                  |
| ------------------------ | ------------------------------------------------ |
| 安全数据库（可信数据库） | 适应网络环境下安全要求级别的数据库               |
| 可信计算基（TCB）        | 为实现数据库安全所采用的所有实施策略与机制的集合 |
| 主体                     | 数据的访问者                                     |
| 客体                     | 数据库中的数据                                   |
| 身份标识与鉴别           | 每个主体标识自己的标识符合访问口令               |
| 自主访问控制（DAC）      | 基于存取矩阵(HRU)的安全控制模型                  |
| 存取权限                 |                                                  |
| 强制访问控制（MAC）      | 通过无法回避的存取限制来防止各种攻击             |
| 数据完整性               | 防止非法插入，删除，修改等影响数据完整性的操作   |
| 隐蔽通道                 | 非正规的，不受 TCB 控制的访问通道                |
| 审计                     | 跟踪用户对数据的访问操作                         |
| 访问监控器               | 独立的机构，TCB 在网络中的实现                   |

* 安全标准
  * 1985 TCSEC
  * 国际标准(ISO 15408) CC V2.1
  * 国标：GB 17859-1999 计算机系统安全保护等级划分
    * 第一级：用户自主保护级 (C1)
      * 自主访问控制 + 身份鉴别 + 数据完整性
    * 第二级：系统审计保护级 (C2)
      * \+ 客体重用 + 审计
    * 第三级：安全标记保护级 (B1)
      * \+ 强制访问控制 + 标记
    * 第四级：结构化保护级 (B2)
      * \+ 隐蔽信道分析 + 可信路径
    * 第五级：访问验证保护级 (B3)
      * \+ 可信恢复
* SQL'92 C1
  * 自主访问控制：（用户，操作对象，操作权限）
    * 操作权限：SELECT, INSERT, DELETE, UPDATE, REFERENCE, EXECUTE, USAGE
    * 操作对象：表，属性，域，函数
    * 授权语句 `GRANT <操作权限列表> ON <操作对象> TO <用户名列表> [OPTION]`
    * 回收语句 `REVOKE <操作权限列表> ON <操作对象> FROM <用户名列表> [RESTRICT|CASCADE]`

## 完整性保护 (integrity)

* 数据的正确性和一致性
  * 正确性：数据的有效性，有意义
  * 一致性：在多用户并发访问数据库的情况下，保证对数据的更新不会出现与实际不一致的情况
* 完整性规则
  * 实体完整性规则：在一个基表的主关键字中，属性取值不能为空
  * 参照完整性
    * 引用：$R$ 中有属性集与另一个关系的主关键字对应，则 $R$ 引用 $S$ 中的元组
    * $R$ 中每个元组在外关键字上不能引用不存在的实体
  * 用户自定义的完整性
* 完整性约束规则
  * 设置 `CONSTRAINT <约束名> <完整性约束子句>`
  * 检查
  * 处理
* 属性级约束（域约束）

```SQL
{ NOT NULL | DEFAULT {default_constant|NULL} |
    [ CONSTRAINT constraint_name ]
    UNIQUE
    | PRIMARY KEY
    | CHECK ( search_condition )
    | REFERENCES table_name [(column_name)]
        [ ON DELETE CASCADE | RESTRICT | SET NULL ]
        [ ON UPDATE CASCADE | RESTRICT | SET NULL ] }
```

* 元组级约束（表约束）

```SQL
[ CONSTRAINT constraint_name ]
   { UNIQUE ( colname { , colname ... } )
     | PRIMARY KEY ( colname { , colname ... } )
     | CHECK ( search_condition )
     | FOREIGN KEY ( colname { , colname ... } )
       REFERENCES table_name [ ( colname { ,colname... } ) ]
          [ ON DELETE CASCADE | RESTRICT | SET NULL ]
          [ ON UPDATE CASCADE | RESTRICT | SET NULL ] }
```

* 全局约束（assertion）

```SQL
CREATE ASSERTION  <name>  CHECK( <condition> )
DROP  ASSERTION  <assertion-name-list>
```

* 触发器
  * 触发事件（自定义）
  * 结果事件（自定义）
  * 触发过程

```SQL
CREATE TRIGGER trigger_name { BEFORE | AFTER }
    { INSERT | DELETE | UPDATE [ OF colname {, colname ... }]} ON table_name 
    [ REFERENCING corr_name_def { , ...... } ]
    [ FOR EACH ROW | FOR EACH STATEMENT ]
    [ WHEN ( search_condition ) ]
    { statement | BEGIN ATOMIC statement; { statement; ... } END }

corr_name_def: {
    OLD [ ROW ] [ AS ] old_row_corr_name
  | NEW [ ROW ] [ AS ] new_row_corr_name

  | OLD TABLE [ AS ] old_table_corr_name
  | NEW TABLE [ AS ] new_table_corr_name
}

DROP TRIGGER trigger_name
```

* 新元组：`new`
* 旧元组：`old`

# 关系数据库的规范化理论

解决如何评价关系模式设计的好坏和如何设计性能良好的关系模式的问题

* 关系设计模式：同一个关系数据库系统可以有多种关系模式设计方案
  * 好方案：既有合理的数据冗余度，又没有插入和删除等操作异常现象
* 关系数据模型设计方法：建模(E-R model)，转换(set of tables)，规范化
* 数据依赖理论
  * 函数依赖
  * 多值依赖

## 函数依赖（FD,Functional Dependency）

给定关系 $R$，$X,Y$ 是 $R$ 两个属性子集，在关系 $R$ 中，每一个 $X$ 值都有唯一的一个 $Y$ 值与之对应

* $Y$ 函数依赖 $X$
  * $X$ 函数决定 $Y$($X\rightarrow Y$)
  * 关系 $R$ 满足函数依赖 $X\rightarrow Y$
  * 决定因素：$X$
  * 依赖因素：$Y$
* 只能证否，不能证明
* 平凡函数依赖 $X\overset{f}{\rightarrow} Y$：$X=Y$
* 完全函数依赖 $X\overset{p}{\rightarrow} Y$：$X\rightarrow Y,\forall X'\subsetneq X,X'\not\rightarrow Y$
  * 部分函数依赖
* 传递函数依赖：$X\rightarrow Y,Y\not\rightarrow X,Y\rightarrow Z$, 则 $Z$ 传递函数依赖于 $X$
* Armstrong 公理系统：寻找所有函数依赖
  * 基本规则
    * Reflexivity: $Y\subset X\Rightarrow X\rightarrow Y$
    * Augmentation: $X\rightarrow Y\Rightarrow X\cup Z\rightarrow Y\cup Z$
    * Transtivity: $X\rightarrow Y,Y\rightarrow Z\Rightarrow X\rightarrow Z$
  * 扩充规则
    * Union: $X\rightarrow Y\cup Z\Rightarrow X\rightarrow Y,X\rightarrow Z$
    * Decomposition: $X\rightarrow Y,X\rightarrow Z\Rightarrow X\rightarrow Y\cup Z$
    * Pseudo transitivity: $X\rightarrow Y,W\cup Y\rightarrow Z\Rightarrow W\cup X\rightarrow Z$
  * 逻辑蕴含：$F\vDash X\rightarrow Y,F$ 为一个函数依赖集
  * 函数依赖集的闭包：$F^+=\{X\rightarrow Y|F\vDash X\rightarrow Y\}$
* 关键字（码,key）：$R(U,F),K\subset U,K$ 完全函数决定 $U$
  * 主属性集：$R$ 的所有关键字中的属性构成的集合
    * 非主属性集
* 属性集 $X$ 的闭包：$X_F^+=\{A|F\vDash X\rightarrow A\}$
  * 计算闭包
    * while $X$ changes
      * for each $Y\rightarrow Z\in F$
        * if $Y\subset X,X=X\cup Z$
  * 关键字 $K$
    * $K_F^+=U$
    * $\forall Z\subsetneq K,Z_F^+\neq U$
* **计算关键字**
  * 法一：$F\vDash K\overset{f}{\rightarrow} U$
  * 法二
    * $K=U$
    * for $A\in K$
      * if $(K-A)_F^+$ contains all attribute then $K=K-A$
    * 优化：最小函数依赖集只在左边出现过的属性是主属性，只在右边出现过的属性为非主属性
* 函数依赖集的等价：$F_1^+=F_2^+$
* 最小函数依赖集（最小覆盖）
  * 判定方法：对于每个关系 $X\rightarrow A$ 需满足以下三条
    * $A$ 为单个属性
    * $(F-\{X\rightarrow A\}))^+\neq F^+$
    * $\forall Y\subset X,(F-\{X\rightarrow X,Y\rightarrow A\})^+\neq F^+$
  * **计算方法**
    * $G=F$，将 $G$ 中每个 $X\rightarrow(A_1,\cdots,A_n)$ 的函数依赖替换为 $X\rightarrow A_1,\cdots,X\rightarrow A_n$
    * 消除部分函数依赖：对每个函数依赖 $X\rightarrow A$
      * 对 $X$ 中每个属性 $B$
        * 若 $A\in(X-B)_G^+$, 则用 $(X-B)\rightarrow A$ 替换 $X\rightarrow A$
    * 消除荣誉函数依赖：对每个函数依赖 $X\rightarrow A$
      * 若 $A\in X_N^+,N=G-\{X\rightarrow A\}$ 则从 $G$ 中删去 $X\rightarrow A$
    * 将 $X\rightarrow A_1,\cdots,X\rightarrow A_n$ 合并为 $X\rightarrow(A_1,\cdots,A_n)$

## 多值依赖 (MVD)

* $X\rightarrow\rightarrow Y$: $X$ 与 $Y$ 的一组值对应，且 $Y$ 的这组值域 $U-X-Y$ 无关
* 非平凡的多值依赖：$U-X-Y\neq\emptyset$
* $X\rightarrow\rightarrow Y\Rightarrow X\rightarrow\rightarrow (U-X-Y)$
* $X\rightarrow Y\Rightarrow X\rightarrow\rightarrow Y$
* $X\rightarrow\rightarrow Y,W\supseteq Z\Rightarrow W\cup X\rightarrow\rightarrow Y\cup Z$
* $X\rightarrow\rightarrow Y,Y\rightarrow\rightarrow Z \Rightarrow X\rightarrow\rightarrow(Z-Y)$
* $X\rightarrow\rightarrow Y,W\cap Y=\emptyset,W\rightarrow Z,Y\subseteq Z\Rightarrow X\rightarrow Z$

## 范式

* 范式：满足允许存在的函数依赖的要求的关系集合
* 第一范式 $R\in$ 1NF：每个属性级都是不可分割的数据量
  * 每个关系必须满足
* 第二范式 $R\in$ 2NF: $R\in$ 1NF 且每个非主属性完全依赖于关键字
  * 判断方法
    * 确定主属性集合非主属性级
    * 判断每个非主属性和关键字之间是否满足 2NF
  * **模式分解**：将属性集合分解构成若干小的关系模式
    * 找出不满足范式要求的函数依赖关系 $X\overset{f}{\rightarrow} Y$
    * 分解为
      * $R_1=(X\cup Y,\{X\rightarrow Y\})$
      * $R_2=(\text{Head}(R)-Y, \{A\rightarrow B|A\rightarrow B\in F^+,(A\cup B)\subseteq \text{Head}(R_2)\})$
    * 对子关系重复进行
    * 合并具有相同关键字的子关系模式
* 第三范式 $R\in$ 3NF: $R\in$ 2NF 且每个非主属性不传递函数依赖于关键字
* BCNF 范式：$R\in$ 1NF，若 $X\rightarrow Y$ 则 $X$ 必含有该关系模式的关键字
  * $R\in$ BCNF 则 $R\in$ 3NF
* 第四范式 $R\in$ 4NF: $X\rightarrow\rightarrow Y$ 是非平凡多值依赖，则 $X$ 必含有关键字
  * $X\in$ BCNF

## 模式分解

* 无损联结性：分解后原关系中的信息不会被丢失
  * $R$ 的分解为 $\rho=\{R_1,R_2\}$，$F$ 为 $R$ 所满足的函数依赖集合，分解 $\rho$ 具有无损联结性的充分必要条件是：$R_1\cap R_2\rightarrow (R_1-R_2)$ 或 $R_1\cap R_2\rightarrow (R_2-R_1)$
* 依赖保持性：原有的函数依赖在分解后的关系模式上依然存在
* 在必须同时满足无损联接性和依赖保持性的要求下，一个关系模式最高可以被分解到满足第三范式
