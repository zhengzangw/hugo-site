---
title: Linux
date: 2019-01-19
weight: 11
---

Linux 私房菜

# 命令

<!--more-->

## 基础命令

| Command | Parameters | Description | Order                  |
| ------- | ---------- | ----------- | ---------------------- |
| locale  |            | 语系        | en_US.utf8,zh_CN.utf-8 |
| date    |            |             | scale=3                |
| cal     |            |             |                        |
| bc      |            | 计算器      |                        |
| man     |            |             |                        |
| info    |            |             |                        |
| whatis  |            | man -f      | mandb 建立数据库       |
| apropos |            | man-k       |                        |
| sync    |            |             |                        |
| su      |            |             |                        |

## 关机命令

| Command  | Parameters     | Description                                   |
| -------- | -------------- | --------------------------------------------- |
| shutdown | -[krhc] [time] | 警告/重启/关闭/取消 runs the shutdown scripts |
| halt     |                |                                               |
| poweroff |                | also turns off the unit itself                |
| reboot   |                |                                               |

## 访问控制

| Command | Parameters | Description     |
| ------- | ---------- | --------------- |
| chgrp   | [-R]       |                 |
| chown   | [-R]       | 4755(4:special) |
| chmod   |            | Num/ugo+-=      |

* SUID: Set UID
  * -rwsr-xr-x
  * 文件
    * SUID 权限仅对二进制文件有效
    * 执行者对于该程序需要 x 的可执行权限
    * 执行者在程序执行过程中有 owner 权限
* SGID: Set GID
  * -rwx--s--x
  * 文件
    * SGID 对二进制程序有效
    * 执行者对于该程序需要 x 的可执行权限
    * 执行者获得程序用户组支持
  * 目录
    * 在此目录下用户的有效用户组成为目录的用户组
* Sticky Bit
  * drwxrwxrwt
  * 目录
    * 用户在该目录下建立文件或目录，仅自己与root才有权力删除

## 文件管理

| Command | Parameters     | Description       |
| ------- | -------------- | ----------------- |
| ls      | [-adil] [-hSr] |                   |
| cp      | [-ap] [-ir]    |                   |
| mv      |                |                   |
| touch   | [-cd]          |                   |
| umask   | [num]          | 查看/修改默认权限 |
| lsattr  |                |                   |
| chattr  |                | 隐藏属性          |

* 建立文件：(-rw-rw-rw-)-umask
* 建立目录：(drwxrwxrwx)-umask

| 隐藏属性 | Description                      |
| -------- | -------------------------------- |
| A        | atime 不修改（加速）             |
| S        | 同步                             |
| a        | 只能增加                         |
| c        | 自动压缩                         |
| d        | 不会被dump                       |
| i        | 不能被删除、改名、设置链接、写入 |

### 内容查看

| Command   | Parameters | Description |
| --------- | ---------- | ----------- |
| rm        |            |             |
| cat       |            |             |
| tac       |            |             |
| nl        |            |             |
| more/less |            |             |
| od        |            |             |

### 查找

| Command | Parameters | Description                                |
| ------- | ---------- | ------------------------------------------ |
| which   | [-a]       | 在PATH中寻找                               |
| type    |            |
| whereis | [-l]       |                                            |
| locate  |            | 在 /var/lib/mlocate 数据库寻找（updatedb） |
| find    |            |                                            |

* find
  * 时间：-atime,-ctime,-mtime
  * 用户：-uid n,-gid n
  * -name
  * -size

## 磁盘工具

| Command     | Parameters | Description                                       |
| ----------- | ---------- | ------------------------------------------------- |
| lsblk       |            | 列出块储存设备                                    |
| blkid       |            | 列出块储存设备UUID(Universally unique identifier) |
| gdisk       |            | GPT 分区                                          |
| fdisk       |            | MBR 分区                                          |
| parted      |            |                                                   |
| fsck        |            |                                                   |
| xfs_repair  |            |                                                   |
| mount       | -loop      |                                                   |
| umount      |            |                                                   |
| xfs_dump    |            |                                                   |
| xfs_restore |            |                                                   |

## 光盘工具

* mkisofs
  * 格式：iso9660
    * -r 增加更多信息
  * -graft-point 分层
* isoinfo
* rsync
* wodim(cdrecord)
* dd if="input" of="output" bs="block_size" count="number"
* cpio

## 压缩

| Name  | 压缩工具 | Description                               |
| ----- | -------- | ----------------------------------------- |
| .Z    | compress | 废弃                                      |
| .zip  | zip      | 算法不定，主要DEFLATE,中等,兼容性好       |
| .gz   | gzip     | 算法基于DEFLATE, gnu/Linux。 原始而效率低 |
| .bz2  | bzip2    | 优于gzip，时间更长                        |
| .xz   | xz       | LZMA SDK                                  |
| .7zip |          | 主要用bzip2和lzma，略优于rar              |
| .rar  |          | 算法专有，优                              |
| .tar  | tar      | 归档                                      |

* tar 可以和压缩或加密格式串用，tar.gz tar.bzip2 tar.xz tar.lzma 都是常见的压缩格式组合
* gzip [-cdtv#]
  * zcat/zmore/zless/zgrep
* bzip2
  * bzcat/bzmore/bzless/bzgrep
* xz
  * xzcat/xzmore/xzless/xzgrep
* tar
  * -c 产生新包
  * -t 列出文件
  * -x 解出文件
  * -zjJ
  * -f

## Bash

* 变量设置
  * myname=value
  * myname=${value}
* 双引号：$ 保持原有样本
* 单引号：一般文本
* 借助命令
  * $()
  * ``
* 增量：PATH=${PATH}:/home/bin
* export: 是变量成为环境变量
* 取消变量：unset
* 内核版本：uname -r
* 查看环境变量 env
* declare/typeset 声明变量类型
  * -a
  * -i
  * -x
  * -r
* set 观察所有变量
* 提示字符 PS1
* $ : shell PID
* ? : 上个命令返回值
* read [-pt] varible
* ulimit 限制
* 删除
  * 从左到右 {variable#/*local/bin:}
    * 最短 #
    * 最长 ##
* 替换
  * ${variable/old/new} 单个
  * ${variable//old/new} 全部
* new=${old-content}
  * old 不存在则 content
* new=${old:-content}
  * old 不存在或为空则 content
* P333
* alias
* unalias
* history
  * !num 执行第num命令
  * !! 上一条
  * !al 最近以al开头的命令
* /etc/issue 登录画面
* login shell
  * /etc/profile
    * /etc/profile.d/*.sh
    * /etc/locale.conf
  * ~/.bash_profile 或 ~/.bash_login 或 ~/.profile
* non-login shell
  * ~/.bashrc
* source 或 .
* stty

## man

* Section 1 user commands (introduction)
* Section 2 system calls (introduction)
* Section 3 library functions (introduction)
* Section 4 special files (introduction)
* Section 5 file formats (introduction) 
* Section 6 games (introduction)
* Section 7 conventions and miscellany (introduction)
* Section 8 administration and privileged commands (introduction)
* Section L math library functions Section Ntcl functions


### wildcard

*?[][-][^]

### 重定向

< <<
> >>
2> 2>>
tee

tr
* -d 删除
* -s 替换重复字符

col
* -x 将 tab 转为对等空格

join
expand
unexpand
split
xargs -p -n 1
- 前一个命令的stdout 

### 选取命令

grep 
cut -d'分隔字符' -f fields
cut -c 字符区间 
sort
wc
uniq

## 其它

| Command | Parameters | Description |
| ------- | ---------- | ----------- |

* `cat /proc/iomem`
* `lspci`
* `lsblk`
* vipw/vigr
* ctrl+alt+F1/2t

## Hard Disk File Type

都支持：动态调整大小，快照，划分小于2G

| Hard disk                  | Description                   |
| -------------------------- | ----------------------------- |
| VDI(VirtualBox Disk Image) | VB 独有形式                   |
| VHD(Virtual Hard Disk)     | Microsoft Virtual PC 基本格式 |
| VMDK                       | VMWare                        |

## Text

* od
  * -t 指定数据的显示格式，主要的参数有：
    * c ASCII字符或反斜杠序列
    * d 有符号十进制数
    * f 浮点数
    * o 八进制（系统默认值为02） 
    * u 无符号十进制数
    * x 十六进制数
* hexdump
  * -C
  * -v 显示所有输入
* xxd
  * -r

## FS

* dd
* mkfs
* stat
* ls -i

## 设备

* blockdev --getbsz /dev/sda2

## imagemagick

* [convert](https://imagemagick.org/script/command-line-options.php#type)
  * -resize
    * 100x100, 50%x50%
    * -mattecolor "#000000" -frame 60x60
    * -border 60x60 -bordercolor "#000000"
    * -blur 80
    * -flip 上下翻转
    * -flop 左右翻转
    * -negate
    * -monochrome
    * -noise 3
    * -paint 4 油画
    * -rotate 30
    * -charcoal 2 炭笔
    * -swirl 67 散射
    * -raise 5x5
    * -type Bilevel, Grayscale, GrayscaleAlpha, Palette, PaletteAlpha, TrueColor, TrueColorAlpha, ColorSeparation, or ColorSeparationAlpha
* mogrify
  * -sample 80x60

<!--more-->