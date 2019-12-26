---
title: 2-关系数据库系统
date: 2019-05-26
tags: [database]
weight: 2
---

## 衡量准则

完全关系型，基本关系型，半关系型

1. 信息准则：信息能在逻辑一级唯一地用“表”中的值显示表示
2. 确保访问准则：逻辑方式依靠表名、关键字名与列名的组合来访问数据库汇总的每一个原子数据
3. 空值的关系处理准则：处理空值的能力
4. 基于资源管理的动态联机目录：数据字典与用户数据具有相同的表示形式与操作方式
5. 统一易用的数据子语言：至少有一种数据子语言支持：数据定义，视图定义，数据操控空，完整性约束，授权机制，事务处理能力
6. 视图更新准则：通过视图不仅可以查询，还可以执行对数据的增、删、改等操作
7. 高级的插入、删除及修改操作：一条命令可以操作多个元组
8. 物理数据独立性
9. 逻辑数据独立性
10. 数据完整性准则
11. 分布独立性：数据分布的改变不影响原有的应用程序
12. 无损害原则：对提供低级数据子语言的要求

## 关系模型

由关系构建的模型

### 关系数据结构

* 二维表
    * Frame：表框架有 $n$ 的 Attribute 组成
        * 表的元数：$n$
        * Domain：属性的取值范围
    * Tuple：由 $n$ 个元组分量组成
        * 表的基数：$m$
* 关系：满足以下性质的的二维表
    * First Normal Form Rule
        * 元组分量原子性
    * Access Rows by Content Only Rule
        * 元组次序无关
        * 属性次序无关
    * The Unique Row Rule
        * 元组唯一
    * 元组个数有限
    * 属性名唯一性
    * 分量值域同一性
* 关系框架：关系名+所有属性名 $R(A_1,A_2,\cdots,A_n)$
* 键
    * Superkey: a set of columns that has the uniqueness property
    * Key: a minimal superkey
    * Foreign Key: 表 A 中的属性集 F 是表 B 的键，则 F 为表 A 的外键
        * A 可以等于 B
        * A：引用表，B：被应用表

| 关系模型  | 二维表        |
| --------- | ------------- |
| Releation | Table         |
| Attribute | Column        |
| Tuple     | Row           |
| Schema    | Table Heading |

### 关系操纵

* 数据操纵功能
    * 数据查询
        * 单张表：纵向定位+横向定位
        * 两张表：先将两张表合一
        * 多张表：逐步合一
    * 数据插入
    * 数据删除
    * 数据修改
* 基本操作模型
    * 元组选择
    * 属性指定
    * 关系合并
    * 元组插入
    * 元组删除
* 空值处理
    * 算术运算中有空值，结果为空
    * 逻辑运算中有空值，结果为假
    * 统计计算中，定义对空集和空值的处理方法
        * 空值可以不统计 SUM AVG MAX MIN COUNT
        * 空集结果为空 SUM AVG MAX MIN
        * 空集结果为 0 COUNT

### 数据约束

* 实体完整性约束：关系的主键中不允许有空值
* 参照完整性约束：外键要么取空值，要么是被引用表中当前存在的某元组上的主键值
* 用户定义的完整性

## 关系代数

集合在 $(\pi,\sigma,\times,\cup,-)$ 下的代数系统

* 元组：元组分量的集合，n 元有序组
* 关系：元组的集合，n 元有序组的集合，$R\subseteq D_1\times D_2\times\cdots D_n$
* 基本操作：关系上的基本运算
* Compatible Tables: Head(R)=Head(S), attributes chosen from the same domains with the same meanings
* $\pi_A(\sigma_F(R))=\pi_A\sigma_F(R)$
* $R\times S$ 有 $(n+m)$ 个属性，$pq$ 个元组
    * $R\times S=S\times R$
    * $(R\times S)\times T=R\times(S\times T)$
    * $T=R\times S,R=T÷S$
    * $R=T÷S,R\times S\subseteq T$
* $R÷S$, Head(T)=Head(R)-Head(S)，关系$S$所有元组在$R$中对应的相同值
    * 条件对象集中的所有元组都能使得查询条件成立

| 基本操作 | 运算             | 条件                                 | 结果                                                                                                            | 关系演算表达式                                                                                                                          |
| -------- | ---------------- | ------------------------------------ | --------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| 元组选择 | 选择运算         | $F$为条件                            | $\sigma_F(R)$                                                                                                   | $\{t\vert R(t)\wedge F\}$                                                                                                               |
| 属性选择 | 投影运算         | $B_i\in\{A_n\}$                      | $\pi_{B_1,B_2,\cdots,B_m}(R)$(消除结果关系中重复元组)                                                           | $\pi_{A_{i_1},\cdots,A_{i_k}}(R)=\{\langle u_1,\cdots,u_k\rangle\vert\exists t(R(t)\wedge u_1=t_{i_1}\wedge\cdots\wedge u_k=t_{i_k})\}$ |
| 关系合并 | 笛卡尔乘积       | 相同属性名需要换名                   | $R\times S$                                                                                                     | $\{t^{(m+n)}\vert \exists u^{(m)}\exists v^{(n)}(R(u)\wedge S(v)\wedge t_1=u_1\cdots\wedge t_{m+n}=v_n\}$                               |
| 元组插入 | 并运算           | 相容表                               | $R\cup S$                                                                                                       | $\{t\vert R(t)\vee S(t)\}$                                                                                                              |
| 元组删除 | 差运算           | 相容表                               | $R-S$                                                                                                           | $\{t\vert R(t)\wedge \neg S(t)\}$                                                                                                       |
|          | 交运算           | 相容表                               | $R\cap S=R-(R-S)$                                                                                               |
|          | 除运算           | Head(S)$\subset$Head(R)              | $R÷S=\pi_{A_1\cdots A_n}(R)-\pi_{A_1\cdots A_n}(\pi_{A_1\cdots A_n}(R)\times S-R))$                             |
|          | join             | 连接条件$F$                          | $R\Join_FS=\sigma_F(R\times S)$，同名属性换名                                                                   | $R(p)\wedge S(q)\wedge F$                                                                                                               |
|          | natural join     | Head(R)$\cap$Head(S)$\not=\emptyset$ | $R\Join S=\pi_{A_1,A_2,\cdots,A_n,B_{j+1},\cdots,B_m}(\sigma_{A_1=B_1\wedge A_2=B_2\cdots A_j=B_j}(R\times S))$ | $R(x,y,z)\wedge S(y,u,v)$                                                                                                               |
|          | outer join       |                                      |                                                                                                                 |
|          | left outer join  |                                      |                                                                                                                 |
|          | right outer join |                                      |                                                                                                                 |

### 例

* 求解过程：确定目标，确定条件，确定对象，关系合并，元组选择，属性指定
* 查询折扣最高的客户：$\pi_{C.cid}(C)-\pi_{C.cid}(\sigma_{C.discnt<S.discnt}(C\times S))$
* 选修过所有课程的学生：$\pi_{s,c}(SC)÷S$

## 关系演算

* 以数理逻辑中的谓词演算为基础的关系模型理论
    * 非过程性数据子语言理论基础
    * 关系：谓词
    * 关系上的操作：关系演算公式
* 一阶谓词术语表

| 数据库            | 数理逻辑                       |
| ----------------- | ------------------------------ |
| 个体常元          | 常元集合 $\mathscr{L}_c$       |
| 个体变元          | 变元集 $V$                     |
| 个体词            | 个体常量+个体谓元              |
| 个体域            | 论域                           |
| 全总个体域        |                                |
| 成真指派/成假指派 | 谓词为真/假的指派              |
| 原子公式          | 个体词在比较运算谓词下的*公式* |
| 关系演算公式      | 公式                           |

* 关系演算（一阶逻辑）
    * 变元集 $V$：属性
        * 元组关系演算: 元组$t$, $t(i)$ 为 $t$ 的第 $i$ 个属性
        * 域关系演算: 属性变量 $x_i$
    * 函数集合 $\mathscr{L}_f$：比较运算符
    * 谓词集合 $\mathscr{L}_P$：关系 $P$
        * $P_{\mathbb{M}}=I(P)\subseteq M^n$: 关系中的每个元组为成真指派，其它元组为成假指派
        * 特性刻画法：$R=\{t|P(t)\}=P_{\mathbb{M}}$
    * 关系演算公式：$\varphi(t)$
        * 自由变量：目标属性
        * 约束变量：其它属性
    * **关系演算表达式**: $\{t|\varphi(t)\}\dot=\varphi(t),$
* 安全公式：没有无限性问题的公式
    * 无限关系：$|R|=\infty$
        * $\{t|\neg R(t)\}$
    * 无穷验证：因使用存在量词或全称量词而导致的无穷验证现象
        * $\forall t(W(t))$
        * $\exists t(W(t))$
* 约束集 $\text{DOM}(\varphi)$: 有限符号集合
    * 如果以公式 $\varphi$ 做特征可以构造出一个元组集合，其中的每个元组只能由出现在 $\text{DOM}(\varphi)$ 中的符号构成，则这样的公式 $\varphi$ 是安全的
* 关系代数等价于安全的关系运算

| 公式的表示                             | 关系代数                                                                |
| -------------------------------------- | ----------------------------------------------------------------------- |
| $\varphi_1\wedge\varphi_2$(有公共变元) | $R_1\Join R_2$                                                          |
| $\varphi_1\wedge\varphi_2$(无公共变元) | $R_1\times R_2$                                                         |
| $\varphi_1\vee\varphi_2$               | $R_1\cup R_2$                                                           |
| $\varphi_1\rightarrow\varphi_2$        | $R_2\div R_1$                                                           |
| $\neg\varphi$                          | $(D_1\times D_2\times\cdots\times D_n)-R,D_i$ 为第 $i$ 的自由变元的值域 |
| $\exists r(\varphi)$                   | $\pi_{A_1,A_2,\cdots,A_k}(R), A_i$ 为自由变元                           |
| $\forall r(\varphi)$                   | $R \div S$, $S$ 为受全称量词约束的变元                                  |

## SQL'92 (Structured Query Language, SQL2)

| 关系模型   | SQL                |
| ---------- | ------------------ |
| 关系       | base table         |
| 关系子模式 | view/virtual table |
| 属性       | column             |
| 元组       | row                |

* 表：基表和视图

| 符号                       | SQL 数据类型     | Description      |
| -------------------------- | ---------------- | ---------------- |
| INT                        | 整数             | 10 位            |
| SMALLINT                   | 短整数           | 5 位             |
| BIGINT                     | 巨整数           | 19位             |
| DEC(p,s),NUM(p,s)          | 十进制数         | 精度 p，小数位 s |
| FLOAT                      | 浮点数           |                  |
| CHAR(n)                    | 定长字符串       |                  |
| VARCHAR(n)                 | 变长字符串       |                  |
| CLOB$(n[K\vert M\vert G])$ | 字符大对象字符串 |                  |
| GRAPHIC(n)                 | 图形字符串       | 双字节           |
| BIT(n)                     | 定长位串         |                  |
| BIT VARYING(n)             | 变长位串         |                  |
| BLOB(n)                    |                  |                  |
| DATA                       | 日期             |                  |
| TIME                       | 时间             |                  |
| TIMESTAMP                  | 时间戳           |                  |

* []: 仅允许出现一次
* {}: 出现0次或若干次
* --: 单行注释
* /**/: 多行注释

## 数据定义功能

* 创建

```sql
CREATE TABLE tablename(
    colname datatype [<属性级约束>]
    {, colname datatype [<属性级约束>]}
    <表级约束>
)
```

* 修改与删除

```sql
ALTER TABLE <table name> ADD <column name> <data type>;
ALTER TABLE <table name> DROP <column name>
DROP TABLE <table name>
```

## 数据操纵功能

* 查询 $\pi_{A_1,\cdots,A_m}(\sigma_F(R_1\times\cdots\times R_n))$

```sql
SELECT A1,A2,...,Am
FROM R1,R2,...,Rn
WHERE F
```

* 查询 $\pi_{A_1,A_2,\cdots,A_m}(\sigma_F(R\Join S))$

```sql
SELECT A1,A2,...,Am
FROM R1,R2,...,Rn
WHERE F and R.B1=S.B1 and ... and R.Bk=S.Bk
```

* 映像语句
  * 目标子句: `SELECT *| colname {, colname ...}`
    * `*`: 所有属性
    * `dinstinct`: 消除结果中重复元组
    * `<colunm_expression> AS <colname>`
  * 范围子句: `FROM tablename, {, tablename ...}`
    * `<table_name> <alias_name>`
  * 条件子句: `[WHERE search_condition]`
    * 比较谓词
      * `[NOT] BETWEEN...AND`
      * `[NOT] LIKE`: `column [NOT] LIKE val1 [ESCAPE val2]`
        * 模板 val1: 下划线匹配任一字符，百分号匹配任一字符串
        * 转义指示符：紧跟在转义指示字符val2之后的‘_’或‘%’（包括转义字符自身）不再是通配符，而是其自身
      * `IS [NOT] NULL`
    * 逻辑运算：`NOT`, `AND`, `OR`
    * 嵌套查询
      * 集合谓词：
        * `expr [NOT] IN (subquery)`
          * 自然连接
          * `[NOT]` 减法运算
        * `expr >|<|= SOME|ANY|ALL (subquery)`
        * `[NOT] EXISTS (subquery)`
        * `CONTAINS`
      * 处理顺序
        * 独立子查询：内到外
        * 相关子查询：外到内
  * 分组子句: `[GROUP BY colname {, colname ...}]`
    * 每个小组进行单独统计，一个小组产生一条结果元组
    * 在分组统计查询中，目标属性必须包含所有的分组属性
  * 分组查询子句: `[HAVING group_condition]`
    * 满足 group_condition 的元组集合才会被保留
  * 排序输出子句: `[ORDER BY colname [ASC|DESC] {,colname [ASC|DESC] ...}]`
* 映像语句间的运算
  * `UNION [ALL]`
  * `INTERSECT [ALL]`
  * `EXCEPT [ALL]`
* 统计计算
  * `COUNT`
    * count(*): 返回元组个数
    * count(colname): colname 属性上取值非空的元组个数
    * count(distinct colname)
  * `SUM`
  * `AVG`
  * `MAX`
  * `MIN`
* SQL 语句多样性
  * 表的连接查询
  * IN + 独立子查询
  * IN + 相关子查询
  * =SOME + 子查询
  * EXISTS + 相关子查询

## 更新功能

* 元组删除语句

```sql
DELETE FROM table_name
[WHERE search_condition];
```

* 元组插入语句

```sql
INSERT INTO tabname [(colname {, colname ...})]
VALUES (expr | NULL {,expr|NULL ...})
| subquery;
```

* 元组修改语句

```sql
UPDATE table_name
SET colname=expr|NULL|subquery, ...
[WHERE search_condition];
```

## 视图（导出表，虚表）

* 由若干张表经映像语句构筑而成的表

```sql
CREATE VIEW <name> [(<col_name> {, <col_name> ...})] AS <statement> [WITH CHECK OPTION]
```

* 视图的删除：连带删除定义在该视图上的其它视图

```sql
DROP VIEW <name>
```

* 可更新视图：视图的每一行对应基表唯一一行，每一列对应基表的唯一一列
