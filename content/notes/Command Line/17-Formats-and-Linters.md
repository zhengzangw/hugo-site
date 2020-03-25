---
title: 17. Formats and Linters
date: 2020-03-25
weight: 17
---

## Formats

### C/C++

代码风格：Google, linux, gnu

```shell
indent
astyle --style=gnu src/*.cpp include/*.h # brew install astyle
```

In Vscode: `"C_Cpp.clang_format_style": "{ BasedOnStyle: Google, IndentWidth: 4}"`

### Python

代码风格：pep8

```shell
autopep8 --in-place --aggressive test.py # pip install pep8
```

## Frontend

Prettier

## Lint

静态代码检测

- pylint
- eslint
