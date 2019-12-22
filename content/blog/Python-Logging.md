---
title: Logging module
date: 2018-11-12
tags: [python]
---

# Logging module

## level

CRITICAL > ERROR > WARNING > INFO > DEBUG > NOTSET

<!--more-->

## init

logging.basicConfig()

### format

* %(levelno)s: 打印日志级别的数值
* %(levelname)s: 打印日志级别名称
* %(pathname)s: 打印当前执行程序的路径，其实就是sys.argv[0]
* %(filename)s: 打印当前执行程序名
* %(funcName)s: 打印日志的当前函数
* %(lineno)d: 打印日志的当前行号
* %(asctime)s: 打印日志的时间
* %(thread)d: 打印线程ID
* %(threadName)s: 打印线程名称
* %(process)d: 打印进程ID
* %(message)s: 打印日志信息

### default level

* 默认级别为WARNING: 即低于WARNING的信息不输出

### filename

* 日志输出文件

### example

```python
logging.basicConfig(level=DEBUG,
                      format="%(asctime)s %(filename)s[func:%(funcName)s line:%(lineno)d] %(message))
```

## StreamHandler

```python
console = logging.streamHandler()  
console.setLevel(logging.INFO)  

formatter = logging.Formatter('%(name)-12s: %(levelname)-8s %(message)s')
console.setFormatter
logging.getLogger('').addHandler(console)
```

## 日志回滚

```python
from logging.handlers import RotatingFileHandler
Rthandler = RotatingFileHandler('myapp.log', maxBytes=10*1024*1024,backupCount=5)
Rthandler.setLevel(logging.INFO)
formatter = logging.Formatter('%(name)-12s: %(levelname)-8s %(message)s')
Rthandler.setFormatter(formatter)
logging.getLogger('').addHandler(Rthandler)
```

## logging.config 配置

```python
logging.config.fileConfig("\<filename\>")
logger = logging.getLogger("\<name\>")
logger.warning()
```

### 配置文件

```conf
#logger.conf
###############################################
[loggers]
keys=root,example01,example02
[logger_root]
level=DEBUG
handlers=hand01,hand02
[logger_example01]
handlers=hand01,hand02
qualname=example01
propagate=0
[logger_example02]
handlers=hand01,hand03
qualname=example02
propagate=0
###############################################
[handlers]
keys=hand01,hand02,hand03
[handler_hand01]
class=StreamHandler
level=INFO
formatter=form02
args=(sys.stderr,)
[handler_hand02]
class=FileHandler
level=DEBUG
formatter=form01
args=('myapp.log', 'a')
[handler_hand03]
class=handlers.RotatingFileHandler
level=INFO
formatter=form02
args=('myapp.log', 'a', 10*1024*1024, 5)
###############################################
[formatters]
keys=form01,form02
[formatter_form01]
format=%(asctime)s %(filename)s[line:%(lineno)d] %(levelname)s %(message)s
datefmt=%a, %d %b %Y %H:%M:%S
[formatter_form02]
format=%(name)-12s: %(levelname)-8s %(message)s
datefmt=
```