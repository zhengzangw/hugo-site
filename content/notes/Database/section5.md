---
title: 数据库中的数据交换
date: 2019-05-26
tags: [database]
weight: 5
---

* 初级阶段：交换方式（命令执行方式）
* 中级阶段：嵌入式方式，自含方式（可编程SQL），调用层方式
* 近期方式：Web方式

## 数据交换的管理

* 会话管理
  * 数据客体模式设定（网络环境，目录层，模式层）
  * 语言模式设定（字符集）
  * 时间模式设定（时区）
  * 标识符设定
* 连接管理
  * 连接语句 `connect to <连接目标>`
  * 断开连接 `disconnect <断开对象>`
* 游标管理
  * Scrollable Cursors

```sql
--declare
EXEC SQL DECLARE agent_dollars CURSOR FOR
select  aid, sum(dollars)
from    orders
where  cid = :cust_id --:cust_id is stored in host variable
group by  aid ;
--open
exec sql open agent_dollars
--fetch
exec sql whenever not found goto finish;
while (TRUE){
    exec sql fetch agent_dollars into :agnent_id, :dollar_sum;
    printf("%s %11.2f\n", agent_id, dollar_sum);
}
finish: exec sql close agent_dollars;
--mysql
declare continue HANDLER for not found set done = true;
open cur;
fetch cur into n,c;
while(not done) do
    fetch cur into n,c;
end while;
close cur;
--mysql
open cur;
read_loop:loop
fetch cur into n,c;
    if done then
        leave read_loop;
    end if;
end loop;
close cur;
```

* 诊断管理
  * 返回状态码
* 动态 SQL：根据实际情况调用 SQL 语句
  * prepare: 为执行对数据库的访问操作而准备一个存储在主变量中的SQL语句
  * describe: 获得一个已准备好的SQL语句的结果集的描述信息
  * execute: 执行一个已准备好的 SQL 语句

## 数据交换的方式

* 嵌入式 SQL: precompiler - compiler - link - exec
  * 语句区分：前后缀（EXEC SQL, END_EXEC）
  * 通讯：EXEC SQL INCLUDE SQLCA
  * 变量区分
    * 主变量：标量
    * SQL变量：集合变量
  * 数据交换：游标

```SQL
--Declare Section
exec sql begin declare section;
    char cust_id[5];
    char cust_name[14];
    float cust_discnt;
    char user_name[20], user_pwd[20];
exec sql end declare section;
--Condition Handling
----Condition: SQLERROR, NOT FOUND, SQLWARNING
----Action: CONTINUE, GOTO label, STOP, DO function| BREAK | CONTINUE
exec sql whenever sqlerror goto report_error;
exec sql whenever not found goto notfound;
set  discnt = :cust_discnt INDICATOR :cd_ind where  cid = :cust_id;
--Connect
exec sql connect to target-server
--main
--Disconnect
exec sql commit work;
exec sql rollback work;
exec sql disconnect current;
```

* 自含式 SQL: PL/SQL, T-SQL
  * 块：DECLARE + BEGIN + EXCEPTION + END
  * PL/SQL 中的游标属性
    * %ISOPEN
    * %FOUND
    * %NOTFOUND
    * %ROWCOUNT
  * T-SQL 全局变量
    * @@ERROR
    * @@ROWCOUNT
    * @@CURSOR_ROWS
    * @@FETCH_STATUS
* 调用层接口
  * C/S方式下访问接口
    * ISO接口：SQL/CLI
    * 微软：ODBC
    * SUN：JDBC
* Web 方式
  * ASP(Active Server Page)
  * JSP(Java Server Page)
  * XML
  * 数据库连接池
