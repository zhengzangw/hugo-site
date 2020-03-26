---
title: 2. Shell Script
date: 2019-02-07
weight: 2
---

## 内建命令

```sh
man builtin
source ~/.zshrc
read -p "Enter some information > " name url age
cd
```

## 变量

字母数字及下划线组成，并且变量名的第一个字符不能为数字
赋值时，变量和等号之间不要有空格，等号和值之间也不要有空格，否则 shell 不会认为变量被定义

```sh
echo $(ls) # output -> string
echo `ls` # output -> string
diff <(ls) <(ls ..) # output -> tmp file
# declare
declare -r a # 只读
local a  # 局部变量
declare -i a=5 # 对数字声明
declare -a arr=(a b c) # 对数字声明
# 函数 -f
declare -x # 通过环境输出变量
#- 开启 + 关闭
# Variable
foo=bar # No space
a=5 # same to a='5'
a=$b+$c # 存在 + 号的字符串
url=https://zhengzangw.com
readonly foo
echo Value is foo # Value is foo
printf "Value is %s" "$foo" # Value is bar
echo 'Value is $foo' # Value is $foo
echo "Value is${foo}"
echo "Length is $#foo or ${#foo}"
echo ${url:2:9} # ${string:start:length} or ${string:start}
echo ${url:0-13:9} # 右边开始计数
echo ${url#*:} # 从左边截取 *:，非贪婪
echo ${url#https://} # 从左边截取 https://
echo ${url##*:} # 贪婪
echo ${url%/*} # 从右边开始截取
echo ${url%%/*} # 贪婪
echo ${url-unset_show_this}
echo ${url:-unset_or_null_show_this}
unset foo
# Array
arr=(20 56 "zhengzangw.com")
arr[6]=7 # 长度不定
ages=([3]=24 [5]=19 [10]=12)
ages=('red'=1 'green'=2 'yellow'=3)
echo ${ages[3]}
echo ${ages[*]} # or $ages[@] or $ages 全部元素
echo ${#ages[*]} # 获得数组长度
($ages $arr) # 数组拼接
unset ages[3]
# Math
i=5
echo $((1+1))
((i=i*2))
let i+=8
echo $[1+1]
# Judge
man test
test $age -le 2
[$age -le 2] # equal to test
[[$age -le 2]] # upgrade of [], support ||,&&,!
[[$str =~ ^1[0-9]{10}$ ]] # support regex
```

## 流程控制

```bash
# if
if [ -f "file" ] # Judge if exists
then
    ...
elif [ -x "/bin/ls" ] # Judge if executable
then
    ...
else
    ...
fi

# 链接符
true && echo "若左为真则右"
false || echo "若左为非则右"

# Case && while
while [ -n "$1" ]
do
case $1 in # 根据 unix 系统的惯例，首先输入的应该是包含减号的参数
　　-h) help;shift 1;; # function help is called
　　-f) opt_f=1;shift 1;; # variable opt_f is set
　　-l) opt_l=$2;shift 2;; # -l takes an argument -> shift by 2
　　--) shift;break;; # end of options
　　-*) echo "error: no such option $1. -h for help";exit 1;;
　　*) break;;
esac
done

# For
for var in A B C ; do
　echo "var is $var"
done

# Select
select var in "A" "B" "C"
do
    echo $var
done
# #? 提示用户输入
# ^D 结束循环

# 函数
function name(){ # function 可省略
    statements
    return 0
}

# exit
exit -1
```

## 系统变量

```sh
$# # 命令行参数个数
$n # $1 表示第一个参数，$2 表示第二个参数，以此类推
$0 # 当前程序名
$$ # PID
$* # = "$1 $2 ..."
$@ # = "$1" "$2" ...
$? # 上一命令的的返回码
$! # 上一命令的 PID
$_ # 上一命令的最后一个参数
shift 将第一个参数删除
```

## 环境变量

环境变量：当 shell 程序启动自动设置的一组变量，可以在~/.bash_profile 或者~/.bashrc 中设置

```sh
export TEST=test # 定义环境变量
env # 显示命令
env PATH=/usr/bin python --version # 执行命令

PATH # 命令搜索路径，以冒号为分隔符
HOME # 用户 home 目录的路径名
COLUMNS # 定义了命令编辑模式下可使用命令行的长度
EDITOR # 默认的行编辑器
VISUAL # 默认的可视编辑器
FCEDIT # 命令 fc 使用的编辑器
HISTFILE # 命令历史文件
HISTSIZE # 命令历史文件中最多可包含的命令条数（默认 1000 条）
HISTFILESIZE # 命令历史文件中包含的最大行数
IFS # 定义 shell 使用的分隔符
LOGNAME # 用户登录名
MAIL # 指向一个需要 shell 监视其修改时间的文件。当该文件修改后，shell 将发消息给用户
MAILCHECK # shell 检查 MAIL 文件的周期，单位是秒
MAILPATH # 功能与 MAIL 类似，但可以用一组文件，以冒号分隔，每个文件后可跟一个问号和一条发向用户的消息
SHELL # shell 的路径名
TERM # 指定在主命令提示符前应执行的命令
TMOUT # shell 自动退出的时间，单位为秒，若设为 0 则禁止 shell 自动退出
PROMPT_COMMAND # 指定在主命令提示符前应执行的命令
PS1 # 主命令提示符
PS2 # 二级命令提示符，命令执行过程中要求输入数据时用
PS3 # selcet 的命令提示符
PS4 # 调试命令提示符
MANPATH # 寻找手册页的路径，以冒号分隔
LD_LIBRARY_PATH 寻# 找库的路径，以冒号分隔
```

shebang

- `#!/bin/bash`
- `#!/usr/bin/env python`

PS1

![显示值](https://pic4.zhimg.com/80/v2-9d699207efcc666a7a2223cfdd6dedc7_1440w.jpg)

## 参数

```sh
# getopts
# : after letter indicates it requires arguments
while getopts ":a:" opt; do
  case $opt in
    a)
      echo "-a was triggered, Parameter: $OPTARG" >&2
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

# getopt
```
