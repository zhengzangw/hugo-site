---
title: 1. Shell Basic
date: 2019-02-07
weight: 1
---

## 帮助

```sh
man mkdir
tldr mkdir
type cd
which ffmpeg
shellcheck script.sh # brew install shellcheck
history 1 # history from 1
```

## File System

```sh
# 查看
ls -R
tree -L 1 # brew install tree
# 跳转
cd # = cd $HOME
cd - # 放回之前目录 cd $OLDPWD
broot
nnn
j -s # autojump
dirs -v # 查看栈
popd # 出栈
popd +n # 从栈顶向栈底计算，删除
pushd # = cd -
pushd +n # 切换到第 n 个，循环方式
# 操作
cp source_file target_file
mv source_file target_file
rm target_file
mkdir -p # Create missing ones
basename ./a/b/c.d # 返回不包含路径的文件名
dirname ./a/b/c.d # 返回文件所在路径（上级）
```

## Search

```sh
find . -name src -type d # type directory
find . -path '**/test/*.py' -type f
find . -name "*.tmp" -exec rm {} \;
fd 'image.*' --extension 'jpg' # 
locate hello # show path contains hello
updatedb # update database
grep foobar script.sh
gerp -R foobar # go through directory
rg "import requests" -t py -C 5 . # ripgrep
rg -e "img.*\.jpg" -t py -C 5 .
rg -u --files-without-match --stats '^#\!' -t sh # -u don't ignore hidden file
ack --ruby foo
ag foo
fzf
# brew install fzf
# /usr/local/opt/fzf/install
```

## Pipeline

```sh
> # 重定向，覆盖
?> # 重定向，强制覆盖 in mac
>> # 追加
> /dev/null 2> /dev/null
| # standard file inferface
ffmpeg -loglevel panic -i /dev/video0 -frames 1 -f image2 - | convert - -colorspace gray - | gzip | ssh tsp 'gzip -d | tee copy.png'  # - means stdin/stdout
| xargs -d "\t" # 将标准输入按\t分解为命令行参数 -p 只打印不执行
| tee # output and forward
```

## globbing

```sh
ls project*
ls project?
touch project{1,2}/src/text/test{1,2,3}.py
touch {foo,bar}/{a..g}
**/test/*.py # ** means any prefix
```

## 其它常用命令

```sh
date
date +%Y-%m-%d
cmp a.c b.c
diff a.c b.c
yes "hello world!"
```
