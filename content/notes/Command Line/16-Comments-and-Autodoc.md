---
title: 16. Comments and Autodoc
date: 2020-03-25
weight: 16
---

## 注释风格

### File Comments

Python

```python
#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : ${DATE} ${TIME}
# @Author  : Shark
# @Site    : ${SITE}
# @File    : ${NAME}.py
# @Software: ${PRODUCT_NAME}
```

C++

```C++
//
// @brief: 简单介绍
// @copyright: Copyright 2020 Google Inc
// @license: GPL
// @birth: created by Dablelv on 2018-08-02
// @version: V1.1.1
// @revision: last revised by lvlv on 2018-09-02
//
```

### C++

Doxygen

```C++
/**
 *<A short one line description>
 *
 *<Longer description>
 *<May span multiple lines or paragraphs as needed>
 *
 *@param  <参数名> <参数说明>
 *@param  ...
 *@return <返回值说明>
 *@see    <相关函数>
 *@note   <注意>
 */
```

### Python

Epytext: javadoc 风格

```python
def docstring_epytext(parm_a, parm_b, parm_c):
    """
    Epytext Style

    @param parm_a: this is a
    @type parm_a: int
    @param parm_b: this is b
    @type parm_b: int
    @param parm_c: this is c
    @type parm_c: str
    @return: the result
    @raise keyError: raises an exception
    """
```

reST: Sphinx

```python
def docstring_restructruedtext(parm_a: int, parm_b: int, parm_c: str) -> bool:
    """
    reStructed Style

    :param int parm_a: this is a
    :param int parm_b: this is b
    :param str parm_c: this is c
    :return: the result
    :raises keyError: raises an exception
    :example:
        >>> my_fuction(2, 3)
        6
        >>> my_faction('a', 3)
        'aaa'

    :Author:  yourname
    :Create:  2020-03-04
    :Blog:    https://zhengzangw.com
    Copyright (c) 2020, All Rights Reserved.
    """
```

Google

```python
def docstring_google(parm_a, parm_b, parm_c):
    """Summary here.

    Google Style long description

    Arg:
        parm_a: int
            this is a
        parm_b: this is b
        parm_c: this is c

    Returns:
        The result

    Raises:
        KeyError: raises an exception
    """

class docstring_google_class(object):
    """Summary here

    Longer

    Attributes:
        attr_1: this is attr 1
        attr_2: this is attr 2
    """
```

Numpy

```python
def docstring_numpy(parm_a, parm_b, parm_c):
    """
    Numpy Style

    Parameters
    ----------
    parm_a (int): this is a
    parm_b (str): this is b
    parm_c (bool): this is c

    Returns
    -------
    this is result
```

### Modifiers

TODO

```C++
// TODO(zhengzangw@gmail.com): Add comments to your code
// TODO(issue 12345): fix it
```

DEPRECATED

```C++
// DEPRECATED some comments
```

## 工具

sphinx

```sh
pip install sphinx
mkdir docs && cd docs
sphinx-quickstart
# Separate source and build directories
# Modify source/conf.py
sphinx-apidoc -o source ../src/
make html
```

Modify source/conf.py

- import file

  ```python
  import os
  import sys
  sys.path.insert(0, os.path.abspath('../../../src))
  ```

- language: `language='zh_cn'` 中文支持

- theme: `pip install sphinx-rtd-theme`

  ```python
  import sphinx_rtd_theme
  html_theme = "sphinx_rtd_theme"
  html_theme_path = [sphinx_rtd_theme.get_html_theme_path()]
  ```

- extensions

  ```python
  extensions = [
    'sphinx.ext.autodoc',
    'sphinx.ext.napoleon',  # Able to parse Numpy and Google
    'sphinx_autodoc_typehints', # pip install sphinx-autodoc-typehints
    'sphinx.ext.todo',
    'sphinx.ext.ifconfig',
    'sphinx.ext.mathjax',
    'recommonmark'
  ]
  napoleon_use_param = True
  ```

- 中文 LaTeX

  ```python
  latex_engine = 'xelatex'
  latex_elements = {
    # The paper size ('letterpaper' or 'a4paper').
    # 'papersize': 'letterpaper',

    # The font size ('10pt', '11pt' or '12pt').
    # 'pointsize': '10pt',

    # Additional stuff for the LaTeX preamble.
    'preamble': r'''
    \addto\captionsenglish{\renewcommand{\chaptername}{}}
    \usepackage[UTF8, scheme = plain]{ctex}
    \setCJKmainfont{STSongti-SC-Regular}
    ''',

    # Latex figure (float) alignment
    # 'figure_align': 'htbp',
  }
  ```

## reStructuredText

[reStructuredText-Quick-Syntax](https://github.com/seayxu/CheatSheet/blob/master/files/reStructuredText-Quick-Syntax.md)

```rst
.. toctree::
   :maxdepth: 2
   :caption: Contents:

   modules
   A file <test1.rst>
   test2
   c

.. code-block:: python
  :linenos:

  import project
  # Get your stuff done
  project.do_stuff()
```

## 类型注解

```python
form typing import List
def test(a: List[List[int]] =[[0,0]]) -> int:
  return 0
```

使用 `mypy` 检查
