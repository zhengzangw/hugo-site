---
title: Jupyter Notebook Introduction
date: 2019-05-12
tags: [tutor]
---

# Jupyter-Notebook-Introduction

![Jupyter](https://jupyter.readthedocs.io/en/latest/_static/_images/jupyter.svg)

本文为大家介绍 Jupyter Notebook 这一实用工具（原名 IPython Notebook），总共分为两个部分：安装与简介，使用与展示

[官方教程](https://nbviewer.jupyter.org/github/ipython/ipython/blob/3.x/examples/Notebook/Index.ipynb)

Jupyter Notebook 是一个交互式的编程环境，可以方便的供脚本语言（python, matlab）以及 REPL 化的其它语言进行编程、调试以及展示。  
更多内容见[What is the IPython Notebook](https://nbviewer.jupyter.org/github/ipython/ipython/blob/3.x/examples/Notebook/What%20is%20the%20IPython%20Notebook.ipynb)

本文也是使用 Jupyter Notebook 编写。

<!--more-->

## 安装与简介

Jupyter Notebook 由三个部分组成：应用程序（用于在浏览器中打开编辑器），kernel（用于运行不同语言），文档（你编写的程序）。亦可见官方[下载方法](https://jupyter.readthedocs.io/en/latest/install.html) 和 Help->User Interface Tour

### 应用程序

* \[Recommended\] 安装 [Anaconda](https://www.anaconda.com/distribution/)
* pip install jupyter

### 启动

* 终端输入：`jupyter notebook` 或 `nohup jupyter notebook &`
* Anaconda 启动后点击启动

### 基本使用

Jupyter Notebook 对新手十分友好，你应该可以直接上手了。如果一开始遇到困难，可以看看这篇[新手教程](https://nbviewer.jupyter.org/github/ipython/ipython/blob/3.x/examples/Notebook/Notebook%20Basics.ipynb)

新建文件后，输入框默认为代码框。点击代码框，在输入框内输入 python 命令，按 Run 或 Ctrl+Enter 可获得运行结果。默认将最后一行的内容输出。左侧 In \[num\], Out \[num\] 指示了第几次运行，输出。



```python
m = 6
c = 3e8
E = m*(c**2)
E
```




    5.4e+17



通过 Cell->Cell Type->Markdown, 可以将一行转为 Markdown 语法，支持 $\LaTeX$. 运行后即获得本文类似的效果。上方计算的内容即为 $$E=mc^2$$

### Kernel

默认的 Jupyter Notebook 可以运行 Python. 但其实可以支持更多语言。可以官方给出的 [List](https://github.com/jupyter/jupyter/wiki/Jupyter-kernels) 中获取想获得的 kernal. 这里介绍 conda 虚拟环境的 kernal 和 Matlab kernal 的安装。

#### conda env

为 `conda create -n env_name python=3.6` 创建的新环境添加 kernal:

1. 在默认环境下 `conda install nb_conda`
2. 在需要添加 kernel 的虚拟环境下 `conda install ipykernel`

#### Matlab

Kernel 的 Github 地址 [https://github.com/calysto/matlab_kernel](https://github.com/calysto/matlab_kernel)

* 下载 [MATLAB Engine API for Python](https://www.mathworks.com/help/matlab/matlab_external/install-the-matlab-engine-for-python.html)
* `pip install matlab_kernel`

### 更换主题

`pip install jupyterthemes`  
`jt -l` 查看可选择的主题  
`jt -t theme_name -T -N` 选择主题

## 使用与展示

### Command Mode 与 Edit Mode

这两个模式类似 Vim 的 Normal 和 Insert 模式。通过点击代码框或 Enter 键进入 Edit Mode, 通过点击代码框外或 ESC 或 Ctrl+M 进入 Command Mode。

通过 Help->Shortcut 或在 Command Mode 下按 H 键可查看可使用的功能与快捷键。譬如 Shift+Enter 可以快速运行当前框内代码并聚焦到下一行（可快速运行所有代码），ctrl+Enter 运行当前框代码可方便快速调试同一段代码。


### 输出为其它格式

Ipython 默认的文件格式为 .ipynb, 使用 nbconvert 可转换为其它格式。

* html: `ipython nbconvert --to=html Jupyter-Notebook-Introduction.ipynb`
* Markdown: `ipython nbconvert --to=markdown Jupyter-Notebook-Introduction.ipynb`
* $\LaTeX$: `ipython nbconvert --to=latex Jupyter-Notebook-Introduction.ipynb`
* Python: `ipython nbconvert --to=python Jupyter-Notebook-Introduction.ipynb`

### Magic Command

Magic Command 是内置的一些特殊指令，以%开头，单%为 Line magics, 例如 %pwd 打印当前位置; %%打头的为 Cell magics, 改变整个单元格的属性，例如 %%bash, 将该单元改为 bash 脚本。特殊的命令有 display(), 它可以将非末尾的元素同末尾元素一样显示在单元格中；以!/!!/%sx开头的命令在终端中执行


```python
%pwd
```

    /Users/zhengzangw/Desktop



```python
!python -c "import this"
```

    The Zen of Python, by Tim Peters
    
    Beautiful is better than ugly.
    Explicit is better than implicit.
    Simple is better than complex.
    Complex is better than complicated.
    Flat is better than nested.
    Sparse is better than dense.
    Readability counts.
    Special cases aren't special enough to break the rules.
    Although practicality beats purity.
    Errors should never pass silently.
    Unless explicitly silenced.
    In the face of ambiguity, refuse the temptation to guess.
    There should be one-- and preferably only one --obvious way to do it.
    Although that way may not be obvious at first unless you're Dutch.
    Now is better than never.
    Although never is often better than *right* now.
    If the implementation is hard to explain, it's a bad idea.
    If the implementation is easy to explain, it may be a good idea.
    Namespaces are one honking great idea -- let's do more of those!



```python
%%script zsh
time pwd
```

    /Users/zhengzangw/Desktop



```python
%%time
a = 1
display(a)
print(a)
a
```


    1

    1
    CPU times: user 1.46 ms, sys: 1.08 ms, total: 2.54 ms
    Wall time: 1.54 ms



```python
%who
%who function
whols = %who_ls
whols[:2]
```

    SVR	 X	 a	 ax1	 ax2	 ax3	 axes	 f	 fig	 
    ix	 kernel_label	 lw	 model_color	 np	 npSum	 plt	 svr	 svr_lin	 
    svr_poly	 svr_rbf	 svrs	 t.txt	 t1	 whols	 y	 y_lin	 y_poly	 
    y_rbf	 
    f	 npSum	 

    ['SVR', 'X']



[Magic Command 一览](https://ipython.readthedocs.io/en/stable/interactive/magics.html)。这里列举常用的如下：

| 名称 | 用途 |
| --- | --- |
| %%html | html cells |
| %%latex | latex cells |
| %%markdown | markdown cells |
| %%script bash/%%bash | bash cells |
| %%writefile \[-a\] filename | write contents to file |
| %%javascript/%js | javascript cells |
| %who/%whos | Print all interactive variables |
| %who_ls | return a sorted list of all interactive variables |
| %time your_expreesion | run a sentenc to check its running time |
| %time your_expression | repeatedly to run a sentence to check its running time |
| %tb | Print last traceback |
| %run | run the named file inside IPython |
| %reset | Resets the namespace |
| %pycat | Show a syntax-highlighted file |
| %precision num | set precision |
| %macro | define macro |

### Python 库

有一些 Python 库被 Jupyter-Notebook 很好的支持，可以在 Help 中看到这些库的手册链接。


```python
import numpy as np
def npSum():
    a = np.arange(10000)
    b = np.arange(10000)
    c = a**2 + b**2
    return c
npSum()
```




    array([        0,         2,         8, ..., 199880018, 199920008,
           199960002])




```python
import numpy as np
import matplotlib.pyplot as plt


def f(t):
    return np.exp(-t) * np.cos(2*np.pi*t)


t1 = np.arange(0.0, 3.0, 0.01)

ax1 = plt.subplot(212)
ax1.margins(0.05)           # Default margin is 0.05, value 0 means fit
ax1.plot(t1, f(t1), 'k')

ax2 = plt.subplot(221)
ax2.margins(2, 2)           # Values >0.0 zoom out
ax2.plot(t1, f(t1), 'r')
ax2.set_title('Zoomed out')

ax3 = plt.subplot(222)
ax3.margins(x=0, y=-0.25)   # Values in (-0.5, 0.0) zooms in to center
ax3.plot(t1, f(t1), 'g')
ax3.set_title('Zoomed in')

plt.show()
```


![png](https://blog.zhengzangw.com/images/Jupyter-Notebook-Introduction/Jupyter-Notebook-Introduction_14_0.png)



```python
# Example from Sklearn
import numpy as np
from sklearn.svm import SVR
import matplotlib.pyplot as plt

# #############################################################################
# Generate sample data
X = np.sort(5 * np.random.rand(40, 1), axis=0)
y = np.sin(X).ravel()

# #############################################################################
# Add noise to targets
y[::5] += 3 * (0.5 - np.random.rand(8))

# #############################################################################
# Fit regression model
svr_rbf = SVR(kernel='rbf', C=100, gamma=0.1, epsilon=.1)
svr_lin = SVR(kernel='linear', C=100, gamma='auto')
svr_poly = SVR(kernel='poly', C=100, gamma='auto', degree=3, epsilon=.1,
               coef0=1)
y_rbf = svr_rbf.fit(X, y).predict(X)
y_lin = svr_lin.fit(X, y).predict(X)
y_poly = svr_poly.fit(X, y).predict(X)

# #############################################################################
# Look at the results
lw = 2

svrs = [svr_rbf, svr_lin, svr_poly]
kernel_label = ['RBF', 'Linear', 'Polynomial']
model_color = ['m', 'c', 'g']

fig, axes = plt.subplots(nrows=1, ncols=3, figsize=(15, 10), sharey=True)
for ix, svr in enumerate(svrs):
    axes[ix].plot(X, svr.fit(X, y).predict(X), color=model_color[ix], lw=lw,
                  label='{} model'.format(kernel_label[ix]))
    axes[ix].scatter(X[svr.support_], y[svr.support_], facecolor="none",
                     edgecolor=model_color[ix], s=50,
                     label='{} support vectors'.format(kernel_label[ix]))
    axes[ix].scatter(X[np.setdiff1d(np.arange(len(X)), svr.support_)],
                     y[np.setdiff1d(np.arange(len(X)), svr.support_)],
                     facecolor="none", edgecolor="k", s=50,
                     label='other training data')
    axes[ix].legend(loc='upper center', bbox_to_anchor=(0.5, 1.1),
                    ncol=1, fancybox=True, shadow=True)

fig.text(0.5, 0.04, 'data', ha='center', va='center')
fig.text(0.06, 0.5, 'target', ha='center', va='center', rotation='vertical')
fig.suptitle("Support Vector Regression", fontsize=14)
plt.show()
```


![png](https://blog.zhengzangw.com/images/Jupyter-Notebook-Introduction/Jupyter-Notebook-Introduction_15_0.png)

