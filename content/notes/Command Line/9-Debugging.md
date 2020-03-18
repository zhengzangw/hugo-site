---
title: Debugging
date: 2019-03-27
weight: 9
---

## System

```sh
stress -c # brew install stress
# Log
ls /var/log # Log file
cat /var/log/system.log | lnav # brew install lnav
log show # macos
log show --last 1m
logger "Hello Logs"
# 查询系统调用
sudo strace ls -l > /dev/null # dtrace for macos
# static analysis
writegood notes.md # brew install write-good
# time
time curl https://google.com
# perf
sudo perf stat stress -c 1
sudo perf record stress -c 1
sudo perf report
# computer status
top
htop
du # disk usage
ncdu
lsof # list open files
# benchmark
hyperfine --warmup 3 'fd -e jpg' 'find . -iname "*.jpg"
```

## C

### time

```cpp
#include <time.h>
usleep(ms)
```

### gdb

```sh
gdb --args sleep 20 # gdb with binary
lldb -- sleep 20 # lldb
```

### profile

```sh
valgrind
```

## Python

### static analysis

```sh
pyflakes test.py
mypy test.py
```

### pdb

```sh
python -m ipdb test.py # pip install ipdb
# in ipdb
l #list
s #step
restart #restrat
p value #print
p locals()
c #continue
q #quit debugger
b 6 #breakpoint
```

### profiles

Trace profiles

```sh
python -m cProfile -s tottime test.py
python -m memory_profiler test.py # pip install memory_profiler
```

Line profiles: add `@profile` before function

```sh
kernprof -l -v urls.py # pip install line_profiler
```