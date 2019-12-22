---
title: shell 教程
date: 2018-02-01
tags: [linux, notes]
---

# Shell 教程

## Shell 三类命令

### Unix 命令

* echo "some text"
* ls
* wc -l (-w/-c)
* cp source target
* mv source target
* rm source
* grep 'pattern' file
* cut -b column file  (eg: cut -b 1-3 file) 输出每行前x列
* cat file
* file source 得到文件类型
* read var 用户输入值传给var
* sort file 对file中的行进行排序
* uniq file 删除重复 (eg: sort file | uniq)
* expr 2 "+" 3

<!--more-->

* find file
* tee file 同时输出到屏幕和文件
* basename file 返回不包含路径的文件名
* dirname 返回文件所在路径（上级）
* head file
* tail file
* sed 查找替换 (eg: cat file | sed 's/origin/changed' > newfile
* awk 提取字段 (eg: cat file | awk -F , '{print $1 "," $3}'

### | > `

* 重定向 > 覆盖 >> 追加
* 反短斜线  将一个命令的输出作为另外一个命令的一个命令行参数

### 流程控制

#### if

##### 标准

```bash
if ...; then
elif ...; then
else ...
fi
```

##### 判断

判断条件： [  ]  详见man test

```bash
[ -f "file"]
[ -x "/bin/ls" ] #判断/bin/ls是否存在并有可执行权限
[ -n "$var" ] #判断$var变量是否有值
[ "$a"="$b" ]
```

##### 链接符

&& 若左为真则右 (eg: [-f "test"] && echo "Here exists test"  
|| 若左为非则左

#### case

```bash
case "something" in
Pattern 1)
...
;;
Pattern 2) ... ;;
*)  ...;;
esac
```

例：

```bash
while [ -n "$1" ]; do
case $1 in
　　-h) help;shift 1;; # function help is called
　　-f) opt_f=1;shift 1;; # variable opt_f is set
　　-l) opt_l=$2;shift 2;; # -l takes an argument -> shift by 2
　　--) shift;break;; # end of options
　　-*) echo "error: no such option $1. -h for help";exit 1;;
　　*) break;;
esac
done
```

根据unix系统的惯例，首先输入的应该是包含减号的参数

#### select

```bash
select var in "A" "B" "C"; do
    ...
done
```

赋值给var

#### while

```bash
while ...; do
...
done
break
continue
```

#### for

```bash
for var in A B C ; do
　echo "var is $var"
done
```

## Shell变量

### 系统变量

* \$# 命令行参数个数
* $n $1表示第一个参数，$2表示第二个参数，以此类推
* $0 当前程序名
* $? 前一个命令的返回码
* $* 以“参数1 参数2 。。。”形式保存所有参数
* $@ 以“参数1”“参数2”。。。形式保存所有参数
* \$\$ 本程序的（进程ID号）PID
* $! 上一个命令的PID
* shift 将第一个参数删除

### 环境变量

当shell程序启动时，都自动设置一组变量，这组变量就是环境变量。shell中的所有命令都可以使用这些参数,环境变量可以在~/.bash_profile或者~/.bashrc中设置

* PATH 命令搜索路径，以冒号为分隔符（与DOS下不同的是当前目录不在系统路径里）
* HOME 用户home目录的路径名，是cd命令的默认参数
* COLUMNS 定义了命令编辑模式下可使用命令行的长度
* EDITOR 默认的行编辑器
* VISUAL 默认的可视编辑器
* FCEDIT 命令fc使用的编辑器
* HISTFILE 命令历史文件
* HISTSIZE 命令历史文件中最多可包含的命令条数（默认1000条）
* HISTFILESIZE 命令历史文件中包含的最大行数
* IFS 定义shell使用的分隔符
* LOGNAME 用户登录名
* MAIL 指向一个需要shell监视其修改时间的文件。当该文件修改后，shell将发消息给用户
* MAILCHECK shell检查MAIL文件的周期，单位是秒
* MAILPATH 功能与MAIL类似，但可以用一组文件，以冒号分隔，每个文件后可跟一个问号和一条发向用户的消息
* SHELL shell的路径名
* TERM 指定在主命令提示符前应执行的命令
* TMOUT shell自动退出的时间，单位为秒，若设为0则禁止shell自动退出
* PROMPT_COMMAND 指定在主命令提示符前应执行的命令
* PS1 主命令提示符
* PS2 二级命令提示符，命令执行过程中要求输入数据时用
* PS3 selcet的命令提示符
* PS4 调试命令提示符
* MANPATH 寻找手册页的路径，以冒号分隔
* LD_LIBRARY_PATH 寻找库的路径，以冒号分隔
* 定义环境变量：export NEW_ENV_VAR="This is a new environment variable"

### 用户变量

#### 基本操作

字母数字及下划线组成，并且变量名的第一个字符不能为数字  
赋值时，变量和等号之间不要有空格，等号和值之间也不要有空格，否则shell不会认为变量被定义 `new=1`  
引用变量时，需要在变量名前面加\$符号 `new2=$new`  
变量名包含在其他字符串中，这时就需要用{}将变量名括起来 `echo "${a}morning"`  
`unset a`

#### 声明

```bash
declare -r a
# 先赋值，再设置只读
a=good
readonly a
# 或者直接在赋值时设置只读
readonly good

local a  # 局部变量

declare -i a=5 # 对数字声明
declare -a arr=(a b c ) # 对数字声明
# 函数 -f
declare -x # 通过环境输出变量 
#- 开启 + 关闭
```

#### 数组

##### 赋值

(index为0) `ARRAY=(value1 value2 ... valueN)`  
`ARRAY=(index1=value1 index2=value2 ... indexN=valueN)`  
`ARRAY[INDEX]=value`

##### 取值

`${ARRAY[index]}`

#### 运算

##### 数值

/ % + - *

##### 字符串比较

* = 相等 eg: [ "$a" = "$b" ]
* !=
* -z 空串 -n 非空串

##### 数值比较

* -eq 数值相等 eg: ["$a" -eq "$b"]
* -ne 数值不等
* -gt 大于
* -lt 小于
* -le <=
* -ge >=

#### 注意点

* a=5 与 a='5' 等价, 字符串
* a=\$b+\$c 得到有+号的字符串
* 引号 (单引号和双引号) 防止通配符*扩展
* 单引号防止任何变量扩展
* 转义字符 \*

### 函数

```bash
functionname()
{
body
}
```

在每个程序的开始对函数进行声明

### 字符串截取

按子串分割截取  
`${varible#*string}` 从左往右，删除最短的一个以string结尾的子串，即截取第一个string子串之后的字符串

`${varible##*string}` 从左往右，删除最长的一个以string结尾的子串，即截取最后一个string子串之后的字符串

`${varible%string*}`  从右往左，删除最短的一个以string开头的子串，即截取最后一个string子串之前的字符串

`${varible%%string*}` 从右往左，删除最长的一个以string开头的子串，即截取第一个string子串之前的字符串

固定位置截取

`${varible:start:len}` 截取变量varible从位置start开始长度为len的子串。第一个字符的位置为0。
`${var:0-7:5}`表示：从右边第7个字符开始，截取5个字符